<script setup>
import NavbarUser from "./NavbarUser.vue";
import Slider from "./Slider.vue";
</script>

<script>
import BookDataService from "../services/BookDataService";
export default {
  name: "MyBook",
  data() {
    return {
      tourList: [],
      search: "",
    };
  }, 
  methods: {
    getData() {
      BookDataService.get(this.$route.params.user)
        .then((res) => {
          this.tourList = res.data;
        })
        .catch((e) => {
          console.log(e);
        });
    },
    formatPrice(value) {
      let val = (value / 1).toFixed(2).replace(",", ".");
      return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    },
    slashDay(day){ 
      if(day!==null&& day!==undefined){
         day = new Date(day)
         day.setDate(day.getDate() + 10)
         day = day.toLocaleString("en-GB")
         return day.split(',')[0].split('-').reverse().join('/')
      }else{ 
        return day
      } 
    }
  },
  mounted() {
    this.getData();
  },
};
</script>
<template>
  <div :style="{ 'background-image':'url(/src/assets/img/10909472.jpg)','height':'100%', 'width':'100%' }">
    <NavbarUser />
    <div>
      <div class="content">
        <div class="container" style="height: 250px; padding: 0">
          <Slider />
        </div>
        
        <div class="container">
          <div class="row text-center py-5">
            <div
              v-for="tour in tourList"
              :key="tour.id"
              class="col-md-4 col-sm-6 my-3 my-md-3"
            > 
              <div v-if="!!tour">
                <form>
                  <div class="card shadow" style="min-height: 600px; width: 300px">
                    <!-- <div>
                      <img
                        v-bind:src="'/' + tour.tranfer"
                        class="img-fluid card-img-top"
                        style="height: 300px"
                      />
                    </div> -->
                    <div class="card-body">
                      <h6 class="card-title">ชื่อทัวร์</h6>
                      <h6 class="card-title hlight">{{ tour.name_tour }}</h6>
                      <h6 class="card-title">ชื่อสถานที่</h6>
                      <h6 class="card-title">{{ tour.sub_name_tour }}</h6>
                      <h6 class="card-title">ระยะเวลา</h6>
                      <h6 class="card-title">{{ tour.period }}</h6>
                      <h6 class="card-title numbh my-0">จำนวนคน</h6>
                      <h6 class="card-title numbh">{{ tour.people }}</h6>
                      <h6 class="card-title bg-price my-0">ราคา</h6>
                      <h6 class="card-title bg-price">{{ tour.price }}</h6>
                      <h6 class="card-title">จองวันที่</h6>
                      <h6 class="card-title">
                        {{ tour.day.toString().substr(0, 10) }}
                      </h6>
                      <h6 class="card-title">ชื่อคนจอง</h6>
                      <h6 class="card-title">{{ tour.name_user }}</h6>
                      <h6 class="card-title">เบอร์โทรศัพท์</h6>
                      <h6 class="card-title">{{ tour.phone }}</h6>
                      <h6 class="card-title">Email</h6>
                      <h6 class="card-title">{{ tour.user }}</h6>
                      <div v-if="tour.status === 1">
                        <div class="btn-99 my-3">
                            รอตรวจสอบที่ว่าง
                        </div> 
                      </div>
                      <div v-else-if="tour.status === 2">
                        <router-link :to="{
                            name: 'Payment',
                            params: {
                              id: tour.id,
                              user: this.$route.params.user,
                              people: tour.people,
                            },
                          }"
                          type="submit"
                          class="btn btn-warning mx-2"
                          name="add"
                        >
                          ชำระเงิน
                        </router-link>
                        <p style="color: red">
                          กรุณาชำระภายในวันที่ {{ slashDay(tour.create_at) }} <br />
                          หากต้องการยกเลิกติดต่อที่ e-mail:
                          KindSoGroupTravel@gmail.com <br />ก่อนวันออกเดินทาง 7
                          วัน
                        </p>
                      </div>
                      
                      <div v-else-if="tour.status === 3">
                        <div class="btn-99 my-3">
                            รอตรวจสอบการชำระเงิน
                        </div> 
                      </div>
                      <div v-else>
                        <router-link
                          :to="{
                            name: 'Guide',
                            params: {
                              id: tour.id,
                              user: this.$route.params.user,
                            },
                          }"
                          class="btn btn-success my-3"
                          type="submit"
                          name="edit"
                        >
                        ใบเสร็จรับเงินและรายละเอียด
                        </router-link>
                      </div>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
  
<style scoped>
h6,
h4,
p {
  color: black;
  font-weight: 500;
  font-family: "prompt", sans-serif;
}
.hlight{
  background:#e5eeeb;
  padding:7px;
  border-radius:6px;
}
.numbh{
  padding:7px;
  background:#fcf0d3;
}
.btn-99{
  background:#e2e2e2;
  padding:10px;
  border-radius:7px;
}

.bg-price{
  background-color: rgba(127, 255, 123, 0.3);
  padding: 7px;
}
</style>