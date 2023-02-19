//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Address.sol";
import "./interface/IUserLibrary.sol";

contract Civilization is ERC721, ERC721Enumerable, Ownable {
    using Address for address;
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;
    address private userLibraryAddress;

    constructor(string memory name, string memory symbol, address _userLibraryAddress) ERC721(name, symbol) {
        userLibraryAddress = _userLibraryAddress;
    }

    function safeMint(address to, string memory img) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        IUserLibrary(userLibraryAddress).born(tokenId, img, block.number, "");
    }

    function isUser(uint256 tokenId) public returns (bool) {
        address owner = ownerOf(tokenId);
        return !owner.isContract();
    }

    function isWorker(uint256 tokenId) public returns (bool) {
        address owner = ownerOf(tokenId);
        return owner.isContract();
    }

    // The following functions are overrides required by Solidity.
    function _beforeTokenTransfer(address from, address to, uint256 tokenId, uint256 batchSize)
    internal
    override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId, batchSize);
    }

    function supportsInterface(bytes4 interfaceId)
    public
    view
    override(ERC721, ERC721Enumerable)
    returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
