package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 * 充值信息：(RechargeInformation)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "RechargeInformation")
public class RechargeInformation implements Serializable {

    // RechargeInformation编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "recharge_information_id")
    private Integer recharge_information_id;

    // 充值号
    @Basic
    private String recharge_number;
    // 普通用户
    @Basic
    private Integer ordinary_users;
    // 充值金额
    @Basic
    private Integer recharge_amount;
    // 充值日期
    @Basic
    private Timestamp recharge_date;



    // 审核状态
    @Basic
    private String examine_state;

    // 支付状态
    @Basic
    private String pay_state;

    // 支付类型: 微信、支付宝、网银
    @Basic
    private String pay_type;







    // 审核回复
    @Basic
    private String examine_reply;



    // 更新时间
    @Basic
    private Timestamp update_time;

    // 创建时间
    @Basic
    private Timestamp create_time;

}
