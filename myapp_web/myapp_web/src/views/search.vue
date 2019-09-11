<template>
  <div>
    <div id="header">
      <ul>
        <li><img src="http://127.0.0.1:8080/search/return.png" alt=""></li>
        <li><input type="text" placeholder="搜索"></li>
        <li><img src="http://127.0.0.1:8080/search/search.png" alt=""></li>
      </ul>
    </div>
    <div id="clear"></div>
    <div id="nav">
      <ul>
        <li>推荐</li>
        <li>销量</li>
        <li>
          <div>价格</div>
          <div id="btn">
            <button><img src="http://127.0.0.1:8080/search/top.png" alt=""></button>
            <button><img src="http://127.0.0.1:8080/search/bottom.png" alt=""></button>
          </div>
        </li>
        <li>
          <span>筛选</span>
          <button><img src="http://127.0.0.1:8080/search/select.png" alt=""></button>
        </li>
        <li>
          <img src="http://127.0.0.1:8080/search/stype.png" alt="">
        </li>
      </ul>
    </div>
  </div>
</template>
<script>
export default {
  data(){
    return{

    }
  },
}
</script>
<style scoped>
  #header{
    width:100%;
    height:3rem;
    background:#ffe971;
    position:fixed;
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
    height:3rem;
  }
  #nav{
    width:100%;
    height:2rem;
    background:rgb(248, 201, 183);
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
    color:#444;
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
  #nav ul li button{
    height:50%;
    border:none;
    background:none;
    outline:none;
    padding:0;
    margin:0;
  }
</style>