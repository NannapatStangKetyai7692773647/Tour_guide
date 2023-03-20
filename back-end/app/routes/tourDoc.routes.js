module.exports = app => {
    const tour = require("../controllers/tour.controller.js");
  
    var router = require("express").Router();

    router.get("/:id", tour.find);
  
    app.use('/api/tourDoc', router);
  };