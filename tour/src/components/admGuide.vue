<script setup>
import NavbarUser from "./Navbar.vue";
</script>

<script>
import GuideDataService from "../services/GuideDataService";
import SingleFileUpload from "../services/SingleFileUpload";
export default {
  name: "Guide",
  data() {
    return {
      guides: [], 
      Frm:{},
      file:[]
    };
  },
  methods: {
    // getData() {
    //   BookDataService.getDoc(this.$route.params.id)
    //     .then((res) => {
    //       this.tourList = res.data[0].doc;
    //       console.log(this.tourList);
    //     })
    //     .catch((e) => {
    //       console.log(e);
    //     });
    // },
    newGuide(){
      this.$swal({
        title: 'เพิ่มไกด์',
        html:
          '<table width="100%" style="padding:0px;text-align:left;">'+
            '<tr><td width="400">ชื่อ</td><td><input id="fname" class="swal2-input"></td></tr>'+
            '<tr><td>นามสกุล</td><td><input id="sname" class="swal2-input"></td></tr>'+
            '<tr><td>เลขที่ใบอนุญาต</td><td><input id="license" class="swal2-input"></td></tr>'+
            '<tr><td>เบอร์โทร</td><td><input type="number" id="mobile" class="swal2-input"></td></tr>'+
            '<tr><td>อีเมล</td><td><input type="email" id="email" class="swal2-input"></td></tr>'+
            '<tr><td>รูปภาพ</td><td class="frm"><input type="file" id="file" class="swal2-input" accept="image/*"></td></tr>'+
          '</table>',
        focusConfirm: false,
        allowOutsideClick:false,
        showCancelButton: true,
        confirmButtonText: "บันทึก",
        confirmButtonColor: '#198754',
        preConfirm: (e) => {
          this.Frm = {
            fname: document.getElementById('fname').value,
            sname: document.getElementById('sname').value,
            license: document.getElementById('license').value,
            mobile: document.getElementById('mobile').value,
            email: document.getElementById('email').value
          }  
          this.file = document.getElementById('file').files[0]
          this.createData()
        }
      }) 
    },
    
    setGuide(item){
      this.$swal({
        title: 'แก้ไขไกด์ '+item.fname,
        html:
          '<img src="'+item.avatar+'" style="max-height:150px;max-width:150px;object-fit:cover;"><table width="100%" style="padding:0px;text-align:left;">'+
            '<tr><td width="400">ชื่อ</td><td><input id="fname" class="swal2-input" value="'+item.fname+'"></td></tr>'+
            '<tr><td>นามสกุล</td><td><input id="sname" class="swal2-input"  value="'+item.sname+'"></td></tr>'+
            '<tr><td>เลขที่ใบอนุญาต</td><td><input id="license" class="swal2-input"  value="'+item.license+'"></td></tr>'+
            '<tr><td>เบอร์โทร</td><td><input type="number" id="mobile" class="swal2-input"  value="'+item.mobile+'"></td></tr>'+
            '<tr><td>อีเมล</td><td><input type="email" id="email" class="swal2-input"  value="'+item.email+'"></td></tr>'+
            '<tr><td>รูปภาพ</td><td class="frm"><input type="file" id="file" class="swal2-input" accept="image/*"></td></tr>'+
          '</table>',
        focusConfirm: false,
        allowOutsideClick:false,
        showCancelButton: true,
        confirmButtonText: "อัพเดท",
        confirmButtonColor: '#5474C8',
        preConfirm: (e) => {
          this.Frm = {
            fname: document.getElementById('fname').value,
            sname: document.getElementById('sname').value,
            license: document.getElementById('license').value,
            mobile: document.getElementById('mobile').value,
            email: document.getElementById('email').value,
          
          }  
          this.file = document.getElementById('file').files[0]
          this.updateGuide(item)
        }
      }) 
    },
    async createData(){
       let avatar=''
       if(this.file){
          let formData = new FormData(); 
              formData.append("file",this.file,this.file.name)   
              await SingleFileUpload.single(formData,'users')
              .then(res => {   
                if(res.data.status){
                  avatar = res.data.filename;
                  this.file = []
                }  
              })   
       }
       const o = this.Frm
       const data = {
          fname: o.fname ,
          sname: o.sname ,
          license: o.license,
          mobile: o.mobile,
          email: o.email,
          avatar: avatar
       }
       await GuideDataService.create(data)
       .then((res)=>{
          if(res.data.status){
            this.getAllGuide()
          }
       }) 
    },
    async updateGuide(item){
       let avatar=item.l_avatar
       if(this.file){
          let formData = new FormData(); 
              formData.append("file",this.file,this.file.name)   
              await SingleFileUpload.single(formData,'users')
              .then(res => {   
                if(res.data.status){
                  avatar = res.data.filename; 
                  this.file = []
                }  
              })   
       }
       const o = this.Frm
       const data = {
          fname: o.fname ,
          sname: o.sname ,
          license: o.license,
          mobile: o.mobile,
          email: o.email,
          avatar: avatar
       }
       await GuideDataService.update(data,item.id)
       .then((res)=>{
          if(res.data.status){
            this.getAllGuide()
          }
       }) 
    },
    async getAllGuide(){
          await GuideDataService.getAllUser()
          .then((res)=>{  
              if(res.data.length){
                 this.guides = res.data
                 this.guides.forEach(async (itm,idx)=>{
                       console.log(itm)
                      if(itm.avatar!==null&&itm.avatar!==undefined&&itm.avatar!==''){
                          await SingleFileUpload.getFile(itm.avatar,'users')
                          .then((r)=>{    
                            this.guides[idx].l_avatar = itm.avatar
                            this.guides[idx].avatar = 'data:image/png;base64,'+r.data 

                          })
                      }
                 })
              }
          })  
    },
    async removeGuide(item){
      this.$swal({
        title: 'ต้องการลบข้อมูล \n ไกด์ '+item.fname+' ?',
        text: "การลบนี้จะไม่สามารถกู้คืนข้อมูลในภายหลังได้",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#ec0000',
        cancelButtonColor: '#a2a2a2',
        confirmButtonText: 'ยืนยัน',
        allowOutsideClick: false
      }).then((result) => {
        if (result.isConfirmed) {   
          GuideDataService.del(item.id)
          .then((res) => { 
             if(res.data.status){ 
                this.$swal({
                  icon: 'success',
                  title: 'Deleted!!',
                  text: " Giude user \" "+item.id+" \"  has been deleted.", 
                  showConfirmButton:false, 
                  timer:1200
                })
                setTimeout(()=>{
                  this.guides.filter((itm,index)=>{
                      if(itm.id===item.id){
                        this.guides.splice(index,1)
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
    this.getAllGuide();
  },
};
</script>
<template>
  <div :style="{'background-image':'url(./src/assets/img/10909472.jpg)'}">
    <NavbarUser />
    <div>
      <div class="content">
        <div class="container relative" style="min-height: 680px;">
            <h1 class="color-font">Guide</h1> {{ previewImg }}
            <div class="absolute">
                <button class="btn btn-outline-success" @click="newGuide()"> <i class="fa fa-plus"></i> เพิ่มไกด์</button>
            </div>
           <hr/>
           <div class="row">
              <div v-for="(item,i) in guides" :key="i" class="col-lg-3 px-1">
                   <div class="card my-3">
                       <div class="card-body p-0"> 
                          <img
                            :src="item.avatar"
                            class="img-fluid card-img-top"
                            style="height: 200px; object-fit:cover;width:100%;"
                          /> 
                        <div class="p-3"> 
                            <div class="mb-3">
                                <label for="">ชื่อ - นามสกุล</label>
                                <div class="fill color-font">{{item.fname}} &nbsp; {{item.sname}}</div>
                            </div>
                            <div class="mb-2">
                                <label for="">เลขใบอนุญาตไกด์</label>
                                <div class="gno color-font">{{ item.license }}</div>
                            </div>
                            <div class="mb-2" >
                                <label for="">เบอร์โทร</label>
                                <div class="gno color-font" >{{item.mobile}}</div>
                            </div>
                            <div style="line-height:20px;">
                                <label for="">อีเมล</label>
                                <div class="color-font">{{ item.email }}</div>
                            </div>
                        </div>  
                       </div>
                       <div class="card-footer p-1">
                           <div class="row">
                              <div class="col-12 text-end">
                                 <button class="btn btn-warning mx-1" @click="setGuide(item)"> <i class="fas fa-pencil"></i> แก้ไข</button> 
                                 <button class="btn btn-danger" @click="removeGuide(item)"><i class="fas fa-x"></i></button>
                              </div>
                           </div>
                       </div>
                   </div>
              </div>
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

label{
  color:#a2a2a2;
  font-size: 13px;
}
.fill{
  font-size:20px;
}

.color-font {
  color: rgba(0, 0, 0, 0.6);
}
.gno{
  font-size:25px;
  line-height: 20px;
}
.relative .absolute{
  position:absolute; 
  top:15px;
  right:15px;
} 
</style>

<style>

.swal2-input{
   height:45px!important;
   padding:0px!important;
   font-size:13px;
   text-align: center;
}

.frm > input[type=file]{ 
  font-size:17px;
  width:240px;
  margin-left:40px;
}
</style>