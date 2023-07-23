package com.groupfour.sesappapi.resources;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RestController
@RequestMapping("/")
public class UserResource {

    @GetMapping("/announcements")
    public String getAnnouncements() {
        return "UserResource []";
    }
    
    
}
