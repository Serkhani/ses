package com.school.database_proj.models;

import jakarta.persistence.*;
import java.time.LocalDateTime;
import lombok.EqualsAndHashCode;

@Entity
@Table(name = "Announcement")
@EqualsAndHashCode(callSuper = false)
public class Announcement {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long announcementID;

    private String title;

    private String content;

    private LocalDateTime timestamp;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "userID")
    private User postedBy;

}
