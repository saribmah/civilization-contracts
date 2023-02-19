//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

interface IUserLibrary {
    /**
     * @notice User info
     * @param spawnDay Day user entered civilization
     * @param description Information about the user
     * @param imageUrl User look and feel
     * @param attributes User attributes
     */
    struct UserInfo {
        string imageUrl;
        uint256 spawnDay;
        string description;
    }

    function born(uint256 identifier, string calldata img, uint256 spawnDay, string calldata description) external;
    function tokenURI(uint256 tokenId) external view returns (string memory);
}
