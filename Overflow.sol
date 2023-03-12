/*An overflow error attack on a smart contract occurs when more value is provided than the maximum value. When this happens, it circles back to zero, and this feature can be exploited by repeatedly invoking the part that increases the value. 

In this example, the balance variable is an unsigned integer that keeps track of the amount of tokens held by the contract. The deposit function allows a user to deposit tokens into the contract by adding the deposited amount to the balance variable. The withdraw function allows a user to withdraw tokens from the contract by subtracting the withdrawn amount from the balance variable.

However, there is no check to ensure that the balance variable does not overflow. If a user deposits an amount that causes the balance variable to exceed the maximum value for a uint256 (2^256-1), an overflow error will occur. This could result in the balance variable wrapping around to zero and the deposited tokens being lost.

To avoid this type of error, smart contract developers should add appropriate range checks to ensure that overflow errors cannot occur. For example, they could add a check in the deposit function to ensure that the sum of the balance variable and the deposited amount does not exceed the maximum value for a uint256.*/



pragma solidity ^0.8.0;

contract OverflowExample {
    uint256 public balance;

    function deposit(uint256 amount) public {
        balance += amount;
    }

    function withdraw(uint256 amount) public {
        require(balance >= amount, "Insufficient balance");
        balance -= amount;
    }
}