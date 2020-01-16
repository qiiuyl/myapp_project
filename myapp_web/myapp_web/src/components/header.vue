<template>
  <div id="header">
    <van-nav-bar left-arrow>
    </van-nav-bar>
    <router-view></router-view>
  </div>
</template>
<style scoped>
#header {
  height: 3.5rem;
}
#header .van-nav-bar {
  height: 100%;
  background: #ffe971;
  border: 0;
  outline: 0;
  line-height: 56px;
}
#header .van-nav-bar__text,.van-nav-bar .van-icon{
    color:#fff;
    font-size:1.5rem;
}
</style>
<script>
export default {
    data(){
        return{

        }
    }
}
</script>