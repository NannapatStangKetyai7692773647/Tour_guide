const sql = require("./db.js");

// constructor
const Tour = function(tour) {
  this.name = tour.name;
  this.price = tour.price;
  this.img = tour.img;
  this.type = tour.type;
  this.detail = tour.detail;
  this.day = tour.day;
  this.sub_name = tour.sub_name;
};

Tour.create = (newLocation, result) => {
  sql.query("INSERT INTO locations SET ?", newLocation, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(err, null);
      return;
    }
    result(null);
  });
};

// Tour.findByName = (name, result) => {
//   sql.query(`SELECT * FROM locations WHERE name LIKE '%${name}%' OR price < '${name}' OR sub_name LIKE '%${name}%' AND type = 'ต่างประเทศ'`, (err, res) => {
//     if (err) {
//       console.log("error: ", err);
//       result(err, null);
//       return;
//     }

//     if (res.length) {
//       console.log("found location: ", res);
//       result(null, res);
//       return;
//     }
//     result({ kind: "not_found" }, null);
//   });
// };

// Tour.findAll = (result) => {
//   sql.query(`SELECT * FROM locations WHERE type = 'ต่างประเทศ'`, (err, res) => {
//     if (err) {
//       console.log("error: ", err);
//       result(err, null);
//       return;
//     }

//     if (res.length) {
//       result(null, res);
//       return;
//     }
//     result({ kind: "not_found" }, null);
//   });
// };

Tour.findByNameIn = (name, result) => {
  sql.query(`SELECT * FROM locations WHERE name LIKE '%${name}%' OR price LIKE '%${name}%' OR sub_name LIKE '%${name}%' AND type = 'ไทย'`, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(err, null);
      return;
    }

    if (res.length) {
      console.log("found location: ", res);
      result(null, res);
      return;
    }
    result({ kind: "not_found" }, null);
  });
};

Tour.findAllIn = (result) => {
  sql.query(`SELECT * FROM locations WHERE type = 'ไทย'`, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(err, null);
      return;
    }

    if (res.length) {
      result(null, res);
      return;
    }
    result({ kind: "not_found" }, null);
  });
};

Tour.updateById = (id, tour, result) => {
  sql.query(
    "UPDATE locations SET name = ?, price = ?, img = ?, type = ? , detail = ?, day = ?, sub_name = ? WHERE id = ?",
    [tour.name, tour.price, tour.img, tour.type, tour.detail, tour.day, tour.sub_name, id],
    (err, res) => {
      if (err) {
        console.log("error: ", err);
        result(null, err);
        return;
      }

      if (res.affectedRows == 0) {
        result({ kind: "not_found" }, null);
        return;
      }

      console.log("updated tour: ", { id: id, ...tour });
      result(null, { id: id, ...tour });
    }
  );
};

Tour.findById = (id, result) => {
  sql.query(`SELECT * FROM locations WHERE id = ?`, id, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(err, null);
      return;
    }

    if (res.length) {
      console.log("found location: ", res);
      result(null, res);
      return;
    }
    result({ kind: "not_found" }, null);
  });
};



Tour.remove = (id,result) => { 
  sql.query(`DELETE FROM locations WHERE id = ${id}`, (err, res) => {
   
    if (err) {
      console.log("error: ", err);
      result(err, null);
      return;
    }
   
    if(res.affectedRows){
      result(null,{ status: true });
    }else{
      result(null,{ status: false });
    } 
  });
};



module.exports = Tour;