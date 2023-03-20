const guide = require("../models/guide.model.js");




exports.create = (req, res) => {
  if (!req.body) {
    res.status(400).send({
      message: "Content can not be empty!",
    });
  }

  const dataObj = {
    fname: req.body.fname,
    sname: req.body.sname,
    license: req.body.license,
    mobile: req.body.mobile,
    email: req.body.email,
    avatar: req.body.avatar
  }

  guide.create(dataObj, (err, data) => {
    if (err){
      res.status(500).send({
        message: err.message || "Some error occurred.",
        status:false,
      });
    }else{
      if(data.affectedRows){
          res.status(200).send({
            status:true,
            id:data.insertId,
          });
      } 
    } 
  });
};

exports.getAllGuide = (req, res) => {
  guide.getAll((err, data) => {
    if (err) { 
        res.status(404).send({
          message: `Not found user , Maybe something fault`,
        }); 
    } else{
      res.send(data);
    } 
  });
};


exports.delete = (req, res) => {
  guide.delete(req.params.id,(err, data) => {
    if (err) { 
        res.status(404).send({
          message: `can not delete`,
        }); 
    } else{
      res.send(data);
    } 
  });
};

exports.updGuideById = (req, res) => { 
  const dataObj = {
    fname: req.body.fname,
    sname: req.body.sname,
    license: req.body.license,
    mobile: req.body.mobile,
    email: req.body.email,
    avatar: req.body.avatar
  }
  guide.updGuideById(dataObj,req.params.id,(err, data) => {
    if (err) { 
        res.status(404).send({
          message: `can not update`,
        }); 
    } else{
      res.send(data);
    } 
  });
};


// exports.login = (req, res) => {
//   User.login(req.body.email, req.body.pwd, (err, data) => {
//     if (err) {
//       if (err.kind === "not_found") {
//         res.status(404).send({
//           message: `Not found user with email ${req.body.email}.`,
//         });
//       } else {
//         res.status(500).send({
//           message: "Error retrieving user with email " + req.body.email,
//         });
//       }
//     } else res.send(data);
//   });
// };

// exports.update = (req, res) => {

//   if (!req.body) {
//     res.status(400).send({
//       message: "Content can not be empty!"
//     });
//   }
//   console.log(req.body);

//   User.updateById(
//     req.params.id,
//     {
//       fname: req.body.fname,
//       lname: req.body.lname,
//       phone: req.body.phone,
//       pwd: req.body.pwd,
//       old_pwd: req.body.old_pwd,
//     },
//     (err, data) => {
//       if (err) {
//         if (err.kind === "not_found") {
//           res.status(404).send({
//             message: `Not found Tutorial with id ${req.params.id}.`
//           });
//         } else {
//           res.status(500).send({
//             message: "Error updating Tutorial with id " + req.params.id
//           });
//         }
//       } else res.send(data);
//     }
//   );
// };
