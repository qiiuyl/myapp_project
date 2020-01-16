<template>
  <div id="container">
    <div id="header">
      <mt-header fixed>
        <mt-button slot="left">分类</mt-button>
        <mt-button slot="right" class="btn_img" @click.native="SearchUrl">
          <img src="http://127.0.0.1:8080/type/search.png" />
        </mt-button>
      </mt-header>
      <div id="clear"></div>
    </div>
    <div id="type">
      <div id="bigtype">
        <ul v-if="kingkong.length>0">
          <li v-for="(item,index) of kingkong" :key="index">
            <button @touchstart="selectedName(item.pb_tname)">{{item.pb_tname}}</button>
            <hr v-if="item_name==item.pb_tname"/>
            <!-- <button @touchstart="addhr($event,index)">{{item.pb_tname}}</button>
            <hr :data-id="index" /> -->
          </li>
        </ul>
      </div>
      <div id="smalltype">
        <div id="small_top">
          <ul>
            <li>主要品类</li>
          </ul>
        </div>
        <div id="small_center">
          <ul>
            <li v-for="(item,index) of smalltype" :key="index">
              <img :src="smalltype[index].ps_icon" alt />
              <p>{{smalltype[index].ps_tname}}</p>
            </li>
          </ul>
        </div>
        <div id="small_bottom">
          <div id="bottom_top">
            <ul>
              <li>热门品牌</li>
            </ul>
          </div>
          <div id="bottom_bottom">
            <ul>
              <li v-for="(item,index) of brand" :key="index">
                <img :src="brand[index].pc_img" alt />
                <p>{{brand[index].pc_name}}</p>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  props:["name"],
  data() {
    return {
      kingkong: [],
      smalltype: [],
      brand: [],
      item_name:''
    };
  },
  created() {
    this.getkingkong();
    this.getType();
  },
  methods: {
    getType(){
      let name=this.$route.params.name || this.name
      this.getsmalltype(name);
      this.getbrand(name);
      this.selectedName(name);
    },
    selectedName(itemName){
      var keyword=itemName
      this.item_name=keyword;
      this.getsmalltype(keyword);
      this.getbrand(keyword);
    },
    getkingkong() {
      var url = "/product/kingkong";
      this.axios.get(url).then(res => {
        this.kingkong = this.kingkong.concat(res.data);
      });
    },
    getsmalltype(keyword) {
      var url = "/product/smalltype";
      this.axios.get(url, { params: { name: keyword } }).then(res => {
        this.smalltype = res.data;
      });
    },
    getbrand(keyword) {
      var url = "/product/brand";
      this.axios.get(url, { params: { name: keyword } }).then(res => {
        this.brand = res.data;
      });
    },
    SearchUrl() {
      this.$router.push("../search");
    }
  }
};
</script>
<style scoped>
#header /deep/ .mint-header {
  height: 3rem;
  background-color: rgb(252, 244, 133);
  border-radius: 2px;
  color: #363636;
  font-size: 1.5rem;
}
#header /deep/ .mint-header .mint-button-text {
  font-weight: 800;
}
#clear {
  height: 3rem;
}
#type {
  width: 100%;
  height: 40rem;
  display: flex;
  margin-top: 1rem;
}
#bigtype {
  width: 25%;
  height: 40rem;
}
#bigtype ul {
  width: 100%;
  height: 100%;
  list-style: none;
  padding-left: 0;
  display: flex;
  flex-direction: column;
  align-items: center;
  margin: 0;
}
#bigtype ul li {
  width: 100%;
  height: 5rem;
  padding-left: 1rem;
  box-sizing: border-box;
}
#bigtype ul li button {
  width: 100%;
  box-sizing: border-box;
  background: none;
  border: none;
  outline: none;
  font-size: 12px;
  color: #333;
  font-weight: bolder;
}
#bigtype hr {
  background-color: #ffe971;
  width: 35%;
  height: 0.2rem;
  border: #ffe971;
  border-radius: 2px;
}
#smalltype {
  width: 75%;
  height: 40rem;
}
#smalltype #small_top {
  width: 100%;
  height: 10%;
}
#smalltype #small_top ul {
  width: 100%;
  height: 100%;
  display: flex;
  list-style: none;
  padding: 0;
  margin: 0;
}
#smalltype #small_top ul li,
#smalltype #small_bottom #bottom_top ul li {
  width: 100%;
  height: 100%;
  font-size: 14px;
  font-weight: 600;
  color: #333;
  padding: 0.8rem 0 1rem 0;
  box-sizing: border-box;
}
#smalltype #small_top ul li + li {
  font-size: 12px;
  text-align: right;
  padding-right: 0.5rem;
}
#smalltype #small_center {
  width: 100%;
  height: 50%;
}
#smalltype #small_center ul {
  width: 100%;
  height: 100%;
  display: flex;
  flex-wrap: wrap;
  list-style: none;
  margin: 0;
  padding: 0;
}
#smalltype #small_center ul li,
#smalltype #small_bottom #bottom_bottom ul li {
  box-sizing: border-box;
  width: 50%;
  height: 20%;
  text-align: center;
  font-size: 12px;
  color: #333;
}
#smalltype #small_center ul li p,
#smalltype #small_bottom #bottom_bottom ul li p {
  margin: 0;
  margin-top: 0.5rem;
}
#smalltype #small_center ul li img,
#smalltype #small_bottom #bottom_bottom ul li img {
  width: 50px;
  height: 50px;
}
#smalltype #small_bottom {
  width: 100%;
  height: 40%;
}
#smalltype #small_bottom #bottom_top {
  width: 100%;
  height: 20%;
}
#smalltype #small_bottom #bottom_top ul {
  margin: 0;
  padding: 0;
  list-style: none;
}
#smalltype #small_bottom #bottom_bottom {
  width: 100%;
  height: 80%;
}
#smalltype #small_bottom #bottom_bottom ul {
  width: 100%;
  height: 100%;
  display: flex;
  flex-wrap: wrap;
  list-style: none;
  margin: 0;
  padding: 0;
}
</style>