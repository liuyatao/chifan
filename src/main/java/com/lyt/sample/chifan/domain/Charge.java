package com.lyt.sample.chifan.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created by Administrator on 2016/4/25.
 */
@Entity
public class Charge {
    private int id;

    @Id
    @Column(name = "ID")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Charge charge = (Charge) o;

        if (id != charge.id) return false;

        return true;
    }

    @Override
    public int hashCode() {
        return id;
    }
}
