<template>
    <div :style="Height">
        <div id="header"> 
            <van-nav-bar right-text="邮箱注册" left-arrow/>
        </div>
        <div id="container">
            <div class="img">
                <img src="http://127.0.0.1:8080/login/3.jpg" alt="">
            </div>
        </div>
    </div>
</template>
<style scoped>
    #header{
        width:100%;
        height:5.5%;
        position:relative;
    }
    .van-nav-bar{
        height:100%;
        background:#ffe971;
    }
    .van-nav-bar .van-icon,.van-nav-bar__text{
        color:#777;
        font-weight:600;
    }
    #container{
        width:100%;
        height:60%;
        background:#ffe971;
        position:absolute;
        top:20%;
        display:flex;
        flex-direction:column;
        align-items:center;
    }
    #container .img{
        height:15%;
    }
    #container .img img{
        width:20%;
        height:100%;
        border-radius:50%;
    }
</style>
<script>
    export default{
        data(){
            return{
                Height:{height:"0"}
            }
        },
        mounted(){
            this.getH();
        },
        methods:{
            getH(){
                var h=window.innerHeight;
                this.Height.height=h+'px';
                console.log(this.Height.height)
            }
        }
    }
</script>