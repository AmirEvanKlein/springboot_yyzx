package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 * 充值确认：(RechargeConfirmation)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "RechargeConfirmation")
public class RechargeConfirmation implements Serializable {

    // RechargeConfirmation编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "recharge_confirmation_id")
    private Integer recharge_confirmation_id;

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














    // 更新时间
    @Basic
    private Timestamp update_time;

    // 创建时间
    @Basic
    private Timestamp create_time;

}
