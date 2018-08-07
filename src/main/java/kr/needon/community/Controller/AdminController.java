package kr.needon.community.Controller;

import kr.needon.community.Model.Member;
import org.springframework.security.core.context.SecurityContextHolder;
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

        Member member = (Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        System.out.println("로그인한 사용자 ==> " + member.toString());

        return "admin/admin";
    }

}
