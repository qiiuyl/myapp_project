import Vue from 'vue'
import Router from 'vue-router'
import Home from './views/Home.vue'
import registerone from './views/registerone.vue'
import registertwo from './views/registertwo.vue'
import registerthree from './views/registerthree.vue'

Vue.use(Router)

export default new Router({
  routes: [
    {path: '/',name: 'home',component: Home},
    {path: '/registerone',component:registerone},
    {path: '/registertwo',component:registertwo},
    {path: '/registerthree',component:registerthree},
  ]
})
