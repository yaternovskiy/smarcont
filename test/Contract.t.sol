// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Contract.sol";

contract NumberTest is Test {
    Number public ctr;
    function setUp() public {
        ctr = new Number(10);
    }

    function testIncrement() public {
        ctr.increment();
        assertEq(ctr.getNumber(), 11);
    }

    function testDecrement(uint num) public {
        uint contractValue = ctr.getNumber();
        vm.assume(num <= contractValue);
        ctr.decrement(num);
        assertEq(ctr.getNumber(), contractValue - num);
    }

    function testFailDecrement(uint num) public {
        uint contractValue = ctr.getNumber();
        vm.assume(num > contractValue);
        ctr.decrement(num);
    }
}
