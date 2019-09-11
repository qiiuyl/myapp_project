<template>
  <div id="container">
    <table></table>
    <div id="product_list">
      <div id="product_item">
        <div id="item_img">
          <img src="http://127.0.0.1:8080/type/type_01.png" alt="">
        </div>
        <div id="content">

        </div>
      </div>
    </div>
  </div>
</template>
<style scoped>
  #container{
    width:100%;
    background:rgba(238,238,224,.5)
  }
  #product_list{
    width:90%;
    margin:0 auto;
    background:#fff;
    margin:0.5rem;
  }
  #product_list #product_item{
    height:10rem;
    width:100%;
    display:flex;
    flex-wrap:nowrap;
    justify-content:space-between;
    border-radius:0.5rem;
  }
  #product_list #product_item #item_img{
    box-sizing:border-box;
    width:30%;
    height:100%;
    padding-top:10%;
    border-radius:0.5rem;
  }
  #product_list #product_item #item_img img{
    box-sizing:border-box;
    width:5.5rem;
    height:5.5rem;
  }
  #product_list #product_item #content{
    width:70%;
    height:100%;
    background:turquoise;
    border-radius:0.5rem;
  }
</style>