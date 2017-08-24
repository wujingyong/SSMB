package com.wjy.configuration;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication(scanBasePackages={"com.wjy.configuration"})
@ComponentScan(basePackages="com.wjy")
public class RootConfig extends SpringBootServletInitializer {	
	// 部署到tomcat要重写这个方法
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
		return builder.sources(RootConfig.class);
	}

	// springboot自带的tomcat
	public static void main(String[] args) throws Exception {
		SpringApplication.run(RootConfig.class, args);
	}
}
