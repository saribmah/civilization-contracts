//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "./interface/IUserLibrary.sol";

contract UserLibrary is IUserLibrary {
    mapping(address => mapping(uint256 => UserInfo)) public userInfos;

    function born(uint256 identifier, string calldata img, uint256 spawnDay, string calldata description) external {
        address msgSender = msg.sender;
        userInfos[msgSender][identifier] = UserInfo(img, spawnDay, description);
    }

    /**
     * @notice Returns Token URI based on TokenID
     * @param tokenId ID to get the TokenURI for
     */
    function tokenURI(uint256 tokenId) external view returns (string memory) {
        UserInfo storage info = userInfos[msg.sender][tokenId];
        //return _generateUserData(info, tokenId);
        return "";
    }
}
