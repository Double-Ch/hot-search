package com.itchen;

import com.itchen.config.DocumentationConfig;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.core.env.Environment;

/**
 * @author chen
 * @description 功能描述
 * @create 2025/1/14 15:07
 */
@SpringBootApplication
public class HotSearchApplication {
    public static void main(String[] args) {
        SpringApplication.run(HotSearchApplication.class,args);

    }

    @Bean
    public CommandLineRunner startupRunner(Environment env) {
        return args -> {
            DocumentationConfig documentationConfig = new DocumentationConfig();
            documentationConfig.logApplicationStartup(env);
        };
    }

}
