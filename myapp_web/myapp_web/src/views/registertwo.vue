<template>
    <div>
        <div id="header" fixed>
            <mt-header>
                <router-link to="/registerone" slot="left">
                    <mt-button icon="back"></mt-button>
                </router-link>  
            </mt-header>
        </div>
        <div id="content">
            <div class="title">请输入您的密码</div>
            <div class="input">
                <input type="password" placeholder="请输入您的密码" ref="inputMsg" v-model="pwd" @blur="reg_password" :class="input_bg">
            </div>
        </div>
        <div id="footer">
            <mt-button v-if="btn==true" disabled size="large">下一步</mt-button>
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
                pwd:"",
                btn:true,
                input_bg:{
                   input_background:false,
                   input_nobackground:true,
                },
            }
        },
        mounted(){
            this.$refs.inputMsg.focus();
        },
        methods:{
            reg_password(){
                if(this.pwd==""){
                    this.input_bg.input_background=false
                    this.input_bg.input_nobackground=true
                    this.$toast("密码不能为空")
                    this.btn=true
                }else{
                    this.btn=false
                    this.input_bg.input_background=true
                    this.input_bg.input_nobackground=false
                }
            },
            next(){
                this.$router.push("/registerthree")
            },
        }
    }
</script>