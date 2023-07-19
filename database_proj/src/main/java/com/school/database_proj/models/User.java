package com.school.database_proj.models;

import jakarta.persistence.*;
import lombok.EqualsAndHashCode;

@Entity
@Table(name = "User")
@EqualsAndHashCode(callSuper = false)
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long userID;

    private String username;

    private String password;

    private String role;

}
