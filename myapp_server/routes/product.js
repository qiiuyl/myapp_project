//引入express第三方模块
const express=require('express');
//引入连接池模块
var pool=require('../pool.js');
//创建路由器对象
var router=express.Router();

//添加访问轮播图路由//创建sql语句，请求轮播图路径
router.get("/banner",(req,res)=>{
  var sql="SELECT cid,img,title FROM index_carousel";
  pool.query(sql,(err,result)=>{
    res.send(result);
  })
})
//添加访问kingkong的路由
router.get("/kingkong",(req,res)=>{
  var sql="SELECT pb_tid,pb_tname,icon FROM product_bigtype"
  pool.query(sql,(err,result)=>{
    res.send(result);
  })
})
//添加访问act的路由
router.get("/act",(req,res)=>{
  var sql="SELECT s_id,s_name,s_decribe FROM product_status"
  pool.query(sql,(err,result)=>{
    res.send(result);
  })
})
//导出路由器对象
module.exports=router;