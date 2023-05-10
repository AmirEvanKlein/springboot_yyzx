<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','ordinary_users') || $check_field('add','ordinary_users') || $check_field('set','ordinary_users')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="普通用户" prop="ordinary_users">
													<el-select v-if="user_group === '管理员' || (form['user_wallet_id'] && $check_field('set','ordinary_users')) || (!form['user_wallet_id'] && $check_field('add','ordinary_users'))" id="ordinary_users" v-model="form['ordinary_users']" :disabled="disabledObj['ordinary_users_isDisabled']">
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
								<el-col v-if="user_group === '管理员' || $check_field('get','wallet_amount') || $check_field('add','wallet_amount') || $check_field('set','wallet_amount')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="钱包金额" prop="wallet_amount">
								<el-input-number id="wallet_amount" v-model.number="form['wallet_amount']"
						v-if="user_group === '管理员' || (form['user_wallet_id'] && $check_field('set','wallet_amount')) || (!form['user_wallet_id'] && $check_field('add','wallet_amount'))" :disabled="disabledObj['wallet_amount_isDisabled']"></el-input-number>
					<div v-else-if="$check_field('get','wallet_amount')">{{form['wallet_amount']}}</div>
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
				field: "user_wallet_id",
				url_add: "~/api/user_wallet/add?",
				url_set: "~/api/user_wallet/set?",
				url_get_obj: "~/api/user_wallet/get_obj?",
				url_upload: "~/api/user_wallet/upload?",

				query: {
					"user_wallet_id": 0,
				},

				form: {
								"ordinary_users": 0, // 普通用户
										"wallet_amount":  0, // 钱包金额
											"user_wallet_id": 0, // ID
						
				},
				disabledObj:{
								"ordinary_users_isDisabled": false,
					          			"wallet_amount_isDisabled": false,
										},

	
					// 用户列表
				list_user_ordinary_users: [],
				
	
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
			
	
		
			/**
			 * 获取对象之前
			 * @param {Object} param
			 */
			get_obj_before(param) {
				var form = "";
																								
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
								$.db.del("form");
				return param;
			},

			/**
			 * 获取对象之后
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_after(json, func){


						

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
					bl = this.$check_action('/user_wallet/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/user_wallet/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/user_wallet/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/user_wallet/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/user_wallet/view','get');
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
