package com.lyt.sample.chifan.domain;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by Administrator on 2016/4/25.
 */
@Entity
@Table(name = "main_order", schema = "", catalog = "chifan")
public class MainOrder {
    private int id;
    private Double money;
    private Integer category;
    private Date date;


    @Basic
    @Column(name = "Category")
    public Integer getCategory() {
        return category;
    }

    public void setCategory(Integer category) {
        this.category = category;
    }

    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "money")
    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }


    @Basic
    @Column(name = "date")
    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        MainOrder mainOrder = (MainOrder) o;

        if (id != mainOrder.id) return false;
        if (money != null ? !money.equals(mainOrder.money) : mainOrder.money != null) return false;

        if (date != null ? !date.equals(mainOrder.date) : mainOrder.date != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (money != null ? money.hashCode() : 0);
        result = 31 * result + (date != null ? date.hashCode() : 0);
        return result;
    }
}
