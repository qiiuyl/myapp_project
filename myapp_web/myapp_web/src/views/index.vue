<template>
  <div>
    <mt-tab-container v-model="active">
       <mt-tab-container-item id="fontindex">
          <fontsize></fontsize>
          <div id="clear"></div>
       </mt-tab-container-item>
       <mt-tab-container-item id="type">
          分类
       </mt-tab-container-item>
       <mt-tab-container-item id="shopcar">
          购物车
       </mt-tab-container-item>
       <mt-tab-container-item id="myself">
          我的
       </mt-tab-container-item>
    </mt-tab-container>
    <mt-tabbar v-model="active" fixed>
      <mt-tab-item id="fontindex">
        <img slot="icon" src="../assets/index/kingkong_01.png">
        首页
      </mt-tab-item>
      <mt-tab-item id="type">
        <img slot="icon" src="../assets/index/kingkong_01.png">
        分类
      </mt-tab-item>
      <mt-tab-item id="shopcar">
        <img slot="icon" src="../assets/index/kingkong_01.png">
        购物车
      </mt-tab-item>
      <mt-tab-item id="myself">
        <img slot="icon" src="../assets/index/kingkong_01.png">
        我的
      </mt-tab-item>
    </mt-tabbar>
  </div>
</template>
<script>
  import fontindex from './font-index.vue'
  export default{
    data(){
      return{
        active:"fontindex",
      }
    },
    components:{
      "fontsize":fontindex
    }
  }
</script>
<style scoped>
  #clear{
    height:48px;
  }
</style>