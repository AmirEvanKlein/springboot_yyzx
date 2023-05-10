<template>
	<view class="diy_edit page_food_order" id="food_order_edit">
		<view class='warp'>
			<view class='container'>
				<view class='row'>
						<view v-if="$check_field('set','order_number') || $check_field('add','order_number') || $check_field('get','order_number')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								订单号:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_order_number" v-model="form['order_number']" placeholder="请输入订单号" v-if="(form['order_number'] && $check_field('set','order_number')) || (!form['order_number'] && $check_field('add','order_number'))" :disabled="true" />
							<text v-else-if="$check_field('get','order_number')">{{ form['order_number'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','food_name') || $check_field('add','food_name') || $check_field('get','food_name')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								美食名称:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_food_name" v-model="form['food_name']" placeholder="请输入美食名称" v-if="(form['food_name'] && $check_field('set','food_name')) || (!form['food_name'] && $check_field('add','food_name'))" :disabled="disabledObj['food_name_isDisabled']" />
							<text v-else-if="$check_field('get','food_name')">{{ form['food_name'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','cover') || $check_field('add','cover') || $check_field('get','cover')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								封面:
							</text>
						</view>
								<!-- 图片 -->
						<!-- 修改权限 -->
						<view class="diy_field diy_img diy_text_row" v-if="form['cover'] && $check_field('set','cover')">
							<image v-if="disabledObj['cover_isDisabled']" :src="$fullUrl(form['cover'])" />
							<image v-if="!disabledObj['cover_isDisabled']" :src="$fullUrl(form['cover'])" @click="change_img('cover')" />
						</view>
						<!-- 添加权限 -->
						<view class="diy_field diy_img diy_text_row" v-else-if="!form['cover'] && $check_field('add','cover')">
							<view v-if="disabledObj['cover_isDisabled']" class="btn_add_img">
								<text>+</text>
							</view>
							<view v-if="!disabledObj['cover_isDisabled']" class="btn_add_img diy_text_row" @click="change_img('cover')">
								<text>+</text>
							</view>
						</view>
						<!-- 查询权限 -->
						<view class="diy_field diy_img diy_text_row" v-else-if="$check_field('get','cover')">
							<image :src="$fullUrl(form['cover'])" />
						</view>
						<uni-icons style="display: none;" class="forward" type="forward" id="form_img_cover"></uni-icons>
							</view>
							<view v-if="$check_field('set','food_unit_price') || $check_field('add','food_unit_price') || $check_field('get','food_unit_price')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								美食单价:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_food_unit_price" v-model="form['food_unit_price']" placeholder="请输入美食单价" v-if="(form['food_unit_price'] && $check_field('set','food_unit_price')) || (!form['food_unit_price'] && $check_field('add','food_unit_price'))" :disabled="disabledObj['food_unit_price_isDisabled']" />
							<text v-else-if="$check_field('get','food_unit_price')">{{ form['food_unit_price'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','flavor') || $check_field('add','flavor') || $check_field('get','flavor')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								口味:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_flavor" v-model="form['flavor']" placeholder="请输入口味" v-if="(form['flavor'] && $check_field('set','flavor')) || (!form['flavor'] && $check_field('add','flavor'))" :disabled="disabledObj['flavor_isDisabled']" />
							<text v-else-if="$check_field('get','flavor')">{{ form['flavor'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','food_materials') || $check_field('add','food_materials') || $check_field('get','food_materials')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								美食材料:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_food_materials" v-model="form['food_materials']" placeholder="请输入美食材料" v-if="(form['food_materials'] && $check_field('set','food_materials')) || (!form['food_materials'] && $check_field('add','food_materials'))" :disabled="disabledObj['food_materials_isDisabled']" />
							<text v-else-if="$check_field('get','food_materials')">{{ form['food_materials'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','order_date') || $check_field('add','order_date') || $check_field('get','order_date')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								下单日期:
							</text>
						</view>
								<!-- 日期 -->
						<view class="diy_field diy_date">
							<uni-datetime-picker :disabled="disabledObj['order_date_isDisabled']" type="date" id="form_order_date" v-model="form['order_date']" placeholder="请输入下单日期" v-if="(form['order_date'] && $check_field('set','order_date')) || (!form['order_date'] && $check_field('add','order_date'))" />
							<text v-else-if="$check_field('get','order_date')">{{ form['order_date'] }}</text>
						</view>
							</view>
							<view v-if="$check_field('set','ordinary_users') || $check_field('add','ordinary_users') || $check_field('get','ordinary_users')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								普通用户:
							</text>
						</view>
						<view class="diy_field diy_down diy_text_row diy_select_flex">
							<uni-data-select
									id="form_ordinary_users"
									v-model="form['ordinary_users']"
									:localdata="list_user_ordinary_users"
									:clear="!disabledObj['ordinary_users_isDisabled']"
									:disabled="disabledObj['ordinary_users_isDisabled']"
									v-if="(form['ordinary_users'] && $check_field('set','ordinary_users')) || (!form['ordinary_users'] && $check_field('add','ordinary_users'))"
							></uni-data-select>
							<text v-else-if="$check_field('get','ordinary_users')">{{ form['ordinary_users'] }}</text>
						</view>
					</view>
							<view v-if="$check_field('set','purchase_quantity') || $check_field('add','purchase_quantity') || $check_field('get','purchase_quantity')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								购买数量:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_purchase_quantity" v-model="form['purchase_quantity']" placeholder="请输入购买数量" v-if="(form['purchase_quantity'] && $check_field('set','purchase_quantity')) || (!form['purchase_quantity'] && $check_field('add','purchase_quantity'))" :disabled="disabledObj['purchase_quantity_isDisabled']" />
							<text v-else-if="$check_field('get','purchase_quantity')">{{ form['purchase_quantity'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','payment_amount') || $check_field('add','payment_amount') || $check_field('get','payment_amount')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								支付金额:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_payment_amount" v-model="form['payment_amount']" placeholder="请输入支付金额" v-if="(form['payment_amount'] && $check_field('set','payment_amount')) || (!form['payment_amount'] && $check_field('add','payment_amount'))" @focus="set_payment_amount()" :disabled="disabledObj['payment_amount_isDisabled']" />
							<text v-else-if="$check_field('get','payment_amount')">{{ form['payment_amount'] }}</text>
						</view>
										</view>
						<view v-if="user_group === '管理员' || $check_examine()" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								审核状态:
							</text>
						</view>
						<view class="diy_field diy_text diy_text_row diy_select_flex">
							<uni-data-select
									v-model="form['examine_state']"
									:localdata="list_examine_state"
							></uni-data-select>
						</view>
						<view class="diy_field diy_text diy_text_row">
							<text>
								{{ form['examine_state'] }}
							</text>
						</view>
					</view>
					<view v-if="user_group === '管理员' || $check_examine()" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								审核回复:
							</text>
						</view>
						<view class="diy_field diy_text diy_text_row">
							<textarea v-model="form['examine_reply']">
							</textarea>
						</view>
						<view class="diy_field diy_text diy_text_row">
							<text>
								{{ form['examine_reply'] }}
							</text>
						</view>
					</view>

				</view>
				<view class="row">
					<view class="col-12">
						<view class="btn_box">
							<button class="btn_submit primary_btn" @click="submit()">提交</button>
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
	mixins:[mixin],
	components:{},
	data(){
		return{
			url_get_obj:"~/api/food_order/get_obj?",
			url_add:"~/api/food_order/add?",
			url_set:"~/api/food_order/set?",

			// 登录权限
			oauth: {
				"signIn": true,
				"user_group": []
			},

			// 查询条件
			query: {
					"order_number": "",
						"food_name": "",
						"cover": "",
						"food_unit_price": 0,
						"flavor": "",
						"food_materials": "",
						"order_date": "",
						"ordinary_users": 0,
						"purchase_quantity": 0,
						"payment_amount": "",
					"food_order_id": 0
			},

			obj: {
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
				"food_order_id": 0,

			},

			// 表单字段
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
				"food_order_id": 0,
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
					
			field:"food_order_id",
			table_key:"food_order",

	list_examine_state:[{value:"未审核",text:"未审核"},{value:"已通过",text:"已通过"},{value:"未通过",text:"未通过"}],
		}
	},
	methods: {
			
	
				
	
				
	
				
	
				
	
				
	
				
	
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
				async get_user_session_ordinary_users(){
			var _this = this;
			var json = await this.$get("~/api/user_group/get_obj?name=普通用户");
			if(json.result && json.result.obj){
				var source_table = json.result.obj.source_table;
				var user_id = _this.$store.state.user.user_id;
				if (user_id){
					var url = "~/api/"+source_table+"/get_obj?"
					this.$get(url, {"user_id":_this.$store.state.user.user_id}, function(res) {
						if (res.result && res.result.obj) {
							var arr = []
							for (let key in res.result.obj) {
								arr.push(key)
							}
							var arrForm = []
							for (let key in _this.form) {
								arrForm.push(key)
							}
							_this.form["ordinary_users"] = user_id
							_this.disabledObj['ordinary_users' + '_isDisabled'] = true
							for (var i=0;i<arr.length;i++){
                if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
                  for (var j = 0; j < arrForm.length; j++) {
                    if (arr[i] === arrForm[j]) {
                      if (arr[i] !== "ordinary_users") {
                        _this.form[arrForm[j]] = res.result.obj[arr[i]]
                        _this.disabledObj[arrForm[j] + '_isDisabled'] = true
                        break;
                      }
                    }
                  }
                }
							}
						}
					});
				}
			}
			else if(json.error){
				console.error(json.error);
			}
		},
	
	
				
	
				
	
								set_payment_amount(){
			this.form.payment_amount = parseFloat(this.form.purchase_quantity) * parseFloat(this.form.food_unit_price)
			  let r = /^\+?[1-9][0-9]*$/; // 正整数
			  if(!r.test(this.form.payment_amount) ){
				this.form.payment_amount = this.form.payment_amount.toFixed(2);
			  }
		},
								change_file(key_name){
			var _self = this;
				this.$chooseFile().then(res=>{
					console.log(res)

						const uploadTask = uni.uploadFile({
							url: _self.$fullUrl("/api/feedback/upload?"),
							filePath: res[0].path,
							name: "file",
							formData: {
								i_want_to_customize: "test",
							},
							header: {
								"x-auth-token": _self.$store.state.user.token,
							},
							success: function(uploadFileRes) {
								console.log(uploadFileRes)
								var filename = JSON.parse(uploadFileRes.data).result.url;
								_self.form[key_name] = filename;
							},
						});

						uploadTask.onProgressUpdate(function(res) {
							_self.percent = res.progress;
							console.log("上传进度" + res.progress);
							console.log("已经上传的数据长度" + res.totalBytesSent);
							console.log(
								"预期需要上传的数据总长度" + res.totalBytesExpectedToSend
							);
						});

				})
		},
		change_img(key_name) {
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
							'food_order': 'test'
						},
						header: {
							'x-auth-token': _self.$store.state.user.token
						},
						success: function(uploadFileRes) {
							var filename = JSON.parse(uploadFileRes.data).result.url
							var img_url = filename
							_self.form[key_name] = img_url
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
		 * 获取对象后获取缓存表单
		 * @param {Object} json
		 * @param {Object} func
		 */
		get_obj_after(json ,func){
			var form = uni.db.get("form");
			var obj = Object.assign({} ,form ,this.obj);
			if (form) {
				this.obj = uni.push(this.obj ,obj);
			}
			if (form) {
				this.form = uni.push(this.form ,form);
			}
			if(func){
				func(json);
			}
		},

	},
	onLoad(){
																									this.get_user_session_ordinary_users();
				this.get_list_user_ordinary_users();
								},
}
</script>

<style scoped>
	input{
		font-size: 10px;
	}

	.form_edit {
		background-color: #fff;
		margin-bottom: 0.5rem;
		padding: 1rem;
		font-size: 10px;
	}

	.item {
		display: flex;
		padding: 0.2rem 0;
	}

	.left_text {
		flex: 0 0 25%;
		display: flex;
		align-items: center;
	}

	.right_text {
		flex: 0 0 75%;
		border-bottom: 1px solid #eee;
	}
	.right_text.btn_warp{
		border-bottom: 0;
	}

	.btn_submit {
		text-align: center;
		background-color: #fff;
		padding: 0.3rem;
		margin: 0.1rem 1rem;
		border: 1px solid #eee;
		border-radius: 0.5rem;
	}

	.btn_submit:hover {
		opacity: 0.5;
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




</style>
<style scoped>
/*新样式*/
.diy_text_row {
  display: inline-block;
}
.container {
	margin-top:1rem ;
	padding: 1rem;
    -webkit-box-shadow: 0px 0px 0px #888888;
    box-shadow: 0px 0px 0px #888888;
}
.primary_btn{
		background-color: #22B8B8;
		color: #FFFFFF;
	}
	.btn_submit{
		padding: 0;
		margin-top:1rem ;
	}
	.row-item {
		padding: 10px 10px;
	    background: #f8f6fc;
		margin-bottom: 1rem;
	}
	.diy_field{
		padding-left: 1rem;
	}
	.diy_title{
		align-items: center;
        font-size: 14px;
        color: #333;
	}

	.row-item{
		display: flex !important;
		align-items: baseline;
	}
	.diy_select_flex{
		flex: 1;
	}
	.query_select{
		flex: 1;
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
</style>

