import http from "../http-common";

class UserDataService {
  get(email) {
    return http.get(`/signUp/${email}`);
  }

  create(data) {
    return http.post("/signUp", data);
  }

  login(data) {
    return http.post("/login", data);
  }

  update(email, data) {
    return http.put(`/signUp/${email}`, data);
  }
}

export default new UserDataService();
