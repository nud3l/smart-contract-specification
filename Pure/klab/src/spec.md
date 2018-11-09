# Pure functions

A list of pure functions and their proofs.

## Arithmetic

We use `iff` to check for integer overflows and `if` for out of gas exceptions.

```
behaviour add of Pure
interface add(uint256 A, uint256 B)

iff in range uint256

    A + B

if

    VGas > 500

returns A + B
```

A more expressive function. We use `iff` to check for integer overflows and `if` for out of gas exceptions.

```
behaviour add2 of Pure
interface add2(uint256 A, uint256 B)

iff in range uint256

    A + B

if

    VGas > 500

returns A + B
```

We use `iff` to check for integer underflows and `if` for out of gas exceptions.

```
behaviour sub of Pure
interface sub(uint256 A, uint256 B)

iff in range uint256

    A - B

if

    VGas > 500

returns A - B
```

We use `iff` to check for integer underflows and `if` for out of gas exceptions.

```
behaviour mul of Pure
interface mul(uint256 A, uint256 B)

iff in range uint256

    A * B

if

    VGas > 700

returns A * B
```

## Boolean

Check if A < B and return true; otherwise return false. Truth values are encoded as 1 (true) and 0 (false).

```
behaviour smaller of Pure
interface smaller(uint256 A, uint256 B)

iff

    A < B

if
    
    VGas > 500

returns 1
```

Check if A == B and return true; otherwise return false. Truth values are encoded as 1 (true) and 0 (false).

```
behaviour equal of Pure
interface equal(uint256 A, uint256 B)

iff

    A == B

if
    
    VGas > 500

returns 1
```
