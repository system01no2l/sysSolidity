// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

// uint256, int256, bool, string, address, bytes32

contract Types {
    uint256 public age = 30; // Là kiểu dữ liệu không âm
    int256 private numberBank = 11111; // Là số nguyên có độ dài cố định 256bit
    bool isMe = false; // Là kiểu dạng đúng/sai
    string shipped  = "TaofBa"; // Là kiểu dữ liệu string
    address payable public seller; // Address là kiểu dữ liệu sử dụng 20-byte thể hiện địa chỉ tài khoản Ethereum
}