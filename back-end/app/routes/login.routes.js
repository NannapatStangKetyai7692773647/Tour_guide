module.exports = app => {
    const user = require("../controllers/user.controller.js");
  
    var router = require("express").Router();
  
    router.post("/", user.login);
  
    // router.get("/:id", user.findOne);
  
    // router.put("/:id", user.update);
  
    app.use('/api/login', router);
  };