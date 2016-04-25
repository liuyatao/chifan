package com.lyt.sample.chifan.domain;

import javax.persistence.*;

/**
 * Created by Administrator on 2016/4/25.
 */
@Entity
public class Theorder {
    private int id;
    private Double number;
    private String userName;
    private Integer mainId;
    private Integer category;

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
    @Column(name = "Number")
    public Double getNumber() {
        return number;
    }

    public void setNumber(Double number) {
        this.number = number;
    }

    @Basic
    @Column(name = "UserName")
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Basic
    @Column(name = "MainID")
    public Integer getMainId() {
        return mainId;
    }

    public void setMainId(Integer mainId) {
        this.mainId = mainId;
    }

    @Basic
    @Column(name = "Category")
    public Integer getCategory() {
        return category;
    }

    public void setCategory(Integer category) {
        this.category = category;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Theorder theorder = (Theorder) o;

        if (id != theorder.id) return false;
        if (number != null ? !number.equals(theorder.number) : theorder.number != null) return false;
        if (userName != null ? !userName.equals(theorder.userName) : theorder.userName != null) return false;
        if (mainId != null ? !mainId.equals(theorder.mainId) : theorder.mainId != null) return false;
        if (category != null ? !category.equals(theorder.category) : theorder.category != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (number != null ? number.hashCode() : 0);
        result = 31 * result + (userName != null ? userName.hashCode() : 0);
        result = 31 * result + (mainId != null ? mainId.hashCode() : 0);
        result = 31 * result + (category != null ? category.hashCode() : 0);
        return result;
    }
}
