package com.study.project;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.study.project"})
public class StudyProjectApplication {
	
	public static void main(String[] args) {
		
		SpringApplication.run(StudyProjectApplication.class, args);
	}
}
