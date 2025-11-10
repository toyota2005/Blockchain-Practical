
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract Bank {
     
     uint256 balance = 0;
     address public accountOwner;


     constructor (){
        accountOwner=msg.sender;
     }

    //Deposit
     function Deposite() public  payable {
        require(accountOwner == msg.sender,"Your are not an account owner");
        require(msg.value > 0,"Amount Should be Grater than 0");
        balance=msg.value;
     }

    //Withdraw

     function Withdraw() public payable {
         require(accountOwner == msg.sender,"Your are not an account owner");
         require(msg.value>0, "Withdrawal Money Should be Greater than 0");
         balance = balance-msg.value;
     }


    //showbalance
    function ShowBalance() public view  returns(uint256) {
       require(accountOwner == msg.sender,"Your are not an account owner");
       return balance;
    }
}
