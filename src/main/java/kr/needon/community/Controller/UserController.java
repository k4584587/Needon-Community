package kr.needon.community.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

//=====================================
//클래스 설명 : 로그인 컨트롤러 클래스
//작성자 : 김현우
//=====================================

@Controller
@RequestMapping("/user/**")
public class UserController {

    /**
     * 로그인 페이지
     * @return
     */
    @RequestMapping(value = "/login")
    public String UserLogin() {

        return "user/login";
    }

}
