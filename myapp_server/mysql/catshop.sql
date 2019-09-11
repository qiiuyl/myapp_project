SET NAMES UTF8;
DROP DATABASE IF EXISTS catshop;
CREATE DATABASE catshop CHARSET=UTF8;
USE catshop;


/**商城产品大分类**/
CREATE TABLE product_bigtype(
  pb_tid INT PRIMARY KEY AUTO_INCREMENT ,
  pb_tname VARCHAR(32),
  icon VARCHAR(128)
);

/**商城产品小分类**/
CREATE TABLE product_smalltype(
  ps_tid INT PRIMARY KEY AUTO_INCREMENT ,
  ps_tname VARCHAR(32) ,
  ps_icon VARCHAR(128),
  pb_id  INT ,
  FOREIGN KEY(pb_id) REFERENCES product_bigtype(pb_tid)
);

/**商品状态表**/
CREATE TABLE product_status(
  s_id INT PRIMARY KEY AUTO_INCREMENT ,  #状态编码
  s_name VARCHAR(10),                    #状态名称
  s_decribe VARCHAR(20) NULL                #状态描述
);

/**商品品牌表**/
CREATE TABLE product_brand(
  pc_id  INT PRIMARY KEY AUTO_INCREMENT ,  #品牌编号
  pc_name VARCHAR(50),    #品牌名称
  pc_img   VARCHAR(128),   #品牌的商标  
  pc_country VARCHAR(20),   #品牌所属国家名称
  pc_icon VARCHAR(125),    #所在国家的国旗图标
  pbpc_tid  INT,
  FOREIGN KEY(pbpc_tid) REFERENCES product_bigtype(pb_tid)
);


/**商城产品**/
CREATE TABLE product(
  p_id INT PRIMARY KEY AUTO_INCREMENT ,  #产品编号
  p_name VARCHAR(100) ,                  #产品名称
  p_secondname VARCHAR(100),             #产品临时说明，用于好物说
  p_price DECIMAL(10,2) ,		            #产品价格
  p_pastprice DECIMAL(10,2),            #商品旧价格，用于好物说
  p_img  VARCHAR(128) ,		              #产品图片
  st_id INT ,                            #商品所属小类别st_id
  p_status INT ,                         #商品的状态id(属于促销还是别的状态)
  p_brand INT ,                #商品所属的品牌编号
  FOREIGN KEY(p_status) REFERENCES product_status(s_id)
);
alter table product add foreign key(st_id) references product_smalltype(ps_tid);
alter table product add foreign key(p_brand) references product_brand(pc_id);

/**商品详情**/
CREATE TABLE product_detail(
  pd_id INT PRIMARY KEY AUTO_INCREMENT,  #详情编号
  p_id INT,                              #产品编号
  pd_title VARCHAR(128),                 #副标题
  pd_promise VARCHAR(64),                #服务承诺
  pd_spec VARCHAR(64),                   #规格
  pd_shelf_time BIGINT,                  #商品批次
  pd_address VARCHAR(128),               #产品送至地址
  p_smimg VARCHAR(128),              #小图片路径
  FOREIGN KEY(p_id) REFERENCES product(p_id)
);


/**用户信息**/
CREATE TABLE user(
  uid INT PRIMARY KEY AUTO_INCREMENT,  #用户的编号
  uname VARCHAR(32),          #用户名
  upwd VARCHAR(32),	          #用户密码
  phone VARCHAR(16),          #用户号码
  score INT,                  #用户积分
  avatar VARCHAR(128),        #头像图片路径
  user_name VARCHAR(32),      #用户真实姓名，如王小明
  gender INT                  #性别  0-女  1-男
);

/**收货地址信息**/
CREATE TABLE receiver_address(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,                #用户编号
  receiver VARCHAR(16),       #接收人姓名
  province VARCHAR(16),       #省
  city VARCHAR(16),           #市
  county VARCHAR(16),         #县
  address VARCHAR(128),       #详细地址
  cellphone VARCHAR(16),      #手机
  fixedphone VARCHAR(16),     #固定电话
  postcode CHAR(6),           #邮编
  tag VARCHAR(16),            #标签名
  is_default BOOLEAN,         #是否为当前用户的默认收货地址
  FOREIGN KEY(user_id) REFERENCES user(uid)
);

/**购物车条目**/
CREATE TABLE shoppingcart_item(
  iid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,      #用户编号
  product_id INT,   #商品编号
  count INT,        #购买数量
  is_checked BOOLEAN, #是否已勾选，确定购买
  FOREIGN KEY(user_id) REFERENCES user(uid)
);
alter table shoppingcart_item add foreign key(product_id) references product(p_id);

/**用户收藏列表**/
CREATE TABLE user_collect(
  uc_id INT PRIMARY KEY AUTO_INCREMENT,  #收藏列表id
  user_id INT,      #用户编号
  product_id INT,    #商品编号
  FOREIGN KEY(user_id) REFERENCES user(uid)
);
alter table user_collect add foreign key(product_id) references product(p_id);
/**用户浏览的点击商品列表**/
CREATE TABLE user_through(
  ut_id INT PRIMARY KEY AUTO_INCREMENT,  #浏览列表id
  user_id INT,      #用户编号
  product_id INT,    #商品编号
  FOREIGN KEY(user_id) REFERENCES user(uid)
);
alter table user_through add foreign key(product_id) references product(p_id);

/**用户订单**/
CREATE TABLE user_order(
  o_id INT PRIMARY KEY AUTO_INCREMENT,
  address_id INT,
  order_status INT,             #订单状态  1-等待付款  2-等待发货  3-运输中  4-已签收  5-已取消
  order_time BIGINT,      #下单时间
  pay_time BIGINT,        #付款时间
  deliver_time BIGINT,    #发货时间
  received_time BIGINT,    #签收时间
  FOREIGN KEY(address_id) REFERENCES receiver_address(aid)
);

/**用户订单**/
CREATE TABLE order_detail(
  did INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT,           #订单编号
  product_id INT,         #产品编号
  count INT,              #购买数量
  FOREIGN KEY(order_id) REFERENCES user_order(o_id)
);
alter table order_detail add foreign key(product_id) references product(p_id);

/****首页轮播广告商品****/
CREATE TABLE index_carousel(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),
  title VARCHAR(64)
);

/****数据导入****/
INSERT INTO user VALUES
(NULL, 'dingding', '123456', '13501234567','4100','img/avatar/default.png', '丁伟', '1'),
(NULL, 'dangdang', '123456', '13501234568','1200','img/avatar/default.png', '林当', '0');
INSERT INTO index_carousel VALUES
(NULL, 'http://127.0.0.1:8080/index/c1.png','轮播广告商品1'),
(NULL, 'http://127.0.0.1:8080/index/c2.png','轮播广告商品2'),
(NULL, 'http://127.0.0.1:8080/index/c3.png','轮播广告商品3');
INSERT INTO product_bigtype VALUES
(10,"品质猫粮","http://127.0.0.1:8080/index/kingkong_01.png"),
(20,"优选罐头","http://127.0.0.1:8080/index/kingkong_02.png"),
(30,"厕所猫砂","http://127.0.0.1:8080/index/kingkong_03.png"),
(40,"清洁护理","http://127.0.0.1:8080/index/kingkong_04.png"),
(50,"玩具服饰","http://127.0.0.1:8080/index/kingkong_05.png"),
(60,"猫窝爬架","http://127.0.0.1:8080/index/kingkong_06.png"),
(70,"日常用品","http://127.0.0.1:8080/index/kingkong_07.png"),
(80,"医疗保健","http://127.0.0.1:8080/index/kingkong_08.png");
INSERT INTO product_status VALUES
(101,"品质限时购","23:59:59"),
(102,"免费试吃","小样免费申领"),
(103,"临期特惠","褥羊毛在这里"),
(104,"好物说",NULL),
(105,"猜你喜欢",NULL);
INSERT INTO product_smalltype VALUES
(101,"进口猫粮","http://127.0.0.1:8080/type/type_01.png",10),
(NULL,"国产猫粮","http://127.0.0.1:8080/type/type_01.png",10),
(NULL,"幼猫猫粮","http://127.0.0.1:8080/type/type_01.png",10),
(NULL,"成猫猫粮","http://127.0.0.1:8080/type/type_01.png",10),
(NULL,"全猫粮","http://127.0.0.1:8080/type/type_01.png",10),
(NULL,"冻干粮","http://127.0.0.1:8080/type/type_01.png",10),
(NULL,"金枪鱼","http://127.0.0.1:8080/type/type_01.png",20),
(NULL,"金枪鱼+鸡肉","http://127.0.0.1:8080/type/type_01.png",20),
(NULL,"金枪鱼+明虾","http://127.0.0.1:8080/type/type_01.png",20),
(NULL,"猫砂盆/猫厕所","http://127.0.0.1:8080/type/type_01.png",30),
(NULL,"床/垫/沙发","http://127.0.0.1:8080/type/type_01.png",30),
(NULL,"训练器","http://127.0.0.1:8080/type/type_01.png",30),
(NULL,"拾便器","http://127.0.0.1:8080/type/type_01.png",30),
(NULL,"耳部清洁","http://127.0.0.1:8080/type/type_01.png",40),
(NULL,"眼部清洁","http://127.0.0.1:8080/type/type_01.png",40),
(NULL,"口腔清洁","http://127.0.0.1:8080/type/type_01.png",40),
(NULL,"背心","http://127.0.0.1:8080/type/type_01.png",50),
(NULL,"连衣裙","http://127.0.0.1:8080/type/type_01.png",50),
(NULL,"棉衣","http://127.0.0.1:8080/type/type_01.png",50),
(NULL,"四脚衣","http://127.0.0.1:8080/type/type_01.png",50),
(NULL,"半身裙","http://127.0.0.1:8080/type/type_01.png",50),
(NULL,"猫抓板","http://127.0.0.1:8080/type/type_01.png",50),
(NULL,"绒面","http://127.0.0.1:8080/type/type_01.png",60),
(NULL,"人造短毛绒","http://127.0.0.1:8080/type/type_01.png",60),
(NULL,"纯棉","http://127.0.0.1:8080/type/type_01.png",60),
(NULL,"滕竹","http://127.0.0.1:8080/type/type_01.png",60),
(NULL,"逗猫棒","http://127.0.0.1:8080/type/type_01.png",70),
(NULL,"碗/勺/杯","http://127.0.0.1:8080/type/type_01.png",70),
(NULL,"猫爬架","http://127.0.0.1:8080/type/type_01.png",70),
(NULL,"驱虫药","http://127.0.0.1:8080/type/type_01.png",80);
INSERT INTO product_brand VALUES
(10,"美滋元","http://127.0.0.1:8080/brand/brand01.png","美国","http://127.0.0.1:8080/country/mg.png",10),
(NULL,"凯锐思","http://127.0.0.1:8080/brand/brand01.png","中国","http://127.0.0.1:8080/country/zg.png",10),
(NULL,"亿迪","http://127.0.0.1:8080/brand/brand01.png","中国","http://127.0.0.1:8080/country/zg.png",10),
(NULL,"麦富迪","http://127.0.0.1:8080/brand/brand02.png","日本","http://127.0.0.1:8080/country/rb.png",20),
(NULL,"希宝","http://127.0.0.1:8080/brand/brand01.png","泰国","http://127.0.0.1:8080/country/tg.png",20),
(NULL,"猫森林","http://127.0.0.1:8080/brand/brand02.png","中国","http://127.0.0.1:8080/country/zg.png",30),
(NULL,"耐威克","http://127.0.0.1:8080/brand/brand01.png","中国","http://127.0.0.1:8080/country/zg.png",30),
(NULL,"西西猫","http://127.0.0.1:8080/brand/brand02.png","美国","http://127.0.0.1:8080/country/mg.png",30),
(NULL,"逸诺","http://127.0.0.1:8080/brand/brand01.png","马来西亚","http://127.0.0.1:8080/country/mlxy.png",40),
(NULL,"Petio","http://127.0.0.1:8080/brand/brand02.png","韩国","http://127.0.0.1:8080/country/hg.png",50),
(NULL,"贵为","http://127.0.0.1:8080/brand/brand01.png","中国","http://127.0.0.1:8080/country/zg.png",50),
(NULL,"ZEZE","http://127.0.0.1:8080/brand/brand02.png","美国","http://127.0.0.1:8080/country/mg.png",60),
(NULL,"NINNIE","http://127.0.0.1:8080/brand/brand02.png","英国","http://127.0.0.1:8080/country/yg.png",60),
(NULL,"TOM CAT","http://127.0.0.1:8080/brand/brand02.png","西班牙","http://127.0.0.1:8080/country/xby.png",70),
(NULL,"Hoopet/华元宠具","http://127.0.0.1:8080/brand/brand01.png","中国","http://127.0.0.1:8080/country/zg.png",70),
(NULL,"LIADE","http://127.0.0.1:8080/brand/brand01.png","美国","http://127.0.0.1:8080/country/mg.png",80);

INSERT INTO product VALUES
(1,"蜜蜂款猫窝","可可爱爱想睡觉","9.9","19.9","http://127.0.0.1:8080/index/pro_01.png",124,104,21),
(NULL,"西西猫猫粮","可可爱爱想睡觉","45.9","45.9","http://127.0.0.1:8080/index/activity_01.png",101,101,10),
(NULL,"奶油味猫粮","可可爱爱想睡觉","66","66","http://127.0.0.1:8080/index/activity_02.png",101,102,10),
(NULL,"泰国原装金枪鱼罐头","可可爱爱想睡觉","120.0","120.0","http://127.0.0.1:8080/index/activity_03.png",107,103,14),
(NULL,"香薰味猫砂","可可爱爱想睡觉","64.5","64.5","http://127.0.0.1:8080/index/pro_01.png",110,NULL,15),
(NULL,"猫猫掏耳朵神器","可可爱爱想睡觉","26","26","http://127.0.0.1:8080/index/pro_01.png",104,NULL,18),
(NULL,"可爱猫猫小背心","可可爱爱想睡觉","77","77","http://127.0.0.1:8080/index/pro_01.png",117,NULL,19),
(NULL,"猫猫可爱爬架","可可爱爱想睡觉","64.22","64.22","http://127.0.0.1:8080/index/pro_01.png",126,NULL,21),
(NULL,"有趣逗猫棒","可可爱爱想睡觉","71","71","http://127.0.0.1:8080/index/pro_01.png",127,NULL,23),
(NULL,"猫猫强力驱虫药","可可爱爱想睡觉","35.6","35.6","http://127.0.0.1:8080/index/pro_01.png",130,NULL,25),
(NULL,"蜜蜂款猫窝","可可爱爱想睡觉","9.9","19.9","http://127.0.0.1:8080/index/pro_01.png",124,104,21),
(NULL,"蜜蜂款猫窝","可可爱爱想睡觉","9.9","19.9","http://127.0.0.1:8080/index/pro_01.png",124,104,21),
(NULL,"蜜蜂款猫窝","可可爱爱想睡觉","9.9","19.9","http://127.0.0.1:8080/index/pro_01.png",124,104,21),
(NULL,"【Royal Canin】幼猫粮 2kg",NULL,"128","128","http://127.0.0.1:8080/index/like_01.png",101,105,10),
(NULL,"【Royal Canin】幼猫粮 2kg",NULL,"128","128","http://127.0.0.1:8080/index/like_01.png",101,105,10),
(NULL,"【Royal Canin】幼猫粮 2kg",NULL,"128","128","http://127.0.0.1:8080/index/like_01.png",101,105,10),
(NULL,"【Royal Canin】幼猫粮 2kg",NULL,"128","128","http://127.0.0.1:8080/index/like_01.png",101,105,10),
(NULL,"【Royal Canin】幼猫粮 2kg",NULL,"128","128","http://127.0.0.1:8080/index/like_01.png",101,105,10);