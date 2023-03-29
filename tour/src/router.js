import { createRouter, createWebHistory } from "vue-router";
import Login from "./components/Login.vue";
import SignUp from "./components/SignUp.vue";
import Home2 from "./components/Home2.vue";
import HomeAdmin2 from "./components/HomeAdmin2.vue";
import AddTour from "./components/AddTour.vue";
import EditTour from "./components/EditTour.vue";
import Doc from "./components/Doc.vue";
import DocAdmin from "./components/DocAdmin.vue";
import Booking from "./components/Booking.vue";
import AllBook from "./components/AllBook.vue";
import Check from "./components/Check.vue";
import MyBook from "./components/MyBook.vue";
import Guide from "./components/Guide.vue";
import Profile from "./components/Profile.vue";
import Payment from "./components/Payment.vue";
import admGuide from "./components/admGuide.vue";
import Showpage from "./components/Showpage.vue";

const routes = [
  { path: "/", name: "SohwAll", component: Showpage },
  { path: "/login", name: "Login", component: Login },
  { path: "/signUp", name: "SignUp", component: SignUp },
  { path: "/homeAdmin2", name: "HomeAdmin2", component: HomeAdmin2 },
  { path: "/home2/:user", name: "Home2", component: Home2 },
  { path: "/profile/:user", name: "Profile", component: Profile },
  { path: "/addTour", name: "AddTour", component: AddTour },
  { path: "/editTour/:id", name: "EditTour", component: EditTour },
  { path: "/doc/:id/:user", name: "Doc", component: Doc },
  { path: "/docAdmin/:id", name: "DocAdmin", component: DocAdmin },
  { path: "/booking/:id/:user/:price", name: "Booking", component: Booking },
  { path: "/allBook", name: "AllBook", component: AllBook },
  { path: "/check/:id", name: "Check", component: Check },
  { path: "/myBook/:user", name: "MyBook", component: MyBook },
  { path: "/guide/:id/:user", name: "Guide", component: Guide },
  { path: "/payment/:id/:user/:people", name: "Payment", component: Payment },

  { path: "/admguide", name: "admguide", component: admGuide },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
