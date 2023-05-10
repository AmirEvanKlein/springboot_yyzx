package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 * 泳馆信息：(SwimmingHallInformation)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "SwimmingHallInformation")
public class SwimmingHallInformation implements Serializable {

    // SwimmingHallInformation编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "swimming_hall_information_id")
    private Integer swimming_hall_information_id;

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
    // 容纳人数
    @Basic
    private Integer capacity;
    // 预约单价
    @Basic
    private Integer reservation_unit_price;
    // 泳馆详情
    @Basic
    private String details_of_swimming_pool;







	// 计时器标题
	@Basic
	private String timer_title;

	// 计时开始时间
	@Basic
	private Timestamp timing_start_time;

	// 计时结束时间
	@Basic
	private Timestamp timing_end_time;







    // 更新时间
    @Basic
    private Timestamp update_time;

    // 创建时间
    @Basic
    private Timestamp create_time;

}
