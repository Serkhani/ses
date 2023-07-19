package com.school.database_proj.models;

import jakarta.persistence.*;
import lombok.EqualsAndHashCode;

@Entity
@Table(name = "ExamPastQuestion")
@EqualsAndHashCode(callSuper = false)
public class ExamPastQuestion {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long questionID;

    private String courseID;

    private String courseName;

    private String year;

    private String file;

    // Getters and setters, constructors
}
