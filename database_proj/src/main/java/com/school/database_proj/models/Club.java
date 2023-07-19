package com.school.database_proj.models;

import jakarta.persistence.*;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.EqualsAndHashCode;
@EqualsAndHashCode(callSuper = false)
@Entity
@Table(name = "Club")
public class Club {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long clubID;

    private String name;

    private String description;

   
}
