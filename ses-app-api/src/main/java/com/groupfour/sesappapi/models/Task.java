package com.groupfour.sesappapi.models;
import java.time.LocalDate;
import jakarta.persistence.*;

@Entity
public class Task {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long taskId;
    
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User createdBy;
    
    @Column(nullable = false)
    private String taskTitle;
    
    @Column(columnDefinition = "TEXT")
    private String taskDescription;
    
    @Column(nullable = false)
    private LocalDate deadline;
    
    @Column(nullable = false)
    private boolean completed;
    
    // Constructors, getters, and setters
}
