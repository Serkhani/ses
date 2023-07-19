package com.school.database_proj.models;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "students") 
public class Student {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "student_id")
    private Long studentID;

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

    public void setStudentID(Long id) {
    }

}
