package com.school.database_proj.models;

import jakarta.persistence.*;
import lombok.EqualsAndHashCode;

@Entity
@Table(name = "Textbook")
@EqualsAndHashCode(callSuper = false)
public class Textbook {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long textbookID;

    private String courseID;

    private String courseName;

    private String title;

    private String author;

    private String ISBN;

    // Getters and setters, constructors
}
