package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 * 美食订单：(FoodOrder)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "FoodOrder")
public class FoodOrder implements Serializable {

    // FoodOrder编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "food_order_id")
    private Integer food_order_id;

    // 订单号
    @Basic
    private String order_number;
    // 美食名称
    @Basic
    private String food_name;
    // 封面
    @Basic
    private String cover;
    // 美食单价
    @Basic
    private Integer food_unit_price;
    // 口味
    @Basic
    private String flavor;
    // 美食材料
    @Basic
    private String food_materials;
    // 下单日期
    @Basic
    private Timestamp order_date;
    // 普通用户
    @Basic
    private Integer ordinary_users;
    // 购买数量
    @Basic
    private Integer purchase_quantity;
    // 支付金额
    @Basic
    private String payment_amount;



    // 审核状态
    @Basic
    private String examine_state;








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
