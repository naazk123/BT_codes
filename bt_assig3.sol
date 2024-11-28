// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BankAccount {
    address public owner;
    uint public balance;
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the account owner can perform this action");
        _;
    }
    constructor() {
        owner = msg.sender;
    }
    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than zero");
        balance += msg.value;
    }
    function withdraw(uint _amount) public onlyOwner {
        require(_amount <= balance, "Insufficient balance");
        balance -= _amount;
        payable(owner).transfer(_amount);
    }
    function getBalance() public view returns (uint) {
        return balance;
    }
}
