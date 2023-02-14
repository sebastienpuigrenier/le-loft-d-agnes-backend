const express = require("express");
const CategoriesController = require("./controllers/CategoriesController");
const ProduitsController = require("./controllers/ProduitController");
const PolicesController = require("./controllers/PolicesController");
const CuirsController = require("./controllers/CuirsController");
const AuthController = require("./controllers/AuthController");
const PhotosController = require("./controllers/PhotosController");

const { fileMiddleware } = require("./middlewares/fileMiddleware");
const {
  middlewareAdministrateur,
} = require("./middlewares/adminCheckMiddleware");

const router = express.Router();

/* eslint-disable */
// only to keep all line on same model

/*
 ** Categories
 */
router.get(
  "/browse_categories",
  CategoriesController.browseAll
  );

router.post(
  "/create_categorie",
  middlewareAdministrateur,
  fileMiddleware,
  CategoriesController.create,
  PhotosController.create
);

router.put(
  "/modif_categorie/:uuid",
  middlewareAdministrateur,
  fileMiddleware,
  CategoriesController.modify,
  PhotosController.modify
);

router.delete(
  "/delete_categorie/:uuidCat/photo/:uuidPhoto",
  middlewareAdministrateur,
  PhotosController.delete,
  CategoriesController.delete
);

/*
 ** Produits
 */
router.get("/browse_produits", ProduitsController.browseAll);

/*
 ** Polices
 */
router.get("/browse_polices", PolicesController.browseAll);

/*
 ** Cuirs
 */
router.get("/browse_cuirs", CuirsController.browseAll);

/*
 ** Authentification
 */
router.post("/adminlogin", AuthController.session);
router.post("/deconnexion", AuthController.disconnect);

module.exports = router;
