<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','food_name') || $check_field('add','food_name') || $check_field('set','food_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="美食名称" prop="food_name">
												<el-input id="food_name" v-model="form['food_name']" placeholder="请输入美食名称"
							  v-if="user_group === '管理员' || (form['food_information_id'] && $check_field('set','food_name')) || (!form['food_information_id'] && $check_field('add','food_name'))" :disabled="disabledObj['food_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','food_name')">{{form['food_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','cover') || $check_field('add','cover') || $check_field('set','cover')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="封面" prop="cover">
								<el-upload :disabled="disabledObj['cover_isDisabled']" id="cover" class="avatar-uploader" drag
						accept="image/gif, image/jpeg, image/png, image/jpg" action="" :http-request="upload_cover"
						:show-file-list="false" v-if="user_group === '管理员' || (form['food_information_id'] && $check_field('set','cover')) || (!form['food_information_id'] && $check_field('add','cover'))">
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
						v-if="user_group === '管理员' || (form['food_information_id'] && $check_field('set','food_unit_price')) || (!form['food_information_id'] && $check_field('add','food_unit_price'))" :disabled="disabledObj['food_unit_price_isDisabled']"></el-input-number>
					<div v-else-if="$check_field('get','food_unit_price')">{{form['food_unit_price']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','flavor') || $check_field('add','flavor') || $check_field('set','flavor')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="口味" prop="flavor">
												<el-input id="flavor" v-model="form['flavor']" placeholder="请输入口味"
							  v-if="user_group === '管理员' || (form['food_information_id'] && $check_field('set','flavor')) || (!form['food_information_id'] && $check_field('add','flavor'))" :disabled="disabledObj['flavor_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','flavor')">{{form['flavor']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','food_materials') || $check_field('add','food_materials') || $check_field('set','food_materials')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="美食材料" prop="food_materials">
												<el-input id="food_materials" v-model="form['food_materials']" placeholder="请输入美食材料"
							  v-if="user_group === '管理员' || (form['food_information_id'] && $check_field('set','food_materials')) || (!form['food_information_id'] && $check_field('add','food_materials'))" :disabled="disabledObj['food_materials_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','food_materials')">{{form['food_materials']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','details') || $check_field('add','details') || $check_field('set','details')" :xs="24" :sm="24" :lg="24" class="el_form_editor_warp">
				<el-form-item label="详情介绍" prop="details">
					<quill-editor v-model.number="form['details']"
						v-if="user_group === '管理员' || (form['food_information_id'] && $check_field('set','details')) || (!form['food_information_id'] && $check_field('add','details')) ">
					</quill-editor>
					<div v-else-if="$check_field('get','details')" v-html="form['details']"></div>
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
				field: "food_information_id",
				url_add: "~/api/food_information/add?",
				url_set: "~/api/food_information/set?",
				url_get_obj: "~/api/food_information/get_obj?",
				url_upload: "~/api/food_information/upload?",

				query: {
					"food_information_id": 0,
				},

				form: {
								"food_name":  '', // 美食名称
										"cover":  '', // 封面
										"food_unit_price":  0, // 美食单价
										"flavor":  '', // 口味
										"food_materials":  '', // 美食材料
										"details":  '', // 详情介绍
											"food_information_id": 0, // ID
						
				},
				disabledObj:{
								"food_name_isDisabled": false,
										"cover_isDisabled": false,
					          			"food_unit_price_isDisabled": false,
										"flavor_isDisabled": false,
										"food_materials_isDisabled": false,
										"details_isDisabled": false,
										},

	
		
		
		
		
		
	
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
					bl = this.$check_action('/food_information/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/food_information/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/food_information/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/food_information/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/food_information/view','get');
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
