import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:resource/resource.dart';

import 'constants.dart';
import 'error.dart';

var lang_spec;
Map opcodes;

//class Uvarint {
//  int _value;
//  int _length;
//
//  int get value => _value;
//
//  int get length => _length;
//
//  Uvarint(Uint8List data) {
//    final reader = RawReader.withBytes(data);
//    _value = reader.readVarUint();
//    _length = reader.index;
//  }
//}

class Uvarint {
  int _value;
  int _length;

  int get value => _value;

  int get length => _length;

  Uvarint(Uint8List data) {
    int x = 0;
    int s = 0;
    int b;
    for (var i = 0; i < data.length; i++) {
      b = data[i];
      if (b < 0x80) {
        if (i > 9 || i == 9 && b > 1) {
          _value = 0;
          _length = -(i + 1);
          return;
        }
        _value = x | b << s;
        _length = i + 1;
        return;
      }
      x |= b & 0x7f << s;
      s += 7;
    }
    ;

    _length = 0;
    _value = 0;
  }
}

class IntConstBlock {
  List<int> results;
  int size;

  IntConstBlock(this.size, this.results);
}

class ByteConstBlock {
  int size;
  List<Uint8List> results;

  ByteConstBlock(this.size, this.results);
}

class ProgramData {
  final bool good;
  final List<int> int_block;
  final List<Uint8List> byte_block;

  ProgramData({this.good, this.int_block, this.byte_block});
}

IntConstBlock read_int_const_block(Uint8List program, int pc) {
  int size = 1;
  List<int> results = [];

  var result = Uvarint(program.sublist(pc + size));
  if (result.length <= 0) {
    throw InvalidProgram(
        message: 'could not decode int const block size at pc=${pc + size}');
  }

  final num_ints = result.value;

  size += result.length;

  for (var i = 0; i < num_ints; i++) {
    if (pc + size >= program.length) {
      throw InvalidProgram(message: 'intcblock ran past end of program');
    }

    result = Uvarint(program.sublist(pc + size));
    if (result.length <= 0) {
      throw InvalidProgram(
          message: 'could not decode int const${i} at pc=${pc + size}');
    }
    results.add(result.value);
    size += result.length;
  }
  return IntConstBlock(size, results);
}

ByteConstBlock read_byte_const_block(Uint8List program, int pc) {
  List<Uint8List> results = [];
  int size = 1;

  var result = Uvarint(program.sublist(pc + size));

  if (result.length <= 0) {
    throw InvalidProgram(
        message: 'could not decode byte[] const block at pc=${pc}');
  }

  size += result.length;
  final numInts = result.value;

  for (int i = 0; i < numInts; i++) {
    if (pc + size >= program.length) {
      throw InvalidProgram(
          message: 'byte[] const block exceeds program length');
    }
    result = Uvarint(program.sublist(pc + size));
    if (result.length <= 0) {
      throw InvalidProgram(
          message:
              'could not decode byte[] const[${i}] block at pc=${pc + size}');
    }

    size += result.length;

    if (pc + size >= program.length) {
      throw InvalidProgram(
          message: 'byte[] const block exceeds program length');
    }

    var buff = Uint8List.fromList(
        program.sublist(pc + size, pc + size + result.value));

    results.add(buff);
    size += result.value;
  }

  return ByteConstBlock(size, results);
}

Future<ProgramData> read_program(
    Uint8List program, List<Uint8List> args) async {
  final ints = <int>[];
  final bytes = <Uint8List>[];

  const intcblock_opcode = 32;
  const bytecblock_opcode = 38;

  lang_spec ??= jsonDecode(
      await Resource('package:dart_algorand/data/langspec.json')
          .readAsString());

  final result = Uvarint(program);

  final vlen = result.length;
  if (vlen <= 0) {
    throw InvalidProgram(message: 'version parsing error');
  }

  final version = result.value;
  if (version > lang_spec['EvalMaxVersion']) {
    throw InvalidProgram(message: 'unsupported version');
  }

  args ??= <Uint8List>[];

  int cost = 0;
  int length = program.length;

  for (var arg in args) {
    length += arg.length;
  }

  if (length > LOGIC_SIG_MAX_SIZE) {
    throw InvalidProgram(message: 'program too long');
  }

  if (opcodes == null) {
    opcodes = {};
    for (var op in lang_spec['Ops']) {
      opcodes[op['Opcode']] = op;
    }
  }

  var pc = vlen;

  while (pc < program.length) {
    Map op = opcodes[program[pc]];
    if (op == null) {
      throw InvalidProgram(message: 'invalid instruction');
    }

    cost += op['Cost'];
    int size = op['Size'];
    if (size == 0) {
      if (op['Opcode'] == intcblock_opcode) {
        var intsBlock = read_int_const_block(program, pc);
        size += intsBlock.size;
        ints.addAll(intsBlock.results);
      } else if (op['Opcode'] == bytecblock_opcode) {
        var bytesBlock = read_byte_const_block(program, pc);
        size += bytesBlock.size;
        bytes.addAll(bytesBlock.results);
      }
    }

    pc += size;
  }

  if (cost > LOGIC_SIG_MAX_COST) {
    throw InvalidProgram(message: 'program too costly to run');
  }

  return ProgramData(good: true, int_block: ints, byte_block: bytes);
}
