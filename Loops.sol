// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Loops {
    // While Loop => The most basic loop in Solidity.
        // while (expression) {
        //     Statement(s) to be executed if expression is true
        // }
    
    function fWhileLoop() public pure returns (uint) {
        uint idx = 0;
        while (idx < 10) {
            idx++;
        }
        return uint(idx);
    }

    // do...while Loop => The do...while loop is similar to the while loop except that the condition check happens at the end of the loop.
    // => Kiểm tra điều kiện xảy ra ở cuối vòng lặp
        // do {
        //     Statement(s) to be executed;
        // } while (expression);

    function fDoWhileLoop() public pure returns (string memory) {
        uint idx = 0;
        do {
            idx++;
        } while(idx < 5);
        return string('vietnam');
    }

    // For Loop => The for loop is the most compact form of looping.
    // => Hình thức lặp lại nhỏ gọn nhất

    function fForLoop() public pure returns (uint) {
        uint idx = 0;
        for (uint256 index = 0; index < 10; index++) {
            idx = index;
        }
        return uint(idx);
    }

    // Loop Control => Solidity provides full control to handle loops and switch statements. 
    // => Cung cấp toàn quyền kiểm soát để xử lý các vòng lặp và chuyển đổi các câu lệnh.

    function fLoopControl() public pure returns (string memory) {
        for (uint256 index = 0; index < 5; index++) {
            if (index == 3) {
                continue; // skip loop
            }
            if (index == 4) {
                break; // Thoát vòng lặp
            }
        }
        return 'fLoopControl';
    }
}