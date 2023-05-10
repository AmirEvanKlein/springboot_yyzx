<template>
  <view>
    <view class="container diy_view">
      <view>
        <view>
          <view class="">
            <uni-forms :modelValue="form"  v-if="is_view()">

              <uni-forms-item v-if="$check_field('get','appointment_no') || $check_field('add','appointment_no') || $check_field('set','appointment_no')" label="预约号" name="appointment_no">
                                <uni-easyinput type="text" v-model="form['appointment_no']" v-if="user_group === '管理员' || (form['venue_reservation_id'] && $check_field('set','appointment_no')) || (!form['venue_reservation_id'] && $check_field('add','appointment_no'))"  :disabled="true" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','appointment_no')">
                  {{ form['appointment_no'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','no_of_swimming_pool') || $check_field('add','no_of_swimming_pool') || $check_field('set','no_of_swimming_pool')" label="泳馆编号" name="no_of_swimming_pool">
                                <uni-easyinput type="text" v-model="form['no_of_swimming_pool']" v-if="user_group === '管理员' || (form['venue_reservation_id'] && $check_field('set','no_of_swimming_pool')) || (!form['venue_reservation_id'] && $check_field('add','no_of_swimming_pool'))" :disabled="disabledObj['no_of_swimming_pool_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','no_of_swimming_pool')">
                  {{ form['no_of_swimming_pool'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','name_of_swimming_pool') || $check_field('add','name_of_swimming_pool') || $check_field('set','name_of_swimming_pool')" label="泳馆名称" name="name_of_swimming_pool">
                                <uni-easyinput type="text" v-model="form['name_of_swimming_pool']" v-if="user_group === '管理员' || (form['venue_reservation_id'] && $check_field('set','name_of_swimming_pool')) || (!form['venue_reservation_id'] && $check_field('add','name_of_swimming_pool'))" :disabled="disabledObj['name_of_swimming_pool_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','name_of_swimming_pool')">
                  {{ form['name_of_swimming_pool'] }}
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
              <uni-forms-item v-if="$check_field('get','location_of_swimming_pool') || $check_field('add','location_of_swimming_pool') || $check_field('set','location_of_swimming_pool')" label="泳馆位置" name="location_of_swimming_pool">
                                <uni-easyinput type="text" v-model="form['location_of_swimming_pool']" v-if="user_group === '管理员' || (form['venue_reservation_id'] && $check_field('set','location_of_swimming_pool')) || (!form['venue_reservation_id'] && $check_field('add','location_of_swimming_pool'))" :disabled="disabledObj['location_of_swimming_pool_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','location_of_swimming_pool')">
                  {{ form['location_of_swimming_pool'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','order_date') || $check_field('add','order_date') || $check_field('set','order_date')" label="下单日期" name="order_date">
                        <uni-datetime-picker v-if="user_group === '管理员' || (form['venue_reservation_id'] && $check_field('set','order_date')) || (!form['venue_reservation_id'] && $check_field('add','order_date'))" v-model="form['order_date']" type="date" :disabled="disabledObj['order_date_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','order_date')">
                  {{ form['order_date'] }}
                </text>
                    </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','reservation_unit_price') || $check_field('add','reservation_unit_price') || $check_field('set','reservation_unit_price')" label="预约单价" name="reservation_unit_price">
                                <uni-easyinput type="text" v-model="form['reservation_unit_price']" v-if="user_group === '管理员' || (form['venue_reservation_id'] && $check_field('set','reservation_unit_price')) || (!form['venue_reservation_id'] && $check_field('add','reservation_unit_price'))" :disabled="disabledObj['reservation_unit_price_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','reservation_unit_price')">
                  {{ form['reservation_unit_price'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','ordinary_users') || $check_field('add','ordinary_users') || $check_field('set','ordinary_users')" label="普通用户" name="ordinary_users">
                        <uni-data-select
                  id="form_ordinary_users"
                  v-model="form['ordinary_users']"
                  :localdata="list_user_ordinary_users"
                  :clear="!disabledObj['ordinary_users_isDisabled']"
                  :disabled="disabledObj['ordinary_users_isDisabled']"
                  v-if="user_group === '管理员' || (form['venue_reservation_id'] && $check_field('set','ordinary_users')) || (!form['venue_reservation_id'] && $check_field('add','ordinary_users'))"
                ></uni-data-select>
                <uni-data-select
                  v-model="form['ordinary_users']"
                  :localdata="list_user_ordinary_users"
                  :clear="false"
                  :disabled="true"
                  v-else-if="$check_field('get','ordinary_users')" id="ordinary_users"
                ></uni-data-select>
                    </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','number_of_appointments') || $check_field('add','number_of_appointments') || $check_field('set','number_of_appointments')" label="预约人数" name="number_of_appointments">
                                <uni-easyinput type="text" v-model="form['number_of_appointments']" v-if="user_group === '管理员' || (form['venue_reservation_id'] && $check_field('set','number_of_appointments')) || (!form['venue_reservation_id'] && $check_field('add','number_of_appointments'))" :disabled="disabledObj['number_of_appointments_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','number_of_appointments')">
                  {{ form['number_of_appointments'] }}
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

         <uni-forms-item label="二维码图片" name="qrcode_img">
                <!-- 修改权限 -->
                <view
                  class="diy_field diy_img"
                  v-if="form['qrcode_img'] && (user_group === '管理员' || (form['venue_reservation_id'] && $check_action('/venue_reservation/view','set')) || (!form['venue_reservation_id'] && $check_action('/venue_reservation/view','add')))"
                >
                  <image
                    v-if="disabledObj['qrcode_img_isDisabled']"
                    :src="$fullUrl(form['qrcode_img'])"
                  />
                  <image
                    v-if="!disabledObj['qrcode_img_isDisabled']"
                    :src="$fullUrl(form['qrcode_img'])"
                    @click="change_img('qrcode_img')"
                  />
                </view>
                <!-- 添加权限 -->
                <view
                  class="diy_field diy_img"
                  v-else-if="!form['qrcode_img'] && (user_group === '管理员' || (form['venue_reservation_id'] && $check_action('/venue_reservation/view','set')) || (!form['venue_reservation_id'] && $check_action('/venue_reservation/view','add')))"
                >
                  <view
                    v-if="disabledObj['qrcode_img_isDisabled']"
                    class="btn_add_img"
                  >
                    <text>+</text>
                  </view>
                  <view
                    v-if="!disabledObj['qrcode_img_isDisabled']"
                    class="btn_add_img"
                    @click="change_img('qrcode_img')"
                  >
                    <text>+</text>
                  </view>
                </view>
                <!-- 查询权限 -->
                <view
                  class="diy_field diy_img"
                  v-else-if="$check_action('/venue_reservation/view','get')"
                >
                  <image :src="$fullUrl(form['qrcode_img'])" />
                </view>
         </uni-forms-item>
       <uni-forms-item label="二维码标题" name="qrcode_title">
            <uni-easyinput  v-model="form['qrcode_title']" placeholder="请输入二维码标题"
                    v-if="user_group === '管理员' || (form['venue_reservation_id'] && $check_action('/venue_reservation/view','set')) || (!form['venue_reservation_id'] && $check_action('/venue_reservation/view','add'))" :disabled="disabledObj['qrcode_title_isDisabled']"></uni-easyinput>
            <text v-else-if="$check_action('/venue_reservation/view','get')">{{form['qrcode_title']}}</text>
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
      field: "venue_reservation_id",
      url_add: "~/api/venue_reservation/add?",
      url_set: "~/api/venue_reservation/set?",
      url_get_obj: "~/api/venue_reservation/get_obj?",
      url_upload: "~/api/venue_reservation/upload?",

      query: {
        "venue_reservation_id": 0,
      },

      form: {
            "appointment_no": this.$get_stamp(), // 预约号
                    "no_of_swimming_pool":  '', // 泳馆编号
                    "name_of_swimming_pool":  '', // 泳馆名称
                    "cover":  '', // 封面
                    "location_of_swimming_pool":  '', // 泳馆位置
                    "order_date": this.$toTime(new Date().getTime(), "yyyy-MM-dd"),
                    "reservation_unit_price":  0 , // 预约单价
                    "ordinary_users": 0, // 普通用户
                    "number_of_appointments":  0 , // 预约人数
                        "examine_state": "未审核",
                    "examine_reply": "",
                    "venue_reservation_id": 0, // ID
                            "qrcode_img":'', // 图片
            "qrcode_title":'', // 二维码标题
    
              },
          disabledObj:{
                        "appointment_no_isDisabled": false,
                                "no_of_swimming_pool_isDisabled": false,
                                "name_of_swimming_pool_isDisabled": false,
                                "cover_isDisabled": false,
                                "location_of_swimming_pool_isDisabled": false,
                                "order_date_isDisabled": false,
                                                    "ordinary_users_isDisabled": false,
                                                        "qrcode_img_isDisabled": false,
            "qrcode_title_isDisabled": false,
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
            url: _self.$fullUrl('/api/venue_reservation/upload?'),
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
            url: _self.$fullUrl('/api/venue_reservation/upload?'),
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
        bl = this.$check_action('/venue_reservation/table','add');
        console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
      }
      if(!bl){
        bl = this.$check_action('/venue_reservation/table','set');
        console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
      }
      if(!bl){
        bl = this.$check_action('/venue_reservation/view','add');
        console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
      }
      if(!bl){
        bl = this.$check_action('/venue_reservation/view','set');
        console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
      }
      if(!bl){
        bl = this.$check_action('/venue_reservation/view','get');
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
