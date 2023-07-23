package com.groupfour.sesappapi.models;

import jakarta.persistence.*;

@Entity
public class Club {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long clubId;

    @Column(nullable = false, unique = true)
    private String clubName;
    
    @ManyToOne
    @JoinColumn(name = "patron_id")
    private Lecturer patron;
    
    @Column(columnDefinition = "TEXT")
    private String clubDescription;
    
    @Lob
    private byte[] logo;
    
    @Column(nullable = false, unique = true)
    private int memberCount = 0;

    // Constructors, getters, and setters
}
