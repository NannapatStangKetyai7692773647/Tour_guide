<script setup>
import NavLogin from "./NavLogin.vue";
</script>

<script>
import UserDataService from "../services/UserDataService";
import router from "../router";
export default {
  name: "add-user",
  data() {
    return {
      user: {
        fname: "",
        lname: "",
        phone: "",
        email: "",
        pwd: "",
        role: "user",
      },
      submitted: false,
    };
  },
  methods: {
    saveUser() {
      var data = {
        fname: this.user.fname,
        lname: this.user.lname,
        phone: this.user.phone,
        email: this.user.email,
        pwd: this.user.pwd,
        role: this.user.role,
      };

      if (data.fname == "" || data.lname == "" || data.phone == "" || data.email == "" || data.pwd == "" || data.role == "") {
        return false
      }

      UserDataService.create(data)
        .then((response) => {
          this.user.email = response.data.email;
          this.submitted = true;
          this.$swal({
            position: 'center',
            icon: 'success',
            title: 'คุณลงทะเบียนสำเร็จ',
            showConfirmButton: false,
            timer: 1500
          })
          setTimeout(() => {
            router.push('/')
          }, 1600);
        })
        .catch((e) => {
          console.log(e);
        });
    },

    newUser() {
      this.submitted = false;
      this.user = {};
    },
  },
};
</script>

<template>
  <div class="auth-wrapper">
    <NavLogin />
    <div class="auth-inner">
      <form @submit.prevent="saveUser">
        <div v-if="!submitted">
          <h3>ลงทะเบียน</h3>
          <div class="form-group">
            <label for="ชื่อ"> ชื่อ </label>
            <input type="text" name="fname" placeholder="ชื่อ" id="fname" required v-model="user.fname" />
          </div>
          <div class="form-group">
            <label for="นามสกุล"> นามสกุล </label>
            <input type="text" name="lname" placeholder="นามสกุล" id="lname" required v-model="user.lname" />
          </div>
          <div class="form-group">
            <label for="เบอร์"> เบอร์โทรศัพท์ </label>
            <input type="text" onkeypress="return event.charCode >= 48 && event.charCode <= 57" name="phone"
              placeholder="เบอร์โทรศัพท์" id="phone" required v-model="user.phone" />
          </div>
          <div class="form-group">
            <label for="Email">
              <i class="fas fa-user"></i>
              Email
            </label>

            <input type="email" name="email" placeholder="Email" id="email" required v-model="user.email" />
          </div>
          <div class="form-group">
            <label for="password">
              <i class="fas fa-lock"></i>
              Password
            </label>

            <input type="password" name="pwd" placeholder="Password" id="pwd" required v-model="user.pwd" />
          </div>
          <div class="form-group">
            <button type="submit" class="btn btn-primary btn-block">ลงทะเบียน</button>
          </div>
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