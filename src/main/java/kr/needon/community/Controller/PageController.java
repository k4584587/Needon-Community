package kr.needon.community.Controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.needon.community.Model.Board;
import kr.needon.community.Module.Page.PageService;

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
		
		model.addAttribute("page",service.pageView());
		
		return "page_view";
	}
	

}
