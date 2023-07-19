package com.school.database_proj.models;

import jakarta.persistence.*;
import lombok.EqualsAndHashCode;

import java.time.LocalDate;

@Entity
@Table(name = "Assignment")
@EqualsAndHashCode(callSuper = false)
public class Assignment {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long assignmentID;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "facultyID")
    private Faculty faculty;

    private String title;

    private String description;

    private LocalDate deadline;

    private String file;

    // Getters and setters, constructors
}
