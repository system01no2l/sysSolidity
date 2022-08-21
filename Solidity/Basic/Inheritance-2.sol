// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// Kế thừa đơn lẻ
// => Các hàm và biến của một hợp đồng cơ sở chỉ được kế thừa cho một hợp đồng dẫn xuất.
contract Parent {
    // Declaring internal
    // state variable 
    uint internal sum; 
       
    // Defining external function
    // to set value of internal
    // state variable sum
    function setValue() external {
        uint a = 10;
        uint b = 20;
        sum = a + b;
    }
}
contract Child is Parent {
    // internal state variable sum
    function getValue() public view returns(uint) {
        return sum;
    }
}

// Kế thừa đa cấp
/**
Nó rất giống với thừa kế đơn lẻ, nhưng sự khác biệt là nó có các mức độ của mối quan hệ giữa cha mẹ và con cái.
Hợp đồng con có nguồn gốc từ cha mẹ cũng đóng vai trò là cha mẹ của hợp đồng có nguồn gốc từ đó.
Ví dụ:
Hợp đồng B được kế thừa từ hợp đồng A,
Hợp đồng C được kế thừa từ hợp đồng B,
 */

contract A {
    string x;
    string a = 'A';
    string a1 = 'A->A';

    function getA() external {
        x = string(abi.encodePacked(a, a1));
    }
}

contract B is A {
    string public y;
    string c = "B->A";
    function getB() external {
        y = string(abi.encodePacked(x, c));
    }
}

contract C is B {
    function getC() external view returns(string memory) {
        return y;
    }
}

// Kế thừa thứ bậc
/**
Trong thừa kế theo thứ bậc, một hợp đồng mẹ có nhiều hơn một hợp đồng con.
Nó chủ yếu được sử dụng khi một chức năng chung được sử dụng ở những nơi khác nhau.
Ví dụ:
Hợp đồng F được kế thừa bởi hợp đồng Z,
Hợp đồng F được kế thừa bởi hợp đồng Y,
=> Kế thừa thứ bậc.
 */

contract F {
    string f = 'contract F';
    uint numberF = 10;
}

contract Z is F {
    function getStringZ() public view returns(string memory) {
        return f;
    }
}

contract Y is F {
    function getNumberY() public view returns (uint) {
        return numberF;
    }
}

// Thừa kế nhiều
/**
Một hợp đồng duy nhất có thể được kế thừa từ nhiều hợp đồng. 
Hợp đồng cha mẹ có thể có nhiều hơn một con trong khi hợp đồng con có thể có nhiều hơn một hợp đồng cha mẹ
Ví dụ:
Hợp đồng N là kế thừa hợp đồng M và hợp đồng K, 
=> Kế thừa nhiều
 */

contract M {
    string internal m = 'M';
}

contract K {
    string internal k = 'K';
}

contract N is M, K {
    string internal n = string(abi.encodePacked(m, k));
}

contract Caller {
    // Kế thừa đơn
    Child child = new Child();
    function testInheritance() public returns(uint) {
        child.setValue();
        return child.getValue();
    }

    // Đa kế thừa
    C c = new C();
    function testInheritance1() public returns (string memory) {
        c.getA();
        c.getB();
        return c.getC();
    }

    // Kế thừa thứ bậc
    Y y = new Y();
    Z z = new Z();
    function testInheritance2() public view returns (string memory, uint) {
        return (z.getStringZ(), y.getNumberY());
    }

}