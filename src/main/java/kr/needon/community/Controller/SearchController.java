package kr.needon.community.Controller;

import kr.needon.community.Model.Board;
import kr.needon.community.Model.Criteria;
import kr.needon.community.Model.SPageMaker;
import kr.needon.community.Module.Board.BoardServiceImpl;
import kr.needon.community.Module.Search.SearchDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

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

		String keyword = request.getParameter("keyword");

		System.out.println("keyword>>>>>>>>>>>>>>>>>>>"+keyword);

		model.addAttribute("key",keyword);

		board.setPerPageNum(10);
		board.setKeyword(keyword);
		System.out.println("dao list>>>>>>>>>>>>>"+dao.getSearch(board));
		System.out.println("dao list>>>>>>>>>>>>>"+dao.getSearch(board));
		System.out.println("dao list>>>>>>>>>>>>>"+dao.getSearch(board));
		System.out.println("dao list>>>>>>>>>>>>>"+dao.getSearch(board));
		model.addAttribute("list",dao.getSearch(board));

		SPageMaker pageMaker = new SPageMaker();
		pageMaker.setBoard(board);
		pageMaker.setTotalCount(dao.getListCount(board));

		System.out.println("페이지 데이터>>>>>>>>>>>>>>>>"+pageMaker);
		model.addAttribute("pageMaker",pageMaker);



		return "search/search_list";
	}



}