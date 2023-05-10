package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 * 场馆预约：(VenueReservation)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "VenueReservation")
public class VenueReservation implements Serializable {

    // VenueReservation编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "venue_reservation_id")
    private Integer venue_reservation_id;

    // 预约号
    @Basic
    private String appointment_no;
    // 泳馆编号
    @Basic
    private String no_of_swimming_pool;
    // 泳馆名称
    @Basic
    private String name_of_swimming_pool;
    // 封面
    @Basic
    private String cover;
    // 泳馆位置
    @Basic
    private String location_of_swimming_pool;
    // 下单日期
    @Basic
    private Timestamp order_date;
    // 预约单价
    @Basic
    private Integer reservation_unit_price;
    // 普通用户
    @Basic
    private Integer ordinary_users;
    // 预约人数
    @Basic
    private Integer number_of_appointments;



    // 审核状态
    @Basic
    private String examine_state;



	// 扫码状态
	@Basic
	private String qrcode_img;

	// 二维码标题
	@Basic
	private String qrcode_title;





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
