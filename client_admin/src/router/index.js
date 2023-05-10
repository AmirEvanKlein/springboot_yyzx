import Vue from 'vue';
import VueRouter from 'vue-router';
import index from '../views/index.vue';
import login from '../views/login.vue';
import forgot from '../views/forgot.vue';
Vue.use(VueRouter)

const routes = [
	// 主页
	{
		path: '/',
		name: 'index',
		component: index,
		meta: {
			index: 0,
			title: '首页'
		}
	},

	// 登录
	{
		path: '/login',
		name: 'login',
		component: login,
		meta: {
			index: 0,
			title: '登录'
		}
	},


	// 忘记密码
	{
		path: '/forgot',
		name: "forgot",
		component: forgot,
		meta: {
			index: 0,
			title: '忘记密码'
		}
	},

	// 修改密码
	{
		path: '/user/password',
		name: "password",
		component: () => import("../views/user/password.vue"),
		meta: {
			index: 0,
			title: '修改密码'
		}
	},

	// 视频播放页
	{
		path: "/media/video",
		name: "video",
		component: () => import('../views/media/video.vue'),
		meta: {
			index: 0,
			title: "视频"
		}
	},

	// 音频播放页
	{
		path: "/media/audio",
		name: "audio",
		component: () => import('../views/media/audio.vue'),
		meta: {
			index: 0,
			title: "音频"
		}
	},



	// 友情链接路由
	// {
	// 	path: '/link/table',
	// 	name: 'link_table',
	// 	component: () => import('../views/link/table.vue'),
	// 	meta: {
	// 		index: 0,
	// 		title: '链接列表'
	// 	}
	// },
	// {
	// 	path: '/link/view',
	// 	name: 'link_view',
	// 	component: () => import('../views/link/view.vue'),
	// 	meta: {
	// 		index: 0,
	// 		title: '链接详情'
	// 	}
	// },

	// 轮播图路由
	{
		path: '/slides/table',
		name: 'slides_table',
		component: () => import('../views/slides/table.vue'),
		meta: {
			index: 0,
			title: '轮播图列表'
		}
	},
	{
		path: '/slides/view',
		name: 'slides_view',
		component: () => import('../views/slides/view.vue'),
		meta: {
			index: 0,
			title: '轮播图详情'
		}
	},
	
	// 广告路由
	// {
	// 	path: '/ad/table',
	// 	name: 'ad_table',
	// 	component: () => import('../views/ad/table.vue'),
	// 	meta: {
	// 		index: 0,
	// 		title: '广告列表'
	// 	}
	// },
	// {
	// 	path: '/ad/view',
	// 	name: 'ad_view',
	// 	component: () => import('../views/ad/view.vue'),
	// 	meta: {
	// 		index: 0,
	// 		title: '广告详情'
	// 	}
	// },



	// 公告路由
	{
		path: '/notice/table',
		name: 'notice_table',
		component: () => import('../views/notice/table.vue'),
		meta: {
			index: 0,
			title: '公告信息列表'
		}
	},
	{
		path: '/notice/view',
		name: 'notice_view',
		component: () => import('../views/notice/view.vue'),
		meta: {
			index: 0,
			title: '公告信息详情'
		}
	},


	// 评论路由
	{
		path: '/comment/table',
		name: 'comment_table',
		component: () => import('../views/comment/table.vue'),
		meta: {
			index: 0,
			title: '评论列表'
		}
	},
	{
		path: '/comment/view',
		name: 'comment_view',
		component: () => import('../views/comment/view.vue'),
		meta: {
			index: 0,
			title: '评论详情'
		}
	},

	// 泳馆信息路由
	{
		path: '/swimming_hall_information/table',
		name: 'swimming_hall_information_table',
		component: () => import('../views/swimming_hall_information/table.vue'),
		meta: {
			index: 0,
			title: '泳馆信息列表'
		}
	},
	{
		path: '/swimming_hall_information/view',
		name: 'swimming_hall_information_view',
		component: () => import('../views/swimming_hall_information/view.vue'),
		meta: {
			index: 0,
			title: '泳馆信息详情'
		}
	},
	// 场馆预约路由
	{
		path: '/venue_reservation/table',
		name: 'venue_reservation_table',
		component: () => import('../views/venue_reservation/table.vue'),
		meta: {
			index: 0,
			title: '场馆预约列表'
		}
	},
	{
		path: '/venue_reservation/view',
		name: 'venue_reservation_view',
		component: () => import('../views/venue_reservation/view.vue'),
		meta: {
			index: 0,
			title: '场馆预约详情'
		}
	},
	// 支付信息路由
	{
		path: '/payment_information/table',
		name: 'payment_information_table',
		component: () => import('../views/payment_information/table.vue'),
		meta: {
			index: 0,
			title: '支付信息列表'
		}
	},
	{
		path: '/payment_information/view',
		name: 'payment_information_view',
		component: () => import('../views/payment_information/view.vue'),
		meta: {
			index: 0,
			title: '支付信息详情'
		}
	},
	// 用户钱包路由
	{
		path: '/user_wallet/table',
		name: 'user_wallet_table',
		component: () => import('../views/user_wallet/table.vue'),
		meta: {
			index: 0,
			title: '用户钱包列表'
		}
	},
	{
		path: '/user_wallet/view',
		name: 'user_wallet_view',
		component: () => import('../views/user_wallet/view.vue'),
		meta: {
			index: 0,
			title: '用户钱包详情'
		}
	},
	// 充值信息路由
	{
		path: '/recharge_information/table',
		name: 'recharge_information_table',
		component: () => import('../views/recharge_information/table.vue'),
		meta: {
			index: 0,
			title: '充值信息列表'
		}
	},
	{
		path: '/recharge_information/view',
		name: 'recharge_information_view',
		component: () => import('../views/recharge_information/view.vue'),
		meta: {
			index: 0,
			title: '充值信息详情'
		}
	},
	// 充值确认路由
	{
		path: '/recharge_confirmation/table',
		name: 'recharge_confirmation_table',
		component: () => import('../views/recharge_confirmation/table.vue'),
		meta: {
			index: 0,
			title: '充值确认列表'
		}
	},
	{
		path: '/recharge_confirmation/view',
		name: 'recharge_confirmation_view',
		component: () => import('../views/recharge_confirmation/view.vue'),
		meta: {
			index: 0,
			title: '充值确认详情'
		}
	},
	// 美食信息路由
	{
		path: '/food_information/table',
		name: 'food_information_table',
		component: () => import('../views/food_information/table.vue'),
		meta: {
			index: 0,
			title: '美食信息列表'
		}
	},
	{
		path: '/food_information/view',
		name: 'food_information_view',
		component: () => import('../views/food_information/view.vue'),
		meta: {
			index: 0,
			title: '美食信息详情'
		}
	},
	// 美食订单路由
	{
		path: '/food_order/table',
		name: 'food_order_table',
		component: () => import('../views/food_order/table.vue'),
		meta: {
			index: 0,
			title: '美食订单列表'
		}
	},
	{
		path: '/food_order/view',
		name: 'food_order_view',
		component: () => import('../views/food_order/view.vue'),
		meta: {
			index: 0,
			title: '美食订单详情'
		}
	},
	// 普通用户路由
	{
		path: '/ordinary_users/table',
		name: 'ordinary_users_table',
		component: () => import('../views/ordinary_users/table.vue'),
		meta: {
			index: 0,
			title: '普通用户列表'
		}
	},
	{
		path: '/ordinary_users/view',
		name: 'ordinary_users_view',
		component: () => import('../views/ordinary_users/view.vue'),
		meta: {
			index: 0,
			title: '普通用户详情'
		}
	},

	// 用户路由
	{
		path: '/user/table',
		name: 'user_table',
		component: () => import('../views/user/table.vue'),
		meta: {
			index: 0,
			title: '用户列表'
		}
	},
	{
		path: '/user/view',
		name: 'user_view',
		component: () => import('../views/user/view.vue'),
		meta: {
			index: 0,
			title: '用户详情'
		}
	},
	{
		path: '/user/info',
		name: 'user_info',
		component: () => import('../views/user/info.vue'),
		meta: {
			index: 0,
			title: '个人信息'
		}
	},
	// 用户组路由
	{
		path: '/user_group/table',
		name: 'user_group_table',
		component: () => import('../views/user_group/table.vue'),
		meta: {
			index: 0,
			title: '用户组列表'
		}
	},
	{
		path: '/user_group/view',
		name: 'user_group_view',
		component: () => import('../views/user_group/view.vue'),
		meta: {
			index: 0,
			title: '用户组详情'
		}
	}
]

const router = new VueRouter({
	mode: 'history',
	base: process.env.BASE_URL,
	routes
})

router.beforeEach((to, from, next) => {
	let token = to.query.token;
	if (token){
		$.db.set("token",token,120);
	}
	next();
})

router.afterEach((to, from, next) => {
	let title = "游泳中心管理系统-admin";
	document.title = title;
})

export default router
