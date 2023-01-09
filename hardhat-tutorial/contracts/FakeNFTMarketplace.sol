// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract FakeNFTMarketPlace{
    
    mapping (uint256 => address) tokens;
    uint256 nftprice = 0.1 ether;

    function purchase(uint256 _tokenId) external payable{
        require(msg.value == nftprice, "You don't have enough ethers (0.01)");
        tokens[_tokenId] = msg.sender;
    }

    function getPrice() external view returns(uint256){
        return nftprice;
    }

    function availble(uint256 _tokenId) external view returns(bool){
        if (tokens[_tokenId] == address(0)) {
            return true;
        } else {
            return false;
        }
    }
}