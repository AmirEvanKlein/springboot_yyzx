package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 * 美食信息：(FoodInformation)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "FoodInformation")
public class FoodInformation implements Serializable {

    // FoodInformation编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "food_information_id")
    private Integer food_information_id;

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
    // 详情介绍
    @Basic
    private String details;

    // 点击数
    @Basic
    private Integer hits;

    // 点赞数
    @Basic
    private Integer praise_len;












    // 更新时间
    @Basic
    private Timestamp update_time;

    // 创建时间
    @Basic
    private Timestamp create_time;

}
