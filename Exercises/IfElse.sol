//SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

// 10 Solidity supports conditional statements if, else if and else.

contract IfElse {
    function foo(uint _x) public pure returns (uint) {
        // pure: function that don't update and don't read the state on blockchain
        if (_x < 10) {
            return 0;
        } else if (_x < 20) {
            return 1;
        } else {
            return 2;
        }
    }

    function ternary(uint _x) public pure returns (uint) {
        return _x < 10 ? 1 : 2;
    }
}