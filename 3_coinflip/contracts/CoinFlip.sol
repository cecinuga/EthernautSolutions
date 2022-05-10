pragma solidity >=0.6.0;

import "openzeppelin-contracts/math/SafeMath.sol";

contract CoinFlip {

  using SafeMath for uint256;
  uint256 public consecutiveWins;
  uint256 public lastHash;
  uint256 public blockValue;
  bytes32 public blockHash;
  uint256 public coinFlip;
  uint256 public FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

  constructor() public {
    consecutiveWins = 0;
  }

  function flip(bool _guess) public returns (bool) {
    blockHash = blockhash(block.number.sub(1));
    blockValue = uint256(blockHash);

    if (lastHash == blockValue) {
      revert();
    }

    lastHash = blockValue;
    coinFlip = blockValue.div(FACTOR);
    bool side = coinFlip == 1 ? true : false;

    if (side == _guess) {
      consecutiveWins++;
      return true;
    } else {
      consecutiveWins = 0;
      return false;
    }
  }
}