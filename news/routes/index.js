var express = require('express');
var router = express.Router();
var database = require("../config/db_connection");

router.get("/testconnection", function(request, response, next){
  if(database!=null){
    response.send("Successful connection!");
  }else{
    response.send("Failed connection!");
  }
});

/* GET home page. */
router.get('/', function(req, res, next) {
  
  var people = [
     {
       id: 101,
       name: "Francisco Villa",
       email: "contactfv@gmail.com"
     },
     {
      id: 102,
      name: "Venustiano Carranza",
      email: "contactvc@gmail.com"
    },
    {
      id: 103,
      name: "Emiliano Zapata",
      email: "contactez@gmail.com"
    },
    {
      id: 104,
      name: "Porfirio Diaz",
      email: "contactpd@gmail.com"
    }
  ];
  res.render('index', {title: 'Mundo' , people: people});
});



module.exports = router;
