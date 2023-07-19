package com.school.database_proj.models;

import jakarta.persistence.*;
import lombok.EqualsAndHashCode;

import java.time.LocalDate;

@Entity
@Table(name = "Task")
@EqualsAndHashCode(callSuper = false)
public class Task {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long taskID;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "studentID")
    private Student student;

    private String title;

    private String description;

    private LocalDate deadline;

    private boolean completed;

    // Getters and setters, constructors
}
