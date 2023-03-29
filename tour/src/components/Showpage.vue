<template>
    <div class="bg" >
        <nav class="navtop">
            <div>
                <img src="@/assets/logo.jpg" alt="logo" style="
            display: flex;
            margin: 0 auto;
            border-radius: 50%;
            padding: 5px;
          " />
                <h1>บริษัทไคด์ โซ กรุ๊ป ทราเวล จำกัด</h1>
                <a href="/login"><i class="fas fa-sign-out-alt"></i>Login</a>
            </div>
        </nav>
        <div class="content">
            <div class="container-fluid">
                <form class="search" v-on:submit.prevent="Search">
                    <input type="search" placeholder="ค้นหา ภาค จังหวัด สถานที่ งบประมาณ ได้ที่นี่" name="search"
                        v-model="search" />
                    <button type="submit"><i class="fas fa-search"></i></button>
                </form>
                <div class="row text-center py-5">
                    <div v-for="tour in filteredData" class="col-md-4 col-sm-6 my-3 my-md-3">
                        <div v-if="!!tour">
                            <form>
                                <div class="card shadow" style="min-height: 500px">
                                    <div>
                                        <img :src="tour.img" class="img-fluid card-img-top"
                                            style="height: 200px; object-fit:cover;width:100%;" />
                                    </div>
                                    <div class="card-body">
                                        <h4 class="card-title">{{ tour.name }}</h4>
                                        <h4 class="card-title">{{ tour.day }}</h4>
                                        <p class="quantity">ราคาเริ่มต้น(บาท)</p>
                                        <h6 class="card-title">{{ formatPrice(tour.price) }}</h6>
                                        <p class="quantity">รายละเอียด</p>
                                        <h6 class="card-title">{{ tour.sub_name }}</h6>
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

<script>
import Slider from "./Slider.vue";
import TourDataService from "../services/TourDataService";
import SingleFileUpload from "../services/SingleFileUpload";
export default {
    name: "Show",
    data() {
        return {
            tourList: [],
            search: "",
            mybooking: []
        }
    },
    mounted() {
        this.getData();
    },
    methods: {
        getData() {
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
    components: {
        Slider
    }
}
</script>

<style scoped>
h6,
h4,
p {
    color: black;
    font-weight: 500;
    font-family: "prompt", sans-serif;
}

.bdr-test {
    border: #EC0000 1px solid;
}

.btn-booked {
    background: #FFCD00;
    color: #000;
    padding: 6px 10px;
    border-radius: 5px;
}

.navtop {
    box-sizing: border-box;
    background-color: #2f3947;
    height: 60px;
    width: 100%;
    border: 0;
    margin: auto;
    margin-top: 0;
}

.navtop div {
    display: flex;
    margin: 0 auto;
    width: 1000px;
    height: 100%;
}

.navtop div h1,
.navtop div a {
    display: inline-flex;
    align-items: center;
}

.navtop img {
    display: flex;
    margin: 0 auto;
    border-radius: 50%;
}

.navtop div h1 {
    flex: 1;
    font-size: 16px;
    padding: 0;
    margin: 0;
    color: #eaebed;
    font-weight: normal;
}

.navtop div a {
    padding: 0 20px;
    text-decoration: none;
    color: #c1c4c8;
    font-weight: bold;
}

.navtop div a i {
    padding: 2px 8px 0 0;
}

.navtop div a:hover {
    color: #eaebed;
}

.bg {
    /* The image used */
    background-image: url(../assets/img/10909472.jpg);
    /* Set a specific height */
    min-height: auto;

    /* Create the parallax scrolling effect */
    background-attachment: fixed;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
}
</style>