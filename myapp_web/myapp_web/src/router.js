import Vue from 'vue'
import Router from 'vue-router'
import register from './views/register.vue'
import login from './views/login.vue'
import index from './views/index.vue'
import search from './views/search.vue'
import product_item from './components/product_item.vue'
import product_list from './components/product_list.vue'
import type  from './components/type.vue'
import prodetail from './views/proDetail.vue'
import header from './components/header.vue'

Vue.use(Router)

export default new Router({
  routes: [
    {path: '/register',component:register},
    {path: '/login',component:login},
    {path: '/index',component:index},
    {path: '/search',component:search},
    {path: '/productItem',component:product_item},
    {path: '/productList',component:product_list},
    {path: '/type/:name',component:type},
    {path: '/prodetail',component:prodetail},
    {path: '/header',component:header},
  ]
})
