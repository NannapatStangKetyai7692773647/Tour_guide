module.exports = app => {
    const book = require("../controllers/booking.controller.js");
  
    var router = require("express").Router();
  
    router.get("/:id", book.findDoc);
  
    app.use('/api/doc', router);
  };