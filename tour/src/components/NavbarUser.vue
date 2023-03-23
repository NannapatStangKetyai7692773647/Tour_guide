<script setup></script>

<script>
export default {
  name: "logout",
  methods: {
    logout() {
      this.$swal({
        title: "คุณต้องการออกจากระบบหรือไม่",
        showDenyButton: true,
        showCancelButton: false,
        confirmButtonText: "ออกจากระบบ",
        denyButtonText: "ยกเลิก",
      }).then((result) => {
        /* Read more about isConfirmed, isDenied below */
        if (result.isConfirmed) {
          this.$swal({
            position: "center",
            icon: "success",
            title: "ออกจากระบบแล้ว",
            showConfirmButton: false,
            timer: 1500,
          });
          this.$router.push("/");
        } else if (result.isDenied) {
          this.$swal("คุณยังอยู่ในระบบ", "", "info");
        }
      });
    },
  },
};
</script>

<template>
  <div>
    <nav class="navtop">
      <div>
        <img
          src="@/assets/logo.jpg"
          alt="logo"
          style="
            display: flex;
            margin: 0 auto;
            border-radius: 50%;
            padding: 5px;
          "
        />
        <h1>บริษัทไคด์ โซ กรุ๊ป ทราเวล จำกัด</h1>
        <router-link
          :to="{ name: 'Home2', params: { user: this.$route.params.user } }"
          >หน้าหลัก</router-link
        >
        <router-link
          :to="{ name: 'Profile', params: { user: this.$route.params.user } }"
        >
          ข้อมูลส่วนตัว</router-link
        >
        <router-link
          :to="{ name: 'MyBook', params: { user: this.$route.params.user } }"
          >การจองของฉัน</router-link
        >
        <a @click="logout" href="#"
          ><i class="fas fa-sign-out-alt"></i>Logout</a
        >
      </div>
    </nav>
  </div>
</template>

<style scoped>
.navtop {
  box-sizing: border-box;
  background-color: #2f3947;
  height: 60px;
  width: 100%;
  border: 0;
  margin: auto;
  margin-top: 0;
}
.navtop div {
  display: flex;
  margin: 0 auto;
  width: 1000px;
  height: 100%;
}
.navtop div h1,
.navtop div a {
  display: inline-flex;
  align-items: center;
}

.navtop img {
  display: flex;
  margin: 0 auto;
  border-radius: 50%;
}

.navtop div h1 {
  flex: 1;
  font-size: 16px;
  padding: 0;
  margin: 0;
  color: #eaebed;
  font-weight: normal;
}
.navtop div a {
  padding: 0 20px;
  text-decoration: none;
  color: #c1c4c8;
  font-weight: bold;
}
.navtop div a i {
  padding: 2px 8px 0 0;
}
.navtop div a:hover {
  color: #eaebed;
}
</style>
