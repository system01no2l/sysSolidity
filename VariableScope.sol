// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

// Phạm vi của biến cục bộ (local variable) được giới hạn trong code block mà nó được sử dụng
// public => can be accessed internally as well as via messages (Truy cập nội bộ contract và thông qua messages). Khi khai báo thì hàm get/set được tạo tự động
// internal => Các biến trạng thái nội bộ chỉ có thể được truy cập nội bộ từ hợp đồng hiện tại hoặc hợp đồng được kế thừa.
// private => Các biến trạng thái riêng chỉ có thể được truy cập nội bộ từ hợp đồng hiện tại.

contract A {
    uint public money = 0;
    uint internal wallet = 0;
    bool private isCheck = false;

    // Function with scope is public 
    function checkMoney() public view returns (uint) {
        return money + 1000;
    }

    // Function with scope is internal 
    function checkWallet(uint amount) internal view returns (uint) {
        return wallet + amount;
    }

    // Function with scope is private 
    function isCheckContract(bool checker) private pure returns (bool) {
        return !checker;
    }
}

contract B {
    A a = new A();
    uint private amount = 1000;

    function fBCheckMoney() public view returns (uint) {
        return a.checkMoney(); // => Truy cập từ bên ngoài => external access => function public
    }

    
    function fBCheckWallet() public view returns (uint) {
       // a.checkWallet(amount); // => Không thể call function internal khi đang không kế thừa contract đó
    }

    function fBCheckContract() public view returns (bool) {
        // a.isCheckContract(true); // // => Không thể call function private
    }
}

// Contract C sẽ kế thừa lớp A
contract C is A {
    uint private amount = 1000;

    function fCGetMoney() public view returns (uint) {
        uint _money = money;
        return amount + _money; // => Truy cập từ bên ngoài => external access => function public
    }

    
    function fCCheckWallet() public returns (uint) {
       wallet = 1000000; // => Có thể call function internal khi đang không kế thừa contract đó
       return wallet;
    }

    function fCCheckContract() public pure returns (bool) {
        // isCheck = true; // => Không thể private function private (Undeclared identifier)
        return true;
    }
}