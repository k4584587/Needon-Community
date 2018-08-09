package kr.needon.community.Config;

//=====================================
// 	클래스 설명 : 시큐리티 설정 클래스
//	작성자 : 김현우
//=====================================


import kr.needon.community.Module.User.UserSecurityService;
import lombok.extern.java.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Log
@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    UserSecurityService userSecurityService;



    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/resources/**");
    }

    //시큐리티 설정
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        // TODO Auto-generated method stub

        http.authorizeRequests().antMatchers("/admin/**").hasRole("ADMIN");
        http.authorizeRequests().antMatchers("/board/write_from").hasAnyRole("ADMIN","USER");

        http
        	.csrf().disable();
        
        http
                .formLogin()
                .and()
                .formLogin().loginProcessingUrl("/user/login.check")
                .and()
                .logout().logoutSuccessUrl("/").invalidateHttpSession(true)
                .and()
                .exceptionHandling().accessDeniedPage("/page/accessDenied")
                .and()
                .formLogin().loginPage("/user/login")
                .and()
                .userDetailsService(userSecurityService);


    }



    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {

        System.out.println("security configure ... ");

        auth.userDetailsService(userSecurityService).passwordEncoder(passwordEncoder());
    }

    //로그인 성공시 이동할 페이지
    @Bean
    public AuthenticationSuccessHandler successHandler() {
        return new MyCustomLoginSuccessHandler("/");
    }


    //시큐리티 로그인 커스텀
    public class MyCustomLoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
        public MyCustomLoginSuccessHandler(String defaultTargetUrl) {
            setDefaultTargetUrl(defaultTargetUrl);
        }

        @Override
        public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws ServletException, IOException {
            HttpSession session = request.getSession();
            if (session != null) {
                String redirectUrl = (String) session.getAttribute("url_prior_login");
                if (redirectUrl != null) {
                    // we do not forget to clean this attribute from session
                    session.removeAttribute("url_prior_login");
                    // then we redirect
                    getRedirectStrategy().sendRedirect(request, response, redirectUrl);
                } else {
                    super.onAuthenticationSuccess(request, response, authentication);
                }
            } else {
                super.onAuthenticationSuccess(request, response, authentication);
            }
        }
    }



    @Bean
    public PasswordEncoder passwordEncoder() { //패스워드 암호화
        return new BCryptPasswordEncoder();
    }

}
