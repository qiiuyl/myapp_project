<template>
  <div id="bg" :style="Height">
    <div id="header">
      <ul>
        <li>
          <img src="http://127.0.0.1:8080/search/return.png" />
        </li>
        <li>
          <img src="http://127.0.0.1:8080/prodetail/share.png" />
        </li>
      </ul>
    </div>
    <div id="clear"></div>
    <div id="carousal">
      <van-swipe indicator-color="#333">
        <van-swipe-item><img src="http://127.0.0.1:8080/zanshi/01.jpg" alt=""></van-swipe-item>
        <van-swipe-item><img src="http://127.0.0.1:8080/zanshi/02.jpg" alt=""></van-swipe-item>
        <van-swipe-item><img src="http://127.0.0.1:8080/zanshi/03.jpg" alt=""></van-swipe-item>
        <van-swipe-item><img src="http://127.0.0.1:8080/zanshi/04.jpg" alt=""></van-swipe-item>
      </van-swipe>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      Height: { height: "0" }
    };
  },
  mounted() {
    this.getH();
  },
  methods: {
    getH() {
      var h = window.innerHeight;
      this.Height.height = h + "px";
    }
  }
};
</script>
<style scoped>
#header {
  width: 100%;
  height: 3rem;
  background: #ffe971;
  position: fixed;
  z-index: 2;
}
#clear {
  width: 100%;
  height: 3rem;
}
#nav {
  position: fixed;
  top: 3rem;
  z-index: 2;
  margin-bottom: 0.8rem;
}
#header ul {
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 0 1rem 0 0.5rem;
  display: flex;
  list-style: none;
  justify-content: space-between;
  align-items: center;
  box-sizing: border-box;
}
#header ul li img {
  width: 1.5rem;
  height: 1.5rem;
}
#carousal {
  height: 40%;
}
#carousal .van-swipe{
  height:100%;
}
#carousal img{
  width:100%;
  height:100%;
}
</style>
