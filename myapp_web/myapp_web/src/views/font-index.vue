<template>
  <div>
    <div id="header">
      <div class="big_font">首页推荐</div>
      <div id="img">
        <input type="text" placeholder="搜索" ref="inputMsg">
        <img class="search" src="../assets/search.png" alt="">
        <img src="../assets/info.png" alt="">
      </div>
    </div>
    <div id="clear"></div><!--为了解决因为fixed对banner造成的影响-->
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
        <div id="product">
          <v-touch v-on:swipeleft="onSwipeLeft" v-on:swiperight="onSwipeRight">
            <div id="product_item" ref="product_item">
              <div id="item_content">
                <img src="../assets/index/pro_01.png" alt="">
                <div id="content">
                  <p>蜜蜂款猫窝</p>
                  <span>“可可爱爱想睡觉的猫窝”</span>
                  <p><span>￥9.9</span><span class="price">￥19.9</span></p>
                </div>
              </div>
              <div id="item_content">
                <img src="../assets/index/pro_01.png" alt="">
                <div id="content">
                  <p>蜜蜂款猫窝</p>
                  <span>“可可爱爱想睡觉的猫窝”</span>
                  <p><span>￥9.9</span><span class="price">￥19.9</span></p>
                </div>
              </div>
              <div id="item_content">
                <img src="../assets/index/pro_01.png" alt="">
                <div id="content">
                  <p>蜜蜂款猫窝</p>
                  <span>“可可爱爱想睡觉的猫窝”</span>
                  <p><span>￥9.9</span><span class="price">￥19.9</span></p>
                </div>
              </div>
              <div id="item_content">
                <img src="../assets/index/pro_01.png" alt="">
                <div id="content">
                  <p>蜜蜂款猫窝</p>
                  <span>“可可爱爱想睡觉的猫窝”</span>
                  <p><span>￥9.9</span><span class="price">￥19.9</span></p>
                </div>
              </div>
            </div>
          </v-touch>
        </div>
    </div>
    <div id="like_product">
        <h5>猜你喜欢</h5>
        <v-touch v-on:swipeleft="onSwipeLeft1" v-on:swiperight="onSwipeRight1">
          <div id="like_list" ref="like_list">
            <div id="like_item">
              <img src="../assets/index/like_01.png" alt="">
              <span>【Royal Canin】幼猫粮 2kg</span>
              <p><span>￥</span>128</p>
            </div>
            <div id="like_item">
              <img src="../assets/index/like_01.png" alt="">
              <span>【Royal Canin】幼猫粮 2kg</span>
              <p><span>￥</span>128</p>
            </div>
            <div id="like_item">
              <img src="../assets/index/like_01.png" alt="">
              <span>【Royal Canin】幼猫粮 2kg</span>
              <p><span>￥</span>128</p>
            </div>
            <div id="like_item">
              <img src="../assets/index/like_01.png" alt="">
              <span>【Royal Canin】幼猫粮 2kg</span>
              <p><span>￥</span>128</p>
            </div>
            <div id="like_item">
              <img src="../assets/index/like_01.png" alt="">
              <span>【Royal Canin】幼猫粮 2kg</span>
              <p><span>￥</span>128</p>
            </div>
          </div>
        </v-touch>
    </div>
  </div>
</template>
<script>
  export default{
    data(){
      return{
        ml:0,
        banner_img:[],
        kingkong:[],
      }
    },
    created(){
      this.getbanner();
      this.getkingkong();
    },
    methods:{
      onSwipeLeft(){
        if(this.ml>-40){
        this.ml-=20;
        this.$refs.product_item.style.marginLeft=`${this.ml}%`;
        this.$refs.product_item.style.transition="margin 0.5s linear"
        }
      },
      onSwipeRight(){
        if(this.ml<0){
          this.ml+=20;
          this.$refs.product_item.style.marginLeft=`${this.ml}%`;
          this.$refs.product_item.style.transition="margin 0.5s linear"
        }
      },
      onSwipeLeft1(){
        if(this.ml>-100){
        this.ml-=20;
        this.$refs.like_list.style.marginLeft=`${this.ml}%`;
        this.$refs.like_list.style.transition="margin 0.5s linear"
        }
      },
      onSwipeRight1(){
        if(this.ml<0){
          this.ml+=20;
          this.$refs.like_list.style.marginLeft=`${this.ml}%`;
          this.$refs.like_list.style.transition="margin 0.5s linear"
        }
      },
      getbanner(){
        var url="/product/banner";
        this.axios.get(url).then(res=>{
          this.banner_img.push(res.data);
          console.log(this.banner_img[0][0].img)
        })
      },
      getkingkong(){
        var url="/product/kingkong";
        this.axios.get(url).then(res=>{
          this.kingkong.push(res.data);
          console.log(this.kingkong);
        })
      }
    }
  }
</script>

<style scoped>
  #header,#banner,#kingkong,#activity{
    width:90%;
    margin:0 auto;
  }
  #header{
    width:100%;
    padding-top:0.5rem;
    height:3rem;
    display:flex;
    justify-content:space-between;
    align-content: center;
    position:fixed;
    z-index:100;
    background:white;
  }
  #header .big_font{
    width:40%;
    height:3rem;
    line-height:3rem;
    font-size:22px;
    color:#333;
    font-weight:900;
    padding-left:5%;
  }
  #header #img{
    width:60%;
    height:3rem;
    display:flex;
    justify-content:flex-end;
    align-items: center;
    padding-right:5%;
  }
  #header #img img{
    width:25px;
    height:25px;
    padding-left:0.3rem;
  }
  #header #img img+img{
    padding-left:1rem;
  }
  #header #img input{
    display:none;
    height:40%;
    border-radius:10px;
    border:2px solid #FFEC8B;
    outline:none;
    padding-left:0.5rem;
    font-size: 12px;
    color:#999;
  }
  #clear{
    height:3.5rem;
    width:100%;
  }
  #banner{
    width:90%;
    height:11rem;/* 多出来的10px放圆点176 */
  }
  #banner .mint-swipe img{
    border-radius:1rem;
  }
  #banner img{
    width:100%;
    height:9rem;
  }
  #kingkong{
    height:10rem;
    margin-top:0.5rem;
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
    width:80%;
    position:absolute;
    top:30%;
    left:15%;
  }
  #activity #activity_right img{
    width:35%;
    position:absolute;
    top:43%;
    left:53%;
  }
  #good_product,#like_product{
    margin-left:0;
    margin-top:1rem;
    height:15rem;
    margin-left:5%;
    overflow: hidden;
  }
  #good_product h5,#like_product h5{
    margin:0;
    margin-left:0.5rem;
    padding:0;
    font-size:18px;
    font-weight:800;
    height:10%;
  }
  #good_product #product{
    display:flex;
    flex-wrap:wrap;
    width:200%;
    height:90%;
  }
  #good_product #product #product_item{
    display:flex;
    flex-wrap:wrap;
    width: 100%;
    height:100%;
  }
  #product_item #item_content{
    background:#f5f5f5;
    height:45%;
    width:40%;
    display:flex;
    margin-right:1rem;
    border-radius:1rem;
    margin-bottom:0.5rem;
  }
  #product_item #item_content img{
    width:35%;
    height:100%;
  }
  #product_item #item_content #content{
    transform: translateX(1.5rem)
  }
  #product_item #item_content #content p{
    font-size:16px;
    font-weight:600;
    margin:0;
    margin-top:0.5rem;
  }
  #product_item #item_content #content>span{
    display:block;
    font-size:12px;
    color:#888;
    transform:translateY(0.5rem)
  }
  #product_item #item_content #content p>span{
    display:inline-block;
    transform:translateY(0.8rem);
    font-size:18px;
    font-weight:600;
  }
  #product_item #item_content #content span.price{
    display:inline-block;
    margin-left:0.5rem;
    font-size:12px;
    font-weight:600;
    color:#666;
    text-decoration:line-through;
  }
  #like_product{
    height:12rem;
  }
  #like_product #like_list{
    width:200%;
    height:100%;
    display:flex;
    justify-content:space-between;
  }
  #like_product #like_list #like_item{
    display:flex;
    align-items:center;
    flex-direction: column;
    width:15%;
    height:100%;
  }
  #like_product #like_list #like_item>span{
    display:block;
    font-size:13px;
    text-align:center;
  }
  #like_product #like_list #like_item>p{
    font-size:18px;
    font-weight:600;
    margin-top:0.5rem;
  }
  #like_product #like_list #like_item>p span{
    font-size:12px;
  }
</style>