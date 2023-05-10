package com.project.demo.controller;

import com.project.demo.entity.RechargeConfirmation;
import com.project.demo.service.RechargeConfirmationService;
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
 * 充值确认：(RechargeConfirmation)表控制层
 *
 */
@RestController
@RequestMapping("/recharge_confirmation")
public class RechargeConfirmationController extends BaseController<RechargeConfirmation, RechargeConfirmationService> {

    /**
     * 充值确认对象
     */
    @Autowired
    public RechargeConfirmationController(RechargeConfirmationService service) {
        setService(service);
    }

    @PostMapping("/add")
    @Transactional
    public Map<String, Object> add(HttpServletRequest request) throws IOException {
        Map<String,Object> paramMap = service.readBody(request.getReader());
        Map<String, String> maprecharge_number = new HashMap<>();
        maprecharge_number.put("recharge_number",String.valueOf(paramMap.get("recharge_number")));
        List listrecharge_number = service.select(maprecharge_number, new HashMap<>()).getResultList();
        if (listrecharge_number.size()>0){
            return error(30000, "字段充值号内容不能重复");
        }
        this.addMap(paramMap);
        String sql = "SELECT MAX(recharge_confirmation_id) AS max FROM "+"`recharge_confirmation`";
        Query select = service.runCountSql(sql);
        Integer max = (Integer) select.getSingleResult();
        sql = "UPDATE `user_wallet` INNER JOIN `recharge_confirmation` ON user_wallet.ordinary_users=recharge_confirmation.ordinary_users SET user_wallet.wallet_amount= user_wallet.wallet_amount + recharge_confirmation.recharge_amount WHERE recharge_confirmation.recharge_confirmation_id="+max;
        select = service.runCountSql(sql);
        select.executeUpdate();
        return success(1);
    }

}
