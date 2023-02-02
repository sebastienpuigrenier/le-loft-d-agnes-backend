const models = require("../models");

class CategoriesController {
  static browseAll = (req, res) => {
    models.categories
      .findAllCategories()
      .then(([rows]) => {
        res.send(rows);
      })
      .catch((error) => {
        console.error(error);
        res.sendStatus(500);
      });
  };
}

module.exports = CategoriesController;
