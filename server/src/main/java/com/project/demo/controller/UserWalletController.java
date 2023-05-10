package com.project.demo.controller;

import com.project.demo.entity.UserWallet;
import com.project.demo.service.UserWalletService;
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
 * 用户钱包：(UserWallet)表控制层
 *
 */
@RestController
@RequestMapping("/user_wallet")
public class UserWalletController extends BaseController<UserWallet, UserWalletService> {

    /**
     * 用户钱包对象
     */
    @Autowired
    public UserWalletController(UserWalletService service) {
        setService(service);
    }

    @PostMapping("/add")
    @Transactional
    public Map<String, Object> add(HttpServletRequest request) throws IOException {
        Map<String,Object> paramMap = service.readBody(request.getReader());
        this.addMap(paramMap);
        return success(1);
    }

}
