<template>
  <div id="item_container">
    <table></table>
    <div id="product_item">
      <div id="item_img">
        <img src="http://127.0.0.1:8080/type/type_01.png" alt />
      </div>
      <div id="content">
        <h6>【Acana】 爱肯拿无谷鸡肉鱼配方全猫粮 1.8kg</h6>
        <div id="head">
          <p id="discount">折扣</p>
          <p id="shopcar">
            <button>
              <img src="http://127.0.0.1:8080/search/shopcar.png" alt />
            </button>
          </p>
        </div>
        <p id="price">
          <span>￥</span>228
          <span>￥63.33/500g</span>
        </p>
        <div id="bottom">
          <p>
            <img src="http://127.0.0.1:8080/country/hg.png" alt />
            <span>韩国原装进口</span>
          </p>
          <p>
            <img src="http://127.0.0.1:8080/search/client.png" alt />
            <span>228人已购买</span>
          </p>
        </div>
      </div>
    </div>
  </div>
</template>
<style scoped>
#item_container {
  width: 95%;
  margin: 1rem auto;
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
  width: 100%;
  height: 20%;
  margin: 0;
  padding: 0;
  color: #444;
}
#product_item #content #head {
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