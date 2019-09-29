<template>
  <div>
    <div id="header">
      <ul>
        <li><img src="http://127.0.0.1:8080/search/return.png" alt=""></li>
        <li><input type="text" placeholder="搜索" ref="inputMsg"></li>
        <li><img src="http://127.0.0.1:8080/search/search.png" alt=""></li>
      </ul>
    </div>
    <div id="nav">
      <ul ref="navUL">
        <li v-for="(item,index) of list" :key=index>
          <div v-if="item.label" @touchstart="change(item)" :ref="item">{{item.label}}</div>
          <div :id="item.btnId || null" v-if="item.img&&item.img.length>0"><!-- item.img是为了遍历不到img的时候不会报找不到length的错误 -->
            <button v-for="(iv,i) in item.img" :key="i">
              <img :src="iv.src" :alt="iv.src">
            </button>
          </div>
        </li>
      </ul>
    </div>
    <div id="clear"></div>
    <div>
      <productlist></productlist>
    </div>
  </div>
</template>
<script>
import productlist from '../components/product_list.vue';
export default {
  name: 'search',
  data(){
    return{
      list:{
        recommend:{
          label:'推荐'
        },
        sales:{
          label:'销量'
        },
        prices:{
          label:'价格',
          btnId:'btn',
          img:[
            {src:'http://127.0.0.1:8080/search/top.png'},{src:'http://127.0.0.1:8080/search/bottom.png'}
          ]
        },
        select:{
          label:'筛选',
          img:[{src:'http://127.0.0.1:8080/search/unselect.png'}]
        },
        type:{
          img:[{src:'http://127.0.0.1:8080/search/untype.png'}]
        }
      }
    }
  },
  components:{
    productlist,
  },
  mounted(){
    this.$refs.inputMsg.focus();
  },
  methods:{
    getKeyWord(){
      
    },
    change(i){
      console.log(this.$refs[i])
      this.$refs[i][0].style.color="red";
    }
  }
}
</script>
<style scoped>
  #header{
    width:100%;
    height:3rem;
    background:#ffe971;
    position:fixed;
    z-index:2;
  }
  #nav{
    position:fixed;
    top:3rem;
    z-index:2;
    background:#fff;
    margin-bottom:0.8rem;
  }
  #header ul{
    width:100%;
    height:100%;
    margin:0;
    padding:0 1rem 0 0.5rem;
    display:flex;
    list-style: none;
    justify-content:space-between;
    align-items:center;
    box-sizing:border-box;
  }
  #header ul li img{
    width:30px;
    height:30px;
  }
  #header ul li input{
    border:0;
    outline:0;
    width:12rem;
    height:1.5rem;
    border-radius:4px;
    margin-left:-2rem;
    font-size:12px;
    color:#666;
    padding-left:0.5rem;
  }
  #clear{
    height:4rem;
  }
  #nav{
    width:100%;
    height:2rem;
  }
  #nav ul{
    width:100%;
    height:100%;
    display:flex;
    list-style: none;
    justify-content:space-between;
    align-items:center;
    box-sizing:border-box;
    padding:0.5rem 0 0 0;
    margin:0;
  }
  #nav ul li{
    width:25%;
    height:100%;
    font-size:12px;
    color:#bfbfbf;
    font-weight:600;
    text-align: center;
  }
  #nav ul li:nth-child(3){
    display:flex;
    padding-left:1rem;
  }
  #nav ul li:nth-child(3) #btn{
    display:flex;
    flex-direction:column;
    height:100%;
    transform:translateY(-0.5rem)
  }
  #nav ul li:nth-child(3) #btn img{
    width:20px;
    height:20px;
  }
  #nav ul li:nth-child(4){
    display:flex;
    padding-left:1rem;
  }
  #nav ul li:nth-child(4) img{
    width:14px;
    height:14px;
  }
  #nav ul li:last-child img{
    width:18px;
    height:18px;
    transform:translateY(-0.1rem)
  }
  #nav ul li button{
    height:50%;
    border:none;
    background:none;
    outline:none;
    padding:0;
    margin:0;
  }
</style>