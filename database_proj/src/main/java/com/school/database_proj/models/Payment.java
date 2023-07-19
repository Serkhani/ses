package com.school.database_proj.models;

import jakarta.persistence.*;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;

@Entity
@Table(name = "Payment")
@EqualsAndHashCode(callSuper = false)
public class Payment {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long paymentID;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "studentID")
    private Student student;

    private double amount;

    private String description;

    private LocalDateTime timestamp;

    // Getters and setters, constructors
}
