const AbstractManager = require("./AbstractManager");

class AdministrateursManager extends AbstractManager {
  static table = "administrateurs";

  findByEmail(email) {
    return this.connection.query(
      `select * from  ${this.table} where email = ?`,
      [email]
    );
  }
}

module.exports = AdministrateursManager;
