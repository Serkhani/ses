package com.school.database_proj.models;

import jakarta.persistence.*;
import lombok.EqualsAndHashCode;

import java.time.LocalTime;

@Entity
@Table(name = "Timetable")
@EqualsAndHashCode(callSuper = false)
public class Timetable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long timetableID;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "studentID")
    private Student student;

    private String courseID;

    private String courseName;

    private String instructorName;

    private String location;

    private String dayOfWeek;

    private LocalTime startTime;

    private LocalTime endTime;

    // Getters and setters, constructors
}
