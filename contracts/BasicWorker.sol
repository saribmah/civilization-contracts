//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "./interface/IWorker.sol";

contract BasicWorker is IWorker {
    uint256 public immutable birthday;

    constructor() {
        birthday = block.number;
    }

    function cursed() external returns (bool) {
        return false;
    }

    function peek() external returns (string memory) {
        return "";
    }

    function age() external returns (uint256) {
        return block.number - birthday;
    }
}
