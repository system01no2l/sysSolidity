// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/**
Events cho phép đăng nhập vào chuỗi khối Ethereum. Một số trường hợp sử dụng cho các sự kiện là:
- Lắng nghe các sự kiện và cập nhật giao diện người dùng
- Một hình thức lưu trữ rẻ tiền 
*/
contract Events {
    event Deposit(address indexed _from, uint256 _value, uint time);

    function deposit() public payable {
        emit Deposit(msg.sender, msg.value, block.timestamp);
    }
}
