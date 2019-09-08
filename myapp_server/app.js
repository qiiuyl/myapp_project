const express = require('express');
const session = require("express-session");
const cors = require("cors");
//引入body-parser中间件
const bodyParser=require('body-parser');
//引入用户路由器
const userRouter=require('./routes/user.js')
//引入商品路由器
const proRouter=require('./routes/product.js')
//创建web路由器
var app=express();
//监听端口
app.listen(8080);
//5:处理跨域 cors 
//5.1：配置允许访问程序地址(脚手架)
//     http://127.0.0.1:5050  (ok)
//     http://localhost:5050
//5.2:每请求是否验证true
app.use(cors({
  origin:["http://localhost:8081","http://localhost:8080"],
  credentials:true
}))
//6:配置session
//#session配置一定要在所有请求之前
app.use(session({
   secret:"128位字符串",    //#安全字符串
   resave:true,            //#每次请求保存数据 
   saveUninitialized:true  //#保存初始化数据
}));
//使用body-parser中间件
app.use(bodyParser.urlencoded({
  extended:false
}));
//使用路由器，挂载到/user下
app.use('/user',userRouter);//所有的中间件都要放在路由器的前面
app.use('/product',proRouter);