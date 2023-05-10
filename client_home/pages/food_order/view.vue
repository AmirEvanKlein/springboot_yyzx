<template>
  <view>
    <view class="container diy_view">
      <view>
        <view>
          <view class="">
            <uni-forms :modelValue="form"  v-if="is_view()">

              <uni-forms-item v-if="$check_field('get','order_number') || $check_field('add','order_number') || $check_field('set','order_number')" label="订单号" name="order_number">
                                <uni-easyinput type="text" v-model="form['order_number']" v-if="user_group === '管理员' || (form['food_order_id'] && $check_field('set','order_number')) || (!form['food_order_id'] && $check_field('add','order_number'))"  :disabled="true" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','order_number')">
                  {{ form['order_number'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','food_name') || $check_field('add','food_name') || $check_field('set','food_name')" label="美食名称" name="food_name">
                                <uni-easyinput type="text" v-model="form['food_name']" v-if="user_group === '管理员' || (form['food_order_id'] && $check_field('set','food_name')) || (!form['food_order_id'] && $check_field('add','food_name'))" :disabled="disabledObj['food_name_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','food_name')">
                  {{ form['food_name'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','cover') || $check_field('add','cover') || $check_field('set','cover')" label="封面" name="cover">
                        <!-- 修改权限 -->
                <view class="diy_field diy_img" v-if="form['cover'] && $check_field('set','cover')">
                  <image v-if="disabledObj['cover_isDisabled']" :src="$fullUrl(form['cover'])" />
                  <image v-if="!disabledObj['cover_isDisabled']" :src="$fullUrl(form['cover'])" @click="change_img('cover')" />
                </view>
                <!-- 添加权限 -->
                <view class="diy_field diy_img" v-else-if="!form['cover'] && $check_field('add','cover')">
                  <view v-if="disabledObj['cover_isDisabled']" class="btn_add_img">
                    <text>+</text>
                  </view>
                  <view v-if="!disabledObj['cover_isDisabled']" class="btn_add_img" @click="change_img('cover')">
                    <text>+</text>
                  </view>
                </view>
                <!-- 查询权限 -->
                <view class="diy_field diy_img" v-else-if="$check_field('get','cover')">
                  <image :src="$fullUrl(form['cover'])" />
                </view>
                    </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','food_unit_price') || $check_field('add','food_unit_price') || $check_field('set','food_unit_price')" label="美食单价" name="food_unit_price">
                                <uni-easyinput type="text" v-model="form['food_unit_price']" v-if="user_group === '管理员' || (form['food_order_id'] && $check_field('set','food_unit_price')) || (!form['food_order_id'] && $check_field('add','food_unit_price'))" :disabled="disabledObj['food_unit_price_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','food_unit_price')">
                  {{ form['food_unit_price'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','flavor') || $check_field('add','flavor') || $check_field('set','flavor')" label="口味" name="flavor">
                                <uni-easyinput type="text" v-model="form['flavor']" v-if="user_group === '管理员' || (form['food_order_id'] && $check_field('set','flavor')) || (!form['food_order_id'] && $check_field('add','flavor'))" :disabled="disabledObj['flavor_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','flavor')">
                  {{ form['flavor'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','food_materials') || $check_field('add','food_materials') || $check_field('set','food_materials')" label="美食材料" name="food_materials">
                                <uni-easyinput type="text" v-model="form['food_materials']" v-if="user_group === '管理员' || (form['food_order_id'] && $check_field('set','food_materials')) || (!form['food_order_id'] && $check_field('add','food_materials'))" :disabled="disabledObj['food_materials_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','food_materials')">
                  {{ form['food_materials'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','order_date') || $check_field('add','order_date') || $check_field('set','order_date')" label="下单日期" name="order_date">
                        <uni-datetime-picker v-if="user_group === '管理员' || (form['food_order_id'] && $check_field('set','order_date')) || (!form['food_order_id'] && $check_field('add','order_date'))" v-model="form['order_date']" type="date" :disabled="disabledObj['order_date_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','order_date')">
                  {{ form['order_date'] }}
                </text>
                    </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','ordinary_users') || $check_field('add','ordinary_users') || $check_field('set','ordinary_users')" label="普通用户" name="ordinary_users">
                        <uni-data-select
                  id="form_ordinary_users"
                  v-model="form['ordinary_users']"
                  :localdata="list_user_ordinary_users"
                  :clear="!disabledObj['ordinary_users_isDisabled']"
                  :disabled="disabledObj['ordinary_users_isDisabled']"
                  v-if="user_group === '管理员' || (form['food_order_id'] && $check_field('set','ordinary_users')) || (!form['food_order_id'] && $check_field('add','ordinary_users'))"
                ></uni-data-select>
                <uni-data-select
                  v-model="form['ordinary_users']"
                  :localdata="list_user_ordinary_users"
                  :clear="false"
                  :disabled="true"
                  v-else-if="$check_field('get','ordinary_users')" id="ordinary_users"
                ></uni-data-select>
                    </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','purchase_quantity') || $check_field('add','purchase_quantity') || $check_field('set','purchase_quantity')" label="购买数量" name="purchase_quantity">
                                <uni-easyinput type="text" v-model="form['purchase_quantity']" v-if="user_group === '管理员' || (form['food_order_id'] && $check_field('set','purchase_quantity')) || (!form['food_order_id'] && $check_field('add','purchase_quantity'))" :disabled="disabledObj['purchase_quantity_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','purchase_quantity')">
                  {{ form['purchase_quantity'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','payment_amount') || $check_field('add','payment_amount') || $check_field('set','payment_amount')" label="支付金额" name="payment_amount">
                                <uni-easyinput type="text" v-model="form['payment_amount']" v-if="user_group === '管理员' || (form['food_order_id'] && $check_field('set','payment_amount')) || (!form['food_order_id'] && $check_field('add','payment_amount'))"  @focus="set_payment_amount()" :disabled="disabledObj['payment_amount_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','payment_amount')">
                  {{ form['payment_amount'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item label="审核状态" name="examine_state">
                <uni-data-select
                    v-model="form['examine_state']"
                    :localdata="list_examine_state"
                    v-if="user_group === '管理员' || (form['examine_state'] && $check_examine()) || (!form['examine_state'] && $check_examine())"
                ></uni-data-select>
                <text v-else>{{form["examine_state"]}}</text>
              </uni-forms-item>
              <uni-forms-item label="审核回复" name="examine_reply">
                <uni-easyinput type="text" placeholder="请输入审核回复" v-model="form['examine_reply']"
                               v-if="user_group === '管理员' || (form['examine_reply'] && $check_examine()) || (!form['examine_reply'] && $check_examine())" />
                <!-- 仅查看 -->
                <text v-else>{{form["examine_reply"]}}</text>
              </uni-forms-item>


            </uni-forms>
            <view class="form_button">
              <button size="mini" type="primary" @click="submit()" class="primary_btn">提交</button>
              <button size="mini" @click="cancel()">取消</button>
            </view>
          </view>
        </view>
      </view>
    </view>
  </view>
</template>

<script>
import mixin from "@/libs/mixins/page.js";

export default {
  mixins: [mixin],
  data() {
    return {
      field: "food_order_id",
      url_add: "~/api/food_order/add?",
      url_set: "~/api/food_order/set?",
      url_get_obj: "~/api/food_order/get_obj?",
      url_upload: "~/api/food_order/upload?",

      query: {
        "food_order_id": 0,
      },

      form: {
            "order_number": this.$get_stamp(), // 订单号
                    "food_name":  '', // 美食名称
                    "cover":  '', // 封面
                    "food_unit_price":  0 , // 美食单价
                    "flavor":  '', // 口味
                    "food_materials":  '', // 美食材料
                    "order_date": this.$toTime(new Date().getTime(), "yyyy-MM-dd"),
                    "ordinary_users": 0, // 普通用户
                    "purchase_quantity":  0 , // 购买数量
                    "payment_amount":  '', // 支付金额
                        "examine_state": "未审核",
                    "examine_reply": "",
                    "food_order_id": 0, // ID
                
              },
          disabledObj:{
                        "order_number_isDisabled": false,
                                "food_name_isDisabled": false,
                                "cover_isDisabled": false,
                                                    "flavor_isDisabled": false,
                                "food_materials_isDisabled": false,
                                "order_date_isDisabled": false,
                                "ordinary_users_isDisabled": false,
                                                    "payment_amount_isDisabled": false,
                                  },
                                                                                                                                                                            // 用户列表
            list_user_ordinary_users: [],
                        // 用户组
            group_user_ordinary_users: "",
                                                                              list_examine_state:[{value:"未审核",text:"未审核"},{value:"已通过",text:"已通过"},{value:"未通过",text:"未通过"}],
              }
  },
  methods: {
    changeLog(v,value){
      this.form[value] = v
    },
    /**
     * 上传文件
     * @param {Object} param文件参数
     */
    change_file(key_name){
      var _self = this;
      // 选择图像方法
      uni.chooseFile({
        count: 1,
        sizeType: ['original', 'compressed'], //可以指定是原图还是压缩图，默认二者都有
        sourceType: ['album'], //从相册选择
        success: function(res) {
          const tempFilePaths = res.tempFilePaths;
          const uploadTask = uni.uploadFile({
            url: _self.$fullUrl('/api/food_order/upload?'),
            filePath: tempFilePaths[0],
            name: 'file',
            formData: {
              'i_want_to_customize': 'test'
            },
            header: {
              'x-auth-token': _self.$store.state.user.token
            },
            success: function(uploadFileRes) {
              var filename = JSON.parse(uploadFileRes.data).result.url
              _self.form[key_name] = filename
            }
          });

          uploadTask.onProgressUpdate(function(res) {
            _self.percent = res.progress;
            console.log('上传进度' + res.progress);
            console.log('已经上传的数据长度' + res.totalBytesSent);
            console.log('预期需要上传的数据总长度' + res.totalBytesExpectedToSend);
          });
        },
        error: function(e) {
          console.log(e);
        }
      });
    },
    /**
     * 上传图片
     * @param {Object} param文件参数
     */
    change_img(key_name){
      var _self = this;
      _self.upload_img_flag = false
      // 选择图像方法
      uni.chooseImage({
        count: 1,
        sizeType: ['original', 'compressed'], //可以指定是原图还是压缩图，默认二者都有
        sourceType: ['album'], //从相册选择
        success: function(res) {
          const tempFilePaths = res.tempFilePaths;
          const uploadTask = uni.uploadFile({
            url: _self.$fullUrl('/api/food_order/upload?'),
            filePath: tempFilePaths[0],
            name: 'file',
            formData: {
              'i_want_to_customize': 'test'
            },
            header: {
              'x-auth-token': _self.$store.state.user.token
            },
            success: function(uploadFileRes) {
              var filename = JSON.parse(uploadFileRes.data).result.url
              _self.form[key_name] = filename
            }
          });

          uploadTask.onProgressUpdate(function(res) {
            _self.percent = res.progress;
            console.log('上传进度' + res.progress);
            console.log('已经上传的数据长度' + res.totalBytesSent);
            console.log('预期需要上传的数据总长度' + res.totalBytesExpectedToSend);
          });
        },
        error: function(e) {
          console.log(e);
        }
      });
    },
    /**
     * 获取对象后获取缓存表单
     * @param {Object} json
     * @param {Object} func
     */
    get_obj_before(param){
      var form = uni.db.get("form");
      if (form) {
        delete(form.examine_state)
        delete(form.examine_reply)
        this.obj = uni.push(this.obj ,form);
        this.form = uni.push(this.form ,form);
      }
      var arr = []
      for (let key in form) {
        arr.push(key)
      }
      for (var i=0;i<arr.length;i++){
        this.disabledObj[arr[i] + '_isDisabled'] = true
      }
                                                              if (this.form["order_date"] && JSON.stringify(this.form["order_date"]).indexOf("-")===-1) {
        this.form["order_date"] = this.$toTime(parseInt(this.form["order_date"]), "yyyy-MM-dd")
      }
                                  uni.db.del("form");
      return param;
    },
        
            
            
            
            
            
            
                /**
     * 获取普通用户用户列表
     */
    async get_list_user_ordinary_users() {
      // if(this.user_group !== "管理员" && this.form["ordinary_users"] === 0) {
      //     this.form["ordinary_users"] = this.user.user_id;
      // }
      var json = await this.$get("~/api/user/get_list?user_group=普通用户");
      if(json.result && json.result.list){
        json.result.list.map((o) => this.list_user_ordinary_users.push({value:o.user_id,text:o.nickname + '-' + o.username}));
      }
      else if(json.error){
        console.error(json.error);
      }
    },
            /**
     * 获取普通用户用户组
     */
    async get_group_user_ordinary_users() {
      this.form["ordinary_users"] = this.user.user_id;
      var json = await this.$get("~/api/user_group/get_obj?name=普通用户");
      if(json.result && json.result.obj){
        this.group_user_ordinary_users = json.result.obj;
        this.get_user_session_ordinary_users(this.form['ordinary_users'])
      }
      else if(json.error){
        console.error(json.error);
      }
    },
    get_user_session_ordinary_users(id){
      var _this = this;
      var user_id = {"user_id":id}
      var url = "~/api/"+_this.group_user_ordinary_users.source_table+"/get_obj?"
      this.$get(url, user_id, function(res) {
        if (res.result && res.result.obj) {
          var arr = []
          for (let key in res.result.obj) {
            arr.push(key)
          }
          var arrForm = []
          for (let key in _this.form) {
            arrForm.push(key)
          }
          for (var i=0;i<arr.length;i++){
            if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
              for (var j = 0; j < arrForm.length; j++) {
                if (arr[i] === arrForm[j]) {
                  if (arr[i] !== "ordinary_users") {
                    _this.form[arrForm[j]] = res.result.obj[arr[i]]
                    _this.disabledObj[arrForm[j] + '_isDisabled'] = true
                    break;
                  } else {
                    _this.disabledObj[arrForm[j] + '_isDisabled'] = true
                  }
                }
              }
            }
          }
        }
      });
    },
            
            
            
                            set_payment_amount(){
      this.form.payment_amount = parseFloat(this.form.purchase_quantity) * parseFloat(this.form.food_unit_price)
      let r = /^\+?[1-9][0-9]*$/; // 正整数
      if(!r.test(this.form.payment_amount) ){
        this.form.payment_amount = this.form.payment_amount.toFixed(2);
      }
    },
                        
    /**
     * 获取对象之后
     * @param {Object} json
     * @param {Object} func
     */
    get_obj_after(json, func){
                                                              if (this.form["order_date"] && JSON.stringify(this.form["order_date"]).indexOf("-")===-1) {
        this.form["order_date"] = this.$toTime(parseInt(this.form["order_date"]),"yyyy-MM-dd")
      }
                                },

    is_view(){
      var bl = this.user_group == "管理员";

      if(!bl){
        bl = this.$check_action('/food_order/table','add');
        console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
      }
      if(!bl){
        bl = this.$check_action('/food_order/table','set');
        console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
      }
      if(!bl){
        bl = this.$check_action('/food_order/view','add');
        console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
      }
      if(!bl){
        bl = this.$check_action('/food_order/view','set');
        console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
      }
      if(!bl){
        bl = this.$check_action('/food_order/view','get');
        console.log(bl ? "你有视图查询权限视作有查询权限" : "你没有视图查询权限");
      }

      console.log(bl ? "具有当前页面的查看权，请注意这不代表你有字段的查看权" : "无权查看当前页，请注意即便有字段查询权限没有页面查询权限也不行");

      return bl;
    },

  },
  created() {
                                                                    this.get_list_user_ordinary_users();
            this.get_group_user_ordinary_users();
                              },
}
</script>

<style scoped>
.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}

.avatar-uploader .el-upload:hover {
  border-color: #409EFF;
}

.form_button{
  padding-bottom: 15px;
  display: flex;
}
.form_button button{
  width: 40%;
}
.query_select{
  border-color: rgb(229, 229, 229);
  background-color: rgb(255, 255, 255);
  border-radius: 4px;
  box-sizing: border-box;
  flex: 1;
  width: 100%;
  line-height: 2;
  font-size: 14px;
  height: 2.4em;
  min-height: 2.4em;
  display: block;
  outline:none;
}

.query_option{
  width: 100%;
}

.btn_add_img{
  color: #D3D3D3;
  text-align: center;
  border: 1px solid #eee;
  height: 5rem;
  width: 5rem;
  position: relative;
}
.btn_add_img text{
  font-size: 35px;
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%,-50%);
}
.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}

.avatar-uploader .el-upload:hover {
  border-color: #409eff;
}

.form_button {
  padding-bottom: 15px;
  display: flex;
}
.form_button button {
  width: 40%;
}
.query_select {
  border-color: rgb(229, 229, 229);
  background-color: rgb(255, 255, 255);
  border-radius: 4px;
  box-sizing: border-box;
  flex: 1;
  width: 100%;
  line-height: 2;
  font-size: 14px;
  height: 2.4em;
  min-height: 2.4em;
  display: block;
  outline: none;
}

.query_option {
  width: 100%;
}

.btn_add_img {
  color: #d3d3d3;
  text-align: center;
  border: 1px solid #eee;
  height: 5rem;
  width: 5rem;
  position: relative;
}
.btn_add_img text {
  font-size: 35px;
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
}
/*新样式*/
.uni-forms{
padding-top:1rem;
}
.uni-forms-item {
	padding: 6px 10px;
    background: #f8f6fc;
}
.uni-forms .is-input-border{
	border: 0;
}
.container{
	    -webkit-box-shadow: 0px 0px 0px #888888;
	    box-shadow: 0px 0px 0px #888888;
}
.form_button .primary_btn{
		background-color: #22B8B8;
		color: #FFFFFF;
	}
</style>
