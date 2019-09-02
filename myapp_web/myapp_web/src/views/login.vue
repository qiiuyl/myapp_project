<template>
    <div>
        <div id="header" fixed>
            <mt-header></mt-header>
        </div>
        <div id="content">
            <div class="title">
              <p>喵~</p>
              <p>欢迎来到猫猫说</p>  
            </div>
            <div id="content_input">
                <div class="input"><input type="text" placeholder="手机/邮箱"></div>
                <div class="input"><input type="password" placeholder="请输入您的密码"></div>
                <span>忘记密码</span>
            </div>
            <div id="footer">
                <mt-button size="large">登录</mt-button>
                <p>还没有账户？<span>立即注册</span></p>
            </div>
        </div>
        <div id="login_foot">
            <p>-第三方登录-</p>
            <div id="login_icon">
                <div class="icon1"></div>
                <div class="icon2"></div>
                <div class="icon3"></div>
            </div>
        </div>
    </div>
</template>
<style src="../../static/register.css" scoped>
</style>
<style scoped>
    #content{
        height:35rem;
        padding-top:6rem;
    }
    #content .title p{
        font-size:28px;
        font-weight: 700;
        margin:0;
    }
    #content #content_input span{
        width:90%;
        display:block;
        margin-top:0.5rem;
        color:#888;
        text-align:right;
    }
    #footer{
        width:90%;
        height:10rem;
        margin:0
    }
    #content #footer p{
        text-align: center;
    }
    #content #footer p span{
        color:#ffe971;
    }
</style>