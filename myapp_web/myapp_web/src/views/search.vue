<template>
  <div class="bgcolor">
    <div id="load">
      <van-loading size="24px" v-if="loading==1">加载中...</van-loading>
    </div>
    <div id="header">
      <ul>
        <li>
          <img src="http://127.0.0.1:8080/search/return.png" @click="indexUrl"/>
        </li>
        <li>
          <input type="text" v-model="keyWord" placeholder="搜索" ref="inputMsg" />
        </li>
        <li @click="change('recommend')">
          <img src="http://127.0.0.1:8080/search/search.png" alt />
        </li>
      </ul>
    </div>
    <div id="nav">
      <ul ref="navUL">
        <li v-for="(item,index) of list" :key="index" @click="change(index)" :ref="index">
          <div v-if="item.label">{{item.label}}</div>
          <div :id="item.btnId || null" v-if="item.img&&item.img.length>0">
            <!-- item.img是为了遍历不到img的时候不会报找不到length的错误 -->
            <button v-for="(iv,i) in item.img" :key="i" @click="index=='prices'?getProMsg(index,i):''">
              <img :src="iv.src" :alt="iv.src" />
            </button>
          </div>
        </li>
      </ul>
    </div>
    <div id="clear"></div>
    <div>
      <productlist :proMsg="searchMsg"></productlist>
    </div>
  </div>
</template>
<script>
import productlist from "../components/product_list.vue";
export default {
  name: "search",
  data() {
    return {
      list: {
        recommend: {
          label: "推荐"
        },
        sales: {
          label: "销量"
        },
        prices: {
          label: "价格",
          btnId: "btn",
          img: [
            { src: "http://127.0.0.1:8080/search/top.png" },
            { src: "http://127.0.0.1:8080/search/bottom.png" }
          ]
        },
        select: {
          label: "筛选",
          img: [{ src: "http://127.0.0.1:8080/search/unselect.png" }]
        },
        type: {
          img: [{ src: "http://127.0.0.1:8080/search/untype.png" }]
        }
      },
      keyWord: "",
      searchMsg: [],
      loading:"0",
    };
  },
  components: {
    productlist
  },
  mounted() {
    this.$refs.inputMsg.focus();
  },
  methods: {
    getProMsg(keyWay, priceWay) {
      //按照默认的推荐方法排列
      var keyword = this.keyWord;
      if (keyword == "") {
        this.$toast("您输入查询内容为空！");
      } else {
        if (keyWay == "recommend") {
          this.loading="1"
          let way = "default";
          var obj = { keyword, way };
          this.axios.get("/product/searchMsg", { params: obj }).then(res => {
            this.searchMsg = res.data;
          }).then(this.loading="0");
        } else if (keyWay == "sales") {
          this.loading="1"
          let way = "sales";
          var obj = { keyword, way };
          this.axios.get("/product/searchMsg", { params: obj }).then(res => {
            this.searchMsg = res.data;
          }).then(this.loading="0");
        } else if (keyWay == "prices") {
          if (priceWay == 0) {
            this.loading="1"
            let way = "up";
            var obj = { keyword, way };
            this.axios.get("/product/searchMsg", { params: obj }).then(res => {
              this.searchMsg = res.data;
            }).then(this.loading="0");
          }else if(priceWay == 1){
            this.loading="1"
            let way = "down";
            var obj = { keyword, way };
            this.axios.get("/product/searchMsg", { params: obj }).then(res => {
              this.searchMsg = res.data;
            }).then(this.loading="0");
          }
        }
      }
    },
    change(index) {
      for (var key in this.list) {
        if (index == key) {
          this.$refs[index][0].style.color = "#666";
          this.$refs[index][0].style.borderBottom = "2px solid #ffe971";
          if (index == "select") {
            this.list["select"]["img"][0]["src"] =
              "http://127.0.0.1:8080/search/select.png";
            this.list["type"]["img"][0]["src"] =
              "http://127.0.0.1:8080/search/untype.png";
            this.$router.push("../type/品质猫粮")
          } else if (index == "type") {
            this.list["type"]["img"][0]["src"] =
              "http://127.0.0.1:8080/search/type.png";
            this.list["select"]["img"][0]["src"] =
              "http://127.0.0.1:8080/search/unselect.png";
            this.getProMsg(index);
          } else {
            this.list["select"]["img"][0]["src"] =
              "http://127.0.0.1:8080/search/unselect.png";
            this.list["type"]["img"][0]["src"] =
              "http://127.0.0.1:8080/search/untype.png";
            this.getProMsg(index);
          }
        } else {
          this.$refs[key][0].style.color = "#bfbfbf";
          this.$refs[key][0].style.borderBottom = "";
        }
      }
    },
    indexUrl(){
      this.$router.push("index")
    }
  }
};
</script>
<style scoped>
.bgcolor {
  background: rgb(238, 238, 224);
}
#header {
  width: 100%;
  height: 3rem;
  background: #ffe971;
  position: fixed;
  z-index: 2;
}
#nav {
  position: fixed;
  top: 3rem;
  z-index: 2;
  background: #fff;
  margin-bottom: 0.8rem;
}
#header ul {
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 0 1rem 0 0.5rem;
  display: flex;
  list-style: none;
  justify-content: space-between;
  align-items: center;
  box-sizing: border-box;
}
#header ul li img {
  width: 30px;
  height: 30px;
}
#header ul li input {
  border: 0;
  outline: 0;
  width: 12rem;
  height: 1.5rem;
  border-radius: 4px;
  margin-left: -2rem;
  font-size: 12px;
  color: #666;
  padding-left: 0.5rem;
}
#clear {
  height: 4rem;
}
#nav {
  width: 100%;
  height: 2rem;
}
#nav ul {
  width: 100%;
  height: 100%;
  display: flex;
  list-style: none;
  justify-content: space-between;
  align-items: center;
  box-sizing: border-box;
  padding: 0.5rem 0 0 0;
  margin: 0;
}
#nav ul li {
  width: 25%;
  height: 100%;
  font-size: 12px;
  color: #bfbfbf;
  font-weight: 600;
  text-align: center;
}
#nav ul li:nth-child(3) {
  display: flex;
  padding-left: 1rem;
}
#nav ul li:nth-child(3) #btn {
  display: flex;
  flex-direction: column;
  height: 100%;
  transform: translateY(-0.5rem);
}
#nav ul li:nth-child(3) #btn img {
  width: 20px;
  height: 20px;
}
#nav ul li:nth-child(4) {
  display: flex;
  padding-left: 1rem;
}
#nav ul li:nth-child(4) img {
  width: 14px;
  height: 14px;
}
#nav ul li:last-child img {
  width: 18px;
  height: 18px;
  transform: translateY(-0.1rem);
}
#nav ul li button {
  height: 50%;
  border: none;
  background: none;
  outline: none;
  padding: 0;
  margin: 0;
}
#load{
  position: fixed;
  top:50%;
  left:50%;
  transform: translate(-56px,-12px);
}
</style>