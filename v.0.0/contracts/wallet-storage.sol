// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract walletStorage {
    struct Wallet{
        uint256 walletId;
        string name;
    }

    Wallet[] public wallet;
    mapping( uint256 => string ) public idToWalletName;

    function createWallet(uint256 _walletId, string memory _name) public {
        wallet.push(Wallet(_walletId, _name));
        idToWalletName[_walletId] = _name;
    }
}