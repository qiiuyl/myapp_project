<template>
  <div id="index_content">
    <div id="header">
      <div class="big_font">首页</div>
      <div id="img">
        <img src="../assets/search.png" alt="">
        <img src="../assets/info.png" alt="">
      </div>
      <div>
        
      </div>
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
    height:3rem;
    line-height:3rem;
    font-size:22px;
    color:#333;
    font-weight:900;
  }
  #index_content #header #img{
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
</style>