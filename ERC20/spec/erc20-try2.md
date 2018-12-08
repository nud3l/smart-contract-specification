# ERC20

## Config

Global configuration parameters. Indicates which distributed VM to target like EVM, eWASM etc.

```
@config
target : EVM
contract : Solidity
meter : Gas
```

Questions:

- Likely skip this for now and default the config to EVM, Solidity, and a maximum gas assumption.
- NOTE: Include maximum gas assumptions in globals.

## Storage

Defines the storage variables of the overall contract. This defines later use of such variables.

```
@storage
totalSupply : Int
balances[address : Address] => balance : Int
allowances[address : Address] => allowance : Int
```

Questions:

- Type enforcement? Do we infer special types or keep it more general? One could do like int8 or uint256 to define the types more restrictive. However, this makes it special to the EVM since e.g. Silica or IELE do have unlimited integers.
- Same problem with address: in K this is also just an integer, with special rules. However, we argue that this should be kept as a separate type.


## Global

Global constraints are invariants that should hold for the entire life of a contract. This should also ensure that no function exists which changes any of the assumptions made here.

```
@global
gas >= 600000
totalSupply = 10000
balance >= 0
balance <= totalSupply
```

Questions:

- How to enforce these values based on the functions?
- How to prove that there exists NO function in the contract that touches these constraints? For example, if an ERC20 has a function that increases the totalSupply and a balance, how to check that it does not exist?
- Further, totalSupply and balances are decoupled. Just checking totalSupply might actually not be helpful. Is there a way to get a (sum of all balances == totalSupply)?

## Functions

### Non-state changing functions

Define function level specification.

```
@pure
getBalances()
inputs:
    sender: Address

outputs:
    balance

ensures:
    balances[sender] == balance
```

Questions:

- How to define the function interface? The sender can be send explicitly as (address sender) or called implicitly as msg.sender in Solidity? How does that look on bytecode level?
- Do we need to redefine balance here?
- Do we infer that this is a pure function as it does not change any parameter?

### State changing functions

Define function level specification.

```
@transition
transfer(receiver, amount)
inputs:
    sender: Address
    receiver: Address
    amount: Int

assigns:
    balances[sender]
    balances[receiver]

requires:
    balances[sender] >= amount

ensures:
    balances[sender] == initial(balances[sender] - amount)
    balances[receiver] == initial(balances[receiver] + amount)
```

Questions:

- Again, how to do the function signatures here?
