var SimpleStorage = artifacts.require("./SimpleStorage.sol");
var BusTicket = artifacts.require("./BusTicket.sol");

module.exports = function (deployer) {
  deployer.deploy(SimpleStorage);
  deployer.deploy(BusTicket);
};
