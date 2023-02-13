const AbstractManager = require("./AbstractManager");

class CategoriesManager extends AbstractManager {
  static table = "categories";

  findAllCategories() {
    return this.connection.query(
      `SELECT DISTINCT
        cat.num_categories, cat.nom, cat.description, cat.priorité,
        photos.lien, photos.localhostlien, photos.num_photos FROM categories as cat
        LEFT JOIN photos ON photos.num_categories = cat.num_categories
        ORDER BY cat.priorité;`
    );
  }

  insert(categorie) {
    return this.connection.query(
      `INSERT INTO ${this.table} (num_categories, nom, description, priorité)
        VALUES (?, ?, ?, ?);`,
      [
        categorie.num_categories,
        categorie.nom,
        categorie.description,
        categorie.priorité,
      ]
    );
  }

  modify(uuid, modification) {
    return this.connection.query(
      `UPDATE ${this.table} SET 
        nom = ?,
        description = ?,
        priorité = ?
      WHERE num_categories = '${uuid}';`,
      [modification.nom, modification.description, modification.priorité]
    );
  }

  delete(uuid) {
    return this.connection.query(
      `DELETE FROM ${this.table}
      WHERE num_categories = ?`,
      [uuid]
    );
  }
}

module.exports = CategoriesManager;
