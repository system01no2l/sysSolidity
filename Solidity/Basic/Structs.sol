// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


contract Simple {
    // Enum 
    enum FreshJuiceSize { SMALL, MEDIUM, LARGE }

    FreshJuiceSize choice;
    FreshJuiceSize constant defaultChoice = FreshJuiceSize.MEDIUM;

    function setLarge() public {
      choice = FreshJuiceSize.LARGE;
    }

    function getChoice() public view returns (FreshJuiceSize) {
        return choice;
    }

    function getDefault() public pure returns (uint) {
        return uint(defaultChoice);
    }

    // Khai báo struct
    struct Token {
        uint price;
        string symbol;
    }
    // Create struct
    Token near;

    // Set data struct
    function createToken(uint price, string memory symbol) public {
       near = Token(price, symbol);
    }
    // Get data struct
    function getPrice() public view returns (uint) {
        return near.price;
    }

    // Get token
    function getToken() public view returns (Token memory) {
        return near;
    }
}