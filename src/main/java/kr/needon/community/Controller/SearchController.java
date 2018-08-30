package kr.needon.community.Controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.needon.community.Model.BoTable;
import kr.needon.community.Model.Board;
import kr.needon.community.Model.Criteria;
import kr.needon.community.Model.PageMaker;
import kr.needon.community.Module.Board.BoardServiceImpl;
import kr.needon.community.Module.Search.SearchDAO;

@Controller
@RequestMapping("/search/**")
public class SearchController {
	
	@Autowired
	private SearchDAO dao;
	
	@Autowired
	private BoardServiceImpl service;
	
	
	@RequestMapping(value="/view", method = RequestMethod.GET)
	public String search(HttpServletRequest request,Criteria cri, Board board, Model model)throws Exception {
		
		System.out.println("search>>>>>>>>>>>success!!");
		System.out.println("search>>>>>>>>>>>success!!");
		System.out.println("search>>>>>>>>>>>success!!");
		System.out.println("search>>>>>>>>>>>success!!");
		
		String keyword = request.getParameter("keyword");
		
		System.out.println("keyword>>>>>>>>>>>>>>>>>>>"+keyword);
		System.out.println("keyword>>>>>>>>>>>>>>>>>>>"+keyword);
		System.out.println("keyword>>>>>>>>>>>>>>>>>>>"+keyword);
		System.out.println("keyword>>>>>>>>>>>>>>>>>>>"+keyword);
		
		model.addAttribute("key",keyword);
		
		//cri.setPerPageNum(10);
		//cri.setKeyword(keyword);
		board.setKeyword(keyword);
		System.out.println("list>>>>>>>>>>>>>"+dao.getSearch(board));
		model.addAttribute("list",dao.getSearch(board));
		
		
		/*PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.getListCount(cri));
		*/
		
		return "/search/searchForm";
	}
	
	

}
