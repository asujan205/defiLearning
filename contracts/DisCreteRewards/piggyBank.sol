// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;


contract PiggyBank {

    address public immutable owner;

    event Deposit( uint amount);
    event Withdraw(uint amount);

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {


        emit Deposit(msg.value);
    }

    function withdraw() external {
        require(msg.sender == owner, "Only owner can withdraw");
        payable(msg.sender).transfer(address(this).balance);
        emit Withdraw(address(this).balance);

        // selfdestruct(payable(msg.sender));
    }


}