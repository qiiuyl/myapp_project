import Vue from 'vue'
import Router from 'vue-router'
import Home from './views/Home.vue'
import registerone from './views/registerone.vue'
import registertwo from './views/registertwo.vue'
import registerthree from './views/registerthree.vue'
import login from './views/login.vue'
import index from './views/index.vue'
import search from './views/search.vue'
import product_item from './components/product_item.vue'
import product_list from './components/product_list.vue'

Vue.use(Router)

export default new Router({
  routes: [
    {path: '/',name: 'home',component: Home},
    {path: '/registerone',component:registerone},
    {path: '/registertwo',component:registertwo},
    {path: '/registerthree',component:registerthree},
    {path: '/login',component:login},
    {path: '/index',component:index},
    {path: '/search',component:search},
    {path: '/productItem',component:product_item},
    {path: '/productList',component:product_list},
  ]
})
