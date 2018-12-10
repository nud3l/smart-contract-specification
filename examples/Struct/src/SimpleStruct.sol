pragma solidity ^0.4.25;

contract SimpleStruct {

    struct Example {
        address someone;
        uint256 somevalue;
        bool check;
    }
    mapping(uint => Example) examples;
    uint256 example_id;

    function getExample(uint _id) public view
    returns (address, uint256, bool) {
        return (
            examples[_id].someone,
            examples[_id].somevalue,
            examples[_id].check
        );
    }
    
    function setExample(address _someone, uint256 _somevalue, bool _check) public {
        examples[example_id] = Example(_someone, _somevalue, _check);

        example_id++;
    }
}