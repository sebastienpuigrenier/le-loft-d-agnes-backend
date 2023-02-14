const { verifyAccessToken } = require("../utils/authentification");

const middlewareAdministrateur = async (req, res, next) => {
  console.warn("middleware");
  const data = await verifyAccessToken(req.cookies.user_token);
  console.warn("data", data);
  if (data.role === "administrateur") {
    next();
  }
};

module.exports = { middlewareAdministrateur };
