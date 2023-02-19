//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

interface IWorker {
    function cursed() external returns (bool);
    function peek() external returns (string memory);
    function age() external returns (uint256);
}
