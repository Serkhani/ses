package com.school.database_proj.models;

import jakarta.persistence.*;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;

@Entity
@Table(name = "FaultReport")
@EqualsAndHashCode(callSuper = false)
public class FaultReport {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long reportID;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "studentID")
    private Student student;

    private String description;

    private String image;

    private LocalDateTime timestamp;

    private String status;

    // Getters and setters, constructors
}
