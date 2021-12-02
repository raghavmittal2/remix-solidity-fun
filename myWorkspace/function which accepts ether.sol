pragma solidity 0.5.1;

contract myContract {
    mapping(address => uint256) public balances;
    //address of wallet to send ether to
    address payable wallet;

    constructor(address payable _wallet) public {
        wallet = _wallet;
    }

    //payable modifier is required to send ether
    function buyToken() public payable{
        //buy a token
        balances[msg.sender] += 1;

        //send ether to wallet
        wallet.transfer(msg.value);
    }
}