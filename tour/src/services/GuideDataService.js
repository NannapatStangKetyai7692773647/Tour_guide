import http from "../http-common";

class GuideDataService {
  // get(email) {
  //   return http.get(`/signUp/${email}`);
  // }

  create(data) {
    return http.post("/guide/", data);
  }

  getAllUser() {
    return http.get("/guide/all");
  }
  
  update(data,id){
    return http.put("/guide/"+id,data);
  }
  del(id){
    return http.delete("/guide/"+id);
  }
}

export default new GuideDataService();
