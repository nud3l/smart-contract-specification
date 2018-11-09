pragma solidity ^0.4.25;

contract Pure {
    function add(uint256 a, uint256 b) public pure returns (uint256 z) {
        require((z = a + b) >= a, "overflow");
    }

    function add2(uint x, uint y) public pure returns (uint z) {
        z = x + y; 
        require(z >= x, "overflow");
        return z;
    }

    function sub(uint256 a, uint256 b) public pure returns (uint256 z) {
        require((z = a - b) <= a, "underflow");
    }

    function mul(uint256 a, uint256 b) public pure returns (uint256 z) {
        require((z = a * b) >= a, "overflow");
    }

    function smaller(uint256 a, uint256 b) public pure returns (bool) {
        if (a < b) {
            return true;
        } else {
            return false;
        }
    }

    function equal(uint256 a, uint256 b) public pure returns (bool) {
        if (a == b) {
            return true;
        } else {
            return false;
        }
    }
}