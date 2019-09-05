<template>
    <div>
        <div id="header" fixed>
            <mt-header>
                <router-link to="/registertwo" slot="left">
                    <mt-button icon="back"></mt-button>
                </router-link> 
            </mt-header>
        </div>
        <div id="content">
            <div class="title">请完善您的个人信息
                <img src="../assets/photo.png" @click="actionSheet">
                <mt-actionsheet :actions= "data" v-model="sheetVisible"></mt-actionsheet>
            </div>
            <div class="input"><input type="text" placeholder="用户名" maxlength="10" :class="input_bg" v-model="user" @blur="reg_username"></div>
        </div>
        <div id="footer">
            <mt-button v-if="btn==true" disabled size="large">完成注册</mt-button>
            <mt-button v-else size="large" @click="next">完成注册</mt-button>
        </div>
    </div>
</template>
<script>
export default {
  name: 'hello',
  data () {
    return {
      // action sheet 选项内容
      data: [{
        name: '拍照',
        method : this.getCamera	// 调用methods中的函数
      }, {
        name: '从相册中选择', 
        method : this.getLibrary	// 调用methods中的函数
      }],
      // action sheet 默认不显示，为false。操作sheetVisible可以控制显示与隐藏
      sheetVisible: false,
      input_bg:{
                   input_background:false,
                   input_nobackground:true,
                },
      user:"",
      btn:true,
    }
  },
  methods: {
    actionSheet: function(){
    	// 打开action sheet
      this.sheetVisible = true;
    },
    getCamera: function(){
      console.log("打开照相机")
    },
    getLibrary: function(){
      console.log("打开相册")
    },
    reg_username(){
        if(this.user==""){
            this.input_bg.input_background=false
            this.input_bg.input_nobackground=true
            this.$toast("用户名不能为空")
        }else{
            this.btn=false
            this.input_bg.input_background=true
            this.input_bg.input_nobackground=false
        }
    },
    next(){
        this.$router.push("/registerone")
    },
  }
}
</script>
<style src="../../static/register.css" scoped>
</style>
<style scoped>
    #content{
        height:21.5rem;
    }
    #footer{
        height:6rem;
    }
    #content .title img{
        width:4.5rem;
        height:4.5rem;
        cursor:pointer;
        display:block;
        padding-left:0.5rem;
        padding-top:0.6rem;
    }
    #content .input_background{
         background:url('../assets/sucess.png') no-repeat 100% 50%;
    }
    #content .input_nobackground{
         background:none;
    }
</style>