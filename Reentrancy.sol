pragma solidity ^0.8.0;

contract VulnerableCOntract{
    mapping(address => uint) public blances

    function withdraw(uint amount) public{
        if (blances[msg.sender] >= amount){
            msg.sender.call{vlaue: amount}("");
            balances[msg.sender] -= amount;

        }
    }

    function deposit() public payable{
        balances[msg.sender] += msg.value;
    }
}