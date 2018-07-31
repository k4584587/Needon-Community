package kr.needon.community.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.needon.community.Model.Board;
import kr.needon.community.Module.Board.BoardServiceImpl;

//=====================================
//	클래스 설명 : 게시판 컨트롤러 클래스
//  작성자 : 박영기
//=====================================

@Controller
@RequestMapping("/board/**")
public class BoardController {
	
	@Autowired
	private BoardServiceImpl service;
	
	@RequestMapping("/list")
	public String board_list(Model model) throws Exception{		// 게시판 리스트
		
		model.addAttribute("title", "게시판 리스트");
		model.addAttribute("list", service.list());
		
		return "board_list";
	}
	
	@RequestMapping("/view")
	public String board_view(Board board, Model model) throws Exception{		// 게시판 조회
		
		model.addAttribute("title", "게시판 조회");
		model.addAttribute("board", service.view(board));
		
		return "board_view";
	}
}
