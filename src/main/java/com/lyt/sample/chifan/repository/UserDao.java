package com.lyt.sample.chifan.repository;

import com.lyt.sample.chifan.domain.User;
import org.springframework.data.querydsl.QueryDslPredicateExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * Created by liuyatao on 16-4-24.
 */
public interface UserDao extends PagingAndSortingRepository<User,Integer> ,QueryDslPredicateExecutor<User> {

}
