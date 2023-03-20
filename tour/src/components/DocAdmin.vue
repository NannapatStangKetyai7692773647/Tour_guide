<script setup>
import NavbarUser from "./Navbar.vue";
</script>

<script> 
import SingleFileUpload from "../services/SingleFileUpload";
import TourDataService from "../services/TourDataService";
export default {
  name: "DocAdmin",
  data() {
    return {
      tourList: false,
      pdf:null
    };
  },
         
  methods: {
    getData() {
      TourDataService.getById(this.$route.params.id)
        .then(async (res) => { 
          this.tourList = false 
          if(res.data[0].detail!==''&&res.data[0].detail!==null&&res.data[0].detail!==undefined){
              await SingleFileUpload.getFile(res.data[0].detail,'tour')
              .then((r)=>{  
                console.log(res.data[0].detail)
                 this.tourList = true  
                 const obj = document.createElement('object');
                 obj.style.width = '100%';
                 obj.style.height = '500pt';
                 obj.type = 'application/pdf';  
                 obj.data = 'data:application/pdf;base64,' + r.data;    
                  if(this.pdf){
                      this.$refs.showme.removeChild(this.pdf)
                  }   
                  this.$refs.showme.appendChild(obj);
                  this.pdf = obj  
              })
          }
          // this.tourList = res.data[0];  
        })
        .catch((e) => {
          console.log(e);
        });
    },
  },
  mounted() {
    this.getData();
  },
};
</script>
<template>
  <div :style="{'background-image':'url(./src/assets/img/10909472.jpg)'}">
    <NavbarUser />
    <div>
      <div class="content">
        <div class="container" > 
          <div ref="showme"></div>
          <div v-if="!tourList" style="font-size:40px; color:#d2d2d2;padding:20px;"> File Not Found!. </div> 
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