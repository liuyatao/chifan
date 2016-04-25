package com.lyt.sample.chifan.repository;

import com.lyt.sample.chifan.domain.Theorder;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QueryDslPredicateExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

/**
 * Created by Administrator on 2016/4/25.
 */
public interface OrderDao extends PagingAndSortingRepository<Theorder,Integer>,QueryDslPredicateExecutor<Theorder> {

    //获取个人账单总充值
    @Query("select sum(o.number)from Theorder o where o.category=0 and o.userName=:userName")
    Double getPersonalTotalCharge(@Param("userName")String userName);

    //获取个人总消费
    @Query("select sum(o.number) from Theorder o where o.category=1 and o.userName=:userName")
    Double getPersonalTotalConsume(@Param("userName")String userName);
}
