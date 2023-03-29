<script setup>
import Navbar from "./Navbar.vue";
</script>

<script>
import BookDataService from "../services/BookDataService";
import GuideDataService from "../services/GuideDataService";
import SingleFileUpload from "../services/SingleFileUpload"; 
export default {
  name: "Check",
  data() {
    return {
      tourList: [],
      doc: "",
      status: 3,
      guide: "",
      guide_phone: "",
      guides:[],
    };
  },
  methods: {
    AddTour() {
      let guideName = ''
      this.guides.forEach((itm)=>{
         if(itm.id==this.guide){ 
           guideName = itm.fname+' '+itm.sname
         }
      }) 
      var data = {
        status: this.status,
        doc: this.doc,
        guide: guideName,
        guide_phone: this.guide_phone,
        status: 4
      };
      BookDataService.update(this.$route.params.id, data)
        .then((res) => { 
          this.$router.push({
            name: "AllBook",
          });
        })
        .catch((e) => {
          console.log(e);
        });
    },
   async fileUpload(e) { 
      const file = e.target.files[0]; 
      ///upload file 
      if(file){ 
        let formData = new FormData(); 
          formData.append("file",file,file.name)   
          await SingleFileUpload.single(formData,'agenda')
          .then(res => {   
               if(res.data.status){
                this.doc = res.data.filename;
               }  
            })  
      }
    },
    async getData() {
      this.tourList = []
      BookDataService.getAll()
        .then(async(res) => {
          this.tourList.tranfer =''; 
          res.data.filter((itm)=>{  
            if(itm.id === parseInt(this.$route.params.id)){
              this.tourList = itm
            }
          }) 
          if(this.tourList.tranfer!==null&&this.tourList.tranfer!==undefined&&this.tourList.tranfer!==''){
             console.log('found')
                  await SingleFileUpload.getFile(this.tourList.tranfer,'slip')
                  .then((r)=>{   
                    this.tourList.tranfer = 'data:image/png;base64,'+r.data
                  })
          }
        })
        .catch((e) => {
          console.log(e);
        });
    },
    async getAllGuide(){
          await GuideDataService.getAllUser()
          .then((res)=>{  
              if(res.data.length){
                 this.guides = res.data 
              }
          })  
    },
    setMobile(){ 
      this.guides.forEach((itm)=>{
         if(itm.id==this.guide){ 
          this.guide_phone = itm.mobile
         }
      }) 
    }
  },
  mounted() {
    this.getData();
    this.getAllGuide()
  },
};
</script>
<template>
  <div :style="{ 'background-image': 'url(/src/assets/img/10909472.jpg)','height': '100%', 
  'background-position': 'center',
  'background-repeat': 'no-repeat',
  'background-size': 'cover',
  'padding-bottom': '150px',}">
    <Navbar />
    <div>
      <div class="content">
        <div class="container">
          <div class="tools-cart">
            <h2 class="pt-2">จองทัวร์</h2>  
            <div v-if="tourList.tranfer === ''">
              <div class="border rounded my-4 my-md-6" style="padding-bottom: 100px;">
                <div class="row bg-white">
                  <h3 style="color: red">ลูกค้ายังไม่ได้ทำการชำระเงิน</h3>
                </div>
              </div>
            </div>
            <div v-else>
              <form
                @submit.prevent="AddTour"
                class="cart-items"
                enctype="multipart/form-data"
              >
                <div class="border rounded my-4 my-md-6">
                  <div class="row bg-white"> 
                    <div class="col-lg-7">
                      <h6 class="pt-2 my-4">สลิปจ่ายเงิน</h6>
                      <img
                        :src="tourList.tranfer"
                        class="img-fluid card-img-top"
                      />
                    </div> 
                    <div class="col-lg-4 text-start">
                      <h6 class="pt-2 my-4">ชื่อสมาชิก</h6>
                      <textarea :rows="tourList.people" class="form-control" v-model="tourList.member"></textarea>
                      <h6 class="pt-2 my-4">ไฟล์โปรแกรมทัวร์</h6> 
                      <input
                        @change="fileUpload($event)"
                        ref="file"
                        type="file"
                        class="form-control-file mx-5"
                        id="file"
                        name="file"
                        accept="application/pdf"
                        required
                      />
                      <input
                        type="hidden"
                        name="name"
                        id="name"
                        v-model="status"
                      />
                      <h6 class="pt-2 mt-4">ชื่อไกด์</h6> 
                      <select v-model="guide" @change="setMobile()" class="form-control" required oninvalid="this.setCustomValidity('กรุณาเลือกชื่อไกด์')">
                        <option disabled value="">Please select one</option>
                        <option v-for="(gui,i) in guides" :key="i" :value="gui.id">{{gui.fname}} {{gui.sname}}</option> 
                      </select>

                      <h6 class="pt-2 mt-4">เบอร์โทรศัพท์ไกด์</h6>
                      <input
                        type="text"
                        name="name"
                        id="name"
                        v-model="guide_phone"
                        class="form-control"
                      />
                      
                      <button type="submit" class="btn btn-info mx-2 my-4" name="add">
                        ยืนยันการจอง
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

textarea {
  resize: none;
  overflow:hidden;
}
</style>