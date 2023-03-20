const Tour = require("../models/tour.model.js");

exports.create = (req, res) => {
  if (!req.body) {
    res.status(400).send({
      message: "Content can not be empty!",
    });
  }

  const tour = new Tour ({
    name: req.body.name,
    price: req.body.price,
    img: req.body.img,
    type: req.body.type,
    detail: req.body.detail,
    day: req.body.day,
    sub_name: req.body.sub_name,
  });

  Tour.create(tour, (err, data) => {
    if (err)
      res.status(500).send({
        message: err.message || "Some error occurred.",
      });
    else res.send(data);
  });
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
      res.send(data);}
  });
};

// exports.findOne = (req, res) => {
//   Tour.findByName(req.params.name, (err, data) => {
//     if (err) {
//       if (err.kind === "not_found") {
//         res.send(null);
//       } else {
//         res.status(500).send({
//           message: "Error retrieving tour with name " + req.params.name,
//         });
//       }
//     } else {
//       res.send(data);}
//   });
// };

// exports.allData = (req, res) => {
//   Tour.findAll((err, data) => {
//     if (err) {
//       if (err.kind === "not_found") {
//         res.send(null);
//       } else {
//         res.status(500).send({
//           message: "Error retrieving tour"
//         });
//       }
//     } else {
//       res.send(data);}
//   });
// };

exports.findOneIn = (req, res) => {
  Tour.findByNameIn(req.params.name, (err, data) => {
    if (err) {
      if (err.kind === "not_found") {
        res.send(null);
      } else {
        res.status(500).send({
          message: "Error retrieving tour with name " + req.params.name,
        });
      }
    } else {
      res.send(data);}
  });
};

exports.allDataIn = (req, res) => {
  Tour.findAllIn((err, data) => {
    if (err) {
      if (err.kind === "not_found") {
        res.send(null);
      } else {
        res.status(500).send({
          message: "Error retrieving tour"
        });
      }
    } else {
      res.send(data);}
  });
};

exports.remove = (req, res) => { 
  Tour.remove(req.params.id, (err, data) => { 
    if (err) {
      if (err.kind === "not_found") {
        res.send(null);
      } else {
        res.status(500).send({
          message: "Error deleting tour"
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
      message: "Content can not be empty!"
    });
  }

  console.log(req.body);

  Tour.updateById(
    req.params.id,
    new Tour(req.body),
    (err, data) => {
      if (err) {
        if (err.kind === "not_found") {
          res.status(404).send({
            message: `Not found tour with id ${req.params.id}.`
          });
        } else {
          res.status(500).send({
            message: "Error updating tour with id " + req.params.id
          });
        }
      } else res.send(data);
    }
  );
};
