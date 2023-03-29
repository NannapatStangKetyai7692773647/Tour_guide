<script setup>
import Navbar from "./Navbar.vue";
</script>

<script>  
import BookDataService from "../services/BookDataService";
export default {
  name: "Booking",
  data() {
    return {
      tourList: [],
      doc: "",
      status: 2,
      cnfdel: false
    };
  },
  methods: {
    AddTour(id) {
      var data = {
        status: this.status,
        doc: this.doc,
      };
      BookDataService.update(id, data)
        .then((res) => {
          console.log(res.data);
          this.$router.push({ name: "HomeAdmin2" });
        })
        .catch((e) => {
          console.log(e);
        });
    },
    formatPrice(value) {
      let val = (value / 1).toFixed(2).replace(",", ".");
      return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    },
    getData() {
      BookDataService.getAll()
        .then((res) => {
          this.tourList = res.data;
        })
        .catch((e) => {
          console.log(e);
        });
    },
    dayLeft(day){
      var date1 = new Date();
      var date2 = new Date(day);
      var diff = new Date(date1.getTime() - date2.getTime());
      return 10 - Math.floor(diff/(1000*3600*24))
    },
    rmvTour(item){
      this.$swal({
        title: 'ต้องการลบข้อมูลการจองหมายเลข '+item.id+' ?',
        text: "การลบนี้จะไม่สามารถกู้คืนข้อมูลในภายหลังได้",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#ec0000',
        cancelButtonColor: '#a2a2a2',
        confirmButtonText: 'ยืนยัน',
        allowOutsideClick: false
      }).then((result) => {
        if (result.isConfirmed) {   
          BookDataService.del(item.id)
          .then((res) => { 
             if(res.data.status){ 
                this.$swal({
                  icon: 'success',
                  title: 'Deleted!!',
                  text: " Package name \" "+item.id+" \"  has been deleted.", 
                  showConfirmButton:false, 
                  timer:1200
                })
                setTimeout(()=>{
                  this.tourList.filter((itm,index)=>{
                      if(itm.id===item.id){
                        this.tourList.splice(index,1)
                      }
                    }) 
                },1200)
                
             }else{
              this.$swal({
                icon: 'error',
                title: 'Error!',
                text: "Con not delete \" "+item.id+" \" Please try again...", 
                showConfirmButton:false, 
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
  <div :style="{'background-image':'url(./src/assets/img/10909472.jpg)','height':'100%', 'width':'100%' }">
    <Navbar />
    <div>
      <div class="content">
        <div class="container">
          <div class="row text-center py-5">
            <div
              v-for="tour in tourList"
              :key="tour.id"
              class="col-md-4 col-sm-6 my-3 my-md-3 relative"
            > 
            <button  class="btn btn-danger mx-1 close" @click="rmvTour(tour)"><i class="fas fa-x"></i> </button>
              <div v-if="!!tour">
                <form>
                  <div class="card shadow" style="min-height: 600px; width: 300px">
                    <!-- <div>
                      <img
                        v-bind:src="tour.tranfer"
                        class="img-fluid card-img-top"
                        style="height: 300px"
                      />
                    </div> -->
                    <div class="card-body">
                      <h6 class="card-title">รหัสจองที่ :  {{ tour.id }}</h6>
                      <h6 class="card-title hlight">{{ tour.name_tour }}</h6>
                      <h6 class="card-title num my-0">ชื่อผู้จอง : {{ tour.name_user }}</h6>
                      <h6 class="card-title num my-0">เบอร์โทรศัพท์ : {{ tour.phone }}</h6>
                      <h6 class="card-title num ">Email : {{ tour.user }}</h6>
                      <!--<h6 class="card-title">ชื่อสถานที่ : </h6> -->
                      <!----<h6 class="card-title">{{ tour.sub_name_tour }}</h6>-->
                      <h6 class="card-title  num2 my-0 ">ระยะเวลา : {{ tour.period }}</h6>
                      <h6 class="card-title  num2 my-0">จำนวนคน {{ tour.people }} ท่าน</h6>
                      <h6 class="card-title num2 ">ราคารวม : {{formatPrice(tour.price) }} บาท</h6>
                     
                      <h6 class="card-title num3 my-0">จองวันที่ : {{ tour.day.toString().substr(0, 10) }}</h6>
                   
                      <h6 class="card-title num3 ">ถึงวันที่ : {{ tour.to_date.toString().substr(0, 10) }}</h6>
                   
                      <div v-if="tour.status === 1">
                        <button
                          @click="AddTour(tour.id)"
                          class="btn btn-outline-success mx-2"
                        >
                          ยืนยันให้ชำระเงิน
                        </button>
                      </div>
                      <div v-else-if="tour.status === 2">
                        <div class="btn-99 my-3">
                            รอชำระเงิน
                        </div>
                      </div>
                      <div v-else-if="tour.status === 3">
                        <router-link
                          :to="{
                            name: 'Check',
                            params: {
                              id: tour.id,
                            },
                          }"
                          class="btn btn-info mx-2"
                        >
                          ตรวจสอบ 
                        </router-link>

                        <button v-if="dayLeft(tour.create_at)<0" class="btn btn-danger">เกินมา {{ Math.abs(dayLeft(tour.create_at)) }} วัน</button>
                        <button v-else class="btn btn-light-outline">เหลือ {{ dayLeft(tour.create_at) }} วัน</button>

                      </div>
                      <div v-else>
                        <button
                          type="submit"
                          class="btn btn-success mx-2"
                          name="add"
                          disabled
                        >
                          ยืนยันการจองเรียบร้อยแล้ว
                        </button>
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
p,
input[type="file"] {
  color: black;
  font-weight: 500;
  font-family: "prompt", sans-serif;
}
.hlight{
  background:#dbded1;
  padding:20px;
  border-radius:4px;
}
.num{
  background:#f1ff6f;
  padding:15px;
  border-radius:4px;
}
.num2{
  background:#e5e5fb;
  padding:15px;
  border-radius:4px;
}
.num3{
  background:#d5faff;
  padding:15px;
  border-radius:4px;
}
.relative{
    position: relative;
}
.relative .close{
  position: absolute;
  top:-5px;
  right:7px;
  z-index: 3;
  border-radius:50%;
}
.btn-99{
  background:#ffcfee;
  color: #c02188;
  padding: 10px;
  border-radius:4px; 
  font-size: 20px;
}
</style>