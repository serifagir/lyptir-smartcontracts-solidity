//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Storage {
    uint256 data;

    function storeData( uint256 storedData ) public {
        data = storedData;
    }

    function displayStoredData() public view returns(uint256) {
        return data;
    }
}


