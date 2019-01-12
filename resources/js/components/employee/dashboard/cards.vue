<template>
    <div class="cards-wrap"
      @mousemove="handleMouseMove"
      @mouseenter="handleMouseEnter"
      @mouseleave="handleMouseLeave"
      ref="cards">
      <div class="cards"
        :style="cardsStyle">
        <div class="cards-bg" :style="[cardsBgTransform, cardsBgImage]"></div>
        <div class="cards-info">
          <slot name="header"></slot>
          <slot name="content"></slot>
        </div>
      </div>
    </div>
</template>

<script>
export default {


    mounted() {
        this.width = this.$refs.cards.offsetWidth;
    this.height = this.$refs.cards.offsetHeight;
  },
  props: ['dataImage'],
  data: () => ({
      width: 0,
    height: 0,
    mouseX: 0,
    mouseY: 0,
    mouseLeaveDelay: null
  }),
  computed: {
      mousePX() {
          return this.mouseX / this.width;
    },
    mousePY() {
        return this.mouseY / this.height;
    },
    cardsStyle() {
        const rX = this.mousePX * 30;
      const rY = this.mousePY * -30;
      return {
          transform: `rotateY(${rX}deg) rotateX(${rY}deg)`
      };
    },
    cardsBgTransform() {
      const tX = this.mousePX * -40;
      const tY = this.mousePY * -40;
      return {
        transform: `translateX(${tX}px) translateY(${tY}px)`
      }
    },
    cardsBgImage() {
        return {
            backgroundImage: `url(${this.dataImage})`
      }
    }
  },
  methods: {
      handleMouseMove(e) {
          this.mouseX = e.pageX - this.$refs.cards.offsetLeft - this.width/2;
      this.mouseY = e.pageY - this.$refs.cards.offsetTop - this.height/2;
    },
    handleMouseEnter() {
        clearTimeout(this.mouseLeaveDelay);
    },
    handleMouseLeave() {
        this.mouseLeaveDelay = setTimeout(()=>{
            this.mouseX = 0;
        this.mouseY = 0;
      }, 1000);
    }
  }
      }
  </script>
