package com.groupfour.sesappapi.models;


import jakarta.persistence.*;
@Entity
public class Course {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long courseId;
    
    @Column(nullable = false, unique = true)
    private String courseName;
    
    @OneToOne
    @JoinColumn(name = "department_id")
    private Department department;
    
    @Column(nullable = false)
    private Integer creditHours;
    
    @Column(columnDefinition = "TEXT")
    private String description;
    
    @Column(nullable = false)
    private String semester;
    
    // Constructors, getters, and setters
}
