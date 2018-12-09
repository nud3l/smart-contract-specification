# Compiling

KLab requires the contract to be compiled using:

```
solc --combined-json=abi,bin,bin-runtime,srcmap,srcmap-runtime,ast contract.sol > contract.sol.json
```

# Proofs

K reachability proofs are created from the specification using:

```
cd project/klab
klab build
```

Proofs can be verified using klab server with:
```
klab run
```