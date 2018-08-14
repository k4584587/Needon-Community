package kr.needon.community.Controller;

import kr.needon.community.Model.Board;
import kr.needon.community.Model.Criteria;
import kr.needon.community.Module.Board.BoardServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	@Autowired
	BoardServiceImpl boardService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, Board board, Criteria cri) throws Exception {

		cri.setCategory("freeboard");
		cri.setPerPageNum(5);
		cri.setPage(1);
		model.addAttribute("new_freeboard",boardService.listpage(cri));
		
		cri.setCategory("notice");
		cri.setPerPageNum(5);
		cri.setPage(1);
		model.addAttribute("new_notice",boardService.listpage(cri));
		
		
		return "home";
	}
	
}
