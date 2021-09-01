const db = require("../models");
// DEFINE DB
const orders = db.orders;
const cnpjs = db.cnpjs;
const users = db.users;
const providers = db.providers;
const buyers = db.buyers;

// INNER JOIN DB
orders.hasMany(cnpjs, {foreignKey: 'id', sourceKey: 'cnpjId'});
orders.hasMany(users, {foreignKey: 'id', sourceKey: 'userId'});
orders.hasMany(providers, {foreignKey: 'id', sourceKey: 'providerId'});
orders.hasMany(buyers, {foreignKey: 'id', sourceKey: 'buyerId'});

const Tutorial = db.tutorials;
const Op = db.Sequelize.Op;

// Retrieve all Tutorials from the database.
exports.findAll = (req, res) => {
      orders.findAll({
        include: [
            {
                model:users,
                attributes:['name'],
            },
            {
                model:cnpjs,
                attributes:['cnpj'],
            },
            {
              model:providers,
              attributes:['name'],
            },
            {
              model:buyers,
              attributes:['name'],
            },
        ]
      })
      .then(data => {
        res.send(data);
        console.log(data);
      })
      .catch(err => {
        res.status(500).send({
          message:
            err.message || "Some error occurred while retrieving DATA API."
        });
      });
};