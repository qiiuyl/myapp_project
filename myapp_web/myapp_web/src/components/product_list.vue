<template>
  <div id="container">
    <productItem></productItem>
  </div>
</template>
<script>
  import product_item from './product_item';
  export default{
    components:{
      "productItem":product_item
    },
    methods:{
      getProductInfo(){
        
      }
    }
  }
</script>
<style scoped>
  #container{
    box-sizing:border-box;
    width:100%;
    background:rgb(238,238,224);
    padding:0.5rem 0;
  }
</style>