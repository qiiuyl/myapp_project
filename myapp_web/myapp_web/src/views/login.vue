<template>
    <div :style="Height" id="bg">
        <div id="header"> 
            <van-nav-bar right-text="去注册" @click-left="onClickLeft" @click-right="onClickRight" left-arrow/>
        </div>
        <div class="title">Hi~ 欢迎来到猫猫说</div>
        <div id="container"> 
           <div><span>昵称：</span><input ref="uname" type="text" v-model="uname" placeholder="请输入您的用户名"></div>
            <div><span>手机号：</span><input type="text" v-model="phone" placeholder="请输入您的手机号"></div>
            <div><span>密码：</span><input type="text" v-model="upwd" placeholder="请输入您的密码"></div>
        </div>
        <div id="button">
            <van-button type="primary" @click="regLogin" size="large">登录</van-button>
        </div>
    </div>
</template>
<style scoped>
    #bg{
        display:flex;
        flex-direction:column;
        align-items: center;
    }
    #header{
        width:100%;
        height:6%;
    }
    .van-nav-bar{
        height:100%;
        background:#ffe971;
        border:0;
        outline: 0;
    }
    .van-nav-bar .van-icon,.van-nav-bar__text{
        color:#777;
        font-weight:600;
    }
    .title{
        width:90%;
        font-size:1.5rem;
        text-align:left;
        color:#999;
        margin-top:9rem;
        font-weight:600;
    }
    #container{
        width:100%;
        height:30%;
        display:flex;
        flex-direction:column;
        align-items:center;
        justify-content:space-around;
        margin-top:0.5rem;
    }
    #container div{
        width:100%;
        height:15%;
        padding:0 5%;
        box-sizing:border-box;
        display: flex;
        justify-content:space-around;
    }
    #container span{
        width:25%;
        font-size:1.2rem;
        color:#333;
        transform:translateY(0.5rem);
    }
    #container input{
        margin:0;
        padding:0;
        width:65%;
        height:80%;
        border:0;
        outline:0;
        border-bottom:3px solid #ffe971;
        font-size:1rem;
        color:#333;
    }
    #button{
        width:90%;
        height:6%;
    }
    #button .van-button--primary{
        background:#ffe971;
        border:0;
        width:100%;
        height:100%;
    }
</style>
<script>
    export default{
        data(){
            return{
                Height:{height:"0"},
                uname:"",
                phone:"",
                upwd:"",
            }
        },
        mounted(){
            this.getH();
            this.$refs.uname.focus();
        },
        methods:{
            getH(){
                var h=window.innerHeight;
                this.Height.height=h+'px';
            },
            onClickRight(){
                this.$router.push("./register")
            },
            onClickLeft(){
                this.$router.push('./index')
            },
            regLogin(){
                if(this.uname==""){
                    this.$toast("用户名不能为空")
                }else if(this.phone==""){
                    this.$toast("手机号不能为空")
                }
                else if(this.upwd==""){
                    this.$toast("密码不能为空")
                }else if(!(/^1[3456789]\d{9}$/.test(this.phone))){
                    //验证手机号码的格式是否正确
                    this.$toast("手机号码格式不正确")
                }else{
                    var obj={uname:this.uname,phone:this.phone,upwd:this.upwd}
                    this.axios.post("/user/login",this.qs.stringify(obj)).then(
                        res=>{
                            if(res.data.code==1){
                                this.$toast({message:"登录成功",duration:2000})
                                setTimeout(()=>{
                                    this.$router.push('./index')
                                },2000)
                            }else{
                                this.$toast("用户名或密码错误")
                            }
                        }
                    )
                }
            }
        }
    }
</script>