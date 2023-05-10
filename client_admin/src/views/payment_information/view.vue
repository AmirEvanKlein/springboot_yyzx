<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','appointment_no') || $check_field('add','appointment_no') || $check_field('set','appointment_no')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="预约号" prop="appointment_no">
												<el-input id="appointment_no" v-model="form['appointment_no']" placeholder="请输入预约号"
							  v-if="user_group === '管理员' || (form['payment_information_id'] && $check_field('set','appointment_no')) || (!form['payment_information_id'] && $check_field('add','appointment_no'))" :disabled="disabledObj['appointment_no_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','appointment_no')">{{form['appointment_no']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','no_of_swimming_pool') || $check_field('add','no_of_swimming_pool') || $check_field('set','no_of_swimming_pool')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="泳馆编号" prop="no_of_swimming_pool">
												<el-input id="no_of_swimming_pool" v-model="form['no_of_swimming_pool']" placeholder="请输入泳馆编号"
							  v-if="user_group === '管理员' || (form['payment_information_id'] && $check_field('set','no_of_swimming_pool')) || (!form['payment_information_id'] && $check_field('add','no_of_swimming_pool'))" :disabled="disabledObj['no_of_swimming_pool_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','no_of_swimming_pool')">{{form['no_of_swimming_pool']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','name_of_swimming_pool') || $check_field('add','name_of_swimming_pool') || $check_field('set','name_of_swimming_pool')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="泳馆名称" prop="name_of_swimming_pool">
												<el-input id="name_of_swimming_pool" v-model="form['name_of_swimming_pool']" placeholder="请输入泳馆名称"
							  v-if="user_group === '管理员' || (form['payment_information_id'] && $check_field('set','name_of_swimming_pool')) || (!form['payment_information_id'] && $check_field('add','name_of_swimming_pool'))" :disabled="disabledObj['name_of_swimming_pool_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','name_of_swimming_pool')">{{form['name_of_swimming_pool']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','cover') || $check_field('add','cover') || $check_field('set','cover')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="封面" prop="cover">
								<el-upload :disabled="disabledObj['cover_isDisabled']" id="cover" class="avatar-uploader" drag
						accept="image/gif, image/jpeg, image/png, image/jpg" action="" :http-request="upload_cover"
						:show-file-list="false" v-if="user_group === '管理员' || (form['payment_information_id'] && $check_field('set','cover')) || (!form['payment_information_id'] && $check_field('add','cover'))">
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
								<el-col v-if="user_group === '管理员' || $check_field('get','location_of_swimming_pool') || $check_field('add','location_of_swimming_pool') || $check_field('set','location_of_swimming_pool')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="泳馆位置" prop="location_of_swimming_pool">
												<el-input id="location_of_swimming_pool" v-model="form['location_of_swimming_pool']" placeholder="请输入泳馆位置"
							  v-if="user_group === '管理员' || (form['payment_information_id'] && $check_field('set','location_of_swimming_pool')) || (!form['payment_information_id'] && $check_field('add','location_of_swimming_pool'))" :disabled="disabledObj['location_of_swimming_pool_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','location_of_swimming_pool')">{{form['location_of_swimming_pool']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','order_date') || $check_field('add','order_date') || $check_field('set','order_date')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="下单日期" prop="order_date">
								<el-date-picker :disabled="disabledObj['order_date_isDisabled']" v-if="user_group === '管理员' || (form['payment_information_id'] && $check_field('set','order_date')) || (!form['payment_information_id'] && $check_field('add','order_date'))" id="order_date"
						v-model="form['order_date']" type="date" placeholder="选择日期">
					</el-date-picker>
					<div v-else-if="$check_field('get','order_date')">{{form['order_date']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','reservation_unit_price') || $check_field('add','reservation_unit_price') || $check_field('set','reservation_unit_price')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="预约单价" prop="reservation_unit_price">
								<el-input-number id="reservation_unit_price" v-model.number="form['reservation_unit_price']"
						v-if="user_group === '管理员' || (form['payment_information_id'] && $check_field('set','reservation_unit_price')) || (!form['payment_information_id'] && $check_field('add','reservation_unit_price'))" :disabled="disabledObj['reservation_unit_price_isDisabled']"></el-input-number>
					<div v-else-if="$check_field('get','reservation_unit_price')">{{form['reservation_unit_price']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','ordinary_users') || $check_field('add','ordinary_users') || $check_field('set','ordinary_users')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="普通用户" prop="ordinary_users">
													<el-select v-if="user_group === '管理员' || (form['payment_information_id'] && $check_field('set','ordinary_users')) || (!form['payment_information_id'] && $check_field('add','ordinary_users'))" id="ordinary_users" v-model="form['ordinary_users']" :disabled="disabledObj['ordinary_users_isDisabled']">
							<el-option v-for="o in list_user_ordinary_users" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
						<el-select v-else-if="$check_field('get','ordinary_users')" id="ordinary_users" v-model="form['ordinary_users']" :disabled="true">
							<el-option v-for="o in list_user_ordinary_users" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','number_of_appointments') || $check_field('add','number_of_appointments') || $check_field('set','number_of_appointments')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="预约人数" prop="number_of_appointments">
								<el-input-number id="number_of_appointments" v-model.number="form['number_of_appointments']"
						v-if="user_group === '管理员' || (form['payment_information_id'] && $check_field('set','number_of_appointments')) || (!form['payment_information_id'] && $check_field('add','number_of_appointments'))" :disabled="disabledObj['number_of_appointments_isDisabled']"></el-input-number>
					<div v-else-if="$check_field('get','number_of_appointments')">{{form['number_of_appointments']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','payment_amount') || $check_field('add','payment_amount') || $check_field('set','payment_amount')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="支付金额" prop="payment_amount">
												<el-input id="payment_amount" v-model="form['payment_amount']" placeholder="请输入支付金额"
							  v-if="user_group === '管理员' || (form['payment_information_id'] && $check_field('set','payment_amount')) || (!form['payment_information_id'] && $check_field('add','payment_amount'))"  @focus="set_payment_amount()" :disabled="disabledObj['payment_amount_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','payment_amount')">{{form['payment_amount']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','remarks') || $check_field('add','remarks') || $check_field('set','remarks')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="备注" prop="remarks">
												<el-input id="remarks" v-model="form['remarks']" placeholder="请输入备注"
							  v-if="user_group === '管理员' || (form['payment_information_id'] && $check_field('set','remarks')) || (!form['payment_information_id'] && $check_field('add','remarks'))" :disabled="disabledObj['remarks_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','remarks')">{{form['remarks']}}</div>
											</el-form-item>
			</el-col>
					
				<el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="二维码图片" prop="qrcode_img">
					<el-upload :disabled="disabledObj['qrcode_img_isDisabled']" id="qrcode_img" class="avatar-uploader" drag
							   accept="image/gif, image/jpeg, image/png, image/jpg" action="" :http-request="upload_qrcode"
							   :show-file-list="false">
						<img v-if="form['qrcode_img']" :src="$fullUrl(form['qrcode_img'])" class="avatar">
						<i v-else class="el-icon-plus avatar-uploader-icon"></i>
					</el-upload>
				</el-form-item>
			</el-col>
			<el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="二维码标题" prop="qrcode_title">
					<el-input id="qrcode_title" v-model="form['qrcode_title']" placeholder="请输入二维码标题"
							  :disabled="disabledObj['qrcode_title_isDisabled']"></el-input>
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
				field: "payment_information_id",
				url_add: "~/api/payment_information/add?",
				url_set: "~/api/payment_information/set?",
				url_get_obj: "~/api/payment_information/get_obj?",
				url_upload: "~/api/payment_information/upload?",

				query: {
					"payment_information_id": 0,
				},

				form: {
								"appointment_no":  '', // 预约号
										"no_of_swimming_pool":  '', // 泳馆编号
										"name_of_swimming_pool":  '', // 泳馆名称
										"cover":  '', // 封面
										"location_of_swimming_pool":  '', // 泳馆位置
										"order_date":  '', // 下单日期
										"reservation_unit_price":  0, // 预约单价
										"ordinary_users": 0, // 普通用户
										"number_of_appointments":  0, // 预约人数
										"payment_amount":  '', // 支付金额
										"remarks":  '', // 备注
											"payment_information_id": 0, // ID
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
					          			"reservation_unit_price_isDisabled": false,
										"ordinary_users_isDisabled": false,
					          			"number_of_appointments_isDisabled": false,
										"payment_amount_isDisabled": false,
										"remarks_isDisabled": false,
									"qrcode_img_isDisabled": false,
					"qrcode_title_isDisabled": false,
							},

	
		
		
		
		
		
		
		
					// 用户列表
				list_user_ordinary_users: [],
				
		
		
	
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
				this.form.payment_amount = parseFloat(this.form.reservation_unit_price) * parseFloat(this.form.number_of_appointments)
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
					bl = this.$check_action('/payment_information/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/payment_information/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/payment_information/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/payment_information/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/payment_information/view','get');
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
			/**
			 * 上传二维码
			 * @param {Object} param图片参数
			 */
			upload_qrcode(param){
				this.uploadFile(param.file, "qrcode_img");
			},

		},
		created() {
																			this.get_list_user_ordinary_users();
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
