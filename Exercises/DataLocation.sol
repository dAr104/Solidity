// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/* 16
Variables are declared as either storage, memory or calldata to explicitly specify the location of the data.

storage - variable is a state variable (store on blockchain)
memory - variable is in memory and it exists while a function is being called
calldata - special data location that contains function arguments

The Gas consumption of Memory is not very significant as compared to the gas consumption of Storage.
Therefore, it is always better to use Memory for intermediate calculations and store the final result in Storage.

1) State variables and Local Variables of structs, array are always stored in storage by default.
2) Function arguments are in memory.
3) Whenever a new instance of an array is created using the keyword ‘memory’, a new copy of that variable is created.
   Changing the array value of the new instance does not affect the original array.
*/ 

contract Datalocations {
    uint[] public arr;
    mapping(uint => address) map;
    struct MyStruct {
        uint foo;
    }
    mapping(uint => MyStruct) myStructs;

    function f() public {
        // call _f with state variables
        _f(arr, map, myStructs[1]);

        // get a struct from a mapping
        MyStruct storage myStruct = myStructs[1];
        // create a struct in memory
        MyStruct memory myMemStruct = MyStruct(0);
    }

    function _f(uint[] storage _arr, mapping(uint => address) storage _map, MyStruct storage _myStruct) internal {
        // do something with storage variables
    }

    // You can return memory variables
    function g(uint[] memory _arr) public returns (uint[] memory) {
        // do something with memory array
    }

    function h(uint[] calldata _arr) external {
        // do something with calldata array
    }

}