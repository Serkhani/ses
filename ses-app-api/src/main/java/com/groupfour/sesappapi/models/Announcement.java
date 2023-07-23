package com.groupfour.sesappapi.models;

import java.time.LocalDateTime;

import jakarta.persistence.*;


@Entity
public class Announcement {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long announcementId;
    
    @Column(nullable = false)
    private String title;
    
    @Column(columnDefinition = "TEXT")
    private String content;
    
    @Column(nullable = false, updatable = false)
    private LocalDateTime dateCreated = LocalDateTime.now();
    
    @Lob
    private byte[] image;
    
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User sender;
    
    // Constructors, getters, and setters
}
