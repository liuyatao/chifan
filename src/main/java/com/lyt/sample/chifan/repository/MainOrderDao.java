package com.lyt.sample.chifan.repository;

import com.lyt.sample.chifan.domain.MainOrder;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QueryDslPredicateExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * Created by Administrator on 2016/4/25.
 */
public interface MainOrderDao extends PagingAndSortingRepository<MainOrder,Integer> ,QueryDslPredicateExecutor<MainOrder>{



    @Query("select SUM (mo.money)from MainOrder mo where mo.category=0")
    Float getTotalCharge();


    //获取总消费
    @Query("select SUM (mo.money)from MainOrder mo where mo.category=1")
    Float getTotalConsume();



}
