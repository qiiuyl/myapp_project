//引入express第三方模块
const express = require('express');
//引入连接池模块
var pool = require('../pool.js');
//创建路由器对象
var router = express.Router();

//添加访问轮播图路由//创建sql语句，请求轮播图路径
router.get("/banner", (req, res) => {
  var sql = "SELECT cid,img,title FROM index_carousel";
  pool.query(sql, (err, result) => {
    res.send(result);
  })
})
//添加访问kingkong的路由
router.get("/kingkong", (req, res) => {
  var sql = "SELECT pb_tid,pb_tname,icon FROM product_bigtype"
  pool.query(sql, (err, result) => {
    res.send(result);
  })
})
//添加访问act的路由
router.get("/act", (req, res) => {
  var sql = "SELECT s_id,s_name,s_decribe FROM product_status"
  pool.query(sql, (err, result) => {
    res.send(result);
  })
})
//访问处于活动状态的商品信息
router.get("/act_product", (req, res) => {
  var sql = "SELECT p_id,p_name,p_price,p_pastprice,p_img FROM product WHERE p_status=101 OR p_status=102 OR p_status=103"
  pool.query(sql, (err, result) => {
    res.send(result);
  })
})
//访问处于好物说状态的商品信息
router.get("/good_product", (req, res) => {
  var sql = "SELECT p_id,p_name,p_secondname,p_price,p_pastprice,p_img FROM product WHERE p_status=104"
  pool.query(sql, (err, result) => {
    res.send(result);
  })
})
//访问处于猜你喜欢状态的商品信息
router.get("/like_product", (req, res) => {
  var sql = "SELECT p_id,p_name,p_price,p_pastprice,p_img FROM product WHERE p_status=105"
  pool.query(sql, (err, result) => {
    res.send(result);
  })
})
//查询小类别的商品
router.get("/smalltype", (req, res) => {
  var name = req.query.name
  var sql = "SELECT ps_tid,ps_tname,ps_icon FROM product_smalltype,product_bigtype WHERE pb_id=pb_tid AND pb_tname=?"
  pool.query(sql, [name], (err, result) => {
    if (err) throw err;
    res.send(result);
  })
})
//查询商品的品牌
router.get("/brand", (req, res) => {
  var name = req.query.name
  var sql = "SELECT pc_id,pc_name,pc_img FROM product_brand,product_bigtype WHERE pbpc_tid=pb_tid AND pb_tname=?"
  pool.query(sql, [name], (err, result) => {
    if (err) throw err;
    res.send(result);
  })
})
//查询带关键词的商品(推荐)
router.get("/searchDefault", (req, res) => {
  var keyword = req.query.keyword;
    var sql = "SELECT p_id,p_name,p_price,p_img,p_discount,p_brand,pc_country,pc_icon,p_buypeople FROM product,product_brand WHERE p_brand=pc_id AND p_name LIKE ?"
    pool.query(sql, [`%${keyword}%`], (err, result) => {
      if (err) throw err;
      res.send(result);
    })
})
//查询带关键词的商品(按销量)
router.get("/searchSales", (req, res) => {
  var keyword = req.query.keyword;
  var sql = "SELECT p_id,p_name,p_price,p_img,p_discount,p_brand,pc_country,pc_icon,p_buypeople FROM product,product_brand WHERE p_brand=pc_id AND p_name LIKE ? ORDER BY p_buypeople DESC"
  pool.query(sql, [`%${keyword}%`], (err, result) => {
    if (err) throw err;
    res.send(result);
  })
})
//查询带关键词的商品(按价格)
router.get("/searchPrice", (req, res) => {
  var keyword = req.query.keyword;
  var priceWay = req.query.priceWay;
  if (priceWay == "down") {
    var sql = "SELECT p_id,p_name,p_price,p_img,p_discount,p_brand,pc_country,pc_icon,p_buypeople FROM product,product_brand WHERE p_brand=pc_id AND p_name LIKE ? ORDER BY p_price ASC"
    pool.query(sql, [`%${keyword}%`], (err, result) => {
      if (err) throw err;
      res.send(result);
    })
    return;
  }else{
    var sql = "SELECT p_id,p_name,p_price,p_img,p_discount,p_brand,pc_country,pc_icon,p_buypeople FROM product,product_brand WHERE p_brand=pc_id AND p_name LIKE ? ORDER BY p_price DESC"
    pool.query(sql, [`%${keyword}%`], (err, result) => {
      if (err) throw err;
      res.send(result);
    })
    return;
  }
})
//导出路由器对象
module.exports = router;