package kr.needon.community.Controller;

import kr.needon.community.Model.Member;
import kr.needon.community.Module.User.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.StringTokenizer;

//=====================================
//클래스 설명 : 회원관리 컨트롤러 클래스
//작성자 : 김현우,최민승
//=====================================

@Controller
@RequestMapping("/user/**")
public class UserController {

	@Autowired
	private PasswordEncoder passwordEncoder; // 페스워드 암호화시 사용하면됨.

	@Autowired
	private UserService service;

	/**
	 * 로그인 페이지
	 * 
	 * @return
	 */
	@RequestMapping(value = "/login")
	public String UserLogin() {

		return "user/login"; // titles 안쓴 jsp 로그인 페이지
	}

	// 회원가입 폼으로 이동
	@RequestMapping(value = "/userJoinForm")
	public String userJoinForm() {
		return "user/userJoinForm";
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
			filename = "null";

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
			} else if (!file[1].equals("jpg") && !file[1].equals("gif") && !file[1].equals("png")) {

				result = 2;

				model.addAttribute("result", result);

				return "user/uploadResult";
			}
			
			//password 암호화
			member.setPassword(passwordEncoder.encode(member.getPassword()));

			String phone2 = request.getParameter("phone2").trim();
			String phone3 = request.getParameter("phone3").trim();
			String phone1 = request.getParameter("phone1").trim();
			String phone = phone1 + "-" + phone2 + "-" + phone3;

			String mailid = request.getParameter("mailid").trim();
			String domain = request.getParameter("domain").trim();
			String email = mailid + "@" + domain;

			String birth1 = request.getParameter("birth1").trim();
			String birth2 = request.getParameter("birth2").trim();
			String birth = birth1 + "-" + birth2;

			member.setPhone(phone);
			member.setEmail(email);
			member.setPhoto(mf.getBytes());
			member.setBirth(birth);

			int out = service.member_Join(member);

			if (out == 1)
				System.out.println("성공");

		}

		model.addAttribute("username", member.getUsername());

		return "redirect:../file/profile.jpg";
	}


}
