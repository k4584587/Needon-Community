package kr.needon.community.Controller;

import kr.needon.community.Model.BoTable;
import kr.needon.community.Model.Board;
import kr.needon.community.Model.Menu;
import kr.needon.community.Module.Board.BoardDAOImpl;
import kr.needon.community.Module.Page.PageDAOImpl;
import kr.needon.community.Module.Page.PageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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

	@Inject
	private PageDAOImpl pageDAO;
	
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String page_view(Board board, Model model)throws Exception {
		
		board.setCategory(board.getCategory());
		
		model.addAttribute("page",service.pageView(board));
		System.out.println("카테고리 ==> " + board.getCategory());
		return "page_view";
	}

	@RequestMapping("/accessDenied")
	public String AccessDenied() { // 권한이 없을시 보여줄 페이지

		return "page/accessDenied";
	}

	@GetMapping("/menu")
	public String BoardInfoPage(Model model, int no, Menu menu) throws Exception {


		menu.setId(no);
		model.addAttribute("menu_info", pageDAO.menu_info(menu));

		return "board_page";
	}
	
	

}
