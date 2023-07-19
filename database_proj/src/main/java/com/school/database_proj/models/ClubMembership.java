package com.school.database_proj.models;

import jakarta.persistence.*;

@Entity
@Table(name = "ClubMembership")
public class ClubMembership {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long membershipID;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "clubID")
    private Club club;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "studentID")
    private Student student;

    // Getters and setters, constructors
}
