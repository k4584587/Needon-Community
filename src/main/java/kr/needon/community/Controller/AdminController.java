package kr.needon.community.Controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.needon.community.Model.Member;
import kr.needon.community.Module.admin.AdminService;

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

        return "redirect:admin/userList";
    }
    
    //유저목록 출력
    @RequestMapping(value="/userList")
    public String userList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
    	Member member = (Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	
    	
    	Map<String,Object> userList = adminService.user_List(request, response);
    	model.addAllAttributes(userList);
    	return "admin/userList";
    	
    }
    
    //관리자가 유저 정보 수정 폼으로 이동
    @RequestMapping(value="/userModifyForm")
    public String userModifyForm(HttpServletRequest request, Model model)
    		throws Exception{
    	
    	System.out.println("userModifyForm");
    	String username = request.getParameter("username");
    	
    	Member user = adminService.findUser(username);
    	System.out.println("유저 : " + user);
    	
    	model.addAttribute("user",user);
    	model.addAttribute("role", user.getGetUserRole().get(0).getRole());
    	
    	
    	return "admin/userModifyForm";
    }
    
    //유저 정보 수정 완료
    @RequestMapping(value="/userModify_ok", method=RequestMethod.POST)
    public String userModify_ok() {
    	return "";
    }
   

}
