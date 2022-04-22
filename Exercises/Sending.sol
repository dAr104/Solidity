// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/* 28 Sending Ether (transfer, send, call)
HOW TO SEND ETHER?
You can send Ether to other contracts by:

-transfer (2300 gas, throws error)
-send (2300 gas, returns bool)
-call (forward all gas or set gas, returns bool)

HOW TO RECEIVE ETHER?
A contract receiving Ether must have at least one of the functions below:

-receive() external payable
-fallback() external payable

receive() is called if msg.data is empty, otherwise fallback() is called.

WHICH METHOD SHOUL YOU USE?
call in combination with re-entrancy guard is the recommended method to use after December 2019.

Guard against re-entrancy by:

-making all state changes before calling other contracts
-using re-entrancy guard modifier
*/ 

contract ReceiveEther {
     /*
    Which function is called, fallback() or receive()?

           send Ether
               |
         msg.data is empty?
              / \
            yes  no
            /     \
receive() exists?  fallback()
         /   \
        yes   no
        /      \
    receive()   fallback()
    */

    // Function to receive Ether, msg.data must be empty
    receive() external payable {}

    // Fallback function is called when msg.data is not empty
    fallback() external payable {}
}

contract SendEther {
    function sendViaTransfer(address payable _to) public payable {
        // This function is no longer recommended for sending Ether
        _to.transfer(msg.value);
    }

    function sendViaSend(address payable _to) public payable {
        // This function is not recommended for sending Ether
        // Send return a boolean value indicating success or failure
        bool sent = _to.send(msg.value);
        require(sent, "Failed to send Ether");
    }

    function sendViaCall(address payable _to) public payable {
        // Call returns a boolean value indicating success of failure, is the current recommended method to use
        (bool sent, bytes memory data) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }
}
