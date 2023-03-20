const sql = require("./db.js");

// constructor
const User = function(user) {
  this.fname = user.fname;
  this.lname = user.lname;
  this.phone = user.phone;
  this.email = user.email;
  this.pwd = user.pwd;
  this.role = user.role;
};

User.create = (newUser, result) => {
  sql.query("INSERT INTO users SET ?", newUser, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(err, null);
      return;
    }
    result(null);
  });
};

User.findByEmail = (email, result) => {
  sql.query(`SELECT * FROM users WHERE email = '${email}'`, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(err, null);
      return;
    }

    if (res.length) {
      console.log("found user: ", res);
      result(null, res);
      return;
    }
    result({ kind: "not_found" }, null);
  });
};

User.login = (email, pwd , result) => {
  sql.query(`SELECT * FROM users WHERE email = '${email}' AND pwd = '${pwd}'`, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(err, null);
      return;
    }

    if (res.length) {
      console.log("found user: ", res[0]);
      result(null, res[0]);
      return;
    }
    result({ kind: "not_found" }, null);
  });
};

User.updateById = (id, tutorial, result) => {
  console.log(tutorial.pwd);
  sql.query(`SELECT * FROM users WHERE email = '${id}' AND pwd = '${tutorial.old_pwd}'`, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(err, null);
      return;
    }

    if (res.length) {
      sql.query(
        "UPDATE users SET fname = ?, lname = ?, phone = ?, pwd = ? WHERE email = ?",
        [tutorial.fname, tutorial.lname, tutorial.phone, tutorial.pwd, id],
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
    
          console.log("updated: ", { id: id, ...tutorial });
          result(null, { id: id, ...tutorial });
        }
      );
      return;
    }
    result({ kind: "not_found" }, null);
  });
};

module.exports = User;