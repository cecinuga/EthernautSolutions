const Attacker = artifacts.require("Attacker");
const Partner = artifacts.require("Partner")

module.exports = function (deployer) {
  deployer.deploy(Attacker, Partner.address);
};
