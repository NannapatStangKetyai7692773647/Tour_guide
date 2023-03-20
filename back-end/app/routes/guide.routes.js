module.exports = app => {
    const guide = require("../controllers/guide.controller.js");
  
    var router = require("express").Router();
  
    router.post("/", guide.create);
  
    router.get("/all", guide.getAllGuide);
    router.put("/:id", guide.updGuideById);
    router.delete("/:id", guide.delete);
  
    app.use('/api/guide', router);
  };