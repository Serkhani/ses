package com.school.database_proj.models;

import jakarta.persistence.*;
import lombok.EqualsAndHashCode;

import java.time.LocalDate;
import java.time.LocalTime;

@Entity
@Table(name = "Event")
@EqualsAndHashCode(callSuper = false)
public class Event {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long eventID;

    private String title;

    private String description;

    private LocalDate date;

    private LocalTime startTime;

    private LocalTime endTime;

    private String location;

    // Getters and setters, constructors
}
