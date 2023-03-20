<script setup>
import Navbar from "./Navbar.vue";
</script>

<script>
import TourDataService from "../services/TourDataService";
import SingleFileUpload from "../services/SingleFileUpload"; 
export default {
  name: "AddTour",
  data() {
    return {
      tourList: {
        name: "",
        price: 0,
        img: "",
        type: "ไทย",
        detail: "",
        day: "",
        sub_name: "",
      },
    };
  },
  methods: {
    AddTour() {
      var data = {
        name: this.tourList.name,
        price: this.tourList.price,
        img: this.tourList.img,
        type: this.tourList.type,
        detail: this.tourList.detail,
        day: this.tourList.day,
        sub_name: this.tourList.sub_name,
      };
      TourDataService.create(data)
        .then((res) => {
          console.log(res.data);
          this.$router.push({ name: "HomeAdmin2" });
        })
        .catch((e) => {
          console.log(e);
        });
    },
    async img(e){ 
      const file = e.target.files[0];  
      if(file){ 
        let formData = new FormData(); 
          formData.append("file",file,file.name)   
          await SingleFileUpload.single(formData,'cover')
            .then(res => {   
               if(res.data.status){
                this.tourList.img = res.data.filename;
               }  
            })  
      }
    },
    async file(e){ 
      const file = e.target.files[0];  
      if(file){ 
        let formData = new FormData(); 
          formData.append("file",file,file.name)   
          await SingleFileUpload.single(formData,'tour')
            .then(res => {   
               if(res.data.status){
                this.tourList.detail = res.data.filename;
               }  
            })  
      }

    }
  },
};
</script>
<template>
  <div :style="{'background-image':'url(./src/assets/img/10909472.jpg)'}">
    <Navbar />
    <div>
      <div class="content">
        <div class="container">
          <div class="tools-cart">
            <h2 class="pt-2">เพิ่มโปรแกรมทัวร์ใหม่</h2>
            <form @submit.prevent="AddTour" class="cart-items" enctype="multipart/form-data">
              <div class="border rounded my-4 my-md-6">
                <div class="row bg-white">
                  <div class="col-sm"></div>
                  <div class="col-sm">
                    <h5 class="pt-2 my-4">รูปทัวร์</h5> 
                    <input
                      @change="img($event)"
                      ref="img"
                      type="file"
                      class="form-control-file"
                      id="image"
                      name="image"
                      accept="image/png, image/gif, image/jpeg"
                      required
                    />
                    <h5 class="pt-2 my-4">ชื่อทัวร์</h5>
                    <input
                      type="text"
                      name="name"
                      id="name"
                      class="form-control w-100"
                      placeholder="ชื่อ"
                      required
                      v-model="tourList.name"
                    />
                    <h5 class="pt-2 my-4">จำนวนวัน</h5>
                    <input
                      v-model="tourList.day"
                      type="text"
                      name="day"
                      id="day"
                      class="form-control w-100 d-inline"
                      placeholder="Ex. 3 วัน 2 คืน"
                      required
                    />
                    <h5 class="pt-2 my-4">สถานที่ท่องเที่ยว</h5>
                    <input
                      v-model="tourList.sub_name"
                      type="text"
                      name="sub_name"
                      id="sub_name"
                      class="form-control w-100 d-inline"
                      required
                    />
                    <h5 class="pt-2 my-4">ราคา(บาท)</h5>
                    <input
                      v-model="tourList.price"
                      type="number"
                      name="price"
                      id="price"
                      class="form-control w-100 d-inline"
                      min="1"
                      required
                    />
                    <h5 class="pt-2 my-4">ไฟล์รายระเอียดทัวร์</h5>
                    <input
                      @change="file($event)"
                      ref="file"
                      type="file"
                      class="form-control-file mx-5"
                      id="file"
                      name="file"
                      accept="application/pdf"
                      required
                    />
                  </div>
                  <div class="col-sm"></div>
                </div>
              </div>
              <button
                type="submit"
                class="btn btn-info mx-2"
                name="add"
              >
                เพิ่มโปรแกรมทัวร์ใหม่
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