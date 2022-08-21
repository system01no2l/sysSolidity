// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
/**
Solidity hỗ trợ đa kế thừa. Hợp đồng có thể kế thừa hợp đồng khác bằng cách sử dụng từ khóa is.
Hàm sẽ bị ghi đè bởi hợp đồng con phải được khai báo là virtual.
Hàm sẽ ghi đè một hàm mẹ phải sử dụng từ khóa override.
Thứ tự thừa kế là quan trọng.
Bạn phải liệt kê các hợp đồng mẹ theo thứ tự từ “giống cơ sở nhất” đến “có nguồn gốc nhất”.
 */

/* Graph of inheritance
    A
   / \
  B   C
 / \ /
F  D,E

*/

contract A {
    function foo() public pure virtual returns(string memory) {
        return 'A';
    }

    function eat() public pure virtual returns(bool) {
        return true;
    }
}

//   Contracts inherit other contracts by using the keyword 'is'.
contract B is A {
    // Override A.foo()
    function foo() public pure override virtual returns(string memory) {
        return 'B';
    }
}

contract C is A {
    function foo() public pure override virtual returns(string memory) {
        return 'C';
    }
}

/**

// Các hợp đồng có thể kế thừa từ nhiều hợp đồng mẹ.
// Khi một hàm được gọi, hàm được định nghĩa nhiều lần trong các hợp đồng khác nhau, các hợp đồng mẹ được tìm kiếm từ
// Từ phải sang trái và theo cách tìm hiểu sâu.
 */

contract F is B, C {
    function foo() public pure override(B, C) returns(string memory) {
        return super.foo();
    }
    // Result: C
    // F.foo() returns "C"
    // since C is the right most parent contract with function foo()
}

contract D is C, B {
    function foo() public pure override(C, B) returns (string memory) {
        return super.foo();
    }
    // Result: B
    // D.foo() returns "B"
    // since B is the right most parent contract with function foo()
}

contract E is A, B {
    // Vì A là cha nên luôn đứng trước B
    // Không thể swap B lên trước A => Điều này sẽ làm phát sinh lúc biên dịch
    function foo() public pure override(A, B) returns (string memory) {
        return super.foo();
    }
}