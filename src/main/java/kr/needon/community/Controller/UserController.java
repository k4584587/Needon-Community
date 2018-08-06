package kr.needon.community.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//=====================================
//클래스 설명 : 회원관리 컨트롤러 클래스
//작성자 : 김현우,최민승
//=====================================

@Controller
@RequestMapping("/user/**")
public class UserController {

    @Autowired
    private PasswordEncoder passwordEncoder; //페스워드 암호화시 사용하면됨.

    /**
     * 로그인 페이지
     * @return
     */
    @RequestMapping(value = "/login")
    public String UserLogin() {

        return "user/login"; //titles 안쓴 jsp 로그인 페이지
    }
    
    @RequestMapping(value="/userJoinForm")
    public String userJoinForm() {
    	return "user/userJoinForm";  
    }

}
