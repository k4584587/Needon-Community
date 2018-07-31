package kr.needon.community.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//=====================================
//클래스 설명 : 페이지 컨트롤러 클래스
//작성자 : 박건우
//=====================================

@Controller
@RequestMapping("/page/**")
public class PageController {
	
	@RequestMapping("/view")
	public String page_view() {
		
		return "page_view";
	}
	

}
