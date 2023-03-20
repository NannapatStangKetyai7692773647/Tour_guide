module.exports = app => {
    const tour = require("../controllers/tour.controller.js");
  
    var router = require("express").Router();
  
    router.post("/", tour.create);

    router.get("/", tour.allDataIn);
  
    router.get("/:name", tour.findOneIn);
  
    router.put("/:id", tour.update);
  
    app.use('/api/tourTh', router);
  };