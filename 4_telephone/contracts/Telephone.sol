// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.6.0;

contract Telephone {
  address public txorigin;
  address public msgsender;
  address public owner;

  constructor() public {
    owner = msg.sender;
  }

  function changeOwner(address _owner) public {
    txorigin = tx.origin;
    msgsender = msg.sender;
    
    if (tx.origin != msg.sender) {
      owner = _owner;
    }
  }
}