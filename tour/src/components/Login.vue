<script setup>
import NavLogin from "./NavLogin.vue";
</script>

<script>
import UserDataService from "../services/UserDataService";
export default {
  name: "login",
  data() {
    return {
      user: {
        email: "",
        pwd: "",
        role: null,
      },
      loggedin: false,
    };
  },
  methods: {
    Login() {
      var data = {
        email: this.user.email,
        pwd: this.user.pwd,
      };
      UserDataService.login(data)
        .then((response) => {
          this.user.role = response.data.role;
          this.loggedin = true;
          this.Home(this.user.role);
        })
        .catch((e) => {
          console.log(e);
        });
    },
    Home(role) {
      if (role === "admin") {
        this.$router.push({ name: "HomeAdmin2" });
      } else {
        this.$router.push({ name: "Home2", params: { user: this.user.email } });
      }
    },
  },
};
</script>

<template>
  <div class="auth-wrapper">
    <NavLogin />
    <div class="auth-inner">
      <form v-on:submit.prevent="Login">
        <h3>เข้าสู่ระบบ</h3>
        <div class="form-group">
          <label for="Email">
            <i class="fas fa-user"></i>
            Email
          </label>

          <input
            type="email"
            name="email"
            placeholder="Email"
            id="email"
            required
            v-model="user.email"
          />
        </div>
        <div class="form-group">
          <label for="password">
            <i class="fas fa-lock"></i>
            Password
          </label>

          <input
            type="password"
            name="pwd"
            placeholder="Password"
            id="pwd"
            required
            v-model="user.pwd"
          />
        </div>
        <div class="form-group">
          <button class="btn btn-primary btn-block">เข้าสู่ระบบ</button>
        </div>
      </form>
    </div>
  </div>
</template>
  
<style scoped>
label,
span {
  color: black;
  font-weight: 500;
  font-family: "prompt", sans-serif;
}
</style>