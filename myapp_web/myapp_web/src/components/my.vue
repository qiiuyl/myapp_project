<template>
  <div id="bg" :style="Height">
    <div id="header">
      <van-nav-bar title="我的" right-text="编辑" left-arrow />
    </div>
    <div id="msg">
      <van-image round width="5rem" height="5rem" src="https://img.yzcdn.cn/vant/cat.jpeg" />
      <p class="product-price">养猫少女</p>
      <p>积分 1024</p>
      <div class="info">
        <p>
          <span class="product-price">2</span>
          <span>优惠券</span>
        </p>
        <p>
          <span class="product-price">34</span>
          <span>收藏夹</span>
        </p>
        <p>
          <span class="product-price">45</span>
          <span>足迹</span>
        </p>
      </div>
    </div>
    <div id="order">
      <van-nav-bar left-text="我的订单" right-text="全部订单 >" />
      <div class="order-info">
        <p>
          <span>
            <img src="http://127.0.0.1:8080/my/fk.png" alt />
          </span>
          <span>待付款</span>
        </p>
        <p>
          <span>
            <img src="http://127.0.0.1:8080/my/fh.png" alt />
          </span>
          <span>待发货</span>
        </p>
        <p>
          <span>
            <img src="http://127.0.0.1:8080/my/sh.png" alt />
          </span>
          <span>待收货</span>
        </p>
        <p>
          <span>
            <img src="http://127.0.0.1:8080/my/pj.png" alt />
          </span>
          <span>待评价</span>
        </p>
      </div>
    </div>
    <div id="user-server">
      <van-cell title="联系客服" icon="http://127.0.0.1:8080/my/kf.png" is-link> 
      </van-cell>
      <van-cell title="收货地址" icon="http://127.0.0.1:8080/my/dz.png" is-link>
      </van-cell>
      <van-cell title="售后服务" icon="http://127.0.0.1:8080/my/shouhou.png" is-link>
      </van-cell>
      <van-cell title="设置" icon="http://127.0.0.1:8080/my/sz.png" is-link>
      </van-cell>
    </div>
  </div>
</template>
<style scoped>
#bg {
  background: rgb(238, 238, 224);
  width: 100%;
}
#header {
  width: 100%;
  height: 5.5%;
}
#header .van-nav-bar {
  height: 100%;
  background: #ffe971;
  border: 0;
  outline: 0;
}
#header .van-nav-bar .van-icon,
#header .van-nav-bar__text {
  color: #777;
  font-weight: 600;
}
#header .van-nav-bar__title {
  font-size: 1.3rem;
  font-weight: 600;
}
#msg {
  height: 30%;
  background: #ffffff;
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 5% 0;
  box-sizing: border-box;
}
#msg p {
  margin: 0px;
  padding: 2% 0;
  box-sizing: border-box;
}
.info {
  display: flex;
  width: 100%;
  justify-content: space-around;
}
.info p {
  display: flex;
  flex-direction: column;
  align-items: center;
  color: #666;
}
#order {
  height: 18%;
  background: #fff;
  margin-top: 3%;
}
#order .van-nav-bar__left {
  font-size: 1.3rem;
  font-weight: 600;
}
#order .van-nav-bar .van-icon,
#order .van-nav-bar__text {
  color: #555;
}
#order .order-info {
  display: flex;
  justify-content: space-around;
  margin-top: 1%;
}
#order .order-info p {
  display: flex;
  flex-direction: column;
  align-items: center;
  color: #666;
  font-weight: 600;
}
#user-server{
  height:25%;
  display:flex;
  flex-direction: column;
  justify-content: space-around;
  background:#fff;
  margin-top:3%;
}
#user-server .van-cell__left-icon{
  font-size: 24px;
}
#user-server .van-cell__title{
  font-size: 18px;
  font-weight: 600;
  color:#666;
}
</style>
<script>
export default {
  data() {
    return {
      Height: { height: "0" }
    };
  },
  mounted() {
    this.getH();
    this.getUserMsg();
  },
  methods: {
    getH() {
      var h = window.innerHeight;
      this.Height.height = h + "px";
    },
    getUserMsg(){
      this.axios.get("/user/userMsg").then(res=>{
        console.log(res)
      })
    }
  }
};
</script>
