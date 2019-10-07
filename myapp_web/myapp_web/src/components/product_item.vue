<template>
  <div id="item_container">
    <table></table>
    <div id="product_item">
      <div id="item_img">
        <img :src="item.p_img" alt />
      </div>
      <div id="content">
        <h6>{{item.p_name}}</h6>
        <div id="head">
          <p id="discount" :style="{'opacity':item.p_discount==1?'9':'0'}">折扣</p>
          <p id="shopcar">
            <button>
              <img src="http://127.0.0.1:8080/search/shopcar.png" alt />
            </button>
          </p>
        </div>
        <p id="price">
          <span>￥</span>{{(item.p_price).toFixed(2)}}
          <span>￥{{monovalent.toFixed(2)}}/500g</span>
          <!-- 采用计算属性获得 -->
        </p>
        <div id="bottom">
          <p>
            <img :src="item.pc_icon" alt />
            <span>原产地:{{item.pc_country}}</span>
          </p>
          <p>
            <img src="http://127.0.0.1:8080/search/client.png" alt />
            <span>{{item.p_buypeople}}人已购买</span>
          </p>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  props:['item','index'],
  computed:{
    monovalent(){//根据总价来计算每500g价格是多少
      var price=this.item.p_price;
      return price/2;
    }
  }
}
</script>
<style scoped>
#item_container {
  width: 95%;
  margin: 1.3rem auto;
  background: #fff;
  border-radius: 1rem;
}
#product_item {
  height: 8rem;
  width: 100%;
  display: flex;
  flex-wrap: nowrap;
  justify-content: space-between;
}
#product_item #item_img {
  width: 30%;
  height: 100%;
  display: flex;
  align-items: center;
}
#product_item #item_img img {
  width: 5.5rem;
  height: 5.5rem;
}
#product_item #content {
  width: 70%;
  height: 100%;
  padding: 0.5rem 0.5rem 0rem 0rem;
  box-sizing:border-box;
}
#product_item #content h6 {
  width: 90%;
  /* height: 20%; */
  margin: 0;
  padding: 0;
  color: #444;
}
#product_item #content #head{
  width: 100%;
  height: 30%;
  display: flex;
  justify-content: space-between;
  padding-top: 0.5rem;
  box-sizing: border-box;
}
#product_item #content p {
  margin: 0;
  padding: 0;
}
#product_item #content p#discount {
  border: 1px solid darkred;
  color: darkred;
  border-radius: 0.5rem;
  font-size: 12px;
  width: 18%;
  height: 45%;
  text-align: center;
  transform: translateY(0.5rem);
}
#product_item #content p#shopcar button {
  width: 20%;
  height: 100%;
  background: none;
  outline: none;
  border: none;
}
#product_item #content p#shopcar button img {
  width: 24px;
  height: 24px;
}
#product_item #content #price span:first-child {
  font-size: 12px;
  font-weight: 600;
  color: #000;
}
#product_item #content #price {
  font-size: 20px;
  color: #000;
  font-weight: 600;
}
#product_item #content #price span:last-child {
  font-size: 12px;
  color: #888;
  font-weight: 700;
  margin-left: 1rem;
  letter-spacing: 0.1rem;
}
#product_item #bottom {
  height: 30%;
  width: 100%;
  display: flex;
  justify-content: space-between;
  align-items:center;
  box-sizing: border-box;
}
#product_item #bottom p {
  height: 50%;
  display: flex;
}
#product_item #bottom p:first-child > img {
  width: 22px;
  height: 22px;
}
#product_item #bottom p > span {
  font-size: 12px;
  color: #555;
  font-weight: 700;
  transform: translateY(0.3rem);
  padding-left: 0.1rem;
}
#product_item #bottom p:last-child > img {
  width: 18px;
  height: 18px;
  transform: translateY(0.1rem);
}
</style>