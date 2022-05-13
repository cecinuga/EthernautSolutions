const Partner = artifacts.require("Partner");

module.exports = function (deployer) {
  deployer.deploy(Partner, '0x39fFDB163DFCd4D6D9Ea9bF1a47A5A07D6E918Fb');
};
