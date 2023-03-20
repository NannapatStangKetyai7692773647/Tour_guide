<script setup>
import NavbarUser from "./NavbarUser.vue";
</script>

<script>
import TourDataService from "../services/TourDataService";
import SingleFileUpload from "../services/SingleFileUpload";
export default {
  name: "Doc",
  data() {
    return {
      tourList: false,
      pdf:null
    };
  },
  methods: {
    getData() {
      TourDataService.getById(this.$route.params.id)
        .then(async(res) => { 
          this.tourList = false 
          if(res.data[0].detail!==''&&res.data[0].detail!==null&&res.data[0].detail!==undefined){
              await SingleFileUpload.getFile(res.data[0].detail,'tour')
              .then((r)=>{  
                 this.tourList = true  
                 const o = document.createElement('object');
                  o.style.width = '100%';
                  o.style.height = '500pt';
                  o.type = 'application/pdf';  
                  o.data = 'data:application/pdf;base64,' + r.data;    
                  if(this.pdf){
                      this.$refs.showme.removeChild(this.pdf)
                  }   
                  this.$refs.showme.appendChild(o);
                  this.pdf = obj  
              })
          } 
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
  <div :style="{'background-image':'url(/src/assets/img/10909472.jpg)'}">
    <NavbarUser />
    <div>
      <div class="content">  
        <div class="container"> 
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