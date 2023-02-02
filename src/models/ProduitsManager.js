const AbstractManager = require("./AbstractManager");

class ProduitsManager extends AbstractManager {
  static table = "produits";

  //
  findAllProduits() {
    return this.connection.query(
      `SELECT DISTINCT prod.*, photos.lien, photos.localhostlien FROM produits as prod
        INNER JOIN photos WHERE photos.num_produits = prod.num_produits
        ORDER BY prod.priorité;`
    );
  }
}

module.exports = ProduitsManager;
