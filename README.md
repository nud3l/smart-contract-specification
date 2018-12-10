# Smart Contract Specification Language for Verification

This repository contains ongoing work to define a specification language to formally verify smart contract.

## Core idea

One can use tools and frameworks such as Isabelle/HOL (together with the Lem definitions), K, or F* to formally verify Ethereum smart contracts. However, those tools are written as general tools. Hence, they create a significant amount of overhead for the verification engineer.

Tools like KLab and their own succinct specification language aim to bridge the gap. We want to explore if it would be possible to create a intermediary language for such specifications.

## Objectives

- Easy to write language
- Express typical smart contract scenarios in a reasonable length
- Based on a suitable logic for verifying smart contracts
- Compiles into existing verification language 
  - For now focus on K as it has a complete semantics implemented
  - In the future, consider F*

## Approach

Generate a range of different contracts in Solidity and compile them to EVM bytecode. New projects are added in the according folder.

A project has the following structure:
```
project/
-- src/
-- spec/
-- klab/
```

`src` contains the Solidity contract and the compiled output.

Next, we try to find a way to write smart contract specifications, which compile to K reachability proofs. Those specifications are written in `spec`.

To verify the results, we create a KLab configuration and specification using K-DSS stored in the `klab` folder. K proofs in `spec` are verified using the KLab proofs.

## Example

Check out the example for the [ERC20 contract specification](ERC20/spec/erc20-spec2.md).

## Grammar

The grammar of the langauge is defined in EBNF in [grammar.ebnf](grammar.ebnf).

### Coverage

*Storage*

- [x] uint, int
- [x] bool
- [x] string, bytes32
- [x] mappings
- [ ] structs

*Function input and return*

- [x] uint, int
- [x] bool
- [x] string, bytes32
- [ ] mappings
- [ ] structs
