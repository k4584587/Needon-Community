package kr.needon.community.Controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.needon.community.Model.BoTable;
import kr.needon.community.Model.Board;
import kr.needon.community.Model.Criteria;
import kr.needon.community.Model.Member;
import kr.needon.community.Model.PageMaker;
import kr.needon.community.Module.Board.BoardDAOImpl;
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

		model.addAttribute("board_page",1);

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
	public String board_view(Board board, @ModelAttribute("cri") Criteria cri, Model model, HttpSession session) throws Exception {

		model.addAttribute("board_page",1);

		int fileSize;
		String fileName;
		try{
			  fileName = (String)session.getAttribute("fileName");
			 fileSize = (int)session.getAttribute("fileSize");
		} catch (NullPointerException e) {
			fileName = null;
			fileSize = 0;
		}

		
		model.addAttribute("fileName", fileName);
		model.addAttribute("fileSize", fileSize);
		
		model.addAttribute("title", "게시판 조회");
		model.addAttribute("board", service.view(board));
		model.addAttribute("comment", service.replyList(board));
		System.out.println("result===============> "+service.replyList(board));
		service.viewCount(board);

		return "board_view";
	}

	/* 게시판 글쓰는 폼 */
	@RequestMapping("/write_from")
	public String board_write(Model model, Board board) throws Exception {

		model.addAttribute("board_page",1);

		return "board_write";
	}

	/* 게시판 글쓰기 */
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String board_write_post(@ModelAttribute Board board,
											HttpServletRequest request, 
											int page, 
											Model model,
											@RequestParam("img") MultipartFile mf,
											HttpSession session)
			throws Exception {

		model.addAttribute("board_page",1);

		model.addAttribute("url", "/board/" + board.getCategory() + "/list?page=" + page);

		Member member = (Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		board.setWr_nick(member.getNick());
		board.setWr_password(member.getPassword());
		
		String fileName = mf.getOriginalFilename();
		int fileSize = (int) mf.getSize();
		// mf.transferTo(new File("/gov/"+fileName));
	
			System.out.println("filename==========>"+fileName);
			System.out.println("fileSize============>"+fileSize);	
		
		
		/*int result;
		if(fileSize > 10000000) {
			System.out.println("if문 작동");
			result = 1;
			model.addAttribute("result", result);
			System.out.println("아 좀 제발 ㅡㅡ >>>>>>>>>>>>>>>>>>"+result);
			return "/board/uploadResult";
		}*/

		String path = session.getServletContext().getRealPath("/upload");
		System.out.println("path:" + path);
		
		String file[] = new String[2];
		
		try {			
			StringTokenizer st = new StringTokenizer(fileName, ".");
			file[0] = st.nextToken();
			file[1] = st.nextToken();
		
		FileOutputStream fos = new FileOutputStream(path + "/" + fileName);
		fos.write(mf.getBytes());
		fos.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		session.setAttribute("fileName", fileName);
		session.setAttribute("fileSize", fileSize);
		
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

		model.addAttribute("board_page",1);

		log.info("delete_form.....");
		model.addAttribute("no", no);

		return "board_delete";
	}

	/* 게시판 삭제 */
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String board_delete_post(Board board, int page, Model model) throws Exception {

		model.addAttribute("board_page",1);

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

		model.addAttribute("board_page",1);

		model.addAttribute("title", "게시판 수정");
		model.addAttribute("board", service.view(board));

		return "board_modify";
	}

	/* 게시판 수정 */
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String board_modify_post(HttpServletRequest request, Board board, Model model, int page) throws Exception {

		model.addAttribute("board_page",1);

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
	
	/*게시판 좋아요*/
	@PostMapping("/bo_good")
	public @ResponseBody String bo_good(Board board) throws Exception {

	    board.setCount(0);
	    if(service.board_vote(board)) {
	        return "1";
        } else {
	        return "0";
        }

	}
	
	/*게시판 싫어요*/
	@PostMapping("/bo_bad")
	public @ResponseBody String bo_bad(Board board) throws Exception {

		board.setCount(1);
		if(service.board_vote(board)) {
			return "1";
		} else {
			return "0";
		}
	}
	
	/*댓글 좋아요*/
	@PostMapping("/cm_good")
	public @ResponseBody String cm_good(Board board) throws Exception {
		
		board.setCount(0);
		if(service.comment_vote(board)) {
			return "1";
		} else {
			return "0";
		}
		
	}
	
	/*댓글 싫어요*/
	@PostMapping("/cm_bad")
	public @ResponseBody String cm_bad(Board board) throws Exception {
		
		board.setCount(1);
		if(service.comment_vote(board)) {
			return "1";
		} else {
			return "0";
		}
	}
	
	/* 파일 다운로드 */
	@RequestMapping(value = "/download", method = RequestMethod.GET)
	public String download(Board board, int page,
			HttpServletRequest request, Model model, HttpServletResponse response) throws Exception {

		String fname = request.getParameter("fname");
		System.out.println("fname = " + fname);
		
		String DownloadPath = request.getRealPath("upload");
		String path = DownloadPath + "\\" + fname;
		System.out.println("path=" + path);
		
		File file = new File(path);
		String downName = file.getName(); //다운로드 받을 파일명을 절대경로로  구해옴

		// 이 부분이 한글 파일명이 깨지는 것을 방지해 줍니다
		downName = new String(downName.getBytes("utf-8"), "iso-8859-1");

		// octet-stream은 8비트로 된 일련의 데이터를 뜻합니다. 지정되지 않은 파일 형식을 의미합니다. 
		// response.setHeader("Content-Type", "application/octet-stream");
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + downName + "\"");

		FileInputStream in = null;
		OutputStream out = null;
		try {
			in = new FileInputStream(file);
			out = response.getOutputStream();
			FileCopyUtils.copy(in, out);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		model.addAttribute("url",
				"/board/view?page=" + page + "&no=" + board.getNo() + "&category=" + board.getCategory());

		model.addAttribute("msg", "다운로드 완료");
		return "/msg";
	}

}
