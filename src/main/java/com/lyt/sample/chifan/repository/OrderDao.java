package com.lyt.sample.chifan.repository;

import com.lyt.sample.chifan.domain.Order;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import java.awt.geom.Arc2D;
import java.awt.print.Pageable;

/**
 * Created by liuyatao on 16-4-24.
 */
public interface OrderDao extends PagingAndSortingRepository<Order,Integer> {

    //获取账单总充值
    @Query("select sum (o.number)from Order o where o.type=0")
    Float getTotalCharge();

    //获取总消费
    @Query("select sum (o.number)from Order o where o.type=1")
    Float getTotalConsume();


    //获取个人账单总充值
    @Query("select sum (o.number)from Order o where o.type=0 and o.userName=:userName")
    Float getPersonalTotalCharge(@Param("userName")String userName);

    //获取个人总消费
    @Query("select sum (o.number)from Order o where o.type=1 and o.userName=:userName")
    Float getPersonalTotalConsume();



}
