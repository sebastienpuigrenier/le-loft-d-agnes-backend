const { v4: uuidv4 } = require("uuid");
const models = require("../models");

class PhotosController {
  static create = (req, res) => {
    let newPhoto = {
      num_photo: uuidv4(),
      lien: req.files.imageFile.newFilename,
      ismedium: true,
    };
    let message = "";

    if (req.url === "/create_categorie") {
      newPhoto = {
        ...newPhoto,
        num_categorie: req.body.numCollection,
        nomCategorie: req.body.nom,
      };
      message = "Nouvelle catégorie créée.";
    }

    models.photos
      .insert(newPhoto)
      .then(() => {
        res.status(201).send({ message });
      })
      .catch((error) => {
        console.error(error);
        res.sendStatus(500);
      });
  };

  static modify = (req, res) => {
    if (
      req.files && // 👈 null and undefined check
      Object.keys(req.files).length === 0 &&
      Object.getPrototypeOf(req.files) === Object.prototype
    ) {
      res.sendStatus(201);
    }

    const newPhoto = {
      num_photos: req.body.num_photos,
      lien: req.files.imageFile.newFilename,
    };

    models.photos
      .update(newPhoto)
      .then(() => {
        res.status(201).send("modification terminée");
      })
      .catch((error) => {
        console.error(error);
        res.sendStatus(500);
      });
  };

  static delete = (req, res, next) => {
    const photoToDelete = req.params.uuidPhoto;

    models.photos
      .delete(photoToDelete)
      .then(() => {
        next();
      })
      .catch((error) => {
        console.error(error);
        res.sendStatus(500);
      });
  };
}
module.exports = PhotosController;
