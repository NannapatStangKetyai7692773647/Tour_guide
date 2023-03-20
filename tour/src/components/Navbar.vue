<script>
export default {
  name: "logout",
  methods: {
    logout() {
      this.$router.push("/");
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
        <h1>บริษัทไคด์ โซ กรุ๊ป ทราเวล จำกัด(Admin)</h1>
        <router-link to="/homeAdmin2">หน้าหลัก</router-link>
        <router-link to="/allBook">การจอง</router-link>
        <router-link to="/admguide">ไกด์</router-link>
        <a v-on:click="logout" href="#" ><i class="fas fa-sign-out-alt"></i>Logout</a>
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