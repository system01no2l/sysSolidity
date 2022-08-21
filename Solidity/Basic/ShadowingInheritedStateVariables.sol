// SPDX-License-Identifier: MIT
/**
Các biến trạng thái không thể bị ghi đè bằng cách khai báo lại nó trong hợp đồng con.
 */
pragma solidity ^0.8.0;

contract A {
    string public name = 'TaoBa';
    function getName() public view returns (string memory) {
        return name;
    }
}

contract B is A {
    constructor() {
        name = 'Nu';
    }
    //=>  Call getName return "Nu"
}