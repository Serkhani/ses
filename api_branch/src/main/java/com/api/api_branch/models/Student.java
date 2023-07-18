package com.api.api_branch.models;


import jakarta.persistence.*;
import lombok.EqualsAndHashCode;

import java.time.LocalDate;

import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

@Entity
@Table(name = "students") 
@EqualsAndHashCode(callSuper = false)
public class Student {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "student_id")
    private Long studentID4.;

    @Column(name = "full_name")
    private String name;

    @Column(name = "email")
    private String email;

    @Column(name = "student_id_number")
    private String studentNumber;

    @Column(name = "enrollment_date")
    private LocalDate batchYear;

    @Column(name = "clubMemberships")
    private String clubMemberships;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "userID")
    private User user;

}