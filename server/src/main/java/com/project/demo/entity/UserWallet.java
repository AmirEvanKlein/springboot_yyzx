package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 * 用户钱包：(UserWallet)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "UserWallet")
public class UserWallet implements Serializable {

    // UserWallet编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_wallet_id")
    private Integer user_wallet_id;

    // 普通用户
    @Basic
    private Integer ordinary_users;
    // 钱包金额
    @Basic
    private Integer wallet_amount;














    // 更新时间
    @Basic
    private Timestamp update_time;

    // 创建时间
    @Basic
    private Timestamp create_time;

}
