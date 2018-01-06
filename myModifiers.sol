pragma solidity ^0.4.19;

contract myModifiers{
    
    address owner;
    modifier onlyOwner{
        require(msg.sender == owner);
        _;
    }
    
    function myModifiers(){
        owner = msg.sender;
    }
}
