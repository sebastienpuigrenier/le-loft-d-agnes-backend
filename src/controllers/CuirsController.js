const models = require("../models");

class CuirsController {
  static browseAll = (req, res) => {
    models.cuirs
      .findAll()
      .then(([rows]) => {
        res.send(rows);
      })
      .catch((error) => {
        console.error(error);
        res.sendStatus(500);
      });
  };
}

module.exports = CuirsController;
