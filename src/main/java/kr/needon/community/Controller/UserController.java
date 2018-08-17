package kr.needon.community.Controller;

import java.util.Random;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.needon.community.Model.Member;
import kr.needon.community.Module.User.UserDAOImpl;
import kr.needon.community.Module.User.UserService;

//=====================================
//클래스 설명 : 회원관리 컨트롤러 클래스
//작성자 : 김현우,최민승,박건우
//=====================================

@Controller
@RequestMapping("/user/**")
public class UserController {

	@Autowired
	private PasswordEncoder passwordEncoder; // 페스워드 암호화시 사용하면됨.

	@Autowired
	private UserService service;
	
    @Autowired
    private UserDAOImpl dao;

	/**
	 * 로그인 페이지
	 * 
	 * @return
	 */
	@RequestMapping(value = "/login")
	public String UserLogin() {

		return "user/login"; // titles 안쓴 jsp 로그인 페이지
	}
	
	@RequestMapping(value="/myinfo")
	public String myinfo() {
		
		System.out.println("myinfo>>>>>>>>>>>>>>success!");
		
		return "user/myForm";
	}


	// 회원가입 폼으로 이동
	@RequestMapping(value = "/userJoinForm")
	public String userJoinForm() {
		return "user/userJoinForm";
	}
	
	//아이디 중복검사 데이터
	@RequestMapping(value="/id_check", method = RequestMethod.POST)
	public String id_check(@RequestParam("memid") String username, Model model) {
		
		System.out.println("username>>>>>>>>>"+username);
		int result = service.id_check(username);
		System.out.println("result>>>>>>>>>>>>"+result);
		
		model.addAttribute("result",result);
		
		return "idcheckResult";
	}
	
	// 폼에서 값 받아와서 db에 저장
	@RequestMapping(value = "/userJoin_ok", method = RequestMethod.POST)
	public String userJoin_Ok(@RequestParam("img") MultipartFile mf, Member member, HttpServletRequest request,
			Model model) throws Exception {

		int size = (int) mf.getSize();
		String filename = mf.getOriginalFilename();
		String path = request.getRealPath("upload");

		// 사진 없으면 null
		if (size == 0) {

			//password 암호화
			member.setPassword(passwordEncoder.encode(member.getPassword()));

//			String birth1 = request.getParameter("birth1").trim();
//			String birth2 = request.getParameter("birth2").trim();
//			String birth = birth1 + "-" + birth2;


			member.setPhoto(null);
			member.setBirth("");
			member.setAddress1("");
			member.setAddress2("");

			int out = service.member_Join(member);

			if (out == 1)
				System.out.println("성공");
			model.addAttribute("msg","회원가입되었습니다.");
			model.addAttribute("url","/");


	} else {

			int result = 0;

			String file[] = new String[2];

			StringTokenizer st = new StringTokenizer(filename, ".");
			file[0] = st.nextToken();
			file[1] = st.nextToken();

			System.out.println("file[0]" + file[0]);
			System.out.println("file[1]" + file[1]);

			// 10000000
			if (size > 10000000) {
				result = 1;
				model.addAttribute("result", result);

				return "user/uploadResult";
			} /*else if (!file[1].equals("jpg") && !file[1].equals("gif") && !file[1].equals("png")) {

				result = 2;

				model.addAttribute("result", result);

				return "user/uploadResult";*/
			//}
			
			//password 암호화
			member.setPassword(passwordEncoder.encode(member.getPassword()));

//			String birth1 = request.getParameter("birth1").trim();
//			String birth2 = request.getParameter("birth2").trim();
//			String birth = birth1 + "-" + birth2;


			member.setPhoto(mf.getBytes());
			member.setBirth("");
			member.setAddress1("");
			member.setAddress2("");

			int out = service.member_Join(member);

			if (out == 1)
				System.out.println("성공");
                model.addAttribute("msg","회원가입되었습니다.");
                model.addAttribute("url","/");

		}

		model.addAttribute("username", member.getUsername());

		return "/msg";
	}
	
	 //비밀번호 찾기 폼
    @RequestMapping(value="/psw_find")
    public String findForm(Model model, HttpSession session) {
    	
    	model.addAttribute("count", 0);
    	
    	
    	System.out.println("findForm success.....................!!!");
    	
    	return"user/findForm";
    }
  
    @RequestMapping(value = "/count")
    public String pw_check(HttpServletRequest request,HttpSession session, Model model) {
    	
    	String id = (String) session.getAttribute("id");
    	model.addAttribute("count", 2);
    	session.setAttribute("id",id);
    	
    	return "user/findForm";
    }
    
    //비밀번호 찾기 체크
    @RequestMapping(value="/psw_check" ,method =  RequestMethod.POST )
    public String findPOST(@ModelAttribute Member member, HttpServletRequest request , Model model
    		                        ,HttpSession session) {
    	
    	System.out.println("findPOST success.....................!!!");
    	
    	try {
    		String id =request.getParameter("username");
    		String mail = request.getParameter("email");
    		
    		Member get_member = dao.getFindUser(id);
    		
    		if(get_member.getUsername()==null) {
    			model.addAttribute("msg","등록하신 정보를 정확히 입력하세요.");
    			return "/alert";
    		}else if(!get_member.getEmail().equals(mail)) {
    			model.addAttribute("msg","등록하신 정보를 정확히 입력하세요.");
    			return "/alert";
    		}else {
    			session.setAttribute("psw_check", get_member);
    			
    			model.addAttribute("msg","등록하신 메일로 암호를 전송하였습니다.");
    			model.addAttribute("url","/user/send");
    			
    		}
    		
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			model.addAttribute("msg","회원 등록을 찾을수 없습니다");
			return "/alert";
			
		}
    	
    	
    	return "/msg";
    }
    
    
    //이메일 전송
    @RequestMapping(value="/send" )
	public String send(Member member,  Model model, HttpSession session) {
    	
    	model.addAttribute("count", 1);

    	Member getMember = (Member)session.getAttribute("psw_check");
    	
    	System.out.println("데이터 정보>>>>>>>>>>>>>"+getMember.toString());
    	
    	member = dao.getFindUser(getMember.getUsername());
    	
		Random random = new Random();
		int a = random.nextInt(100);
		

		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com";
		String hostSMTPid = "needon.project@gmail.com";
		String hostSMTPpwd = "needon123"; // 비밀번호 입력해야함

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "needon.project@gmail.com";
		String fromName = "NeedOne";
		String subject = "NeedOne 비밀번호 암호 전송 메일입니다.";

		// 받는 사람 E-Mail 주소
		String mail = member.getEmail();

		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg("<p align = 'center'>NeedOn 사이트 비밀번호 찾기 암호 입니다.</p><br>" 
							 + "<div align='center'> 인증번호 : " + a + "</div>");
			email.send();
			
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		session.setAttribute("check_no",a);
		model.addAttribute("psw_check",member.getUsername());

		return "user/findForm";
	}
    
    @RequestMapping(value ="/check_ok", method =  RequestMethod.POST)
    public String check_ok(Member member, HttpServletRequest request, Model model,HttpSession session){
    	
    	
    	int check_no = (int) session.getAttribute("check_no");
    	int number2 = Integer.parseInt(request.getParameter("number2"));
    	String id = request.getParameter("username");
    	
    
    	
    	Member get_member =dao.getFindUser(id);
    	System.out.println("id>>>>>>>>>>>>>>>"+id);
    	System.out.println("인증번호>>>>>>>>>>>"+check_no);
    	System.out.println("인증 확인번호>>>>>>>>"+number2);
    	try {
			
    		if(number2 != check_no) {
    			//session.removeAttribute("check_no");
    			model.addAttribute("msg","인증번호가 맞지 않습니다");
    			model.addAttribute("url","/user/psw_find");
    			return "/alert";
    		}else {
    			model.addAttribute("id", get_member.getUsername());
    			session.setAttribute("id", id);
//    			model.addAttribute("count",2);
//    			model.addAttribute("id",id);
    			model.addAttribute("msg","인증을 완료하였습니다.");
    			model.addAttribute("url","/user/count");
    		
    		}
    	
    	} catch (Exception e) {
    		e.printStackTrace();
    		model.addAttribute("msg","인증 실패!");
    	}
    	
    	return "/msg";
    }
    
    @RequestMapping(value="/psw_change", method =  RequestMethod.POST)
    public String psw_change(Member member,HttpServletRequest request,Model model, String password,String password2) throws Exception{
    	
    	String id = request.getParameter("username");
    	String rawPassword = password;
        String encodedPassword = passwordEncoder.encode(rawPassword);
    	
    	member = dao.getFindUser(id);
    	System.out.println("id>>>>>>>>>>>"+id);
    	System.out.println("passwd>>>>>>>"+password);
    	System.out.println("passwd2>>>>>>>"+password2);
    	
    	
    	if(!password.equals(password2)) {
			model.addAttribute("msg","비밀번호가 다릅니다");
			model.addAttribute("count", 2);
			model.addAttribute("url","/user/psw_find");
			System.out.println("비밀번호가 다릅니다");
			
			return "/alert";
			
		}else {
		
			System.out.println("비번 일치!!");
			
			member.setUsername(id);
			member.setPassword(encodedPassword);
			boolean result = service.getUpdate(member);
			System.out.println("result>>>>>>>"+result);
			
			if(result != true) {
				model.addAttribute("msg","비밀번호수정 실패");
			}else {
				
				model.addAttribute("msg", "비밀번호가 수정되었습니다.");
				return "/popup_msg";
			}
		}
		
		return "/msg";
    	
    }
    
    @RequestMapping("/myinfo_check")
    public String myinfo_check() {
    	
    	System.out.println("myinfo_check>>>>>>>>>>>>>success");
    	
    	return "/user/my_check";
    }
    
    @RequestMapping(value="/check_result",  method =  RequestMethod.POST)
    public String check_result(Member member, Model model){
    	
    	System.out.println("check_result>>>>>>>>>>>>>>>success!!");
    	
    	 Member login_user = (Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	
    	System.out.println("username>>>>>>>"+login_user.getUsername());
    	
    	try {
    		
    		Member get_member = dao.getFindUser(login_user.getUsername());
    		
    		boolean result = passwordEncoder.matches(member.getPassword(),get_member.getPassword());
    		if(!result) {
    			
    			model.addAttribute("msg","비밀번호가 틀립니다");
    			return "/alert";
    		}else {
    			model.addAttribute("msg","확인 완료");
    			model.addAttribute("url","/user/my_modify");
    		}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			model.addAttribute("msg","인증 실패");
			
		}
    	
    	return "/msg";
    }
    
    @RequestMapping(value="/my_modify")
    public String my_modify(Member member, Model model) throws Exception{
    	
    	System.out.println("my_modify>>>>>>>>>>>success!!");
    	
    	 Member login_user = (Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	 
    	 Member get_member = dao.getFindUser(login_user.getUsername());
    	 
    	 String Phone = get_member.getPhone();
    	 StringTokenizer st01 = new StringTokenizer(Phone, "-");
    	 String Phone1 = st01.nextToken(); 
    	 String Phone2 = st01.nextToken(); 
    	 String Phone3 = st01.nextToken(); 
    	
    	 String email = get_member.getEmail();
    	 StringTokenizer st02 = new StringTokenizer(email,"@");
    	 String email1 = st02.nextToken();
    	 String email2 = st02.nextToken();
    	 
    	 model.addAttribute("Phone1", Phone1);
    	 model.addAttribute("Phone2", Phone2);
    	 model.addAttribute("Phone3", Phone3);
    	 model.addAttribute("email1",email1);
    	 model.addAttribute("email2",email2);
    	 
    	return"/user/my_modify";
    }
    
    @RequestMapping(value="/my_update",  method =  RequestMethod.POST)
    public String my_update(Member member, Model model, HttpServletRequest request)throws Exception{
    	
    	System.out.println("my_update>>>>>>>>>>>>>success!!");
    	
    	Member login_user = (Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	Member get_member = dao.getFindUser(login_user.getUsername());
    	
    	 System.out.println("id>>>>>>>>"+get_member.getUsername());
    	
    	 //핸드폰, 이메일 , 주소
    	String Phone1 =request.getParameter("Phone1");
    	String Phone2 =request.getParameter("Phone2");
    	String Phone3 =request.getParameter("Phone3");
    	String Phone = Phone1 +"-"+ Phone2 +"-"+ Phone3;
    	
    	String email1 = request.getParameter("email1");
    	String email2 = request.getParameter("email2");
    	String email = email1 +"@"+ email2;
    	
    	member.setNo(get_member.getNo());
    	member.setPhone(Phone);
    	member.setEmail(email);
    	
    	System.out.println("수정 값>>>>>>"+member);
    	
    	dao.getUserUpdate(member);
    	model.addAttribute("msg", "수정되었습니다. 재로그인 해야만 정보가 바뀝니다.");
    	model.addAttribute("url", "/");
    	
    	
    	return"/msg";
    }
    
    
    


}
