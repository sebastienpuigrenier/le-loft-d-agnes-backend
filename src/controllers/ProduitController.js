const models = require("../models");

class ProduitsController {
  static browseAll = (req, res) => {
    models.produits
      .findAllProduits()
      .then(([rows]) => {
        res.send(rows);
      })
      .catch((error) => {
        console.error(error);
        res.sendStatus(500);
      });
  };
}

module.exports = ProduitsController;
