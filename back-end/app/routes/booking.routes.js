module.exports = app => {
    const book = require("../controllers/booking.controller.js");
  
    var router = require("express").Router();
  
    router.post("/", book.create);

    router.get("/", book.allData);

    router.put("/:id", book.update);
  
    router.delete("/:id", book.remove);

    app.use('/api/booking', router);
  };