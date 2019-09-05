<template>
    <div>
        <div id="header" fixed>
            <mt-header>
                <router-link to="/" slot="left">
                    <mt-button icon="back"></mt-button>
                </router-link>
                <mt-button slot="right" @click.native="email_phone">{{text}}</mt-button>
            </mt-header>
        </div>
        <div id="content">
            <div class="title">{{msg}}</div>
            <div class="input">
                <input v-if="msg=='请输入您的手机号'" type="text" placeholder="请输入您的手机号" v-model="phone" ref="inputMsg" @blur="reg_phone" :class="input_bg">
                <input v-else type="text" placeholder="请输入您的邮箱" v-model="email" ref="inputMsg" @blur="reg_email" :class="input_bg">
            </div>
        </div>
        <div id="footer">
            <mt-button v-if="btn==true" disabled size="large" ref="nonext">下一步</mt-button>
            <mt-button v-else size="large" @click="next">下一步</mt-button>
        </div>
    </div>
</template>
<style src="../../static/register.css" scoped>
</style>
<style scoped>
    #content{
        height:20rem;
    }
    #footer{
        height:6rem;
    }
    #content .input_background{
         background:url('../assets/sucess.png') no-repeat 100% 50%;
    }
    #content .input_nobackground{
         background:none;
    }
</style>
<script>
    export default {
        data(){
            return{
                msg:"请输入您的手机号",
                text:"邮箱登录",
                phone:"",
                email:"",
                input_bg:{
                   input_background:false,
                   input_nobackground:true,
                },
                btn:true,
            }
        },
        mounted(){
            this.$refs.inputMsg.focus();
        },
        methods:{
            email_phone(){//对邮箱和手机号登录进行切换
                if(this.msg=="请输入您的手机号"&&this.text=="邮箱登录"){
                this.msg="请输入您的邮箱账号"
                this.text="手机登录"
                }else{
                this.msg="请输入您的手机号"
                this.text="邮箱登录"    
                }
            },
            reg_phone(){//使用正则验证用户输入的手机号码是否正确
                var str=this.phone;
                var reg=/^1[3-9]\d{9}$/;
                if(str===""){
                    this.btn=true
                    this.input_bg.input_background=false
                    this.input_bg.input_nobackground=true
                    this.$toast("手机号不能为空")
                }else if(reg.test(str)){
                    this.input_bg.input_background=true
                    this.input_bg.input_nobackground=false
                    this.btn=false
                    }else{
                    this.input_bg.input_background=false
                    this.input_bg.input_nobackground=true
                    this.$toast("手机号错误")
                    this.btn=true
                }
            },
            reg_email(){//使用正则验证用户输入的验证码是否正确----封装成一个函数
                var str=this.email;
                var reg=/^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
                if(str===""){
                    this.$toast("邮箱不能为空")
                    this.btn=true
                }else if(reg.test(str)){
                    this.input_bg.input_background=true
                    this.input_bg.input_nobackground=false
                    this.btn=false
                    }else{
                    this.input_bg.input_background=false
                    this.input_bg.input_nobackground=true
                    this.$toast("邮箱格式错误")
                    this.btn=true
                }
            },
            next(){
                this.$router.push("/registertwo")
            },
        }
    }
</script>