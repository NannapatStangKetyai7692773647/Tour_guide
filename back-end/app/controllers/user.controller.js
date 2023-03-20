const User = require("../models/user.model.js");

exports.create = (req, res) => {
  if (!req.body) {
    res.status(400).send({
      message: "Content can not be empty!",
    });
  }

  const user = new User({
    fname: req.body.fname,
    lname: req.body.lname,
    phone: req.body.phone,
    email: req.body.email,
    pwd: req.body.pwd,
    role: req.body.role,
  });

  User.create(user, (err, data) => {
    if (err)
      res.status(500).send({
        message: err.message || "Some error occurred.",
      });
    else res.send(data);
  });
};

exports.findOne = (req, res) => {
  User.findByEmail(req.params.id, (err, data) => {
    if (err) {
      if (err.kind === "not_found") {
        res.status(404).send({
          message: `Not found user with email ${req.params.id}.`,
        });
      } else {
        res.status(500).send({
          message: "Error retrieving user with email " + req.params.id,
        });
      }
    } else res.send(data);
  });
};

exports.login = (req, res) => {
  User.login(req.body.email, req.body.pwd, (err, data) => {
    if (err) {
      if (err.kind === "not_found") {
        res.status(404).send({
          message: `Not found user with email ${req.body.email}.`,
        });
      } else {
        res.status(500).send({
          message: "Error retrieving user with email " + req.body.email,
        });
      }
    } else res.send(data);
  });
};

exports.update = (req, res) => {

  if (!req.body) {
    res.status(400).send({
      message: "Content can not be empty!"
    });
  }
  console.log(req.body);

  User.updateById(
    req.params.id,
    {
      fname: req.body.fname,
      lname: req.body.lname,
      phone: req.body.phone,
      pwd: req.body.pwd,
      old_pwd: req.body.old_pwd,
    },
    (err, data) => {
      if (err) {
        if (err.kind === "not_found") {
          res.status(404).send({
            message: `Not found Tutorial with id ${req.params.id}.`
          });
        } else {
          res.status(500).send({
            message: "Error updating Tutorial with id " + req.params.id
          });
        }
      } else res.send(data);
    }
  );
};
