package com.groupfour.sesappapi.models;

import jakarta.persistence.*;
/**
 * User
 */
@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long userId;
    
    @Column(nullable = false, unique = true)
    private Integer loginId;
    
    @Column(nullable = false)
    private Integer pin;
    
    @ManyToOne
    @JoinColumn(name = "role_id")
    private Long role;
    
    // Constructors, getters, and setters
}
