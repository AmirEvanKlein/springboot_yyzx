package com.project.demo.controller;

import com.project.demo.entity.FoodOrder;
import com.project.demo.service.FoodOrderService;
import com.project.demo.controller.base.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * 美食订单：(FoodOrder)表控制层
 *
 */
@RestController
@RequestMapping("/food_order")
public class FoodOrderController extends BaseController<FoodOrder, FoodOrderService> {

    /**
     * 美食订单对象
     */
    @Autowired
    public FoodOrderController(FoodOrderService service) {
        setService(service);
    }

    @PostMapping("/add")
    @Transactional
    public Map<String, Object> add(HttpServletRequest request) throws IOException {
        Map<String,Object> paramMap = service.readBody(request.getReader());
        this.addMap(paramMap);
        String sql = "SELECT MAX(food_order_id) AS max FROM "+"`food_order`";
        Query select = service.runCountSql(sql);
        Integer max = (Integer) select.getSingleResult();
        sql = ("SELECT count(*) count FROM `user_wallet` INNER JOIN `food_order` ON user_wallet.ordinary_users=food_order.ordinary_users WHERE user_wallet.wallet_amount < food_order.payment_amount AND food_order.food_order_id="+max).replaceAll("&#60;","<");
        select = service.runCountSql(sql);
        Integer count = Integer.valueOf(String.valueOf(select.getSingleResult()));
        if(count>0){
            sql = "delete from "+"food_order"+" WHERE "+"food_order_id"+" ="+max;
            select = service.runCountSql(sql);
            select.executeUpdate();
            return error(30000,"用户钱包不足！");
        }
        sql = "UPDATE `user_wallet` INNER JOIN `food_order` ON user_wallet.ordinary_users=food_order.ordinary_users SET user_wallet.wallet_amount= user_wallet.wallet_amount - food_order.payment_amount WHERE food_order.food_order_id="+max;
        select = service.runCountSql(sql);
        select.executeUpdate();
        return success(1);
    }

}
