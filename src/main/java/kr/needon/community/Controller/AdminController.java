package kr.needon.community.Controller;

import kr.needon.community.Model.Member;
import kr.needon.community.Module.admin.AdminService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//=====================================
// 	클래스 설명 : 홈페이지 관리자 컨트롤러 클래스
//	작성자 : 김현우,최민승
//=====================================

@Controller
@RequestMapping("/admin/**")
public class AdminController {
	@Autowired
	AdminService adminService;
	

    @GetMapping("/")
    public String AdminMain() {

        Member member = (Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        System.out.println("로그인한 사용자 ==> " + member.toString());

        return "admin/admin";
    }
    
    //유저목록 출력
    @RequestMapping(value="/userList")
    public String userList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
    	Member member = (Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	
    	
    	Map<String,Object> userList = adminService.user_List(request, response);
    	model.addAllAttributes(userList);
    	return "admin/userList";
    }
   

}
