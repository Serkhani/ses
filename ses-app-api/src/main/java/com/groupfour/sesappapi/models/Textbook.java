package com.groupfour.sesappapi.models;

import jakarta.persistence.*;


@Entity
public class Textbook {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long textbookId;
    
    @ManyToOne
    @JoinColumn(name = "course_id")
    private Course course;
    
    @Column(nullable = false)
    private String title;
    
    @Column(nullable = false)
    private String author;
    
    @Column(nullable = false)
    private Integer publicationYear;
    
    @Column(columnDefinition = "TEXT")
    private String description;
    
    @Lob
    private byte[] thumbnail;
    
    // Constructors, getters, and setters
}
