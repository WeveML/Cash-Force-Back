
module.exports = (sequelize, Sequelize) => {
    const Cnpjs = sequelize.define("cnpjs", {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
      },
      cnpj: {
        type: Sequelize.STRING
      },
      companyType: {
        type: Sequelize.STRING
      },
      createdAt: {
        type: Sequelize.STRING
      },
      updatedAt: {
        type: Sequelize.STRING
      },
    });
    return Cnpjs;
};