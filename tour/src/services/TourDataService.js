import http from "../http-common";

class TourDataService {
  // get(name) {
  //   return http.get(`/tour/${name}`);
  // }

  // getAll() {
  //   return http.get(`/tour`);
  // }

  getIn(name) {
    return http.get(`/tourTh/${name}`);
  }

  getAllIn() {
    return http.get(`/tourTh`);
  }

  create(data) {
    return http.post("/tour", data);
  }

  update(id, data) {
    return http.put(`/tour/${id}`, data);
  }

  getById(id) {
    return http.get(`/tourDoc/${id}`);
  }

  del(id) { 
    return http.delete(`/tour/${id}`);
  }
}

export default new TourDataService();