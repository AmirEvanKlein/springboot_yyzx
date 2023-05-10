<template>
	<view class="diy_details diy_div_swimming_hall_information">
		<view v-if="Object.keys(obj).length!==0" class="warp">
			<view class="container">
				<view class="row">
					<view v-if="$check_field('get','no_of_swimming_pool')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>泳馆编号:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["no_of_swimming_pool"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','name_of_swimming_pool')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>泳馆名称:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["name_of_swimming_pool"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','cover')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>封面:</span>
						</view>
							<view class="diy_field diy_img">
							<image style="width:100%;height:auto;" :src="$fullUrl(obj['cover'])" mode="widthFix"></image>
						</view>
						</view>
					<view v-if="$check_field('get','location_of_swimming_pool')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>泳馆位置:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["location_of_swimming_pool"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','capacity')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>容纳人数:</span>
						</view>
							<view class="diy_field diy_number">
							<text>
								{{ obj["capacity"] }}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','reservation_unit_price')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>预约单价:</span>
						</view>
							<view class="diy_field diy_number">
							<text>
								{{ obj["reservation_unit_price"] }}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','details_of_swimming_pool')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>泳馆详情:</span>
						</view>
							<view class="diy_field diy_html">
							<rich-text v-html="obj['details_of_swimming_pool']" ></rich-text>
						</view>
						</view>
				</view>
			</view>
		</view>

			<view class="warp">
			<view class="container">
				<view class="row">
					<view class="col">
						<button type="button" class="diy_btn" @click="to_form('/pages/venue_reservation/edit')" v-if="$check_action('/venue_reservation/edit','add') || $check_action('/venue_reservation/edit','set')" >预约</button>
					</view>
				</view>
			</view>
		</view>
		</view>
</template>

<script>
	import mixin from "@/libs/mixins/component.js";
	export default {
		mixins: [mixin],
		props: {
			obj_goods: {
				type: Object,
				default(){
					return {}
				}
			},
			query:{
				type: Object,
				default(){
					return {
						swimming_hall_information_id: 0
					}
				}
			}
		},
		data() {
			return {
				obj_goods_type: {},
				obj: {},
										}
		},
		methods: {
			async get_obj_goods_type() {
				var res = await this.$get("~/api/goods_type/get_obj", {
					name: this.obj_goods.type
				})

				if (res.result.obj) {
					this.obj_goods_type = res.result.obj
				} else {
					console.log("没有请求到商品分类");
				}
			},
			async get_obj_by_goods() {
				var {
					source_table,
					source_field
				} = this.obj_goods_type
				var {
					source_id
				} = this.obj_goods
				var query = {}
				query[source_field] = source_id
				this.$get("~/api/" + source_table + "/get_obj", {}, (res) => {
					if (res.result.obj) {
						this.obj = res.result.obj
					} else {
						console.log("没有请求到商品分类");
					}
				})
			},
			async get_obj_by_id(){
				var res = await this.$get("~/api/swimming_hall_information/get_obj", {
					swimming_hall_information_id:this.query.swimming_hall_information_id
				})

				if (res.result && res.result.obj) {
					this.obj = res.result.obj
				} else {
					console.log("没有请求到商品分类");
				}
			},
									},
		created() {
									},
		async onLoad(){
			if (Object.keys(this.obj_goods).length !== 0) {
				await this.get_obj_goods_type();
				await this.get_obj_by_goods();
			} else if (this.query["swimming_hall_information_id"] !==0) {
				await this.get_obj_by_id();
			}
		}
	}
</script>

<style scoped>
	.div_swimming_hall_information_details {}

	.details {
		background-color: #fff;
		margin-bottom: 0.5rem;
		padding: 1rem;
		font-size: 10px;
	}

	.item {
		display: flex;
		padding: 0.2rem 0;
		border-bottom: 1px solid #eee;
	}

	.left_text {
		flex: 0 0 25%;
	}

	.right_text {
		flex: 0 0 75%;
	}
	.edit_nav{
		text-align: center;
		background-color: #fff;
		padding: 0.3rem;
		margin: 0.1rem 1rem;
		border: 1px solid #eee;
		border-radius: 0.5rem;
	}
</style>
