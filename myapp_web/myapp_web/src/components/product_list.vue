<template>
  <div id="container">
    <productItem v-for="(item,index) of proMsg" :key="index" :item=item :index=index></productItem>
  </div>
</template>
<script>
  import product_item from './product_item';
  export default{
    data(){
      return{
      }
    },
    props:['proMsg'],
    components:{
      "productItem":product_item
    },
  }
</script>
<style scoped>
  #container{
    box-sizing:border-box;
    width:100%;
    padding:0.5rem 0;
  }
</style>