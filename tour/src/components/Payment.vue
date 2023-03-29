<script setup>
import NavbarUser from "./NavbarUser.vue";
</script>

<script>
import BookDataService from "../services/BookDataService";
import SingleFileUpload from "../services/SingleFileUpload"; 
export default {
  name: "Payment",
  data() {
    return {
      tourList: [],
      img: "",
      member: "",
    };
  },
  methods: {
    AddTour() {
      var data = {
        tranfer: this.img,
        member: this.member,
        status: 3
      };
      BookDataService.updateMem(this.$route.params.id, data)
        .then((res) => {  
          this.$router.push({
            name: "MyBook",
            params: { user: this.$route.params.user },
          });
        })
        .catch((e) => {
          console.log(e);
        });
    },
   async file(e) { 
      const file = e.target.files[0]; 
      ///upload file 
      if(file){ 
        let formData = new FormData(); 
          formData.append("file",file,file.name)   
          await SingleFileUpload.single(formData,'slip')
            .then(res => {   
               if(res.data.status){
                this.img = res.data.filename;
               }  
            })  
      }

    },
    // getData() {
    //   BookDataService.get(this.$route.params.id)
    //     .then((res) => {
    //       this.tourList = res.data[0];
    //       console.log(this.tourList);
    //     })
    //     .catch((e) => {
    //       console.log(e);
    //     });
    // },
  },
//   mounted() {
//     this.getData();
//   },
};
</script>
<template>
  <div :style="{ 'background-image': 'url(/src/assets/img/10909472.jpg)','height': '120vh' }">
    <NavbarUser />
    <div>
      <div class="content">
        <div class="container">
          <div class="tools-cart">
            <h2 class="pt-2">ชำระเงิน</h2>
            <form
              @submit.prevent="AddTour"
              class="cart-items"
              enctype="multipart/form-data"
            >
              <div class="border rounded my-4 my-md-6">
                <div class="row justify-content-center bg-white">  
                  <div class="col-sm col-lg-6 text-center">
                     <h5 class="py-4 b">ข้อมูลการชำระเงิน</h5>
                     <div class="row">
                         <div class="col-lg-3">
                             <img src="/src/assets/img/scb-logo.jpg" class="w-100">
                         </div>
                         <div class="col-lg-9">
                            <ul class="text-start">
                                <li>ธนาคาร : ไทยพาณิชย์</li>
                                <li>เลขที่บัญชี :<span class="text-xl"> 769-2-77364-7</span></li>
                                <li>ชื่อบัญชี : นันท์นภัส เขตใหญ่</li>
      
                            </ul>
                          </div>
                     </div> 
                  </div>
                  <div class="col-sm col-lg-6 text-start">
                    
                    <h5 class="pt-2 my-4 b">แนบหลักฐานการชำระเงิน</h5>
                    <input
                      @change="file($event)"
                      ref="file"
                      type="file"
                      class="form-control-file mx-5"
                      id="file"
                      name="file"
                      accept="image/png, image/gif, image/jpeg"
                      required
                    />
                    <h6 class="pt-2 mt-4">ชื่อสมาชิก</h6>
                    <div class="input-group mb-3">
                      <textarea :rows="this.$route.params.people" cols="40" v-model="this.member"></textarea>
                      <button type="submit" class="btn btn-info" name="add">
                        ยืนยัน
                      </button>
                    </div>
                  </div>
                  <div class="col-sm"></div>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
  
<style scoped>
h6,
h5,
h4,
p,
li,
input[type="file"] {
  color: black;
  font-weight: 500;
  font-family: "prompt", sans-serif;
}

textarea {
  resize: none;
  overflow:hidden;
}
.b{ font-weight: bold;}
.text-xl{ font-size:20px; }
ul li{ list-style: none; font-size:18px; }
ul{
  padding-left:0px;
  margin-left:0px;
}

.delete-from {
  display: none;
}
</style>