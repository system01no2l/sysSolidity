// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
// Gas: là một đơn vị dùng để biểu thị mức độ tính toán trên mạng block chain
// Trong mỗi giao dịch thì chúng ta sẽ phải trả fee gas: gas spent * gas price
// Fee gas: Dùng để thanh toán cho các miner để có thể tính toán cần thiết để xử lý và xác thực các giao dịch trên chuỗi khối Ethereum .
// gas spent => là tổng số lượng gas cần dùng cho giao dịch
// gas price => là số tiền cho mỗi đơn vị gas, được định dạng dưới dạng ether, với đơn vị là: gwei, có thể là: nanoeth
// Do đó, trong mỗi transaction thì khi mà phí gas price càng cao thì transaction đó sẽ được ưu tiên khi đẩy vào khối block

// Mẹo có thể check fee gas cho các sàn dex tại: https://etherscan.io/gastracker
contract Gas {

}