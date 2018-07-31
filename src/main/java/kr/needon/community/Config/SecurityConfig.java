package kr.needon.community.Config;

import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

//=====================================
// 	클래스 설명 : 시큐리티 설정 클래스
//	작성자 : 김현우
//=====================================

@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// TODO Auto-generated method stub

		http
				.formLogin()
				.loginPage("/user/login");

	}
	
}
