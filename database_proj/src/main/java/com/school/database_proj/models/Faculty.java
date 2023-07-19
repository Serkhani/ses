package com.school.database_proj.models;

import jakarta.persistence.*;
import lombok.EqualsAndHashCode;

@Entity
@Table(name = "Faculty")
@EqualsAndHashCode(callSuper = false)
public class Faculty {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long facultyID;

    private String name;

    private String email;

    private String department;

    private String officeLocation;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "userID")
    private User user;

}
