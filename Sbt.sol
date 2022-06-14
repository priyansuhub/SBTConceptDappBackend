//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SBT {
    string name;
    string symbol;
    address owner;
    uint Supply;
    constructor(string memory _name, string memory _symbol){
        owner = msg.sender;
        name = _name;
        symbol = _symbol;
    }
    
    mapping (uint => address) private sbts;
    mapping (uint => string) private uri;

    function contractOwner() external view returns (address){
        return owner;
    }

    function totalSupply() external view returns (uint){
        return Supply;
    }

    function Name() external view returns(string memory){
        return name;
    }

    function Symbol() external view returns(string memory){
        return symbol;
    }

    function _mint(address _to, string memory _uriVal) internal{
        require (sbts[Supply]!= address(0), "token already minted");
        require(owner == msg.sender,"Not the owner of this function");
        Supply++;
        sbts[Supply] = _to;
        uri[Supply] = _uriVal;
    }

    function _revokeAndRetransfer(address _from, address _to, uint _tokenId) internal {
        require(owner == msg.sender, "Cant revoke token");
        require(ownerOf(_from, _tokenId) == true, "Not owner of");
        sbts[_tokenId] = _to;
    }

    function ownerOf(address _addr, uint _tokenId) public view returns (bool){
        if(sbts[_tokenId] == _addr){
            return true;
        }else{
            return false;
        }
    }
}

