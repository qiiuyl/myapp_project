//引入express第三方模块
const express=require('express');
//引入连接池模块
const pool=require('../pool.js');
//创建路由器对象
var router=express.Router();
//添加路由

// 1.注册的路由
router.post("/register",(req,res)=>{
    var uname=req.body.uname;
    var phone=req.body.phone;
    var upwd=req.body.upwd;
    var sql = "SELECT uid FROM user WHERE phone=?"
    pool.query(sql,[phone],(err,result)=>{
        if(err) throw err;
        if(result.length!=0){
            res.send({msg:"该手机号已被注册",code:-1})
            return
        }else{
            var sql="INSERT INTO user(uname,phone,upwd) VALUES (?,?,?)"
            pool.query(sql,[uname,phone,upwd],(err,result)=>{
                if(err) throw err;
                if(result.affectedRows>0){
                    res.send({msg:"注册成功",code:1});
                    return
                }else{
                    res.send({msg:"注册失败",code:-2});
                }
            })
        }
    })
})

//登录路由
router.post("/login",(req,res)=>{
    var uname=req.body.uname;
    var phone=req.body.phone;
    var upwd=req.body.upwd;
    var sql="SELECT uid FROM user WHERE uname=? && phone=? && upwd=?"
    pool.query(sql,[uname,phone,upwd],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            var id=result[0].uid;
            req.session.uid=id;//往session里面存储值
            res.send({code:1,msg:"登录成功"})
        }else{
            res.send({code:-1,msg:"登录失败"})
        }
    })
})

//用户信息路由
router.get("/userMsg",(req,res)=>{
    var uid=req.session.uid
    if(!uid){
        res.send({code:-1,msg:"您还未登录"})
        return;
    }
    var sql="SELECT * FROM user WHERE uid=?"
    pool.query(sql,[uid],(err,result)=>{
        if(err) throw err;
        console.log(result)
        res.send(result);
    })
})

//导出路由器对象
module.exports=router;