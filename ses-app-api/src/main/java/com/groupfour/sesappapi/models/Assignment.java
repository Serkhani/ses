package com.groupfour.sesappapi.models;

import java.time.LocalDate;

import jakarta.persistence.*;

@Entity
public class Assignment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long assignmentId;

    @ManyToOne
    @JoinColumn(name = "lecturer_id")
    private Lecturer lecturer;

    @ManyToOne
    @JoinColumn(name = "course_id")
    private Course course;

    @Column(nullable = false)
    private String topic;

    @Column(columnDefinition = "TEXT")
    private String assignmentDescription;

    @Lob
    private byte[] image;

    @Column(nullable = false)
    private LocalDate deadline;

    @Column(nullable = false)
    private String status = "Open";

    // Constructors, getters, and setters
}
