package com.lyt.sample.chifan.repository;

import com.lyt.sample.chifan.domain.User;
import com.querydsl.core.types.Predicate;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.querydsl.QueryDslPredicateExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * Created by liuyatao on 16-4-24.
 */
public interface UserDao extends PagingAndSortingRepository<User,Integer> ,QueryDslPredicateExecutor<User> {

    Page<User> getUserByPage(Pageable pageable, Predicate predicate);
}
