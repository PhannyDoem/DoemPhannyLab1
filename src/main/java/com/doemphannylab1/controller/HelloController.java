package com.doemphannylab1.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class HelloController {

    @GetMapping("/hello")
    public String hello(){
        return "Hello, GitHub Actions!";
    }

    @GetMapping("/health")
    public String health(){
        return "I'm fine!!";
    }
}
