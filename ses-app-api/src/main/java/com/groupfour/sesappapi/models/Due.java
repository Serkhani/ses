package com.groupfour.sesappapi.models;

import java.math.BigDecimal;

import jakarta.persistence.*;

    @Entity
public class Due {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long duesId;
    
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;
    
    @Column(nullable = false, unique = true)
    private BigDecimal amount;
    
    // Constructors, getters, and setters
}
