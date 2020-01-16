<template>
  <div>
    <mt-tab-container v-model="active">
       <mt-tab-container-item id="fontindex">
          <fontindex></fontindex>
          <div id="clear"></div>
       </mt-tab-container-item>
       <mt-tab-container-item id="type">
          <type :name=typeName></type>
       </mt-tab-container-item>
       <mt-tab-container-item id="shopcar">
          购物车
       </mt-tab-container-item>
       <mt-tab-container-item id="myself">
          <my></my>
       </mt-tab-container-item>
    </mt-tab-container>
    <div id="footer">
      <mt-tabbar v-model="active" fixed>
        <mt-tab-item id="fontindex">
          <img slot="icon" src="http://127.0.0.1:8080/navbar/fontindex.png">
          首页
        </mt-tab-item>
        <mt-tab-item id="type">
          <img slot="icon" src="http://127.0.0.1:8080/navbar/type.png">
          分类
        </mt-tab-item>
        <mt-tab-item id="shopcar">
          <img slot="icon" src="http://127.0.0.1:8080/navbar/shopcar.png">
          购物车
        </mt-tab-item>
        <mt-tab-item id="myself">
          <img slot="icon" src="http://127.0.0.1:8080/navbar/myself.png">
          我的
        </mt-tab-item>
      </mt-tabbar>
    </div>
  </div>
</template>
<script>
  import fontindex from '../components/font-index.vue'
  import type from '../components/type.vue'
  import my from '../components/my.vue'
  export default{
    data(){
      return{
        active:"fontindex",
        typeName:"品质猫粮"
      }
    },
    components:{
      fontindex,
      type,
      my
    }
  }
</script>
<style scoped>
  #clear{
   height:3.5rem;
  }
  .mint-tabbar{
    color:#666;
    font-weight:600;
  }
  .mint-tabbar > .mint-tab-item.is-selected{
    color:#EEB422;
  }
  .mint-tabbar > .mint-tab-item.is-selected .mint-tab-item-icon img{
    width:24px;
    height:24px;
    animation:0.5s bigsmall;
  }
  @keyframes bigsmall{
    0%{
      transform:scale(0.5);
    }
    90%{
      transform:scale(1.1);
    }
    100%{
      transform:scale(1)
    }
  }
</style>