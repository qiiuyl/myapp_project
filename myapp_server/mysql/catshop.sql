SET NAMES UTF8;
DROP DATABASE IF EXISTS catshop;
CREATE DATABASE catshop CHARSET=UTF8;
USE catshop;


/**商城产品大分类**/
CREATE TABLE product_bigtype(
  pb_tid INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  pb_tname VARCHAR(32) NOT NULL
);

/**商城产品小分类**/
CREATE TABLE product_smalltype(
  ps_tid INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  ps_tname VARCHAR(32) NOT NULL,
  pb_id  INT NULL,
  FOREIGN KEY(pb_id) REFERENCES product_bigtype(pb_tid)
);

/**商品状态表**/
CREATE TABLE product_status(
  s_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,  #状态编码
  s_name VARCHAR(10) NOT NULL                    #状态名称
);

/**商品品牌表**/
CREATE TABLE product_brand(
  pc_id  INT PRIMARY KEY AUTO_INCREMENT NOT NULL,  #品牌编号
  pc_country VARCHAR(20)  NOT NULL, #品牌所属国家名称
  pc_icon VARCHAR(125)  NOT NULL  #所在国家的国旗图标
);

/**商城产品**/
CREATE TABLE product(
  p_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,  #产品编号
  p_name VARCHAR(100) NOT NULL,                  #产品名称
  p_price DECIMAL(10,2) NOT NULL,		            #产品价格
  p_img  VARCHAR(128) NOT NULL,		              #产品图片
  st_id INT NOT NULL,                            #商品所属小类别st_id
  p_status INT NULL,                         #商品的状态id(属于促销还是别的状态)
  p_brand INT NOT NULL,                #商品所属的品牌编号
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
  title VARCHAR(64),
  href VARCHAR(128)
);


/****数据导入****/
INSERT INTO user VALUES
(NULL, 'dingding', '123456', '13501234567','4100','img/avatar/default.png', '丁伟', '1'),
(NULL, 'dangdang', '123456', '13501234568','1200','img/avatar/default.png', '林当', '0');