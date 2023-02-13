const models = require("../models");
const authentification = require("../utils/authentification");
const { JWTTokenCreator } = require("../utils/authentification");

class AuthController {
  static session = (req, res) => {
    models.administrateurs.findByEmail(req.body.email).then((user) => {
      const { email, motdepasse } = user[0][0];

      authentification
        .verifyPassword(req.body.password, motdepasse)
        .then((isVerify) => {
          if (isVerify) {
            const token = JWTTokenCreator(email);
            res
              .status(201)
              .cookie("user_token", token, {
                httpOnly: true,
                expires: new Date(Date.now() + 1000 * 60 * 60 * 24),
              })
              .json({
                message: "Le mot de passe est correct",
                cookie: token,
                email,
              });
          } else {
            res.status(401).send("Email ou mot de passe incorect");
          }
        })
        .catch(() => {
          res.status(401).send("Email ou mot de passe incorect");
        });
    });
  };

  static disconnect = (req, res) => {
    res.clearCookie(req.cookies.user_token).sendStatus(200);
  };
}

module.exports = AuthController;
