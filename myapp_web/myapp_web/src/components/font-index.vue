<template>
  <div>
    <div id="header">
      <div class="big_font">首页推荐</div>
      <div id="img">
        <router-link to="search"><img class="search" src="http://127.0.0.1:8080/index/search.png" alt=""></router-link>
        <router-link to="search"><img src="http://127.0.0.1:8080/index/info.png" alt=""></router-link>
      </div>
    </div>
    <div id="clear"></div><!--为了解决因为fixed对banner造成的影响-->
    <div id="banner">
        <mt-swipe :auto="4000">
          <mt-swipe-item v-for="(item,index) of banner_img" :key=index>
            <img :src=banner_img[index].img :alt=banner_img[index].title></mt-swipe-item>
        </mt-swipe>
    </div>
    <div id="kingkong">
      <ul class="kingkong_ul">
        <li v-for="(item,index) of kingkong" :key=index>
          <router-link :to="{path:'/type/'+item.pb_tname}">
            <img :src=item.icon :alt=item.pb_tname>
            <p>{{item.pb_tname}}</p>
          </router-link>
        </li>
      </ul>
    </div>
    <div id="activity" v-if="act.length>0 && act_product.length>0">
      <div id="activity_left">
        <h6>{{(act[0].s_name)}}</h6><span class="time">{{act[0].s_decribe}}</span>
        <img :src=act_product[0].p_img alt="商品图"/>
      </div>
      <div id="activity_right">
        <div>
          <h6>{{(act[1].s_name)}}</h6><span>{{act[1].s_decribe}}</span>
          <img :src=act_product[1].p_img alt="商品图"/>
        </div>
        <div>
          <h6>{{(act[2].s_name)}}</h6><span>{{act[2].s_decribe}}</span>
          <img :src=act_product[2].p_img alt="商品图"/>
        </div>
      </div>
    </div>

    <div id="good_product">
      <h5>好物说</h5>
        <div id="product">
            <div id="product_item" ref="product_item" @touchstart="startSlide" @touchmove="slide($event,'item_content','product_item')" @touchend="slideEnd">
              <div id="item_content" ref="item_content" v-for="(item,index) of good_product" :key="index">
                <img :src=good_product[index].p_img alt="">
                <div id="content">
                  <p>{{good_product[index].p_name}}</p>
                  <span>{{good_product[index].p_secondname}}</span>
                  <p><span>￥{{good_product[index].p_pastprice}}</span><span class="price">￥{{good_product[index].p_price}}</span></p>
                </div>
              </div>
            </div>
        </div>
    </div>

    <div id="like_product" ref="like_product">
        <h5>猜你喜欢</h5>
          <div id="like_list" ref="like_list" @touchstart="startSlide" @touchmove="slide($event,'like_item','like_list')" @touchend="slideEnd">
            <div ref="like_item" id="like_item" v-for="(item,index) of like_product " :key="index">
              <img :src=like_product[index].p_img alt=like_product[index].p_title>
              <span>{{like_product[index].p_name}}</span>
              <p><span>￥</span>{{like_product[index].p_price}}</p>
            </div>
          </div>
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
        act:[],
        act_product:[],
        good_product:[],
        like_product:[],
        touchData:{
          startX:0,
          len:0,
          end:0,
          slidedLen:0//已经滑动了的距离
        }
      }
    },
    created(){
      this.getbanner();
      this.getkingkong();
      this.getactivity();
      this.getactivity_product();
      this.getgood_product();
      this.getlike_product();
    },
    methods:{
      startSlide(e){
        this.touchData.startX=e.targetTouches[0].clientX;//获取到当前鼠标的位置并且记录
      },
      slide(e,slideRef,parentRef){
        let endX= e.targetTouches[0].clientX;//记录移动的最后的点位置
        this.touchData.len=endX-this.touchData.startX;//用最后位置－开始位置，获取移动距离
        let arr=this.$refs[slideRef];//获取当前列表中的每一个商品，得到一个元素数组
        let divWidth=arr[0].offsetWidth;//获取其中任意一个元素的宽度
        let divMargin=parseFloat(window.getComputedStyle(arr[0]).marginRight);//获取每一个元素的margin的值，并且转换成数字格式
        let allWidth=divWidth*(arr.length)+(divMargin*arr.length-1);//把全部item的宽+它们的margin-最后一个item的margin，得到总体的宽
        let BigdivWidth=this.$refs[parentRef].offsetWidth;
        let addSlide=this.touchData.len+this.touchData.slidedLen;//总共移动的距离
        if(parentRef=='product_item'){
          if(addSlide<0 && addSlide>-243  || addSlide>0 && addSlide<2){
            this.$refs[parentRef].style.transform=`translateX(${addSlide}px)`
          }
        }else if(parentRef=='like_list'){
          if(addSlide<0 && addSlide>-(allWidth-BigdivWidth)  || addSlide>0 && addSlide<2){
            this.$refs[parentRef].style.transform=`translateX(${addSlide}px)`
          }
        }
        
      },
      slideEnd(e){
        this.touchData.slidedLen+=this.touchData.len;
      },

      getbanner(){
        var url="/product/banner";
        this.axios.get(url).then(res=>{
          this.banner_img=this.banner_img.concat(res.data)
        })
      },
      getkingkong(){
        var url="/product/kingkong";
        this.axios.get(url).then(res=>{
          this.kingkong=this.kingkong.concat(res.data);
        })                                                                                                                                                                                                                                                        
      },
      getactivity(){
        var url="/product/act";
        this.axios.get(url).then(res=>{
          this.act=this.act.concat(res.data)
        })
      },
      getactivity_product(){
        var url="/product/act_product";
        this.axios.get(url).then(res=>{
          this.act_product=this.act_product.concat(res.data)
        })
      },
      getgood_product(){
        var url="/product/good_product";
        this.axios.get(url).then(res=>{
          this.good_product=this.good_product.concat(res.data)
        })
      },
      getlike_product(){
        var url="/product/like_product";
        this.axios.get(url).then(res=>{
          this.like_product=this.like_product.concat(res.data)
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
  #header #img a+a{
    padding-left:0.8rem;
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
  #kingkong .kingkong_ul a{
    outline:none;
    border:none;
    background:none;
    color:#333;
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
    width:8.5rem;
    position:absolute;
    top:30%;
    left:15%;
  }
  #activity #activity_right img{
    width:3.5rem;
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
    /* width:200%; */
    height:100%;
    display:flex;
    justify-content:space-between;
    flex-wrap: nowrap;
  }
  #like_product #like_list #like_item{
    display:flex;
    align-items:center;
    flex-direction: column;
    width:12rem;
    height:100%;
    margin-right:2rem;
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