module.exports = app => {
    const api = require("../controllers/api.controller.js");
    var router = require("express").Router();
    // Retrieve all Tutorials
    router.get("/", api.findAll);


    app.use('/api/', router);
};