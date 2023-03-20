<script setup>
import NavbarUser from "./NavbarUser.vue";
</script>

<script>
import UserDataService from "../services/UserDataService";
export default {
  name: "Profile",
  data() {
    return {
      user: {
        email: "",
        fname: "",
        lname: "",
        phone: "",
        pwd: "",
        role: "user",
      },
      submitted: false,
      old_pwd: "",
    };
  },
  methods: {
    saveUser() {
      var data = {
        fname: this.user.fname,
        lname: this.user.lname,
        phone: this.user.phone,
        pwd: this.user.pwd,
        old_pwd: this.old_pwd,
      };
      UserDataService.update(this.$route.params.user, data)
        .then((response) => {
          this.$router.push({
            name: "Home2",
            params: { user: this.$route.params.user },
          });
          this.submitted = true;
        })
        .catch((e) => {
          console.log(e);
        });
    },

    newUser() {
      this.submitted = false;
      this.user = {};
    },

    getData() {
      UserDataService.get(this.$route.params.user)
        .then((res) => {
          this.user = res.data[0];
          this.user.pwd = "";
        })
        .catch((e) => {
          console.log(e);
        });
    },
  },
  mounted() {
    this.getData();
  },
};
</script>

<template>
  <div class="auth-wrapper" :style="{'background-image':'url(/src/assets/img/10909472.jpg)','height':'100vh'}">
    <NavbarUser />
    <div class="auth-inner">
      <form @submit.prevent="saveUser">
        <div v-if="!submitted">
          <h3>ข้อมูลส่วนตัว</h3>
          <div class="form-group">
            <label for="ชื่อ"> ชื่อ </label>
            <input
              type="text"
              name="fname"
              placeholder="ชื่อ"
              id="fname"
              required
              v-model="user.fname"
            />
          </div>
          <div class="form-group">
            <label for="นามสกุล"> นามสกุล </label>
            <input
              type="text"
              name="lname"
              placeholder="นามสกุล"
              id="lname"
              required
              v-model="user.lname"
            />
          </div>
          <div class="form-group">
            <label for="เบอร์"> เบอร์โทรศัพท์ </label>
            <input
              type="text"
              onkeypress="return event.charCode >= 48 && event.charCode <= 57"
              name="phone"
              placeholder="เบอร์โทรศัพท์"
              id="phone"
              required
              v-model="user.phone"
            />
          </div>
          <div class="form-group">
            <label for="password">
              <i class="fas fa-lock"></i>
              Password เก่า
            </label>

            <input
              type="password"
              name="pwd"
              placeholder="Password"
              id="pwd"
              required
              v-model="old_pwd"
            />
          </div>
          <div class="form-group">
            <label for="password">
              <i class="fas fa-lock"></i>
              Password ใหม่
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
            <button class="btn btn-primary btn-block">
              แก้ไข
            </button>
          </div>
        </div>
        <div v-else>
          <h4>You submitted successfully!</h4>
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