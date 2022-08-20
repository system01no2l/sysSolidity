
const address = '0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2';
const abi = [
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": true,
				"internalType": "address",
				"name": "_from",
				"type": "address"
			},
			{
				"indexed": false,
				"internalType": "uint256",
				"name": "_value",
				"type": "uint256"
			},
			{
				"indexed": false,
				"internalType": "uint256",
				"name": "time",
				"type": "uint256"
			}
		],
		"name": "Deposit",
		"type": "event"
	},
	{
		"inputs": [],
		"name": "deposit",
		"outputs": [],
		"stateMutability": "payable",
		"type": "function"
	}
];

const ethers = require('ethers');
const ethIn = ethers.utils.parseEther('10');

// Tạo contract
var contract = new ethers.Contract(address, abi);
// Tạo thêm sign
// => TODO

// Main
(async () => {
    // Call function on smart contract at here.
    const tx  = await contract.deposit({ value: ethIn });

})();
setInterval(() => {}, 1 << 30);