package com.semi.planbit;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"naver.ncloud", "com.semi.planbit", "tiles.config","data.*"})
@MapperScan("data.mapper")
public class Project2Bit701Application extends SpringBootServletInitializer{

	public static void main(String[] args) {
		SpringApplication.run(Project2Bit701Application.class, args);
	}

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(Project2Bit701Application.class);
	}
}
