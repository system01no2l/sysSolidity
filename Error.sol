// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Error {
    // Có 3 cách bắt lỗi trong solidity, bao gồm:

    // Require: Is used to validate inputs and conditions before execution
    /**
    => Nó kiểm tra inputs, contract state và return values từ việc call các external contract. Hàm này sẽ tạo ra lỗi kiểu Error(string)
    => Các exception dạng require
        Khi bạn gọi require với một argument được đánh giá là false.
        Khi bạn thực hiện một lệnh gọi đến một external funtion mà nó không chứa code.
        Khi create contract với new keyword nhưng không kết thúc đúng cách
        Khi contract của bạn nhận Ether trong hàm public không có payable bao gồm cả fallback function
        Khi contract của bạn nhận Ether trong hàm public getter
        Khi .transfer() lỗi
     */
    

    // Assert: Is similar to require. See the code below for details
    /**
    => assert sẽ tạo ra lỗi kiểu Panic(uint256) ( hàm trong trình biên dịch ).
    => Assert chỉ nên được sử dụng để kiểm tra các lỗi internal.
    => Các exception dạng assert:
        Nếu bạn gọi assert với một argument được đánh giá là false.
        Khi bạn gọi một biến chưa được khởi tạo
        Khi bạn convert một giá trị lớn hoặc âm thành kiểu enum
        Khi chia cho 0
        Khi truy cập vào array vs index âm hoặc quá lớn
     */

    // Revert: Is used to check for code that should never be false. Failing assertion probably means that there is a bug
    /**
    => Hàm revert là một cách khác để kích hoạt các exception từ bên trong các code block khác để gắn cờ lỗi và revert current call.
       Đầu vào là một chuỗi chứa thông tin chi tiết về lỗi được chuyển lại cho người gọi và nó sẽ tạo ra Error(string) giống requires.
     */

    function checkRequire(uint number) public pure {
        require(number < 10, 'Number > 10');
    }

    function checkRevert(uint number) public pure {
        if (number > 10) {
            revert('Number > 10');
        }
    }
    
    uint _number = 0;
    function checkAssert() public view {
        assert(_number == 0);
    }
}