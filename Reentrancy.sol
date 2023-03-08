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
/*In this contract, users can deposit ether 
into their account and then withdraw it later
by calling the withdraw function. However, the 
withdraw function is vulnerable to a reentrancy 
attack because it updates the balance of the user 
after sending ether to them.
An attacker can exploit this vulnerability 
by creating a separate contract with a fallback function 
that calls back into the withdraw function of the 
vulnerable contract. The attacker can then make 
repeated calls to their contract, which will cause 
the vulnerable contract to repeatedly send ether to 
the attacker's contract before the initial call has 
completed, resulting in a loss of funds.*/
