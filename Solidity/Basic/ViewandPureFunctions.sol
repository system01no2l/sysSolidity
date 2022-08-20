// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract ViewandPure {
    // View Functions => Promise not to modify the state.
    /**
    1. Sẽ không tốn phí gas khi gọi chúng từ bên ngoài hợp đồng.
    2. Đánh dấu với chức năng view, để báo là truy cập vào nút cục bộ của blockchain và không làm phát sinh transaction
    3. Sẽ không làm thay đổi trạng thái nào của khối blockchain
    Các hàm view là hàm chỉ đọc, đảm bảo rằng các biến trạng thái không thể được sửa đổi sau khi gọi chúng. 
    Nếu các câu lệnh sửa đổi các biến trạng thái, tạo ra các sự kiện, 
    tạo các hợp đồng khác, sử dụng phương thức tự cấu trúc , 
    chuyển eth qua các cuộc gọi, Gọi một hàm không phải là 'view hoặc pure', 
    sử dụng các lệnh cấp thấp, v.v. có trong các hàm view 
     => Thì trình biên dịch đưa ra một cảnh báo trong những trường hợp như vậy. 
    Theo mặc định, một phương thức get là chức năng xem.
     */

    uint numberB = 10;

    function addNumber(uint numberA) public view returns (uint) {
        return numberA + numberB;
    }

    // Pure => Promise not to modify or read from the state.
    /**
    Các hàm thuần túy không đọc hoặc sửa đổi các biến trạng thái, 
    các biến này chỉ trả về các giá trị bằng cách sử dụng các tham số được truyền cho hàm hoặc các biến cục bộ có trong nó. 
    Nếu các câu lệnh đọc các biến trạng thái, truy cập địa chỉ hoặc số dư, truy cập bất kỳ khối biến toàn cục hoặc thư, gọi một hàm không thuần túy, v.v. có trong các hàm thuần túy 
    => Thì trình biên dịch sẽ đưa ra cảnh báo trong các trường hợp đó.
     */

    function checkEvenNumber(uint number) public pure returns (bool isEven , uint total) {
        total = number + 2;
        isEven = true;
    }

}