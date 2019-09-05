//引入express第三方模块
const express=require('express');
//引入连接池模块
const pool=require('../pool.js');
//创建路由器对象
var router=express.Router();
//添加路由

//1.注册的路由
// router.post("/reg",function(req,res){
//   //获取post请求的数据
//   var $uname=req.body.uname;
//   var $upwd=req.body.upwd;
//   //查询数据库
//   var sql="select uname,upwd from user where uname=? and upwd=?";
//   pool.query(sql,[$uname,$upwd],(err,result)=>{
//     if(err)throw err;
//     if(result.length>0){
//       res.send("1");
//     }else{
//       res.send("0")
//     }
//   });
// });
router.get("/login",function(req,res){
    var obj=req.query.uname;
    console.log(obj);
    res.send("1");
})
//导出路由器对象
module.exports=router;