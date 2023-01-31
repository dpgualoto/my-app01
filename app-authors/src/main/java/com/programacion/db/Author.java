package com.programacion.db;

import io.quarkus.hibernate.orm.panache.PanacheEntity;


import javax.persistence.*;


@Entity
@Table(name = "authors")
public class Author extends PanacheEntity {

    private String last_name;
    private String first_name;

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }



}
