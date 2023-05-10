package com.project.demo.controller;

import com.project.demo.entity.PaymentInformation;
import com.project.demo.service.PaymentInformationService;
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
 * 支付信息：(PaymentInformation)表控制层
 *
 */
@RestController
@RequestMapping("/payment_information")
public class PaymentInformationController extends BaseController<PaymentInformation, PaymentInformationService> {

    /**
     * 支付信息对象
     */
    @Autowired
    public PaymentInformationController(PaymentInformationService service) {
        setService(service);
    }

    @PostMapping("/add")
    @Transactional
    public Map<String, Object> add(HttpServletRequest request) throws IOException {
        Map<String,Object> paramMap = service.readBody(request.getReader());
        Map<String, String> mapappointment_no = new HashMap<>();
        mapappointment_no.put("appointment_no",String.valueOf(paramMap.get("appointment_no")));
        List listappointment_no = service.select(mapappointment_no, new HashMap<>()).getResultList();
        if (listappointment_no.size()>0){
            return error(30000, "字段预约号内容不能重复");
        }
        this.addMap(paramMap);
        String sql = "SELECT MAX(payment_information_id) AS max FROM "+"`payment_information`";
        Query select = service.runCountSql(sql);
        Integer max = (Integer) select.getSingleResult();
        sql = ("SELECT count(*) count FROM `user_wallet` INNER JOIN `payment_information` ON user_wallet.ordinary_users=payment_information.ordinary_users WHERE user_wallet.wallet_amount < payment_information.payment_amount AND payment_information.payment_information_id="+max).replaceAll("&#60;","<");
        select = service.runCountSql(sql);
        Integer count = Integer.valueOf(String.valueOf(select.getSingleResult()));
        if(count>0){
            sql = "delete from "+"payment_information"+" WHERE "+"payment_information_id"+" ="+max;
            select = service.runCountSql(sql);
            select.executeUpdate();
            return error(30000,"钱包余额不足！");
        }
        sql = "UPDATE `user_wallet` INNER JOIN `payment_information` ON user_wallet.ordinary_users=payment_information.ordinary_users SET user_wallet.wallet_amount= user_wallet.wallet_amount - payment_information.payment_amount WHERE payment_information.payment_information_id="+max;
        select = service.runCountSql(sql);
        select.executeUpdate();
        return success(1);
    }

}
