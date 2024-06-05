/*
................................................................................
...                                                                            .
...                                                                            .
...                                                                            .
...                                                                            .
...                                                                            .
...                                                                            .
...                                                                            .
...                                                                            .
...                                                                            .
...                                                                            .
...                    .& %&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&                     .
...                      &( &&&&&&&&&&&&&&&&&&&&&&&&&&&&#                      .
...                       /& &&&&&   &&&&&&&&&&%  *&&&&                        .
...                         &*.&&&&   &&&&       &&&&%                         .
...                          #& &&&&&  *&&&(   ,&&&&                           .
...                            &,.&&&&   &&,  &&&&&                            .
...                             %& &&&&%       &&.                             .
...                               & *&&&&  #                                   .
...                                && &&&&&&&.                                 .
...                                  & (&&&&&                                  .
...                                   &% &&/                                   .
...                                    .&                                      .
...                                                                            .
...                                                                            .
...                                                                            .
...                                                                            .
...                                                                            .
...                                                                            .
...                                                                            .
...                                                                            .
................................................................................
https://baserunners404.xyz/
*/

// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {ERC404} from "./ERC404.sol";
import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";

contract BaseRunners is ERC404 {
    using Strings for uint256;

    string public baseTokenURI;
    uint256 public constant initialSupply = 10_000;

    constructor(string memory _tokenURI) ERC404("Base Runners", "RNRS", 18, initialSupply, msg.sender) {
        setTokenURI(_tokenURI);
        balanceOf[msg.sender] = initialSupply * 10 ** 18;
    }

    function setTokenURI(string memory _tokenURI) public onlyOwner {
        baseTokenURI = _tokenURI;
    }

    function tokenURI(uint256 id) public view override returns (string memory) {
        return bytes(baseTokenURI).length > 0 ? string.concat(baseTokenURI, id.toString(), ".json") : "";
    }
}