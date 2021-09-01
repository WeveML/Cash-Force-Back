const express = require("express");
const cors = require("cors");
const app = express();
const db = require("./app/models");
var corsOptions = {
  origin: "http://localhost:8080"
};


db.sequelize.sync()
.then(data =>{
    //console.log()
}).catch(error =>{

});
app.use(cors(corsOptions));

// parse requests of content-type - application/json
app.use(express.json());

// parse requests of content-type - application/x-www-form-urlencoded
app.use(express.urlencoded({ extended: true }));

// ROTAS 
require("./app/routes/api.routes")(app);

// set port, listen for requests
const PORT = process.env.PORT || 3030;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}.`);
});


