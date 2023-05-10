package com.project.demo.controller;

import com.project.demo.entity.VenueReservation;
import com.project.demo.service.VenueReservationService;
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
 * 场馆预约：(VenueReservation)表控制层
 *
 */
@RestController
@RequestMapping("/venue_reservation")
public class VenueReservationController extends BaseController<VenueReservation, VenueReservationService> {

    /**
     * 场馆预约对象
     */
    @Autowired
    public VenueReservationController(VenueReservationService service) {
        setService(service);
    }

    @PostMapping("/add")
    @Transactional
    public Map<String, Object> add(HttpServletRequest request) throws IOException {
        Map<String,Object> paramMap = service.readBody(request.getReader());
        this.addMap(paramMap);
        String sql = "SELECT MAX(venue_reservation_id) AS max FROM "+"`venue_reservation`";
        Query select = service.runCountSql(sql);
        Integer max = (Integer) select.getSingleResult();
        sql = ("SELECT count(*) count FROM `swimming_hall_information` INNER JOIN `venue_reservation` ON swimming_hall_information.no_of_swimming_pool=venue_reservation.no_of_swimming_pool WHERE swimming_hall_information.capacity < venue_reservation.number_of_appointments AND venue_reservation.venue_reservation_id="+max).replaceAll("&#60;","<");
        select = service.runCountSql(sql);
        Integer count = Integer.valueOf(String.valueOf(select.getSingleResult()));
        if(count>0){
            sql = "delete from "+"venue_reservation"+" WHERE "+"venue_reservation_id"+" ="+max;
            select = service.runCountSql(sql);
            select.executeUpdate();
            return error(30000,"容纳人数不足！");
        }
        sql = "UPDATE `swimming_hall_information` INNER JOIN `venue_reservation` ON swimming_hall_information.no_of_swimming_pool=venue_reservation.no_of_swimming_pool SET swimming_hall_information.capacity= swimming_hall_information.capacity - venue_reservation.number_of_appointments WHERE venue_reservation.venue_reservation_id="+max;
        select = service.runCountSql(sql);
        select.executeUpdate();
        return success(1);
    }

}
