# Pure functions

## Add

Take care of integer overflow.

```
behaviour add of Pure
interface add(uint256 A, uint256 B)

iff in range uint256

    A + B

if

    VGas > 500

returns A + B
```


## Add

Take care of integer overflow.

```
behaviour add2 of Pure
interface add2(uint256 A, uint256 B)

iff in range uint256

    A + B

if

    VGas > 500

returns A + B
```

## Sub

```
behaviour sub of Pure
interface sub(uint256 A, uint256 B)

iff in range uint256

    A - B

if

    VGas > 500

returns A - B
```