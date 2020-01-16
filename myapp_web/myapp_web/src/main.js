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
//配置axios
//引入axios
import axios from "axios"
//配置请求时保存session信息,允许携带cookie发送请求
// axios.default.withCredentials = true
//配置请求的基础路径
axios.defaults.baseURL = "/api"
//注册
Vue.prototype.axios = axios;//前面的vue必须大写
//引入qs模块
import qs from 'qs'
Vue.prototype.qs = qs;

import { NavBar, Button, Image, Cell, CellGroup, Loading, Swipe, SwipeItem, Dialog} from 'vant';
Vue.use(NavBar).use(Button).use(Image).use(Cell).use(CellGroup).use(Loading).use(Swipe).use(SwipeItem).use(Dialog);

Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
