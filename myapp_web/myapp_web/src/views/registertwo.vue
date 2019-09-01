<template>
    <div>
        <div id="header" fixed>
            <mt-header>
                <router-link to="/" slot="left">
                    <mt-button icon="back"></mt-button>
                </router-link>
                <mt-button slot="right"></mt-button>
            </mt-header>
        </div>
        <div id="content">
            <div class="title">请输入验证码<span>已发送四位验证码到...</span></div>
            <div id="code">
                <input type="text" placeholder="" maxlength="1" v-for="index of sum" :key="index">
            </div>
        </div>
        <div id="footer">
            <mt-button size="large">下一步</mt-button>
            <p>重新获取<span> ...秒</span></p>
        </div>
    </div>
</template>
<script>
    export default {
        data(){
            return{
                sum:4,
            }
        }
    }
</script>
<style scoped src="../../static/register.css">
</style>
<style scoped>
    #content .title span{
        display:block;
        font-size: 10px;
        font-weight:100;
        color:#888;
        padding-left:0.5rem;
        padding-top:0.6rem;
    }
    #code{
        width:80%;
        display: flex;
        justify-content:space-between;
        margin:0 auto;
    }
    #content #code input{
        width:2.5rem;
        height:3rem;
        border:0;
        border-radius:10px;
        background:#e8e8e8;
        text-align:center;
        line-height: 3rem;
        padding-left:0;
        font-size: 20px;
        color:#000;
        margin-left:0;
    }
    #footer p{
        cursor: pointer;
        display:block;
        text-align:none;
        font-size: 10px;
        font-weight:100;
        color:#888;
        margin-left:2.5rem;
    }
    #footer p span{
        color:#ffe971;
    }
</style>