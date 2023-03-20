const sql = require("./db.js");

// constructor
class guide {
  constructor(user) {
    this.fname = user.fname,
      this.sname = user.sname,
      this.license = user.license,
      this.mobile = user.mobile,
      this.email = user.email,
      this.avatar = user.avatar;
  }
  static create(newUser, result) {
    sql.query("INSERT INTO guide SET ?", newUser, (err, res) => {
      if (err) {
        console.log("error: ", err);
        result(err, null);
        return;
      }
      result(null,res);
    });
  }

  static getAll(result){
    sql.query(`SELECT * FROM guide  order by id desc`, (err, res) => {
      if (err) {
        console.log("error: ", err);
        result(err, null);
        return;
      } 
      if (res.length) { 
        result(null, res);
        return;
      }
      result({ message: "not_found", status:false }, null);
    });
  }

  static delete(id,result){ 
      sql.query(`DELETE FROM guide WHERE id = ${id}`, (err, res) => {
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
  }
  static updGuideById(d,id,result){
      let nsql = `UPDATE guide set fname = '${d.fname}' , `
          nsql += `sname = '${d.sname}' , license = '${d.license}' , mobile = '${d.mobile}', email = '${d.email}' , avatar = '${d.avatar}'  `;
          nsql += ` where id ="${id}" `
          sql.query(nsql, (err, res) => {
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
  }
}
 
module.exports = guide;