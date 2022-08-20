// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/**
Đây là function kiểu như middleware
Dùng để kiểm tra các điều kiện trước khi các đoạn mã code trong phương thức đó được thực thi
_; xuất hiện sẽ trả lại luồng thực thi cho function gọi nó.
Mục đích:
- Hạn chế truy cập
- Xác thực đầu vào
- Bảo vệ chống lại hack reentrancy
 */

contract FunctionModifier {
    address public owner;
    bool looked;
    uint number = 10;

    constructor() {
        owner = msg.sender;
    }

    modifier isOwner() {
        require(msg.sender == owner,'not owner');
        _;
    }

    modifier isAddress(address _address) {
        require(_address != address(0), 'not address');
        _;
    }

    modifier noReentrancy() {
        require(!looked, 'No reentrancy');
        looked = true;
        _;
        looked = false;
    }

    function changeOwner(address _owner) public isOwner isAddress(_owner) {
        owner = _owner;
    }

    function decrement(uint i) public noReentrancy {
        number -= i;
        if (i > 1) {
            decrement(i - 1);
        }
    }
}


contract A {
    address owner;
    constructor () {
        owner = msg.sender;
    }
    modifier isOwner() {
        require(msg.sender == owner, 'not owner');
        _;
    }
}

contract B is A {
    address _owner;
    function register() public isOwner() {
        _owner = msg.sender;
    }
}