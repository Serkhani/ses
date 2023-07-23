package com.groupfour.sesappapi.models;

import jakarta.persistence.*;

@Entity
public class Lecturer {
    @Id
    private Long lecturerId;
    
    @OneToOne
    @MapsId
    @JoinColumn(name = "lecturer_id")
    private User user;
    
    @ManyToOne
    @JoinColumn(name = "course_id")
    private Course course;
    
    @ManyToOne
    @JoinColumn(name = "department_id")
    private Department department;
    
    @Column(nullable = false)
    private String fullName;
    
    @Column(nullable = false)
    private String email;
    
    @Column(nullable = false)
    private String contactNumber;
    
    @Column(nullable = false)
    private String gender;
    
    @Lob
    private byte[] profilePicture;
    
    // Constructors, getters, and setters
}
