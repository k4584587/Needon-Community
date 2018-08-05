package kr.needon.community.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

//=====================================
// 	클래스 설명 : 홈페이지 관리자 컨트롤러 클래스
//	작성자 : 김현우
//=====================================

@Controller
@RequestMapping("/admin/**")
public class AdminController {

    @GetMapping("/")
    public String AdminMain() {

        return "admin/admin";
    }

}
