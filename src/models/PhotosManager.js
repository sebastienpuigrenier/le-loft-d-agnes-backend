const AbstractManager = require("./AbstractManager");

class PhotosManager extends AbstractManager {
  static table = "photos";

  insert(newPhoto) {
    let photo = newPhoto;
    if (newPhoto.nomCategorie === "Objets déco") {
      photo = {
        ...newPhoto,
        localhostlien: "https://i.imgur.com/F9nqTGR.png",
      };
    }
    console.warn("photo", photo);
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
        photo.num_photo,
        photo.lien,
        photo.localhostlien ? photo.localhostlien : null,
        photo.ismaxi ? photo.ismaxi : false,
        photo.ismedium ? photo.ismedium : false,
        photo.ismini ? photo.ismini : false,
        photo.num_categorie ? photo.num_categorie : null,
        photo.num_produit ? photo.num_produit : null,
        photo.num_cuir ? photo.num_cuir : null,
        photo.num_police ? photo.num_police : null,
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
