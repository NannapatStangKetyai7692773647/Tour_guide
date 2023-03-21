<script setup>
import Navbar from "./Navbar.vue";
import Slider from "./Slider.vue";
</script>

<script>
import TourDataService from "../services/TourDataService";
import SingleFileUpload from "../services/SingleFileUpload";
export default {
  name: "HomeAdmin2",
  data() {
    return {
      tourList: [],
      search: "",
    };
  },
  computed: {
    filteredData() {
      return this.tourList
        .filter(
          (entry) => this.tourList.length
            ? Object.keys(this.tourList[0])
              .some(key => ('' + entry[key]).toLowerCase().includes(this.search))
            : true
        );
    },
  },
  methods: {
    Search() {
      var data = this.search;
      TourDataService.getIn(data)
        .then((res) => {
          if (Array.isArray(res.data)) {
            this.tourList = res.data;
            this.tourList.forEach(async (itm, i) => {
              if (itm.img !== null && itm.img !== undefined && itm.img !== '') {
                await SingleFileUpload.getFile(itm.img, 'cover')
                  .then((r) => {
                    this.tourList[i].img = 'data:image/png;base64,' + r.data
                  })
              }
            });
          } else this.tourList = [res.data];
          console.log(this.tourList);
        })
        .catch((e) => {
          console.log(e);
        });
    },
    async getData() {
      TourDataService.getAllIn()
        .then((res) => {
          this.tourList = res.data;
          this.tourList.forEach(async (itm, i) => {
            if (itm.img !== null && itm.img !== undefined && itm.img !== '') {
              await SingleFileUpload.getFile(itm.img, 'cover')
                .then((r) => {
                  this.tourList[i].img = 'data:image/png;base64,' + r.data
                })
            }
          });

        })
        .catch((e) => {
          console.log(e);
        });
    },
    formatPrice(value) {
      let val = (value / 1).toFixed(2).replace(",", ".");
      return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    },
    rmvTour(item) {
      this.$swal({
        title: 'ต้องการลบข้อมูล \n ' + item.name + ' ?',
        text: "การลบนี้จะไม่สามารถกู้คืนข้อมูลในภายหลังได้",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#ec0000',
        cancelButtonColor: '#a2a2a2',
        confirmButtonText: 'ยืนยัน',
        allowOutsideClick: false
      }).then((result) => {
        if (result.isConfirmed) {
          TourDataService.del(item.id)
            .then((res) => {
              if (res.data.status) {
                this.$swal({
                  icon: 'success',
                  title: 'Deleted!!',
                  text: " Package name \" " + item.name + " \"  has been deleted.",
                  showConfirmButton: false,
                  timer: 1200
                })
                setTimeout(() => {
                  this.tourList.filter((itm, index) => {
                    if (itm.id === item.id) {
                      this.tourList.splice(index, 1)
                    }
                  })
                }, 1200)

              } else {
                this.$swal({
                  icon: 'error',
                  title: 'Error!',
                  text: "Con not delete \" " + item.name + " \" Please try again...",
                  showConfirmButton: false,
                })
              }
            })
            .catch((e) => {
              console.log(e);
            });
        }
      })
    }
  },
  mounted() {
    this.getData();
  },
};
</script>
<template>
  <div :style="{ 'background-image': 'url(./src/assets/img/10909472.jpg)' }">
    <Navbar />
    <div>
      <div class="content">
        <div class="container" style="height: 250px; padding: 0">
          <Slider />
        </div>
        <div class="container">
          <!-- <div v-if="!this.tourList.length"></div> -->
          <form class="search" v-on:submit.prevent="Search">
            <input type="search" placeholder="ค้นหา.." name="search" v-model="search" />
            <button type="submit"><i class="fas fa-search"></i></button>
          </form>
          <div class="row text-center py-5">
            <form>
              <router-link to="/addTour" class="btn btn-outline-success" style="float: right">
                <i class="fas fa-plus-circle"></i> เพิ่มโปรแกรมทัวร์
              </router-link>
            </form>
            <div v-for="tour in filteredData" :key="tour.id" class="col-md-4 col-sm-6 my-3 my-md-3">
              <div v-if="!!tour">
                <form>
                  <div class="card shadow" style="min-height: 500px;">
                    <div>
                      <img v-bind:src="tour.img" class="img-fluid card-img-top"
                        style="height: 200px; object-fit:cover;width:100%;" />
                    </div>
                    <div class="card-body">
                      <h4 class="card-title">{{ tour.name }}</h4>
                      <h4 class="card-title">{{ tour.day }}</h4>
                      <p class="quantity">ราคาเริ่มต้น(บาท)</p>
                      <h6 class="card-title">{{ formatPrice(tour.price) }}</h6>
                      <p class="quantity">สถานที่</p>
                      <h6 class="card-title">{{ tour.sub_name }}</h6>


                    </div>
                    <div class="card-footer ">
                      <div class="row">
                        <div class="col-6 px-1 py-0">
                          <router-link :to="{ name: 'DocAdmin', params: { id: tour.id } }"
                            class="btn btn-light py-2 w-100" type="submit" name="edit">
                            รายละเอียด <i class="fas fa-eye"></i>
                          </router-link>
                        </div>
                        <div class="col-4 px-1 py-0">
                          <router-link :to="{ name: 'EditTour', params: { id: tour.id } }"
                            class="btn btn-warning py-2 w-100" type="submit" name="edit">
                            แก้ไข <i class="fas fa-edit"></i>
                          </router-link>
                        </div>
                        <div class="col-2 px-1 py-0">
                          <div class="btn btn-danger py-2 w-100" @click="rmvTour(tour)">
                            <i class="fas fa-x"></i>
                          </div>

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
</style>