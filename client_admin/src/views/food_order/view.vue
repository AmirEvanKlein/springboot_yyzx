<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','order_number') || $check_field('add','order_number') || $check_field('set','order_number')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="订单号" prop="order_number">
												<el-input id="order_number" v-model="form['order_number']" placeholder="请输入订单号"
							  v-if="user_group === '管理员' || (form['food_order_id'] && $check_field('set','order_number')) || (!form['food_order_id'] && $check_field('add','order_number'))" :disabled="true"></el-input>
					<div v-else-if="$check_field('get','order_number')">{{form['order_number']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','food_name') || $check_field('add','food_name') || $check_field('set','food_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="美食名称" prop="food_name">
												<el-input id="food_name" v-model="form['food_name']" placeholder="请输入美食名称"
							  v-if="user_group === '管理员' || (form['food_order_id'] && $check_field('set','food_name')) || (!form['food_order_id'] && $check_field('add','food_name'))" :disabled="disabledObj['food_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','food_name')">{{form['food_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','cover') || $check_field('add','cover') || $check_field('set','cover')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="封面" prop="cover">
								<el-upload :disabled="disabledObj['cover_isDisabled']" id="cover" class="avatar-uploader" drag
						accept="image/gif, image/jpeg, image/png, image/jpg" action="" :http-request="upload_cover"
						:show-file-list="false" v-if="user_group === '管理员' || (form['food_order_id'] && $check_field('set','cover')) || (!form['food_order_id'] && $check_field('add','cover'))">
						<img v-if="form['cover']" :src="$fullUrl(form['cover'])" class="avatar">
						<i v-else class="el-icon-plus avatar-uploader-icon"></i>
					</el-upload>
					<el-image v-else-if="$check_field('get','cover')" style="width: 100px; height: 100px"
						:src="$fullUrl(form['cover'])" :preview-src-list="[$fullUrl(form['cover'])]">
						<div slot="error" class="image-slot">
							<img src="../../../public/img/error.png" style="width: 90px; height: 90px" />
						</div>
					</el-image>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','food_unit_price') || $check_field('add','food_unit_price') || $check_field('set','food_unit_price')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="美食单价" prop="food_unit_price">
								<el-input-number id="food_unit_price" v-model.number="form['food_unit_price']"
						v-if="user_group === '管理员' || (form['food_order_id'] && $check_field('set','food_unit_price')) || (!form['food_order_id'] && $check_field('add','food_unit_price'))" :disabled="disabledObj['food_unit_price_isDisabled']"></el-input-number>
					<div v-else-if="$check_field('get','food_unit_price')">{{form['food_unit_price']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','flavor') || $check_field('add','flavor') || $check_field('set','flavor')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="口味" prop="flavor">
												<el-input id="flavor" v-model="form['flavor']" placeholder="请输入口味"
							  v-if="user_group === '管理员' || (form['food_order_id'] && $check_field('set','flavor')) || (!form['food_order_id'] && $check_field('add','flavor'))" :disabled="disabledObj['flavor_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','flavor')">{{form['flavor']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','food_materials') || $check_field('add','food_materials') || $check_field('set','food_materials')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="美食材料" prop="food_materials">
												<el-input id="food_materials" v-model="form['food_materials']" placeholder="请输入美食材料"
							  v-if="user_group === '管理员' || (form['food_order_id'] && $check_field('set','food_materials')) || (!form['food_order_id'] && $check_field('add','food_materials'))" :disabled="disabledObj['food_materials_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','food_materials')">{{form['food_materials']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','order_date') || $check_field('add','order_date') || $check_field('set','order_date')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="下单日期" prop="order_date">
								<el-date-picker :disabled="disabledObj['order_date_isDisabled']" v-if="user_group === '管理员' || (form['food_order_id'] && $check_field('set','order_date')) || (!form['food_order_id'] && $check_field('add','order_date'))" id="order_date"
						v-model="form['order_date']" type="date" placeholder="选择日期">
					</el-date-picker>
					<div v-else-if="$check_field('get','order_date')">{{form['order_date']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','ordinary_users') || $check_field('add','ordinary_users') || $check_field('set','ordinary_users')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="普通用户" prop="ordinary_users">
																		<div v-if="user_group !== '管理员'">
							{{ get_user_session_ordinary_users(form['ordinary_users']) }}
							<!--<el-input id="business_name" v-model="form['ordinary_users']" placeholder="请输入普通用户"-->
							<!--v-if="user_group === '管理员' || (form['food_order_id'] && $check_field('set','ordinary_users')) || (!form['food_order_id'] && $check_field('add','ordinary_users'))" :disabled="disabledObj['ordinary_users_isDisabled']"></el-input>-->
							<!--<div v-else-if="$check_field('get','ordinary_users')">{{form['ordinary_users']}}</div>-->
							<el-select v-if="user_group === '管理员' || (form['food_order_id'] && $check_field('set','ordinary_users')) || (!form['food_order_id'] && $check_field('add','ordinary_users'))" id="ordinary_users" v-model="form['ordinary_users']" :disabled="disabledObj['ordinary_users_isDisabled']">
								<el-option v-for="o in list_user_ordinary_users" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
							<el-select v-else-if="$check_field('get','ordinary_users')" id="ordinary_users" v-model="form['ordinary_users']" :disabled="true">
								<el-option v-for="o in list_user_ordinary_users" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
						</div>
						<el-select v-else id="ordinary_users" v-model="form['ordinary_users']" :disabled="disabledObj['ordinary_users_isDisabled']">
							<el-option v-for="o in list_user_ordinary_users" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
																</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','purchase_quantity') || $check_field('add','purchase_quantity') || $check_field('set','purchase_quantity')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="购买数量" prop="purchase_quantity">
								<el-input-number id="purchase_quantity" v-model.number="form['purchase_quantity']"
						v-if="user_group === '管理员' || (form['food_order_id'] && $check_field('set','purchase_quantity')) || (!form['food_order_id'] && $check_field('add','purchase_quantity'))" :disabled="disabledObj['purchase_quantity_isDisabled']"></el-input-number>
					<div v-else-if="$check_field('get','purchase_quantity')">{{form['purchase_quantity']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','payment_amount') || $check_field('add','payment_amount') || $check_field('set','payment_amount')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="支付金额" prop="payment_amount">
												<el-input id="payment_amount" v-model="form['payment_amount']" placeholder="请输入支付金额"
							  v-if="user_group === '管理员' || (form['food_order_id'] && $check_field('set','payment_amount')) || (!form['food_order_id'] && $check_field('add','payment_amount'))"  @focus="set_payment_amount()" :disabled="disabledObj['payment_amount_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','payment_amount')">{{form['payment_amount']}}</div>
											</el-form-item>
			</el-col>
							<el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="审核状态" prop="examine_state">
					<el-select id="examine_state" v-model="form['examine_state']"
						v-if="user_group === '管理员' || (form['examine_state'] && $check_examine()) || (!form['examine_state'] && $check_examine())">
						<el-option key="未审核" label="未审核" value="未审核"></el-option>
						<el-option key="已通过" label="已通过" value="已通过"></el-option>
						<el-option key="未通过" label="未通过" value="未通过"></el-option>
					</el-select>
					<div v-else>{{form["examine_state"]}}</div>
				</el-form-item>
			</el-col>
					<el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="审核回复" prop="examine_reply">
					<el-input id="examine_reply" v-model="form['examine_reply']" placeholder="请输入审核回复"
						v-if="user_group === '管理员' || (form['examine_reply'] && $check_examine()) || (!form['examine_reply'] && $check_examine())"></el-input>
					<div v-else>{{form["examine_reply"]}}</div>
				</el-form-item>
			</el-col>
	
	
	
	
	
	
	
			<el-col :xs="24" :sm="12" :lg="8" class="el_form_btn_warp">
				<el-form-item>
					<el-button type="primary" @click="submit()">提交</el-button>
					<el-button @click="cancel()">取消</el-button>
				</el-form-item>
			</el-col>

		</el-form>
	</el-main>
</template>

<script>
	import mixin from "@/mixins/page.js";

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
										"food_unit_price":  0, // 美食单价
										"flavor":  '', // 口味
										"food_materials":  '', // 美食材料
										"order_date":  '', // 下单日期
										"ordinary_users": 0, // 普通用户
										"purchase_quantity":  0, // 购买数量
										"payment_amount":  '', // 支付金额
									"examine_state": "未审核",
							"examine_reply": "",
							"food_order_id": 0, // ID
						
				},
				disabledObj:{
								"order_number_isDisabled": false,
										"food_name_isDisabled": false,
										"cover_isDisabled": false,
					          			"food_unit_price_isDisabled": false,
										"flavor_isDisabled": false,
										"food_materials_isDisabled": false,
										"order_date_isDisabled": false,
										"ordinary_users_isDisabled": false,
					          			"purchase_quantity_isDisabled": false,
										"payment_amount_isDisabled": false,
										},

	
		
		
		
		
		
		
		
					// 用户列表
				list_user_ordinary_users: [],
						// 用户组
				group_user_ordinary_users: "",
				
		
	
			}
		},
		methods: {


	
	
			
	
						/**
			 * 上传封面
			 * @param {Object} param 图片参数
			 */
			upload_cover(param){
						this.uploadFile(param.file, "cover");
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
                    this.list_user_ordinary_users = json.result.list;
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
												_this.form["ordinary_users"] = id
									_this.disabledObj['ordinary_users' + '_isDisabled'] = true
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
					get_user_ordinary_users(id){
				var obj = this.list_user_ordinary_users.getObj({"user_id":id});
				var ret = "";
				if(obj){
					if(obj.nickname){
						ret = obj.nickname;}
					else{
						ret = obj.username;
					}
				}
				return ret;
			},
			
	
			
	
										set_payment_amount(){
				this.form.payment_amount = parseFloat(this.form.purchase_quantity) * parseFloat(this.form.food_unit_price)
			},
						
			/**
			 * 获取对象之前
			 * @param {Object} param
			 */
			get_obj_before(param) {
				var form = "";
																									// 获取缓存数据附加
				form = $.db.get("form");
							$.push(this.form ,form);
								
				if(this.form && form){
					Object.keys(this.form).forEach(key => {
						Object.keys(form).forEach(dbKey => {
							// if(dbKey === "charging_standard"){
							// 	this.form['charging_rules'] = form[dbKey];
							// 	this.disabledObj['charging_rules_isDisabled'] = true;
							// };
							if(key === dbKey){
								this.disabledObj[key+'_isDisabled'] = true;
							}
						})
					})
				}
														        if (this.form["order_date"].indexOf("-")===-1){
          this.form["order_date"] = this.$toTime(parseInt(this.form["order_date"]),"yyyy-MM-dd")
        }
											$.db.del("form");
				return param;
			},

			/**
			 * 获取对象之后
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_after(json, func){


																				        if(this.form["order_date"]=="0000-00-00"){
          this.form["order_date"] = null;
        }
				if(parseInt(this.form["order_date"]) > 9999){
					this.form["order_date"] = this.$toTime(parseInt(this.form["order_date"]),"yyyy-MM-dd")
				}
											

			},

			/**
			 * 提交前验证事件
			 * @param {Object} 请求参数
			 * @return {String} 验证成功返回null, 失败返回错误提示
			 */
			submit_check(param) {
				let msg = null
																																				return msg;
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
			/**
			 * 上传文件
			 * @param {Object} param
			 */
			uploadimg(param) {
				this.uploadFile(param.file, "avatar");
			},

		},
		created() {
																			this.get_list_user_ordinary_users();
					this.get_group_user_ordinary_users();
									},
	}
</script>

<style>
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

	.avatar-uploader-icon {
		font-size: 28px;
		color: #8c939d;
		width: 178px;
		height: 178px;
		line-height: 178px;
		text-align: center;
	}

	.avatar {
		width: 178px;
		height: 178px;
		display: block;
	}




</style>
