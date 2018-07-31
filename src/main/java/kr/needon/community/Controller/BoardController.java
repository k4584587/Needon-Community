package kr.needon.community.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	/*게시판 목록*/
	@RequestMapping("/list")
	public String board_list(Model model) throws Exception{		// 게시판 리스트
		
		model.addAttribute("title", "게시판 리스트");
		model.addAttribute("list", service.list());
		
		return "board_list";
	}
	
	/*게시판 조회*/
	@RequestMapping("/view")
	public String board_view(Board board, Model model, int no) throws Exception{		// 게시판 조회
		
		model.addAttribute("title", "게시판 조회");
		model.addAttribute("board", service.view(board));
		service.viewCount(no);
		
		return "board_view";
	}

	/*게시판 글쓰는 폼*/
	@RequestMapping("/write_from" )
	public String board_write(Board board) throws Exception{		// 게시판 조회
		
		return "board_write";
	}
	
	/*게시판 글쓰기*/
	@RequestMapping(value = "/write", method =  RequestMethod.POST )
	public String board_write_post(@ModelAttribute Board board) throws Exception{		// 게시판 조회
		
		service.insert(board);
		
		return "redirect:/board/list";
	}
}
