<template>
  <view>
    <view class="container diy_view">
      <view>
        <view>
          <view class="">
            <uni-forms :modelValue="form"  v-if="is_view()">

              <uni-forms-item v-if="$check_field('get','recharge_number') || $check_field('add','recharge_number') || $check_field('set','recharge_number')" label="充值号" name="recharge_number">
                                <uni-easyinput type="text" v-model="form['recharge_number']" v-if="user_group === '管理员' || (form['recharge_information_id'] && $check_field('set','recharge_number')) || (!form['recharge_information_id'] && $check_field('add','recharge_number'))"  :disabled="true" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','recharge_number')">
                  {{ form['recharge_number'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','ordinary_users') || $check_field('add','ordinary_users') || $check_field('set','ordinary_users')" label="普通用户" name="ordinary_users">
                        <uni-data-select
                  id="form_ordinary_users"
                  v-model="form['ordinary_users']"
                  :localdata="list_user_ordinary_users"
                  :clear="!disabledObj['ordinary_users_isDisabled']"
                  :disabled="disabledObj['ordinary_users_isDisabled']"
                  v-if="user_group === '管理员' || (form['recharge_information_id'] && $check_field('set','ordinary_users')) || (!form['recharge_information_id'] && $check_field('add','ordinary_users'))"
                ></uni-data-select>
                <uni-data-select
                  v-model="form['ordinary_users']"
                  :localdata="list_user_ordinary_users"
                  :clear="false"
                  :disabled="true"
                  v-else-if="$check_field('get','ordinary_users')" id="ordinary_users"
                ></uni-data-select>
                    </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','recharge_amount') || $check_field('add','recharge_amount') || $check_field('set','recharge_amount')" label="充值金额" name="recharge_amount">
                                <uni-easyinput type="text" v-model="form['recharge_amount']" v-if="user_group === '管理员' || (form['recharge_information_id'] && $check_field('set','recharge_amount')) || (!form['recharge_information_id'] && $check_field('add','recharge_amount'))" :disabled="disabledObj['recharge_amount_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','recharge_amount')">
                  {{ form['recharge_amount'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','recharge_date') || $check_field('add','recharge_date') || $check_field('set','recharge_date')" label="充值日期" name="recharge_date">
                        <uni-datetime-picker v-if="user_group === '管理员' || (form['recharge_information_id'] && $check_field('set','recharge_date')) || (!form['recharge_information_id'] && $check_field('add','recharge_date'))" v-model="form['recharge_date']" type="date" :disabled="disabledObj['recharge_date_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','recharge_date')">
                  {{ form['recharge_date'] }}
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
      field: "recharge_information_id",
      url_add: "~/api/recharge_information/add?",
      url_set: "~/api/recharge_information/set?",
      url_get_obj: "~/api/recharge_information/get_obj?",
      url_upload: "~/api/recharge_information/upload?",

      query: {
        "recharge_information_id": 0,
      },

      form: {
            "recharge_number": this.$get_stamp(), // 充值号
                    "ordinary_users": 0, // 普通用户
                    "recharge_amount":  0 , // 充值金额
                    "recharge_date": this.$toTime(new Date().getTime(), "yyyy-MM-dd"),
                        "examine_state": "未审核",
                    "examine_reply": "",
                    "recharge_information_id": 0, // ID
                
              },
          disabledObj:{
                        "recharge_number_isDisabled": false,
                                "ordinary_users_isDisabled": false,
                                                    "recharge_date_isDisabled": false,
                                  },
                                                    // 用户列表
            list_user_ordinary_users: [],
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
            url: _self.$fullUrl('/api/recharge_information/upload?'),
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
            url: _self.$fullUrl('/api/recharge_information/upload?'),
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
                                      if (this.form["recharge_date"] && JSON.stringify(this.form["recharge_date"]).indexOf("-")===-1) {
        this.form["recharge_date"] = this.$toTime(parseInt(this.form["recharge_date"]), "yyyy-MM-dd")
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
     * 获取对象之后
     * @param {Object} json
     * @param {Object} func
     */
    get_obj_after(json, func){
                                      if (this.form["recharge_date"] && JSON.stringify(this.form["recharge_date"]).indexOf("-")===-1) {
        this.form["recharge_date"] = this.$toTime(parseInt(this.form["recharge_date"]),"yyyy-MM-dd")
      }
        },

    is_view(){
      var bl = this.user_group == "管理员";

      if(!bl){
        bl = this.$check_action('/recharge_information/table','add');
        console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
      }
      if(!bl){
        bl = this.$check_action('/recharge_information/table','set');
        console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
      }
      if(!bl){
        bl = this.$check_action('/recharge_information/view','add');
        console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
      }
      if(!bl){
        bl = this.$check_action('/recharge_information/view','set');
        console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
      }
      if(!bl){
        bl = this.$check_action('/recharge_information/view','get');
        console.log(bl ? "你有视图查询权限视作有查询权限" : "你没有视图查询权限");
      }

      console.log(bl ? "具有当前页面的查看权，请注意这不代表你有字段的查看权" : "无权查看当前页，请注意即便有字段查询权限没有页面查询权限也不行");

      return bl;
    },

  },
  created() {
                    this.get_list_user_ordinary_users();
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
