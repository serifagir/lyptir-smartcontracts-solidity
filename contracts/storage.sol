//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Storage{
    struct Wallet{
        string walletId;
        uint256 amount; 
    }

    Wallet[] public wallet;
    mapping(string => uint256)public walletIdToAmount;

    function createWallet(string memory _walletId, uint256 _amount) public {
        wallet.push(Wallet({walletId: _walletId, amount: _amount}));
        walletIdToAmount[_walletId] = _amount;
    }



}