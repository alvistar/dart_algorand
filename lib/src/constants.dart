const ADDRESS_LEN = 58;
const CHECK_SUM_LEN_BYTES = 4;

const KEY_LEN_BYTES = 32;


/// transaction prefix when signing
const TXID_PREFIX = 'TX';

/// transaction group prefix when computing the group ID
const TGID_PREFIX = 'TG';

/// bid prefix when signing
const BID_PREFIX = 'aB';

/// prefix for multisig addresses
const MSIG_ADDR_PREFIX = 'MultisigAddr';

/// program (logic) prefix when signing
const LOGIC_PREFIX = 'Program';

const MNEMONIC_LEN = 25;

/// minimum transaction fee
const MIN_TXN_FEE = 1000;

/// indicates a payment transaction
const PAYMENT_TXN = 'pay';

/// indicates a key registration transaction
const KEYREG_TXN = 'keyreg';

/// indicates an asset freeze transaction
const ASSETFREEZE_TXN = 'afrz';

/// indicates an asset configuration transaction
const ASSETCONFIG_TXN = 'acfg';

/// indicates an asset transfer transaction
const ASSET_TRANSFER_TXN = 'axfer';

/// maximum number of transaction in a transaction group
const TX_GROUP_LIMIT = 16;

/// length of leases
const LEASE_LENGTH = 32;

/// int: maximum value for decimals in assets
const MAX_ASSET_DECIMALS = 19;

/// length of asset metadata
const METADATA_LENGTH = 32;

/// maximum number of addresses in a multisig account
const MULTISIG_ACCOUNT_LIMIT = 255;

/// max size of a teal program and its arguments in bytes
const  LOGIC_SIG_MAX_SIZE = 1000;

/// max execution cost of a teal program
const LOGIC_SIG_MAX_COST = 20000;