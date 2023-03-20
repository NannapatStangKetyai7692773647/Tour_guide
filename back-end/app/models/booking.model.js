const sql = require("./db.js");

// constructor
const Book = function(book) {
  this.location = book.location;
  this.name_tour = book.name_tour;
  this.sub_name_tour = book.sub_name_tour;
  this.period = book.period;
  this.name_user = book.name_user;
  this.member = book.member;
  this.phone = book.phone;
  this.user = book.user;
  this.tranfer = book.tranfer;
  this.status = book.status;
  this.day = book.day;
  this.to_date = book.to_date;
  this.people = book.people;
  this.doc = book.doc;
};

Book.create = (newLocation, result) => {
  sql.query("INSERT INTO booking SET ?", newLocation, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(err, null);
      return;
    }
    result(null);
  });
};

Book.findAll = (result) => {
  sql.query(`SELECT * FROM booking`, (err, res) => {
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

Book.updateById = (id, tour, result) => {
  sql.query(
    "UPDATE booking SET status = ?, doc = ?, guide = ?, guide_phone = ? WHERE id = ?",
    [tour.status, tour.doc, tour.guide, tour.guide_phone, id],
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

Book.updateByIdMem = (id, tour, result) => {
  sql.query(
    "UPDATE booking SET member = ?, tranfer = ?,status = ? WHERE id = ?",
    [tour.member, tour.tranfer, tour.status, id],
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

      console.log("updated tour: ", { id: id});
      result(null, { id: id });
    }
  );
};

Book.findById = (id, result) => {
  console.log(id);
  sql.query(`SELECT * FROM booking WHERE user = ?`, id, (err, res) => {
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


Book.remove = (id,result) => { 
  sql.query(`DELETE FROM booking WHERE id = ${id}`, (err, res) => {
   
    if (err) { 
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


Book.findByIdDoc = (id, result) => {
  console.log(id);
  sql.query(`SELECT * FROM booking WHERE id = ?`, id, (err, res) => {
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

module.exports = Book;