package kr.needon.community.Controller;

import kr.needon.community.Model.Board;
import kr.needon.community.Module.Page.PageService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.inject.Inject;

//=====================================
//클래스 설명 : 페이지 컨트롤러 클래스
//작성자 : 박건우
//=====================================

@Controller
@RequestMapping("/page/**")
public class PageController {
	
	@Inject
	private PageService service;
	
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String page_view(Board board ,
			                        Model model)throws Exception {
		
		board.setCategory(board.getCategory());
		
		model.addAttribute("page",service.pageView(board));
		System.out.println("카테고리 ==> " + board.getCategory());
		return "page_view";
	}

	@RequestMapping("/accessDenied")
	public String AccessDenied() { // 권한이 없을시 보여줄 페이지

		return "page/accessDenied";
	}

	@GetMapping("/category/1")
	public String BoardInfoPage() {

		return "";
	}
	
	

}
