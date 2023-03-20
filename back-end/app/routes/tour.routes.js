module.exports = app => {
    const tour = require("../controllers/tour.controller.js");
  
    var router = require("express").Router();
  
    router.post("/", tour.create);

    // router.get("/", tour.allData);
  
    // router.get("/:name", tour.findOne);
  
    router.put("/:id", tour.update);
    router.delete("/:id", tour.remove);
  
    app.use('/api/tour', router);
  };