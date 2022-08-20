// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract DataLocations {
    /**
Variables are declared as either storage, memory or calldata to explicitly specify the location of the data.
storage - variable is a state variable (store on blockchain) 
=> dữ liệu được lưu trữ trên blockchain
memory - variable is in memory and it exists while a function is being called
=> dữ liệu được lưu vào memoryvà sẽ bị xóa sau khi hàm mà nó được khai báo đã thực thi xong
calldata - special data location that contains function arguments
=> được lưu trữ được truyền dưới dạng tham số đầu vào cho một hàm và không được chỉnh sửa

Việc lưu trữ trên solidity: 
=>  storage là vị trí dữ liệu đắt tiền nhất mà bạn có thể sử dụng. Sau đó là memory, với rẻ nhất là calldata.
Hãy cố gắng giảm thiểu số lần bạn thay đổi các biến (trạng thái) toàn cục
 */

    Person[] persons; // Tạo ra một biến storage

    struct Person {
        string name;
        uint256 age;
        address personAddress;
    }

    constructor () {
        // Tạo ra 1 đối tượng trong struct lưu trên memory, đồng nghĩa với khi hàm khởi tạo chạy xong thì bị hủy data.
        Person memory p1 = Person({
            name: 'TaoBa',
            age: 30,
            personAddress: msg.sender
        });

        Person memory p2 = Person({
            name: 'TaoLao',
            age: 20,
            personAddress: msg.sender
        });
        // Set 2 giá trị vào biến persons ở trong storage của block 
        persons.push(p1);
        persons.push(p2);
    }

    // => Thử thay đổi giá trị với biến ở memory => Không thay đổi giá trị của biến persons ở trong storage
    // Vì nó chỉ tác động đến vùng nhớ ở memory
    // Khi gọi load data thì biến persons trong storage không bị cập nhật
    function changePersonMemory() public view {
        Person memory p1 = persons[0];
        p1.age = 87;
    }

    // => Thử thay đổi giá trị với biến ở storage => Thay đổi giá trị của biến persons ở trong storage
    // Vì nó tác động đến vùng nhớ ở trong storage
    // Khi gọi load data thì biến persons trong storage đã bị cập nhật
    function changePersonStorage() public {
        Person storage p2 = persons[0];
        p2.age = 19;
        p2.name = 'Khung';
    }

    // Load data
    function loadData() public view returns(Person[] memory) {
        return persons;
    }

    function recive(uint[] calldata sender) public pure returns(uint) {
        // sender[0] = 12; => Calldata arrays are read-only.
        return 10;
    }
}
