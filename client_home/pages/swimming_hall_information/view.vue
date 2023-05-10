<template>
  <view>
    <view class="container diy_view">
      <view>
        <view>
          <view class="">
            <uni-forms :modelValue="form"  v-if="is_view()">

              <uni-forms-item v-if="$check_field('get','no_of_swimming_pool') || $check_field('add','no_of_swimming_pool') || $check_field('set','no_of_swimming_pool')" label="泳馆编号" name="no_of_swimming_pool">
                                <uni-easyinput type="text" v-model="form['no_of_swimming_pool']" v-if="user_group === '管理员' || (form['swimming_hall_information_id'] && $check_field('set','no_of_swimming_pool')) || (!form['swimming_hall_information_id'] && $check_field('add','no_of_swimming_pool'))"  :disabled="true" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','no_of_swimming_pool')">
                  {{ form['no_of_swimming_pool'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','name_of_swimming_pool') || $check_field('add','name_of_swimming_pool') || $check_field('set','name_of_swimming_pool')" label="泳馆名称" name="name_of_swimming_pool">
                                <uni-easyinput type="text" v-model="form['name_of_swimming_pool']" v-if="user_group === '管理员' || (form['swimming_hall_information_id'] && $check_field('set','name_of_swimming_pool')) || (!form['swimming_hall_information_id'] && $check_field('add','name_of_swimming_pool'))" :disabled="disabledObj['name_of_swimming_pool_isDisabled']" />
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
                                <uni-easyinput type="text" v-model="form['location_of_swimming_pool']" v-if="user_group === '管理员' || (form['swimming_hall_information_id'] && $check_field('set','location_of_swimming_pool')) || (!form['swimming_hall_information_id'] && $check_field('add','location_of_swimming_pool'))" :disabled="disabledObj['location_of_swimming_pool_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','location_of_swimming_pool')">
                  {{ form['location_of_swimming_pool'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','capacity') || $check_field('add','capacity') || $check_field('set','capacity')" label="容纳人数" name="capacity">
                                <uni-easyinput type="text" v-model="form['capacity']" v-if="user_group === '管理员' || (form['swimming_hall_information_id'] && $check_field('set','capacity')) || (!form['swimming_hall_information_id'] && $check_field('add','capacity'))" :disabled="disabledObj['capacity_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','capacity')">
                  {{ form['capacity'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','reservation_unit_price') || $check_field('add','reservation_unit_price') || $check_field('set','reservation_unit_price')" label="预约单价" name="reservation_unit_price">
                                <uni-easyinput type="text" v-model="form['reservation_unit_price']" v-if="user_group === '管理员' || (form['swimming_hall_information_id'] && $check_field('set','reservation_unit_price')) || (!form['swimming_hall_information_id'] && $check_field('add','reservation_unit_price'))" :disabled="disabledObj['reservation_unit_price_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','reservation_unit_price')">
                  {{ form['reservation_unit_price'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','details_of_swimming_pool') || $check_field('add','details_of_swimming_pool') || $check_field('set','details_of_swimming_pool')" label="泳馆详情" name="details_of_swimming_pool">
                      </uni-forms-item>

              <uni-forms-item label="计时器标题" name="timer_title">
                <uni-easyinput v-if="user_group === '管理员' || (form['swimming_hall_information_id'] && $check_action('/swimming_hall_information/view','set')) || (!form['swimming_hall_information_id'] && $check_action('/swimming_hall_information/view','add'))" v-model="form['timer_title']" type="text" :disabled="disabledObj['timer_title_isDisabled']" />
                <text v-else-if="$check_field('get','timer_title')">
                  {{ form['timer_title'] }}
                </text>
              </uni-forms-item>
              <uni-forms-item label="计时开始时间" name="timing_start_time">
                <uni-datetime-picker v-if="user_group === '管理员' || (form['swimming_hall_information_id'] && $check_action('/swimming_hall_information/view','set')) || (!form['swimming_hall_information_id'] && $check_action('/swimming_hall_information/view','add'))" @change="changeLog($event,'timing_start_time')" v-model="form['timing_start_time']" type="datetime" :disabled="disabledObj['timing_start_time_isDisabled']" />
                <text v-else-if="$check_field('get','timing_start_time')">
                  {{ form['timing_start_time'] }}
                </text>
              </uni-forms-item>
              <uni-forms-item label="计时结束时间" name="timing_end_time">
                <uni-datetime-picker v-if="user_group === '管理员' || (form['swimming_hall_information_id'] && $check_action('/swimming_hall_information/view','set')) || (!form['swimming_hall_information_id'] && $check_action('/swimming_hall_information/view','add'))" @change="changeLog($event,'timing_end_time')" v-model="form['timing_end_time']" type="datetime" :disabled="disabledObj['timing_end_time_isDisabled']" />
                <text v-else-if="$check_field('get','timing_end_time')">
                  {{ form['timing_end_time'] }}
                </text>
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
      field: "swimming_hall_information_id",
      url_add: "~/api/swimming_hall_information/add?",
      url_set: "~/api/swimming_hall_information/set?",
      url_get_obj: "~/api/swimming_hall_information/get_obj?",
      url_upload: "~/api/swimming_hall_information/upload?",

      query: {
        "swimming_hall_information_id": 0,
      },

      form: {
            "no_of_swimming_pool": this.$get_stamp(), // 泳馆编号
                    "name_of_swimming_pool":  '', // 泳馆名称
                    "cover":  '', // 封面
                    "location_of_swimming_pool":  '', // 泳馆位置
                    "capacity":  0 , // 容纳人数
                    "reservation_unit_price":  0 , // 预约单价
                    "details_of_swimming_pool":  '', // 泳馆详情
                                "swimming_hall_information_id": 0, // ID
                "timer_title":'', // 计时器标题
            "timing_start_time":'', // 计时开始时间
            "timing_end_time":'', // 计时结束时间
                
              },
          disabledObj:{
                        "no_of_swimming_pool_isDisabled": false,
                                "name_of_swimming_pool_isDisabled": false,
                                "cover_isDisabled": false,
                                "location_of_swimming_pool_isDisabled": false,
                                                                        "details_of_swimming_pool_isDisabled": false,
                            "timer_title_isDisabled": false, // 计时器标题
            "timing_start_time_isDisabled": false, // 计时开始时间
            "timing_end_time_isDisabled": false, // 计时结束时间
                      },
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
            url: _self.$fullUrl('/api/swimming_hall_information/upload?'),
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
            url: _self.$fullUrl('/api/swimming_hall_information/upload?'),
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
                                                              uni.db.del("form");
      return param;
    },
        
            
            
            
            
            
            
    
    /**
     * 获取对象之后
     * @param {Object} json
     * @param {Object} func
     */
    get_obj_after(json, func){
                                                            },

    is_view(){
      var bl = this.user_group == "管理员";

      if(!bl){
        bl = this.$check_action('/swimming_hall_information/table','add');
        console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
      }
      if(!bl){
        bl = this.$check_action('/swimming_hall_information/table','set');
        console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
      }
      if(!bl){
        bl = this.$check_action('/swimming_hall_information/view','add');
        console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
      }
      if(!bl){
        bl = this.$check_action('/swimming_hall_information/view','set');
        console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
      }
      if(!bl){
        bl = this.$check_action('/swimming_hall_information/view','get');
        console.log(bl ? "你有视图查询权限视作有查询权限" : "你没有视图查询权限");
      }

      console.log(bl ? "具有当前页面的查看权，请注意这不代表你有字段的查看权" : "无权查看当前页，请注意即便有字段查询权限没有页面查询权限也不行");

      return bl;
    },

  },
  created() {
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
