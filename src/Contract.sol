// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Number {
    uint private number;

    error UnsafeDecrement();

    constructor(uint _number) {
        number = _number;
    }

    function increment() public {
        number++;
    }

    function decrement(uint _number) public {
        if ( number >= _number ) {
            number -= _number;
        } else {
            revert UnsafeDecrement();
        }
    }

    function getNumber() view public returns(uint){
        return number;
    }
}
