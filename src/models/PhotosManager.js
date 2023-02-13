const AbstractManager = require("./AbstractManager");

class PhotosManager extends AbstractManager {
  static table = "photos";

  insert(newPhoto) {
    return this.connection.query(
      `INSERT INTO ${this.table} (
        num_photos,
        lien,
        localhostlien,
        ismaxi,
        ismedium,
        ismini,
        num_categories,
        num_produits,
        num_cuirs,
        num_polices
        )
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);`,
      [
        newPhoto.num_photo,
        newPhoto.lien,
        newPhoto.localhostlien ? newPhoto.localhostlien : null,
        newPhoto.ismaxi ? newPhoto.ismaxi : false,
        newPhoto.ismedium ? newPhoto.ismedium : false,
        newPhoto.ismini ? newPhoto.ismini : false,
        newPhoto.num_categorie ? newPhoto.num_categorie : null,
        newPhoto.num_produit ? newPhoto.num_produit : null,
        newPhoto.num_cuir ? newPhoto.num_cuir : null,
        newPhoto.num_police ? newPhoto.num_police : null,
      ]
    );
  }

  modify(newPhoto) {
    return this.connection.query(
      `UPDATE ${this.table} SET 
        lien = ?
      WHERE num_photos = '?';`,
      [newPhoto.lien, newPhoto.num_photos]
    );
  }

  delete(uuid) {
    return this.connection.query(
      `DELETE FROM ${this.table}
         WHERE num_photos = ?;`,
      [uuid]
    );
  }
}

module.exports = PhotosManager;
