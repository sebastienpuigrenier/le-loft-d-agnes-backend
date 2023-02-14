const { v4: uuidv4 } = require("uuid");
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

  static create = (req, res, next) => {
    const newNumCollection = uuidv4();

    const newCategorie = {
      nom: req.body.nom,
      description: req.body.description,
      priorité: req.body.priorité,
      num_categories: newNumCollection,
    };

    models.categories
      .insert(newCategorie)
      .then(() => {
        req.body = {
          ...req.body,
          numCollection: newNumCollection,
          nomCategorie: req.body.nom,
        };
        next();
      })
      .catch((error) => {
        console.error(error);
        res.sendStatus(500);
      });
  };

  static modify = (req, res, next) => {
    const categorie = {
      uuid: req.params.uuid,
    };

    models.categories
      .modify(categorie.uuid, req.body)
      .then(([result]) => {
        res.status(201).send({ ...categorie, uuid: result.insertUuid });
        next();
      })
      .catch((error) => {
        console.error(error);
        res.sendStatus(500);
      });
  };

  static delete = (req, res) => {
    const categorie = {
      uuid: req.params.uuidCat,
    };

    models.categories
      .delete(categorie.uuid)
      .then(([result]) => {
        res.status(201).send({ ...categorie, uuid: result.insertUuid });
      })
      .catch((error) => {
        console.error(error);
        res.sendStatus(500);
      });
  };
}

module.exports = CategoriesController;
