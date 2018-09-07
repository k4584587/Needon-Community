package kr.needon.community.Controller;

import kr.needon.community.Model.BoTable;
import kr.needon.community.Model.Member;
import kr.needon.community.Model.Menu;
import kr.needon.community.Model.UserRole;
import kr.needon.community.Module.SampleExample.SampleExampleDAOImpl;
import kr.needon.community.Module.admin.AdminDAOImpl;
import kr.needon.community.Module.admin.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//=====================================
// 	클래스 설명 : 홈페이지 관리자 컨트롤러 클래스
//	작성자 : 김현우,최민승
//=====================================

@Controller
@RequestMapping("/admin/**")
public class AdminController {

	@Autowired
	AdminService adminService;

	@Autowired
	AdminDAOImpl adminDAO;

	@Autowired
	SampleExampleDAOImpl dao;

    @GetMapping("/")
    public String AdminMain() {

        Member member = (Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        //System.out.println("로그인한 사용자 ==> " + member.toString());

        return "admin/main";
    }
    
    //유저목록 출력
    @RequestMapping(value="/userList")
    public String userList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
    	//Member member = (Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	
    	
    	Map<String,Object> userList = adminService.user_List(request, response);
    	//System.out.println(userList);
    	model.addAllAttributes(userList);
    	return "admin/user_list";
    	
    }
    
    //관리자가 유저 정보 수정 폼으로 이동
    @RequestMapping(value="/userModifyForm")
    public String userModifyForm(HttpServletRequest request, Model model)
    		throws Exception{
    	
    	//System.out.println("userModifyForm");
    	String username = request.getParameter("username");
    	
    	Member user = adminService.findUser(username);
    	//System.out.println("유저 : " + user);
    	
    	model.addAttribute("user",user);
    	model.addAttribute("role", user.getGetUserRole().get(0).getRole());
    	
    	
    	return "admin/user_modify";
    }
    
    //유저 정보 수정 완료
    @RequestMapping(value="/userModify_ok", method=RequestMethod.POST)
    public String userModify_ok(@RequestParam("img") MultipartFile mf, Model model, Member member,HttpServletRequest request)
    		throws Exception {
    	System.out.println("usermodify_ok");
    	
    	String password=request.getParameter("password");
    	String role=request.getParameter("role");
    	
    	
    	//롤 설정
    	UserRole userRole=new UserRole();
    	userRole.setRole(role);
    	userRole.setUsername(member.getUsername());
    	List<UserRole> roleList = new ArrayList<UserRole>();
    	roleList.add(userRole);
    	
    	member.setPassword(password);
    	member.setGetUserRole(roleList);
    	
    	int result=0;
    	//수정값 저장
    	result=adminService.modifyTheUser(member);
    	if(result == 0)
    		System.out.println("실패");
    	else
    		System.out.println("성공");
    	
    	//롤값은 따로 저장
    	adminService.modifyTheUserRole(userRole);
    	
    	
    	
    	
    	return "redirect:userList";
    }
    
    //검색에 맞는 유저 리스트 갖고 오기
    @RequestMapping(value="/search", method=RequestMethod.POST)
    public String search(Model model, HttpServletRequest request) throws Exception{
    	System.out.println("user search post");
    	String keyfield=request.getParameter("keyfield");
    	String keyword=request.getParameter("keyword");
    	
    	Map<String,Object> keys = new HashMap<String,Object>();
    	keys.put("keyfield", keyfield);
    	keys.put("keyword", keyword);
    /*	System.out.println("in controller <keyfield>:"+keys.get("keyfield"));
    	System.out.println("in controller <keyword>:"+keys.get("keyword"));
    	*/
    	
    	Map<String,Object> findUserSet = new HashMap<String,Object>();
    	findUserSet = adminService.getFindUserList(request,keys);
    	model.addAllAttributes(findUserSet);
    	//System.out.println(findUserList);
    	return "admin/findUserList";
    }
    
    //검색된 상태에서 다음 페이지 눌렀을떄 화면 처리
    @RequestMapping(value="/search")
    public String search2(Model model, HttpServletRequest request) throws Exception{
    	System.out.println("user search get");
    	
    	String keyfield=request.getParameter("keyfield");
    	String keyword=request.getParameter("keyword");
    	
    	Map<String,Object> keys = new HashMap<String,Object>();
    	keys.put("keyfield", keyfield);
    	keys.put("keyword", keyword);
    	Map<String,Object> findUserSet = new HashMap<String,Object>();
    	findUserSet = adminService.getFindUserList(request,keys);
    	model.addAllAttributes(findUserSet);
    	
    	return "admin/findUserList";
    }

    @GetMapping("/board_list")
	public String BoardList(Model model) {

    	model.addAttribute("board_list", adminDAO.getBoTable());

    	return "admin/board_list";
	}

	@GetMapping("/board_addform")
	public String board_addform() {

    	return "admin/board_addform";
	}

	@PostMapping("/board_addpost")
	public String board_addpost(BoTable boTable,Model model) throws Exception {

    	if(adminService.AddBoard(boTable)) {

    		model.addAttribute("msg","등록되었습니다.");
		} else {
			model.addAttribute("msg","등록실패.");
		}

		model.addAttribute("url","/admin/board_list");

    	return "msg";
	}

	@PostMapping("/board_delete")
	public @ResponseBody String board_delete(BoTable boTable) throws Exception {

    	if(adminService.BoardDelete(boTable)) {
    		return "1";
		} else {
    		return "0";
		}

	}

	@RequestMapping("/menu_list") //메뉴 추가
	public String MenuList(Menu menu, Model model) {

		List<Menu> getMenuList = dao.getMenuList(menu);
		model.addAttribute("menu_list",getMenuList);

		List<Menu> getSubCategoryList = dao.getSubCategoryList(menu);
		model.addAttribute("sub_list",getSubCategoryList);

		return "admin/menu_list";
	}

	@RequestMapping("/page_list")
	public String PageList() {

    	return "admin/page_list";
	}

	@RequestMapping("/page_add")
	public String PageAdd() {

		return "admin/page_add";
	}

	@PostMapping("/page_post")
	public @ResponseBody String PageInsert(BoTable boTable) throws Exception {

    	if(adminService.PageInsert(boTable)) {
    		return "1";
		} else {
    		return "0";
		}

	}

}

