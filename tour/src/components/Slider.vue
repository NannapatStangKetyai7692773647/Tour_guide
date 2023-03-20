<script>
export default {
  name: "Slider",
  data() {
    return {
      images: [
        "/src/assets/img/แพ็คเกจที่เที่ยวธรรมชาติ ป่ากลางกรุง.jpg",
        "/src/assets/img/bangkok05.jpg",
        "/src/assets/img/bangkok01.jpg",
        "/src/assets/img/bangkok03.jpg",
        "/src/assets/img/Ratcha03.jpg",
        "/src/assets/img/Ratcha04.jpg",
        "/src/assets/img/พัทยา01.jpg",
        "/src/assets/img/พัทยา03.jpg",
        "/src/assets/img/กาญ01.jpg",
        "/src/assets/img/กาญ02.jpg",
        "/src/assets/img/กาญ03.jpg",
        "/src/assets/img/สงคราม1.jpg", 
      ],
      timer: null,
      currentIndex: 0,
    };
  },

  mounted: function () {
    this.startSlide();
  },

  methods: {
    startSlide: function () {
      this.timer = setInterval(this.next, 4000);
    },

    next: function () {
      this.currentIndex += 1;
    },
    prev: function () {
      this.currentIndex -= 1;
    },
  },

  computed: {
    currentImg: function () {
      return this.images[Math.abs(this.currentIndex) % this.images.length];
    },
  },
};
</script>
<template>
  <div>
    <transition-group name="fade" tag="div">
      <div v-for="i in [currentIndex]" :key="i">
        <img :src="currentImg" style="height: 100%; width: 100%; object-fit: fill" />
      </div>
    </transition-group>
    <a class="prev" @click="prev" href="#">&#10094; Previous</a>
    <a class="next" @click="next" href="#">&#10095; Next</a>
  </div>
</template>

<style>
.fade-enter-active,
.fade-leave-active {
  transition: all 0.9s ease;
  overflow: hidden;
  visibility: visible;
  position: absolute;
  width: 100%;
  opacity: 1;
}

.fade-enter,
.fade-leave-to {
  visibility: hidden;
  width: 100%;
  opacity: 0;
}

.prev,
.next {
  cursor: pointer;
  position: absolute;
  top: 40%;
  width: auto;
  padding: 16px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.7s ease;
  border-radius: 0 4px 4px 0;
  text-decoration: none;
  user-select: none;
}

.next {
  right: 0;
}

.prev {
  left: 0;
}

.prev:hover,
.next:hover {
  background-color: rgba(0, 0, 0, 0.9);
}
</style>
  