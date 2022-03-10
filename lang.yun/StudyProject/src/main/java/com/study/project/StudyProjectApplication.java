package com.study.project;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.PostMapping;

@SpringBootApplication
public class StudyProjectApplication {
	
	public static void main(String[] args) {
		System.out.println("111");
		SpringApplication.run(StudyProjectApplication.class, args);
	}
	@PostMapping("/test")
	public String test() {
		return "home";
	}
}
