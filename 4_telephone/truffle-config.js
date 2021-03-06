const HDWalletProvider = require('@truffle/hdwallet-provider');
const infuraUrl = 'https://rinkeby.infura.io/v3/7af73bcae03742799d7f13318b5f5577';
const fs = require('fs');
const mnemonic = fs.readFileSync('.secret').toString().trim();

module.exports = {
  networks: {
    development: {
     host: "127.0.0.1",     // Localhost (default: none)
     port: 7545,            // Standard Ethereum port (default: none)
     network_id: "*",       // Any network (default: none)
    },
    rinkeby: {
      provider: () => new HDWalletProvider(mnemonic, infuraUrl),
      network_id:4,
      gas:5500000,
      skipDryRun:true,
      deploymentPollingInterval:6000
    }
  },

  mocha: {
    // timeout: 100000
  },

  compilers: {
    solc: {
      version: "^0.6.0",    // Fetch exact version from solc-bin (default: truffle's version)
      settings: {          // See the solidity docs for advice about optimization and evmVersion
       optimizer: {
         enabled: false,
         runs: 200
        },
     }
    }
  },
};
