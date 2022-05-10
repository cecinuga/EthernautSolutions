// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Attacker {
  string public txorigin;
  string public msgowner;

  constructor() public {
      txorigin = tx.origin;
      msgowner = msg.owner;
  }

}