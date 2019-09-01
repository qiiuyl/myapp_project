import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
//引入第三方组件库
import MintUI from 'mint-ui'
//单引入mint-ui的样式文件
import "mint-ui/lib/style.css"
// //将mint-ui注册vue
Vue.use(MintUI)
// //配置axios
// //引入axios
// import axios from "axios"
// //配置请求时保存session信息
// axios.default.withCredentials=true
// //配置请求的基础路径
// axios.default.baseURL="http://127.0.0.1:8080/"
// //注册
// vue.prototype.axios=axios;

Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
