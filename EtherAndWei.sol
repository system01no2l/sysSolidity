// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract EtherAndWei {

    // Transaction are paid with ether,
    // one dollar = 100 cent, one ether is equal to 1018 wei.
    uint public oneWei = 1 wei;
    // => 1 wei is equal to 1
    bool public isOneWei = 1 wei == 1;

    uint public oneEther = 1 ether;
    // => 1 ether is equal to 1e18 or 1000000000000000000

    bool public isOneEther = oneEther == 1e18;
}