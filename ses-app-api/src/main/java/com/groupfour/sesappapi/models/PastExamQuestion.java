package com.groupfour.sesappapi.models;

import jakarta.persistence.*;

public class PastExamQuestion {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long paperId;
    
    @ManyToOne
    @JoinColumn(name = "course_id")
    private Course course;
    
    @ManyToOne
    @JoinColumn(name = "lecturer_id")
    private Lecturer lecturer;
    
    @Column(nullable = false)
    private Integer examinationYear;
    
    @Lob
    private byte[] pdfFile;
    
    // Constructors, getters, and setters
}
