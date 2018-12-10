pragma solidity ^0.4.25;

contract Ocontract {

    struct IPFS {
        bytes32 raw_hash;
        uint8 hash_function;
        uint8 size;
    }

    struct Sale {
        address seller;
        address buyer;
        uint resource_type;
        IPFS resource;
        uint price;
        bool completed;
        bool collateral;
    }
    mapping (uint => Sale) sales;
    uint sale_id;

    function getSale(uint _id) public view 
    returns (address, address, uint, uint, bool, bool) {
        return (sales[_id].seller, 
        sales[_id].buyer, 
        sales[_id].resource_type, 
        sales[_id].price, 
        sales[_id].completed,
        sales[_id].collateral);
    }

    function getResource(uint _id) public view returns (bytes32, uint8, uint8) {
        return (sales[_id].resource.raw_hash, sales[_id].resource.hash_function, sales[_id].resource.size);
    }

    function addSale(address _seller, address _buyer) public {
        sales[sale_id].seller = _seller;
        sales[sale_id].buyer = _buyer;
        sales[sale_id].completed = false;
        sales[sale_id].collateral = false;

        sale_id++;
    }

    function addContractType(uint _id, uint _contract_type) public {
        sales[_id].resource_type = _contract_type;
    }

    function addPrice(uint _id, uint _price) public {
        sales[_id].price = _price;
    }

    function lockPrice(uint _id) public payable {
        require(!sales[_id].completed, "Sale already completed");
        require(msg.value >= sales[_id].price, "Higher price agreed");
        require(msg.sender == sales[_id].buyer, "Only buyer can commit");

        sales[_id].collateral = true;        
    }

    function provideResource(uint _id, bytes32 _raw_hash, uint8 _hash_function, uint8 _size) public {
        require(!sales[_id].completed, "Sale already completed");
        require(sales[_id].collateral, "Buyer has not provided collateral");
        require(msg.sender == sales[_id].seller, "Only seller can commit");

        sales[_id].resource = IPFS (_raw_hash, _hash_function, _size);
        sales[_id].completed = true;

        msg.sender.transfer(sales[_id].price);
    }
}