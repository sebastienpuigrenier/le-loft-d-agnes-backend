const AbstractManager = require("./AbstractManager");

class CategoriesManager extends AbstractManager {
  static table = "categories";

  findAllCategories() {
    return this.connection.query(
      `SELECT DISTINCT cat.num_categories, cat.nom, cat.description, photos.lien, photos.localhostlien, cat.priorité FROM categories as cat
        INNER JOIN photos WHERE photos.num_categories = cat.num_categories
        ORDER BY cat.priorité;`
    );
  }
}

module.exports = CategoriesManager;
