import http from "../http-common";

class BookDataService {

  getAll() {
    return http.get(`/booking`);
  }

  get(id) {
    return http.get(`/mybooking/${id}`);
  }

  getDoc(id) {
    return http.get(`/doc/${id}`);
  }

  create(data) {
    return http.post("/booking", data);
  }

  update(id, data) {
    return http.put(`/booking/${id}`, data);
  }

  updateMem(id, data) {
    return http.put(`/mybooking/${id}`, data);
  } 
  
  del(id) { 
    return http.delete(`/booking/${id}`);
  }
}

export default new BookDataService();