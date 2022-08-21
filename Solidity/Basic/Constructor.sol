// SPDX-License-Identifier: MIT

/**
A constructor is an optional function that is executed upon contract creation.
Here are examples of how to pass arguments to constructors.
 */

pragma solidity ^0.8.0;

contract X {
    string name;
    constructor(string memory _name) {
        name = _name;
    }
}

contract Y is X('Tao Ba') {
    uint age;
    constructor(uint _age) {
        age = _age;
    }
}

contract Z is Y {
    constructor() Y(10) {

    }
}