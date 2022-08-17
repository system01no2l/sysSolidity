// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Block {
    // băm của khối đã cho khi blocknumber là một trong 256 khối gần đây nhất; nếu không thì trả về 0
    function blockHash() public view returns (bytes32) {
        return blockhash(block.number);
    }
    // phí cơ sở của khối hiện tại ( EIP-3198 và EIP-1559 )
    function basefee() public view returns (uint) {
        return block.basefee;
    }

    // id chuỗi hiện tại
    function chainId() public view returns (uint) {
        return block.chainid;
    }

    // địa chỉ của người khai thác khối hiện tại => Mỗi lần deloy là một địa chỉ khai thác khác nhau
    function coinbase() public view returns (address) {
        return block.coinbase;
    }

    // Get độ khó của chuổi hiện tại
    function difficulty() public view returns (uint) {
        return block.difficulty;
    }

    // gas limit của khối hiện tại
    function gaslimit() public view returns (uint) {
        return block.gaslimit;
    }

    // id khối block hiện tại trong chuỗi
    function numberBlock() public view returns (uint) {
        return block.number;
    }

    // get timestsamp của khối block hiện tại
    function timestamp() public view returns (uint) {
        return block.timestamp;
    }

    // get số lượng gas còn lại
    function gasLeftBlock() public view returns (uint) {
        return gasleft();
    }

    // Get sender, người yêu cầu cuộc gọi
    function sender() public view returns (address) {
        return msg.sender;
    }

    // Get mã định danh hàm (4 bytes đầu tiên)
    function getSig() public pure returns (bytes4) {
        return msg.sig;
    }

    // giá gas của giao dịch
    function getGasPrice() public view returns (uint) {
        return tx.gasprice;
    }

    // get địa chỉ người gửi giao dịch
    function originAddress() public view returns (address) {
        return tx.origin;
    }
}