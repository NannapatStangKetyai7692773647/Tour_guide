<script setup>
import NavbarUser from "./NavbarUser.vue";
</script>

<script>
import BookDataService from "../services/BookDataService";
import TourDataService from "../services/TourDataService";
import UserDataService from "../services/UserDataService";
import Datepicker from "vue3-datepicker";
export default {
  name: "Booking",
  data() {
    return { 
      s_day: new Date(),
      e_day: new Date(),
      tourList: {
        location: this.$route.params.id,
        name_tour: "",
        sub_name_tour: "",
        period: "",
        name_user: "",
        member: "",
        phone: "",
        user: this.$route.params.user,
        tranfer: "",
        status: 1,
        day: this.s_day,
        to_date: this.e_day,
        people: 1,
        doc: "",
        price: this.$route.params.price,
      },
      
      
      startDay: new Date(),
    };
  },
  components: {
    Datepicker,
  }, 
  watch: {
    someObject: {
      handler(newValue, oldValue) {
        // Note: `newValue` will be equal to `oldValue` here
        // on nested mutations as long as the object itself
        // hasn't been replaced.
      },
      deep: true
    }
  },
  methods: {
    swapDay(){
      alert('Yesss');
    },
    AddTour() {  

      var data = {
        location: this.tourList.location,
        name_tour: this.tourList.name_tour,
        sub_name_tour: this.tourList.sub_name_tour,
        period: this.tourList.period,
        name_user: this.tourList.name_user,
        member: this.tourList.member,
        phone: this.tourList.phone,
        user: this.tourList.user,
        tranfer: this.tourList.tranfer,
        status: this.tourList.status,
        day: this.s_day,
        to_date: this.e_day,
        people: this.tourList.people,
        doc: this.tourList.doc,
        price: this.tourList.price
      };
      BookDataService.create(data)
        .then((res) => { 
          this.$router.push({
            name: "Home2",
            params: { user: this.$route.params.user },
          });
        })
        .catch((e) => {
          console.log(e);
        });
    },
    img() {
      const file = this.$refs.img.files[0].name;
      this.tourList.tranfer = "src/assets/img/" + file;
    },
    getData() {
      TourDataService.getById(this.tourList.location)
        .then((res) => {
          this.tourList.name_tour = res.data[0].name;
          this.tourList.sub_name_tour = res.data[0].sub_name;
          this.tourList.period = res.data[0].day;
        })
        .catch((e) => {
          console.log(e);
        });
      UserDataService.get(this.tourList.user)
        .then((res) => {
          this.tourList.name_user = res.data[0].fname + " " + res.data[0].lname;
          this.tourList.phone = res.data[0].phone;
        })
        .catch((e) => {
          console.log(e);
        });
    },
  },
  mounted() {
    this.getData();
    console.log(this.tourList.price);
  },
};
</script>
<template>
  <div :style="{'background-image':'url(/src/assets/img/10909472.jpg)'}">
    <NavbarUser />
    <div>
      <div class="content">
        <div class="container">
          <div class="tools-cart">
            <h2 class="pt-2">จองทัวร์</h2> 
            <form
              @submit.prevent="AddTour"
              class="cart-items"
              enctype="multipart/form-data"
            >
              <div class="border rounded my-4 my-md-6 mb-4">
                <div class="row bg-white">
                  <div class="col-sm"></div>
                  <div class="col-sm mb-4">
                    <h5 class="pt-2 my-4">วัน</h5>  
                    <Datepicker v-model="s_day" :lowerLimit="startDay" />
                    <h5 class="pt-2 my-4">ถึง</h5>
                    <Datepicker v-model="e_day"  :lowerLimit="new Date(s_day)"/>
                    <h5 class="pt-2 my-4">จำนวนคน</h5>
                    <input
                      v-model="tourList.people"
                      type="number"
                      name="people"
                      id="people"
                      class="form-control w-50 d-inline text-center"
                      min="1"
                      required
                    />
                    <!-- <h5 class="pt-2 my-4">รูปหลักฐานการโอนเงิน</h5>
                    <input
                      @change="img"
                      ref="img"
                      type="file"
                      class="form-control-file"
                      id="image"
                      name="image"
                      accept="image/png, image/gif, image/jpeg"
                      required
                    /> -->
                    <input
                      type="hidden"
                      name="name"
                      id="name"
                      v-model="tourList.location"
                    />
                    <input
                      type="hidden"
                      name="nameUser"
                      id="nameUser"
                      v-model="tourList.user"
                    />
                    <input
                      type="hidden"
                      name="name"
                      id="name"
                      v-model="tourList.name_tour"
                    />
                    <input
                      type="hidden"
                      name="nameUser"
                      id="nameUser"
                      v-model="tourList.sub_name_tour"
                    />
                    <input
                      type="hidden"
                      name="name"
                      id="name"
                      v-model="tourList.period"
                    />
                    <input
                      type="hidden"
                      name="nameUser"
                      id="nameUser"
                      v-model="tourList.name_user"
                    />
                    <input
                      type="hidden"
                      name="name"
                      id="name"
                      v-model="tourList.phone"
                    />
                    <input
                      type="hidden"
                      name="nameUser"
                      id="nameUser"
                      v-model="tourList.price"
                    />
                  </div>
                  <div class="col-sm"></div>
                </div>
              </div>
              <button type="submit" class="btn btn-info mx-2" name="add">
                จองทัวร์
              </button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
  
<style scoped>
h5,
h4,
p,
input[type="file"] {
  color: black;
  font-weight: 500;
  font-family: "prompt", sans-serif;
}
</style>