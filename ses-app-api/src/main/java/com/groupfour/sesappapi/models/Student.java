package com.groupfour.sesappapi.models;

import java.time.LocalDate;

import jakarta.persistence.*;

@Entity
public class Student {
    @Id
    private Long userId;

    @OneToOne
    @MapsId
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "department_id")
    private Department department;

    @Column(nullable = false)
    private String fullName;

    @Column(nullable = false)
    private String email;

    @Column(nullable = false)
    private LocalDate enrollmentDate;

    @Column(nullable = false)
    private String programme;

    @Column(nullable = false)
    private Integer graduationYear;

    @Column(nullable = false)
    private Integer currYear;

    @Column(nullable = false)

    private String address;
    @Column(nullable = false)

    private String contactNumber;

    @Column(nullable = false)
    private String gender;
    @Column(nullable = false)

    private String guardianName;
    @Column(nullable = false)

    private String guardianContactNumber;

    @Lob
    private byte[] profilePicture;

    // Constructors, getters, and setters
}
