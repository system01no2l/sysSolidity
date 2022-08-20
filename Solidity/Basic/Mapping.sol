// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Mapping {
    // Là kiểu dữ liệu theo dạng key -> value. (ánh xạ)
    // Key  : unit, string, bool, ...
    // Value: unit, string, array, ....
    mapping(address => uint) private balanceOfSender;
    mapping(uint => string) public nameOfSender;

    function setDataMaping(address _address, uint balance) public {
        balanceOfSender[_address] = balance;
    }

    function getDataMapping(address _address) public view returns (uint) {
        return balanceOfSender[_address];
    }

    function removeMapping(address _address) public {
        delete balanceOfSender[_address];
    }
}

contract NestedMapping {
    mapping(address => mapping(string => bool)) sender;

    function set(address _address, string memory _user, bool _sender) public {
        sender[_address][_user] = _sender;
    }

    function get(address _address, string memory _user) public view returns (bool) {
        return sender[_address][_user];
    }
    function remove(address _address, string memory _user) public {
        delete sender[_address][_user];
    }
}