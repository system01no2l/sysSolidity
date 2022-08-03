// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract Functions {

    // Struct function

    // function function-name(parameter-list) scope returns() {
    //  => statements
    // }

    // Function basic
    string name;    //  => local variable = biến khai báo với this trong javascript

    function fBasic(string memory _name) public {
        name = _name;
    }
    // Đối với string luôn có memory

    // -------------
    // View => Không thể sửa đổi trạng thái
    // Các hành động sau sẽ sửa đổi trạng thái:
    // Ghi vào các biến trạng thái.
    // Phát ra sự kiện
    // Tạo các hợp đồng khác .
    // Đang sử dụng selfdestruct.
    // Gửi Ether qua các cuộc gọi.
    // Gọi bất kỳ chức năng nào không được đánh dấu view hoặc pure.
    // Sử dụng các cuộc gọi cấp thấp.
    
    function fView(uint a, uint b) public view returns (uint) {
        return a + b + block.timestamp;
    }

    // -------------
    // Pure => Có thể sửa đổi trạng thái
    // Các hành động sau sẽ sửa đổi trạng thái:
    // Ghi vào các biến trạng thái.
    // Phát ra sự kiện
    // Tạo các hợp đồng khác .
    // Đang sử dụng selfdestruct.
    // Gửi Ether qua các cuộc gọi.
    // Gọi bất kỳ chức năng nào không được đánh dấu view hoặc pure.
    // Sử dụng các cuộc gọi cấp thấp.
    
    function fPure(uint a, uint b) public pure returns (uint total, uint zero) {
        total =  a + b;
        zero = 0;
    }
    // Sau returns thì có thể trả về nhiều tham số
}