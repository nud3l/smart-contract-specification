# Smart Contract Specification Language for Verification

This repository contains ongoing work to define a specification language to formally verify smart contract.

## Core idea

One can use tools and frameworks such as Isabelle/HOL (together with the Lem definitions), K, or F* to formally verify Ethereum smart contracts. However, those tools are written as general tools. Hence, they create a significant amount of overhead for the verification engineer.

Tools like KLab and their own succinct specification language aim to bridge the gap. We want to explore if it would be possible to create a intermediary language for such specifications.

## Objectives

- Easy to write language (think Python)
- Express typical smart contract scenarios in a reasonable length
- Based on a suitable logic for verifying smart contracts (think separation logic or temporal logic)
- Compiles into existing statements (for now focus on K as it has a complete semantics implemented)

## Approach

Generate a range of different contracts in Solidity and compile them to EVM bytecode. New projects are added in the according folder like `Ocontract`.

A project has the following structure:
```
project/
-- src/
-- klab/
-- spec/
```

`src` contains the Solidity contract and the compiled output. KLab requires the contract to be compiled using:

```
solc --combined-json=abi,bin,bin-runtime,srcmap,srcmap-runtime,ast contract.sol > contract.sol.json
```

Next, we create a KLab configuration and specification using K-DSS stored in the `klab` folder. K reachability proofs are created from the specification using:

```
cd project/klab
klab build
```

Proofs can be verified using klab server with:
```
klab run
```

Next, we try to find a different way to write these specifications, whic compile to the same or similar K reachability proofs created by KLab. Those specifications are written in `spec`.

## Logics and Calculi

We want to try out the following approaches to see their applicability for our approach:

- [ ] Separation logic (including concurrent separation logic)
- [ ] Temporal logic (LTL and CTL)
- [ ] Matching logic
- [ ] Symmetric interaction calculus
- [ ] Java Modelling Language style (with annotations)
- [ ] Event calculus (maybe)