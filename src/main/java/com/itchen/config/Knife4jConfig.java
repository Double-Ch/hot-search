package com.itchen.config;


import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Contact;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.info.License;
import org.springdoc.core.GroupedOpenApi;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * knife4j配置
 */
@Configuration
public class Knife4jConfig {
    @Bean
    public GroupedOpenApi systemApi() {      // 创建了一个api接口的分组
        return GroupedOpenApi.builder()
                .group("api")         // 分组名称
                .pathsToMatch("/**")  // 接口请求路径规则
                .build();
    }

    @Bean
    public OpenAPI openAPI(){
        return new OpenAPI()
                .info(new Info()
                        .title("热点导航-调试")
                        .description("Knife4j说明")
                        .version("v1")
                        .contact(new Contact().name("chen").email("robin@gmail.com"))
                        .license(new License().name("Apache 2.0").url("http://springdoc.org"))
                );
    }

}
