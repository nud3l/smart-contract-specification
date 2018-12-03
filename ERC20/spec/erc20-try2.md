# ERC20

## Config

Global configuration parameters. Indicates which dsitrubted VM to target like EVM, eWASM etc.

```
@config
target : EVM
contract: Solidity
gas: 6000000
```

Questions:

- Likeley skip this for now and default the config to EVM, Solidity, and a maximum gas assumption.

## Storage

Defines the storage variables of the overall contract. This defines later use of such variables.

```
@storage
totalSupply : int
address : address
balances[address] => balance : Int
allowances[address] => allowance
```

Questions:

- Type enforcement? Do we infer special types or keep it more general? One could do like int8 or uint256 to define the types more restrictive. However, this makes it special to the EVM since e.g. Silica or IELE do have unlimited integers.
- Same problem with address: in K this is also just an integer, with special rules. However, we argue that this should be kept as a separate type.


## Global

Global constraints are invariants that should hold for the entire life of a contract. This should also ensure that no function exsits which changes any of the assumptions made here.

```
@global
totalSupply = 10000;
balance >= 0
balance <= totalSupply
```

## Functions

Define function level specs.