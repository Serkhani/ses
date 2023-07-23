package com.groupfour.sesappapi.models;
import java.sql.Timestamp;
import jakarta.persistence.*;

@Entity
public class Announcement {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long announcementId;

    @Column(nullable = false)
    private String title;

    @Column(nullable = false)
    private String content;

    @Column(nullable = false)
    private Timestamp date_created;

    @Column(nullable = true)
    @Lob
    private byte[] image;

    @Column(nullable = false)
    @JoinColumn(name="user_id")
    private Long user_id;

}
