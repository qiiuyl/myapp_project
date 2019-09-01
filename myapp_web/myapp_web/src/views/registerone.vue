<template>
    <div>
        <div id="header" fixed>
            <mt-header>
                <router-link to="/" slot="left">
                    <mt-button icon="back"></mt-button>
                </router-link>
                <mt-button slot="right">邮箱注册</mt-button>
            </mt-header>
        </div>
        <div id="content">
            <div class="title">请输入您的手机号</div>
            <div class="input"><input type="text" placeholder="请您输入您的手机号"></div>
        </div>
        <div id="footer">
            <mt-button size="large">下一步</mt-button>
        </div>
    </div>
</template>
<style src="../../static/register.css" scoped>
</style>