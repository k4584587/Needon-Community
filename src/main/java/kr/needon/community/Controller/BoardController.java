package kr.needon.community.Controller;

import kr.needon.community.Model.Board;
import kr.needon.community.Module.Board.BoardServiceImpl;
import lombok.extern.java.Log;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//=====================================
//	클래스 설명 : 게시판 컨트롤러 클래스
//  작성자 : 박영기
//=====================================

@Log
@Controller
@RequestMapping("/board/**")
public class BoardController {

	@Autowired
	private BoardServiceImpl service;
	
	/*게시판 목록*/
	@RequestMapping("/{category}/list")
	public String board_list(@PathVariable("category") String category, Model model, Board board) throws Exception{		
		
		model.addAttribute("title", "게시판 리스트");
		model.addAttribute("category", category);
		
		board.setCategory(category);
		model.addAttribute("list", service.list(board));
		
		return "board_list";
	}
	
	/*게시판 조회*/
	@RequestMapping("/view")
	public String board_view(Board board, Model model) throws Exception{		
		
		model.addAttribute("title", "게시판 조회");
		model.addAttribute("board", service.view(board));
		service.viewCount(board);
		
		return "board_view";
	}

	/*게시판 글쓰는 폼*/
	@RequestMapping("/write_from" )
	public String board_write(Board board) throws Exception{		
		
		return "board_write";
	}
	
	/*게시판 글쓰기*/
	@RequestMapping(value = "/write", method =  RequestMethod.POST )
	public String board_write_post(@ModelAttribute Board board, HttpServletRequest request) throws Exception{		
		
		service.insert(request, board);
		
		return "redirect:/board/"+board.getCategory()+"/list";
	}
	
	/*게시판 삭제폼*/
	@RequestMapping(value = "/delete_form", method = RequestMethod.GET)
	public String board_delete(int no, Model model) throws Exception{
		
		log.info("delete_form.....");
		model.addAttribute("no", no);
		
		return "board_delete";
	}
	
	/*게시판 삭제*/
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String board_delete_post(Board board) throws Exception{
		
		log.info("delete.....");
		service.delete(board);
		
		return "redirect:/board/list";
	}
	
	/*게시판 수정폼*/
	@RequestMapping(value = "/modify_form", method = RequestMethod.GET)
	public String board_modify(Board board, Model model)throws Exception {
		
		model.addAttribute("title", "게시판 수정");
		model.addAttribute("board", service.view(board));
		
		return "board_modify";
	}
	
	/*게시판 수정*/
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String board_modify_post(HttpServletRequest request, Board board, Model model)throws Exception{
		
		model.addAttribute("board", board);
		service.modify(request, board);
		
		return "redirect:/board/list";
	}
	
}
