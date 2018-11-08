pragma solidity ^0.4.25;

contract Pure {
    function add(uint256 a, uint256 b) public pure returns (uint256 z) {
        require((z = a + b) >= a, "overflow");
        return z;
    }
}