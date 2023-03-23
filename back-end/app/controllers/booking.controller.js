const Tour = require("../models/booking.model.js");

exports.create = (req, res) => {
  if (!req.body) {
    res.status(400).send({
      message: "Content can not be empty!",
    });
  }

  const book = new Tour({
    location: req.body.location,
    name_tour: req.body.name_tour,
    img : req.body.img,
    sub_name_tour: req.body.sub_name_tour,
    period: req.body.period,
    name_user: req.body.name_user,
    member: req.body.member,
    phone: req.body.phone,
    user: req.body.user,
    tranfer: req.body.tranfer,
    status: req.body.status,
    day: req.body.day,
    to_date: req.body.to_date,
    people: req.body.people,
    doc: req.body.doc,
    price: req.body.price,
  });
  console.log(book);


  Tour.create(book, (err, data) => {
    if (err)
      res.status(500).send({
        message: err.message || "Some error occurred.",
      });
    else res.send(data);
  });
};

exports.allData = (req, res) => {
  Tour.findAll((err, data) => {
    if (err) {
      if (err.kind === "not_found") {
        res.send(null);
      } else {
        res.status(500).send({
          message: "Error retrieving tour",
        });
      }
    } else {
      res.send(data);
    }
  });
};

exports.update = (req, res) => {
  if (!req.body) {
    res.status(400).send({
      message: "Content can not be empty!",
    });
  }

  console.log(req.body);

  Tour.updateById(
    req.params.id,
    {
      status: req.body.status,
      doc: req.body.doc,
      guide: req.body.guide,
      guide_phone: req.body.guide_phone,
      status: req.body.status,
    },
    (err, data) => {
      if (err) {
        if (err.kind === "not_found") {
          res.status(404).send({
            message: `Not found tour with id ${req.params.id}.`,
          });
        } else {
          res.status(500).send({
            message: "Error updating tour with id " + req.params.id,
          });
        }
      } else res.send(data);
    }
  );
};


exports.remove = (req, res) => { 
  Tour.remove(req.params.id, (err, data) => { 
    if (err) {
      if (err.kind === "not_found") {
        res.send(null);
      } else {
        res.status(500).send({
          message: "Error deleting booking"
        });
      }
    } else {
      res.send(data);
    }
  });
};

exports.updateMem = (req, res) => {
  if (!req.body) {
    res.status(400).send({
      message: "Content can not be empty!",
    });
  }

  console.log(req.body);

  Tour.updateByIdMem(
    req.params.id,
    {
      tranfer: req.body.tranfer,
      member: req.body.member,
      status: req.body.status,
    },
    (err, data) => {
      if (err) {
        if (err.kind === "not_found") {
          res.status(404).send({
            message: `Not found tour with id ${req.params.id}.`,
          });
        } else {
          res.status(500).send({
            message: "Error updating tour with id " + req.params.id,
          });
        }
      } else res.send(data);
    }
  );
};

exports.find = (req, res) => {
  Tour.findById(req.params.id, (err, data) => {
    if (err) {
      if (err.kind === "not_found") {
        res.send(null);
      } else {
        res.status(500).send({
          message: "Error retrieving tour with name " + req.params.id,
        });
      }
    } else {
      res.send(data);
    }
  });
};

exports.findDoc = (req, res) => {
  Tour.findByIdDoc(req.params.id, (err, data) => {
    if (err) {
      if (err.kind === "not_found") {
        res.send(null);
      } else {
        res.status(500).send({
          message: "Error retrieving tour with name " + req.params.id,
        });
      }
    } else {
      res.send(data);
    }
  });
};