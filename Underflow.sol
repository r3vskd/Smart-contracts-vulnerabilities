/*This error attack operates in the exact opposite of the overflow error.
Instead of exceeding the maximum value, an underflow error occurs when
you go below the minimum amount. This triggers the system to return you
to maximum value instead of reverting to zero. 

In this example, the 'balance' variable is an unsigned integer that 
keeps track of the amount of tokens held by the contract. The 'deposit'
function allows a user to deposit tokens into the contract by adding
the deposited amount to the 'balance' variable. The 'withdraw' function
allows a user to withdraw tokens from the contract by subtracting the
withdrawn amount from the 'balance' variable.

The 'transfer' function is meant to allow a user to transfer tokens
to another address. It first checks that the contract has sufficient
funds ('balance >= amount') and then transfers the specified 'amount'
to the 'recipient' address using the 'transfer' function. However,
there is no check to ensure that the 'balance' variable does not
underflow. If a user tries to transfer an amount that exceeds the
current balance of the contract, an underflow error will occur.
This could result in the 'balance' variable wrapping around to its
maximum value and the transferred tokens being lost.

To avoid this type of error, smart contract developers should add
appropriate range checks to ensure that underflow errors cannot occur.
For example, they could add a check in the 'transfer' function to ensure
that the 'amount' being transferred does not exceed the current 'balance' variable.*/

pragma solidity ^0.8.0;

contract UnderflowExample {
    uint256 public balance;

    function deposit(uint256 amount) public {
        balance += amount;
    }

    function withdraw(uint256 amount) public {
        require(balance >= amount, "Insufficient balance");
        balance -= amount;
    }

    function transfer(address payable recipient, uint256 amount) public {
        require(balance >= amount, "Insufficient balance");
        recipient.transfer(amount);
        balance -= amount;
    }
}







