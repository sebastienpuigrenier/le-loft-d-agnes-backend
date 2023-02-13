const models = require("../models");

class PolicesController {
  static browseAll = (req, res) => {
    models.polices
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

module.exports = PolicesController;
