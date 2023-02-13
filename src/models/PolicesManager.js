const AbstractManager = require("./AbstractManager");

class PolicesManager extends AbstractManager {
  static table = "polices";
}

module.exports = PolicesManager;
