package com.anotherclass.bitcamp.controller.fileupload;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer{
	//web root가 아닌 외부 경로에 있는 리소스를 url로 불러올 수 있도록 설정
	
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
    	String testPath = this.getClass().getResource("/").getPath();
		System.out.println(testPath);
        registry.addResourceHandler("/anotherImage/**")
                .addResourceLocations("/img/test");
    }
}
	