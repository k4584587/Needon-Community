package kr.needon.community.Controller;

import javax.servlet.http.HttpServletRequest;

import kr.needon.community.Model.*;
import kr.needon.community.Module.Board.BoardDAOImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import kr.needon.community.Module.Board.BoardServiceImpl;
import lombok.extern.java.Log;

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

	@Autowired
	private BoardDAOImpl dao;

	/* 게시판 목록 */
	@RequestMapping("/{category}/list")
	public String board_list(@PathVariable("category") String category, Model model, Board board, Criteria cri, BoTable boTable)
			throws Exception {

		boTable.setBo_table(category);
		model.addAttribute("info",dao.getBoardInfo(boTable));

		model.addAttribute("title", "게시판 리스트");
		model.addAttribute("category", category);

		board.setCategory(category);
		cri.setPerPageNum(10);
		model.addAttribute("list", service.listpage(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.getListCount(cri));
		
		System.out.println("데이터>>>>>>>>>>>>>>>>>>>"+pageMaker);

		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("search", cri.getSearch());
		model.addAttribute("keyword", cri.getKeyword());

		return "board_list";
	}

	/* 게시판 조회 */
	@RequestMapping("/view")
	public String board_view(Board board, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {

		model.addAttribute("title", "게시판 조회");
		model.addAttribute("board", service.view(board));
		model.addAttribute("comment", service.replyList(board));
		System.out.println("result===============> "+service.replyList(board));
		service.viewCount(board);

		return "board_view";
	}

	/* 게시판 글쓰는 폼 */
	@RequestMapping("/write_from")
	public String board_write(Board board) throws Exception {

		return "board_write";
	}

	/* 게시판 글쓰기 */
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String board_write_post(@ModelAttribute Board board, HttpServletRequest request, int page, Model model)
			throws Exception {

		model.addAttribute("url", "/board/" + board.getCategory() + "/list?page=" + page);

		Member member = (Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		board.setWr_nick(member.getNick());
		board.setWr_password(member.getPassword());


		if (service.insert(request, board)) {
			model.addAttribute("msg", "게시물이 등록 되었습니다.");
		} else {
			model.addAttribute("msg", "등록이 실패했습니다.");
		}
		return "/msg";
	}

	/* 게시판 삭제폼 */
	@RequestMapping(value = "/delete_form", method = RequestMethod.GET)
	public String board_delete(int no, Model model) throws Exception {

		log.info("delete_form.....");
		model.addAttribute("no", no);

		return "board_delete";
	}

	/* 게시판 삭제 */
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String board_delete_post(Board board, int page, Model model) throws Exception {

		log.info("delete.....");
		model.addAttribute("url", "/board/" + board.getCategory() + "/list?page=" + page);

		if (service.delete(board)) {
			model.addAttribute("msg", "글이 삭제 되었습니다.");
		} else {
			model.addAttribute("msg", "삭제를 실패했습니다.");
		}
		return "/msg";
	}

	/* 게시판 수정폼 */
	@RequestMapping(value = "/modify_form", method = RequestMethod.GET)
	public String board_modify(Board board, Model model) throws Exception {

		model.addAttribute("title", "게시판 수정");
		model.addAttribute("board", service.view(board));

		return "board_modify";
	}

	/* 게시판 수정 */
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String board_modify_post(HttpServletRequest request, Board board, Model model, int page) throws Exception {

		model.addAttribute("board", board);
		model.addAttribute("url", "/board/view?page=" + page + "&no=" + board.getNo() + "&category=" + board.getCategory());

		if (service.modify(request, board)) {
			model.addAttribute("msg", "게시물이 수정 되었습니다.");
		} else {
			model.addAttribute("msg", "수정이 실패했습니다.");
		}
		return "/msg";
	}
	
	/*댓글 추가*/
	@RequestMapping(value = "/repInsert", method = RequestMethod.POST)
	public @ResponseBody String  repInsert(Board board, HttpServletRequest request) throws Exception{
		if(service.repInsert(board, request)) {
			return "1";
		}
		else {
			return "2";
		}		
	}
	
	/*댓글 수정*/
	@RequestMapping(value = "/repUpdate", method = RequestMethod.POST)
	public @ResponseBody String repUpdate(Board board) throws Exception{
		if(service.repUpdate(board)) {
			return "1";
		}
		else {
			return "2";
		}		
	}
	
	/*댓글 삭제*/
	@RequestMapping(value = "/repDelete", method = RequestMethod.POST)
	public @ResponseBody String repDelete(Board board) throws Exception{
		if(service.repDelete(board)) {
			return "1";
		}
		else {
			return "2";
		}		
	}

	@PostMapping("/bo_good")
	public @ResponseBody String bo_good(Board board) throws Exception {

	    board.setCount(0);
	    if(service.board_vote(board)) {
	        return "1";
        } else {
	        return "0";
        }

	}

	@PostMapping("/bo_bad")
	public @ResponseBody String bo_bad(Board board) throws Exception {

		board.setCount(1);
		if(service.board_vote(board)) {
			return "1";
		} else {
			return "0";
		}
	}

}
