<template>
  <div id="index_content">
    <div id="header">
      <div class="big_font">首页推荐</div>
      <div id="img">
        <img src="../assets/search.png" alt="">
        <img src="../assets/info.png" alt="">
      </div>
    </div>
    <div id="banner">
        <mt-swipe :auto="4000">
          <mt-swipe-item><img src="../assets/index/c1.png" alt="轮播图"></mt-swipe-item>
          <mt-swipe-item><img src="../assets/index/c2.png" alt="轮播图"></mt-swipe-item>
          <mt-swipe-item><img src="../assets/index/c3.png" alt="轮播图"></mt-swipe-item>
        </mt-swipe>
    </div>
    <div id="kingkong">
      <ul class="kingkong_ul">
        <li><img src="../assets/index/kingkong_01.png" alt=""><p>品质猫粮</p></li>
        <li><img src="../assets/index/kingkong_02.png" alt=""><p>优选罐头</p></li>
        <li><img src="../assets/index/kingkong_03.png" alt=""><p>厕所猫砂</p></li>
        <li><img src="../assets/index/kingkong_04.png" alt=""><p>清洁护理</p></li>
        <li><img src="../assets/index/kingkong_05.png" alt=""><p>玩具服饰</p></li>
        <li><img src="../assets/index/kingkong_06.png" alt=""><p>猫窝爬架</p></li>
        <li><img src="../assets/index/kingkong_07.png" alt=""><p>日常用品</p></li>
        <li><img src="../assets/index/kingkong_08.png" alt=""><p>医疗保健</p></li>
      </ul>
    </div>
    <div id="activity">
      <div id="activity_left">
        <h6>品质限时购</h6><span class="time">23:59:59</span>
        <img src="../assets/index/activity_01.png" alt="商品图"/>
      </div>
      <div id="activity_right">
        <div>
          <h6>免费试吃</h6><span>小样免费申领</span>
          <img src="../assets/index/activity_02.png" alt="商品图"/>
          </div>
        <div>
          <h6>临期特惠</h6><span>褥羊毛就在这里</span>
          <img src="../assets/index/activity_03.png" alt="商品图"/>
          </div>
      </div>
    </div>
    <div id="good_product">
      <h5>好物说</h5>
      <div id="product_left">
        <div></div>
        <div></div>
      </div>
      <!-- <div id="product_right">
        <div>3</div>
        <div>4</div>
      </div> -->
    </div>

    <div id="footer">
      <mt-tabbar v-model="selected" fixed>
        <mt-tab-item id="外卖">
        <img slot="icon" src="../assets/index/kingkong_01.png">
        外卖
        </mt-tab-item>
        <mt-tab-item id="订单">
          <img slot="icon" src="../assets/index/kingkong_01.png">
          订单
        </mt-tab-item>
        <mt-tab-item id="发现">
          <img slot="icon" src="../assets/index/kingkong_01.png">
          发现
        </mt-tab-item>
        <mt-tab-item id="我的">
          <img slot="icon" src="../assets/index/kingkong_01.png">
          我的
        </mt-tab-item>
      </mt-tabbar>
    </div>
  </div>
</template>
<style scoped>
  #index_content{
    width:90%;
    margin:0 auto;
  }
  #index_content #header{
    margin-top:0.5rem;
    height:3rem;
    display:flex;
    justify-content:space-between;
    align-content: center;
  }
  #index_content #header .big_font{
    width:50%;
    height:3rem;
    line-height:3rem;
    font-size:22px;
    color:#333;
    font-weight:900;
  }
  #index_content #header #img{
    width:50%;
    height:3rem;
    display:flex;
    justify-content:flex-end;
    align-items: center;
  }
  #index_content #header #img img{
    width:20px;
    height:20px;
  }
  #index_content #header #img img+img{
    padding-left:0.5rem;
  }
  #banner{
    width:100%;
    height:11rem;/* 多出来的10px放圆点 */
  }
  #banner img{
    width:100%;
    height:100%;
  }
  #kingkong{
    height:10rem;
    margin-top:1.5rem;
  }
  #kingkong .kingkong_ul{
    height:100%;
    display:flex;
    justify-content:space-between;
    list-style:none;
    font-size:12px;
    font-weight:700;
    color:#666;
    padding-left:0;
    flex-wrap:wrap;
    margin:0;
  }
  #kingkong .kingkong_ul li{
    width:25%;
    height:50%;
    box-sizing:border-box;
  }
  #kingkong .kingkong_ul li p{
    width:100%;
    text-align:center;
    margin:0.5rem auto;
  }
  #kingkong .kingkong_ul li img{
    display:block;
    width:40%;
    height:40%;
    margin:0 auto;
  }
  #activity{
    width:100%;
    height:14rem;
    display:flex;
  }
  #activity>div{
    box-sizing:border-box;
    width:50%;
    height:14rem;
  }
  #activity #activity_left{
    border-radius:2rem;
    background:#f5f5f5;
    margin-right:0.5rem;
    position: relative;
  }
  #activity #activity_right>div{
    height:6.75rem;
    box-sizing:border-box;
    border-radius:2rem;
    background:#f5f5f5;
    position: relative;
  }
  #activity #activity_right div+div{
    margin-top:0.5rem;
  }
  #activity h6{
    margin:0;
    font-size:16px;
    padding:1rem 0 0 1rem;
  }
  #activity span{
    display:block;
    font-size:12px;
    margin-top:0.5rem;
    color:#888;
    padding-left:1rem;
  }
  #activity span.time{
    color:#000;
    font-size:15px;
    font-weight: 600;
  }
  #activity #activity_left img{
    width:100%;
    position:absolute;
    top:3.5rem;
    left:1rem;
  }
  #activity #activity_right img{
    width:35%;
    position:absolute;
    top:2.7rem;
    left:5.5rem;
  }
  #good_product{
    margin-top:1rem;
    height:20rem;
    display:flex;
    width:100%;
  }
  #good_product h5{
    margin:0;
    padding:0;
    font-size:18px;
    font-weight:800;
    height:10%;
  }
  #good_product #product_left div{
    height:45%;
    width:100px;
    background:#f5f5f5;
  }
</style>