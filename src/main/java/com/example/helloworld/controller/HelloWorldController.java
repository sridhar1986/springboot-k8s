package com.example.helloworld.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

@RestController
public class HelloWorldController {

    @GetMapping("/hello")
    public String sendGreetings() {
        return "Hello, World!";
    }

    @GetMapping("/current-time")
    public Date getCurrentTime() {
        return new Date();
    }

    @GetMapping("/welcome")
    public String getWelcomeSite() {
        return "Welcome to this site. Added endpoints";
    }
    
    @GetMapping("/welcome-test")
    public String getWelcomeSite() {
        return "Welcome to this site. Added endpoints - test";
    }
}
