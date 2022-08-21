// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/**
Hợp đồng mẹ có thể được gọi trực tiếp hoặc bằng cách sử dụng từ khóa super.
Bằng cách sử dụng từ khóa super, tất cả các hợp đồng mẹ ngay lập tức sẽ được gọi.
 */

/* Inheritance tree
   A
 /  \
B   C
 \ /
  D
*/
contract A {
    event Log(string log);

    function foo() public virtual {
        emit Log('A.foo called');
    }

    function bar() public virtual {
        emit Log('A.bar called');
    }
}

contract B is A {
    function foo() public virtual override {
        emit Log("B.foo called");
        A.foo();
    }

    function bar()  public virtual override {
        emit Log("B.bar called");
        super.bar();
    }
}

contract C is A {

    function foo() public virtual override {
        emit Log('C.foo called');
        A.foo();
    }

    function bar() public virtual override {
        emit Log('C.bar called');
        super.bar();
    }
}
/**
- Gọi D.foo và kiểm tra nhật ký giao dịch.
Mặc dù D kế thừa A, B và C nhưng nó chỉ được gọi là C và sau đó là A.
- Gọi D.bar và kiểm tra nhật ký giao dịch
D được gọi là C, sau đó là B và cuối cùng là A.
Mặc dù super được gọi hai lần (bởi B và C) nó chỉ được gọi A một lần.
 */
contract D is B, C {
    function foo() public virtual override(B, C) {
        super.foo();
    }

    function bar() public virtual override(B, C) {
        super.bar();
    }
}