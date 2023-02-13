const jwt = require("jsonwebtoken");
const argon2 = require("argon2");

const JWTTokenCreator = (userEmail) => {
  return jwt.sign(
    {
      email: userEmail,
      role: "administrateur",
    },
    process.env.PRIVATE_KEY
  );
};

const verifyPassword = (password, hashedPassword) => {
  return argon2.verify(hashedPassword, password);
};

const verifyAccessToken = (token) => {
  const accessTokenSecret = process.env.PRIVATE_KEY;
  return new Promise((resolve, reject) => {
    jwt.verify(token, accessTokenSecret, (err, payload) => {
      if (err) {
        const message =
          err.name === "JsonWebTokenError" ? "Unauthorized" : err.message;
        reject(message);
      }
      resolve(payload);
    });
  });
};

module.exports = {
  verifyPassword,
  JWTTokenCreator,
  verifyAccessToken,
};
