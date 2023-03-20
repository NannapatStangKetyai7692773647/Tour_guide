<script setup>
import NavbarUser from "./NavbarUser.vue";
import Slider from "./Slider.vue";
</script>

<script>
import TourDataService from "../services/TourDataService"; 
import BookDataService from "../services/BookDataService";
import SingleFileUpload from "../services/SingleFileUpload"; 
export default {
  name: "Home2",
  data() {
    return {
      tourList: [],
      search: "",
      mybooking:[]
    };
  },
  methods: {
    Search() {
      var data = this.search;
      TourDataService.getIn(data)
        .then((res) => {
          if (Array.isArray(res.data)) {
            this.tourList = res.data;
          } else this.tourList = [res.data];
          console.log(this.tourList);
        })
        .catch((e) => {
          console.log(e);
        });
    },
    getData() {
      TourDataService.getAllIn()
        .then((res) => {
          this.tourList = res.data;
          this.tourList.forEach(async (itm,i) => {
              if(itm.img!==null&&itm.img!==undefined&&itm.img!==''){
                  await SingleFileUpload.getFile(itm.img,'cover')
                  .then((r)=>{   
                    this.tourList[i].img = 'data:image/png;base64,'+r.data
                    console.log(this.tourList[i].img)
                  })
              }
          });
          this.isBooked()
        })
        .catch((e) => {
          console.log(e);
        });
    },
    formatPrice(value) {
      let val = (value / 1).toFixed(2).replace(",", ".");
      return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    },
    isBooked(){
      BookDataService.get(this.$route.params.user)
        .then((res) => {
          this.mybooking = []
          
          res.data.filter((itm,idx)=>{
            this.mybooking.push(itm.location)
          });

          this.tourList.forEach((itm,idx)=>{
              if(this.mybooking.includes(itm.id)){ 
                this.tourList[idx].isbook = true
              }else{ 
                this.tourList[idx].isbook = false
              }
          })

        })
        .catch((e) => {
          console.log(e);
        });
      }
  },
  mounted() {
    this.getData();
  },
};
</script>
<template>
  <div :style="{'background-image':'url(/src/assets/img/10909472.jpg)'}">
    <NavbarUser />
    <div>
      <div class="content">
        <div class="container" style="height: 250px; padding: 0">
          <Slider />
        </div>
        <div class="container-fluid"> 
          <!-- <div v-if="!this.tourList.length"></div> -->
          <form class="search" v-on:submit.prevent="Search">
            <input
              type="search"
              placeholder="ค้นหา.."
              name="search"
              v-model="search"
            />
            <button type="submit"><i class="fas fa-search"></i></button>
          </form>
          <div class="row text-center py-5">
            <div
              v-for="tour in tourList"
              :key="tour.id"
              class="col-md-4 col-sm-6 my-3 my-md-3"
            > 
              <div v-if="!!tour">
                <form>
                  <div class="card shadow" style="min-height: 500px">
                    <div>
                      <img
                        :src="tour.img"
                        class="img-fluid card-img-top"
                        style="height: 200px; object-fit:cover;width:100%;"
                      />
                    </div>
                    <div class="card-body ">
                      <h4 class="card-title">{{ tour.name }}</h4>
                      <h4 class="card-title">{{ tour.day }}</h4>
                      <p class="quantity">ราคาเริ่มต้น(บาท)</p>
                      <h6 class="card-title">{{ formatPrice(tour.price) }}</h6>
                      <p class="quantity">สถานที่</p>
                      <h6 class="card-title">{{ tour.sub_name }}</h6> 
                    </div>
                    <div class="card-footer">
                        <div class="row">
                          <div class="col-6 px-1 py-0">
                            <router-link
                              :to="{ name: 'Doc', params: { id: tour.id } }"
                              class="btn btn-light w-100"
                              type="submit"
                              name="edit"
                            >
                              รายละเอียด <i class="fas fa-edit"></i>
                            </router-link> 
                          </div>
                          <div class="col-6 px-1 py-0">
                              <router-link v-if="!tour.isbook"
                                :to="{
                                  name: 'Booking',
                                  params: {
                                    id: tour.id,
                                    user: this.$route.params.user,
                                    price: tour.price,
                                  },
                                }"
                                class="btn btn-success w-100"
                                type="submit"
                                name="edit"
                              >
                                จอง
                              </router-link>
                              <div v-else class="btn-booked" disabled> จองแล้ว </div>
                          </div>
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

.bdr-test{
  border:#EC0000 1px solid;
}
.btn-booked{
  background:#f1edd1;
  padding:6px 10px;
  border-radius:5px;
}
</style>