// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Arrays {
    // Mảng tĩnh A với kích thước cố định k được viết như sau:  A[k]
    string [2] member = ['Khung', 'Thuan'];

    // Mảng kích thước không cố định A được viết là: A[]
    uint[] public array;

    // Các phương thức có trong array

    uint[] score;

    // Append to array
    function setScore(uint _score) private {
        score.push(_score);
    }

    // Get all array
    function getAllScore() private view returns (uint [] memory) {
        return score;
    }

    // Get a item in array
    function getScoreByIndex(uint idx) private view returns (uint) {
        require(idx < score.length, 'index out of bound');
        return score[idx];
    }

    // Remove last item
    function removeItemScore() public {
        score.pop();
        // Làm giảm độ dài mảng đi 1
    }

    // Get length array
    function getLength() public view returns (uint) {
        return score.length;
    }

    // Remove any item
    function removeItemByIndex(uint idx) private {
        require(idx < score.length, 'index out of bound');
        delete score[idx];
        // Xóa không thay đổi độ dài mảng.
        // Nó đặt lại giá trị tại chỉ mục thành giá trị mặc định,
    }
}