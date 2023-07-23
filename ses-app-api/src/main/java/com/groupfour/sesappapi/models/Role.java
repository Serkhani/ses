package com.groupfour.sesappapi.models;

import jakarta.persistence.*;


@Entity
public class Role {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long roleId;
    
    @Column(nullable = false)
    private String roleName;
    
    // Constructors, getters, and setters
}
