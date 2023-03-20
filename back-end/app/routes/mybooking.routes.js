module.exports = app => {
    const book = require("../controllers/booking.controller.js");
  
    var router = require("express").Router();
  
    router.get("/:id", book.find);
    router.put("/:id", book.updateMem);
  
    app.use('/api/mybooking', router);
  };