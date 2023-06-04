package com.danny.springboot.todoapp.security;

import static org.springframework.security.config.Customizer.withDefaults;

import java.util.function.Function;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

@Configuration //빈을 여기서 직접 정의해야함 
public class SpringSecurityConfiguration {

	//메모리에 저장(db X)  
	@Bean
	public InMemoryUserDetailsManager createUserDetailsManager() {
		
		UserDetails userDetails1 = createNewUser("dann","123");
		UserDetails userDetails2 = createNewUser("jieun", "123");
		
		return new InMemoryUserDetailsManager(userDetails1,userDetails2);
	}

	//유저 상세정보 
	private UserDetails createNewUser(String username, String password) {
		Function<String,String> passwordEncoder
		= input -> passwordEncoder().encode(input);
	
		UserDetails userDetails = User.builder()	
									.passwordEncoder(passwordEncoder)
									.username(username)
									.password(password)
									.roles("USER","ADMIN")
									.build();
		return userDetails;
	}
	
	//비밀번호 암호화
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	//모든 URL이 보호됨 
	//H2도 들어갈 수 없음 .. 
	//CSRF 를 비활성화해야함 
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		
		//모든 요청 -> 인증절차
		http.authorizeHttpRequests(auth->auth.anyRequest().authenticated());
		http.formLogin(withDefaults());
		
		//csrf 보호기능 비활성화 (h2에 들어가기 위해) 
		http.csrf().disable();
		//스프링프레임워크가 아닌 h2프레임워크를 사용하기 위해 disable 함 
		http.headers().frameOptions().disable();
		
		return http.build();
		
	}
	
}
