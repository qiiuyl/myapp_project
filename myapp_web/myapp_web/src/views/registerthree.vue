<template>
    <div>
        <div id="header" fixed>
            <mt-header>
                <router-link to="/" slot="left">
                    <mt-button icon="back"></mt-button>
                </router-link>
                <router-link to="/" slot="right">
                    <mt-button>以后再说</mt-button>
                </router-link>
            </mt-header>
        </div>
        <div id="content">
            <div class="title">请完善您的个人信息
                <img src="../assets/photo.png" @click="actionSheet">
                <mt-actionsheet :actions= "data" v-model="sheetVisible"></mt-actionsheet>
            </div>
            <div class="input"><input type="text" placeholder="用户名" maxlength="10"></div>
        </div>
        <div id="footer">
            <mt-button size="large">完成注册</mt-button>
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
      sheetVisible: false
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
    }
  }
}
</script>

————————————————
版权声明：本文为CSDN博主「michael_ouyang」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/michael_ouyang/article/details/77556391




<style src="../../static/register.css" scoped>
</style>
<style scoped>
    #content .title img{
        width:4.5rem;
        height:4.5rem;
        cursor:pointer;
        display:block;
        padding-left:0.5rem;
        padding-top:0.6rem;
    }
</style>