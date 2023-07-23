package com.groupfour.sesappapi.models;

import jakarta.persistence.*;

@Entity
public class Department {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long departmentId;

    @Column(nullable = false, unique = true)
    private String departmentName;

    @Column(nullable = false)
    private String headOfDepartment;
    @Lob
    private byte[][] departmentTimeTable;//list of images

    // Constructors, getters, and setters
}