//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

interface IHitman {
    function hire() external returns (bool);
    function kill() external returns (bool);
}
