const express = require("express");
const CategoriesController = require("./controllers/CategoriesController");
const ProduitsController = require("./controllers/ProduitController");

const router = express.Router();

router.get("/api", (req, res) => {
  res.json({ message: "Hello from server !" });
});

/*
 ** Categories
 */
router.get("/browse_categories", CategoriesController.browseAll);

/*
 ** Produits
 */

router.get("/browse_produits", ProduitsController.browseAll);

module.exports = router;
