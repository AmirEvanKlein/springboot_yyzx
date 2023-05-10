<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','no_of_swimming_pool') || $check_field('add','no_of_swimming_pool') || $check_field('set','no_of_swimming_pool')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="泳馆编号" prop="no_of_swimming_pool">
												<el-input id="no_of_swimming_pool" v-model="form['no_of_swimming_pool']" placeholder="请输入泳馆编号"
							  v-if="user_group === '管理员' || (form['swimming_hall_information_id'] && $check_field('set','no_of_swimming_pool')) || (!form['swimming_hall_information_id'] && $check_field('add','no_of_swimming_pool'))" :disabled="true"></el-input>
					<div v-else-if="$check_field('get','no_of_swimming_pool')">{{form['no_of_swimming_pool']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','name_of_swimming_pool') || $check_field('add','name_of_swimming_pool') || $check_field('set','name_of_swimming_pool')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="泳馆名称" prop="name_of_swimming_pool">
												<el-input id="name_of_swimming_pool" v-model="form['name_of_swimming_pool']" placeholder="请输入泳馆名称"
							  v-if="user_group === '管理员' || (form['swimming_hall_information_id'] && $check_field('set','name_of_swimming_pool')) || (!form['swimming_hall_information_id'] && $check_field('add','name_of_swimming_pool'))" :disabled="disabledObj['name_of_swimming_pool_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','name_of_swimming_pool')">{{form['name_of_swimming_pool']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','cover') || $check_field('add','cover') || $check_field('set','cover')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="封面" prop="cover">
								<el-upload :disabled="disabledObj['cover_isDisabled']" id="cover" class="avatar-uploader" drag
						accept="image/gif, image/jpeg, image/png, image/jpg" action="" :http-request="upload_cover"
						:show-file-list="false" v-if="user_group === '管理员' || (form['swimming_hall_information_id'] && $check_field('set','cover')) || (!form['swimming_hall_information_id'] && $check_field('add','cover'))">
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
							  v-if="user_group === '管理员' || (form['swimming_hall_information_id'] && $check_field('set','location_of_swimming_pool')) || (!form['swimming_hall_information_id'] && $check_field('add','location_of_swimming_pool'))" :disabled="disabledObj['location_of_swimming_pool_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','location_of_swimming_pool')">{{form['location_of_swimming_pool']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','capacity') || $check_field('add','capacity') || $check_field('set','capacity')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="容纳人数" prop="capacity">
								<el-input-number id="capacity" v-model.number="form['capacity']"
						v-if="user_group === '管理员' || (form['swimming_hall_information_id'] && $check_field('set','capacity')) || (!form['swimming_hall_information_id'] && $check_field('add','capacity'))" :disabled="disabledObj['capacity_isDisabled']"></el-input-number>
					<div v-else-if="$check_field('get','capacity')">{{form['capacity']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','reservation_unit_price') || $check_field('add','reservation_unit_price') || $check_field('set','reservation_unit_price')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="预约单价" prop="reservation_unit_price">
								<el-input-number id="reservation_unit_price" v-model.number="form['reservation_unit_price']"
						v-if="user_group === '管理员' || (form['swimming_hall_information_id'] && $check_field('set','reservation_unit_price')) || (!form['swimming_hall_information_id'] && $check_field('add','reservation_unit_price'))" :disabled="disabledObj['reservation_unit_price_isDisabled']"></el-input-number>
					<div v-else-if="$check_field('get','reservation_unit_price')">{{form['reservation_unit_price']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','details_of_swimming_pool') || $check_field('add','details_of_swimming_pool') || $check_field('set','details_of_swimming_pool')" :xs="24" :sm="24" :lg="24" class="el_form_editor_warp">
				<el-form-item label="泳馆详情" prop="details_of_swimming_pool">
					<quill-editor v-model.number="form['details_of_swimming_pool']"
						v-if="user_group === '管理员' || (form['swimming_hall_information_id'] && $check_field('set','details_of_swimming_pool')) || (!form['swimming_hall_information_id'] && $check_field('add','details_of_swimming_pool')) ">
					</quill-editor>
					<div v-else-if="$check_field('get','details_of_swimming_pool')" v-html="form['details_of_swimming_pool']"></div>
				</el-form-item>
			</el-col>
					
	
				<el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="计时器标题" prop="timer_title">
					<el-input id="timer_title" v-model="form['timer_title']" placeholder="请输入计时器标题"
							  v-if="user_group === '管理员' || $check_action('/swimming_hall_information/view','set') || $check_action('/swimming_hall_information/view','add')" :disabled="disabledObj['timer_title_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','timer_title')">{{form['timer_title']}}</div>
				</el-form-item>
			</el-col>
			<el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="计时开始时间" prop="timing_start_time">
					<el-date-picker id="timing_start_time" v-model="form['timing_start_time']" placeholder="选择计时器开始时间"
						v-if="user_group === '管理员' || $check_action('/swimming_hall_information/view','set') || $check_action('/swimming_hall_information/view','add')" :disabled="disabledObj['timing_start_time_isDisabled']" type="datetime" >
					</el-date-picker>
					<div v-else-if="$check_field('get','timing_start_time')">{{form['timing_start_time']}}</div>
				</el-form-item>
			</el-col>
			<el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="计时结束时间" prop="timing_end_time">
					<el-date-picker id="timing_end_time" v-model="form['timing_end_time']" placeholder="选择计时器开始时间"
						v-if="user_group === '管理员' || $check_action('/swimming_hall_information/view','set') || $check_action('/swimming_hall_information/view','add')" :disabled="disabledObj['timing_end_time_isDisabled']" type="datetime" >
					</el-date-picker>
					<div v-else-if="$check_field('get','timing_end_time')">{{form['timing_end_time']}}</div>
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
										"capacity":  0, // 容纳人数
										"reservation_unit_price":  0, // 预约单价
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
					          			"capacity_isDisabled": false,
					          			"reservation_unit_price_isDisabled": false,
										"details_of_swimming_pool_isDisabled": false,
										"timer_title_isDisabled": false,
					"timing_start_time_isDisabled": false,
					"timing_end_time_isDisabled": false,
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


																					
				if (this.form["timing_end_time"] && JSON.stringify(this.form["timing_end_time"]).indexOf("-")===-1) {
					this.form["timing_end_time"] = this.$toTime(parseInt(this.form["timing_end_time"]), "yyyy-MM-dd hh:mm:ss")
				}
				if (this.form["timing_start_time"] && JSON.stringify(this.form["timing_start_time"]).indexOf("-")===-1) {
					this.form["timing_start_time"] = this.$toTime(parseInt(this.form["timing_start_time"]), "yyyy-MM-dd hh:mm:ss")
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
