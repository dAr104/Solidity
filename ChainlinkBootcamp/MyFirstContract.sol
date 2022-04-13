pragma solidity ^0.6.7;

contract MyFirstContract {

    uint number;

    //set function
    function changeNumber(uint256 _num) public {
        number = _num;
    }

    function getNumber() public view  returns(uint256) {
        return number;
    }
    

}