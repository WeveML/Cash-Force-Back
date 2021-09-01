module.exports = (sequelize, Sequelize) => {
    const Orders = sequelize.define("orders", {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true
      },
      orderNfId: {
        type: Sequelize.STRING
      },
      orderNumber: {
        type: Sequelize.STRING
      },
      orderPath: {
        type: Sequelize.STRING
      },
      orderFileName: {
        type: Sequelize.STRING
      },
      orderOriginalName: {
        type: Sequelize.STRING
      },
      emissionDate: {
        type: Sequelize.STRING
      },
      pdfFile: {
        type: Sequelize.STRING
      },
      emitedTo: {
        type: Sequelize.STRING
      },
      nNf: {
        type: Sequelize.STRING
      },
      CTE: {
        type: Sequelize.STRING
      },
      value: {
        type: Sequelize.STRING
      },
      createdAt: {
        type: Sequelize.DATE
      },
      updatedAt: {
        type: Sequelize.DATE
      },
      cnpjId: {
        type: Sequelize.INTEGER,
        references:{
          model: 'cnpjs',
          key:'id',
        }
      },
      userId: {
        type: Sequelize.INTEGER,
        references: 'users',
        referencesKey: 'id' 
      },
      buyerId: {
        type: Sequelize.INTEGER,
        references: 'buyers',
        referencesKey: 'id' 
      },
      providerId: {
        type: Sequelize.INTEGER,
        references: 'providers',
        referencesKey: 'id' 
      },
      orderStatusBuyer: {
        type: Sequelize.STRING
      },
      orderStatusProvider: {
        type: Sequelize.STRING
      },
      deliveryReceipt: {
        type: Sequelize.STRING
      },
      cargoPackingList: {
        type: Sequelize.STRING
      },
      deliveryCtrc: {
        type: Sequelize.STRING
      },
    });
    return Orders;
  };