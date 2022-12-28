package com.limdaram.ticketing;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication(scanBasePackages = "com.limdaram.ticketing")
@ServletComponentScan
@MapperScan("com.limdaram.ticketing.mapper")
public class TicketingApplication extends SpringBootServletInitializer {

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(TicketingApplication.class);
    }

    public static void main(String[] args) {
        SpringApplication.run(TicketingApplication.class, args);
    }

}
