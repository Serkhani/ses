package com.groupfour.sesappapi.models;

import java.time.LocalDate;

import jakarta.persistence.*;

@Entity
public class Fault {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long faultId;

    @Column(nullable = false)
    private String faultType;
    
    @Column(columnDefinition = "TEXT")
    private String description;
    
    @Column(nullable = false)
    private String location;

    @ManyToOne
    @JoinColumn(name = "reported_by")
    private User reporter;

    @Column(nullable = false, updatable = false)
    private LocalDate dateReported = LocalDate.now();

    @Column(nullable = false)
    private String status = "Open";

    // Constructors, getters, and setters
}
