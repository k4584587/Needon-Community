package kr.needon.community.Controller;

import kr.needon.community.Model.*;
import kr.needon.community.Module.Board.BoardDAOImpl;
import kr.needon.community.Module.Board.BoardServiceImpl;
import lombok.extern.java.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

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

	@Autowired
	private PasswordEncoder passwordEncoder;

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
	public String board_view(Board board, @ModelAttribute("cri") Criteria cri, Model model,
			HttpSession session, BoTable boTable, FileDownload file) throws Exception {

		model.addAttribute("board_page",1);
		
		/*Board bd = service.view(board);
		System.out.println("게시판 정보 >>>>>>>>>>>>>>>>"+bd);
		Member member = (Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(member.getPassword() == bd.getWr_password()) {			
			model.addAttribute("result", 1);
		}else {
			model.addAttribute("result", 2);
		}*/
		file.setBo_table(board.getCategory());
		file.setBo_no(board.getNo());

		// 쿼리에서 불러온 List
		List<FileDownload> file_list = service.file_list(file);

		model.addAttribute("test", file_list);

		boTable.setBo_table(board.getCategory());
		model.addAttribute("info",dao.getBoardInfo(boTable));

		model.addAttribute("title", "게시판 조회");
		model.addAttribute("board", service.view(board));
		model.addAttribute("comment", service.replyList(board));
		System.out.println("result===============> "+service.replyList(board));
		service.viewCount(board);

		return "board_view";
	}

	/* 게시판 글쓰는 폼 */
	@RequestMapping("/write_form")
	public String board_write(Model model, Board board, BoTable boTable) throws Exception {

		model.addAttribute("board_page",0);

		board.setCategory(board.getCategory());
		model.addAttribute("last", service.last_no(board));
		boTable.setBo_table(board.getCategory());
		model.addAttribute("info",dao.getBoardInfo(boTable));

		return "board_write";
	}

	/* 게시판 글쓰기 */
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String board_write_post(@ModelAttribute Board board, HttpServletRequest request,
			int page, Model model,
			@RequestParam("file_name") MultipartFile[] mf1, FileDownload file)
			throws Exception {


		System.out.println("게시판 글쓰기 호출");
		model.addAttribute("board_page",0);

		model.addAttribute("url", "/board/" + board.getCategory() + "/list?page=" + page);

		Member member = (Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		board.setWr_nick(member.getNick());
		board.setWr_password(member.getPassword());

			for(MultipartFile mf : mf1) {
				System.out.println("리스트 이름 출력 확인==============>" + mf.getOriginalFilename());
				if (mf.isEmpty() == false) {
					System.out.println("파일이 존제함");
					String fileName = mf.getOriginalFilename();
					file.setBo_no(board.getNo());
					file.setBo_subject(fileName);
					file.setBo_table(board.getCategory());
					String sub = fileName.substring(fileName.lastIndexOf('.'), fileName.length()).toLowerCase();
					SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
					String today = formatter.format(new java.util.Date());
					String saveName = today + "_" + UUID.randomUUID().toString() + sub;
					file.setBo_encode(saveName);

					int fileSize = (int) mf.getSize();
					file.setBo_filesize(fileSize);
					// mf.transferTo(new File("/gov/"+fileName));

					System.out.println("filename==========>" + saveName);
					System.out.println("fileSize============>" + fileSize);

					//파일 기본경로
					String dftFilePath = request.getSession().getServletContext().getRealPath("/");
					System.out.println("filePath================================>\n" + dftFilePath);
					//파일 기본경로 _ 상세경로
					String filePath = dftFilePath + "resources" + "\\" + "file_upload" + "\\" + today + "\\";
					System.out.println("filePath================================>\n" + filePath);
					System.out.println("fileCreate=============================>\n" + filePath + saveName);
					File dir = new File(filePath);
					if (!dir.exists()) {
						dir.mkdirs();
					}
					try {
						FileOutputStream fos = new FileOutputStream(filePath + saveName);
						service.file_upload(file);
						fos.write(mf.getBytes());
						fos.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}

		if (service.insert(request, board)) {
			model.addAttribute("msg", "게시물이 등록 되었습니다.");
			model.addAttribute("url", "/board/" + board.getCategory() + "/list");

		} else {
			model.addAttribute("msg", "등록이 실패했습니다.");
			model.addAttribute("url", "/board/" + board.getCategory() + "/list");

		}
		return "/msg";
	}

	/* 게시판 삭제 */
	@RequestMapping(value = "/delete1", method = RequestMethod.POST)
	public @ResponseBody String board_delete_post(Board board, HttpServletRequest request, FileDownload file1) throws Exception {

		System.out.println("삭제 호출함");
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		//String today = formatter.format(new java.util.Date());
		String today = "";
		
		//파일 기본경로
        String dftFilePath = request.getSession().getServletContext().getRealPath("/");
        System.out.println("filePath================================>\n"+dftFilePath);
 
        file1.setBo_table(board.getCategory());
        file1.setBo_no(board.getNo());
        // 쿼리에서 불러온 List
     	List<FileDownload> file_list = service.file_list(file1);
     	for(FileDownload getfile : file_list) {
     		today = formatter.format(getfile.getBo_datetime());
     		String filePath = dftFilePath + "resources" + "\\" + "file_upload" + "\\" + today + "\\";
     		System.out.println("today============>"+today);
     		File file = new File(filePath+getfile.getBo_encode());
     		System.out.println("FileList===============>"+getfile);
     		service.file_delete(getfile);
     		//파일 삭제 처리
     		if(file.exists()) {
     			file.delete();
     		}
     	}

		log.info("delete.....");

		if (service.delete(board)) {
			System.out.println("삭제 성공");
			return "1";
		} else {
			System.out.println("삭제 실패");
			return "2";
		}
	}

	/* 게시판 수정폼 */
	@RequestMapping(value = "/modify_form", method = RequestMethod.GET)
	public String board_modify(Board board, Model model, 
			FileDownload file, BoTable boTable) throws Exception {
				
		model.addAttribute("board_page",0);
		model.addAttribute("title", "게시판 수정");
		model.addAttribute("board", service.view(board));
		file.setBo_no(board.getNo());
		file.setBo_table(board.getCategory());
		// 쿼리에서 불러온 List
		List<FileDownload> file_list = service.file_list(file);
		System.out.println("file_list>>>>>>>>>"+file_list);
		model.addAttribute("test", file_list);
		boTable.setBo_table(board.getCategory());
		model.addAttribute("info",dao.getBoardInfo(boTable));

		return "board_modify";
	}

	/* 게시판 수정 */
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String board_modify_post(HttpServletRequest request, @ModelAttribute Board board, 
			Model model, int page, @RequestParam("file_name") MultipartFile[] mf1,
			FileDownload file) throws Exception {

		model.addAttribute("board_page",0);
		model.addAttribute("board", board);
		model.addAttribute("url", "/board/view?page=" + page + "&no=" + board.getNo() + "&category=" + board.getCategory());
		
		for(MultipartFile mf : mf1) {
			System.out.println("리스트 이름 출력 확인==============>" + mf.getOriginalFilename());
			if (mf.isEmpty() == false) {
				System.out.println("파일이 존제함");
				String fileName = mf.getOriginalFilename();
				file.setBo_no(board.getNo());
				file.setBo_subject(fileName);
				file.setBo_table(board.getCategory());
				String sub = fileName.substring(fileName.lastIndexOf('.'), fileName.length()).toLowerCase();
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
				String today = formatter.format(new java.util.Date());
				String saveName = today + "_" + UUID.randomUUID().toString() + sub;
				file.setBo_encode(saveName);

				int fileSize = (int) mf.getSize();
				file.setBo_filesize(fileSize);
				// mf.transferTo(new File("/gov/"+fileName));

				System.out.println("filename==========>" + saveName);
				System.out.println("fileSize============>" + fileSize);

				//파일 기본경로
				String dftFilePath = request.getSession().getServletContext().getRealPath("/");
				System.out.println("filePath================================>\n" + dftFilePath);
				//파일 기본경로 _ 상세경로
				String filePath = dftFilePath + "resources" + "\\" + "file_upload" + "\\" + today + "\\";
				System.out.println("filePath================================>\n" + filePath);
				System.out.println("fileCreate=============================>\n" + filePath + saveName);
		
				try {
					FileOutputStream fos = new FileOutputStream(filePath + saveName);
					service.file_upload(file);
					fos.write(mf.getBytes());
					fos.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
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
			HttpServletRequest request, Model model, HttpServletResponse response, FileDownload file1,
			@RequestParam("fname") String name) throws Exception {
		
		file1.setBo_table(board.getCategory());
		file1.setBo_no(board.getNo());
		file1.setBo_encode(name);
		file1 = service.file_down(file1);
		//String fname = request.getParameter("fname");
		//down.setBo_no(board.getNo());
		String fname = file1.getBo_encode();
		String today= fname.substring(0, 10);
		System.out.println("fname = " + fname);
		
		//파일 기본경로
        String dftFilePath = request.getSession().getServletContext().getRealPath("/");
        //파일 기본경로 _ 상세경로
        System.out.println("today===>"+today);
        String filePath = dftFilePath + "resources" + "\\" + "file_upload" + "\\" +today+"\\"+ fname;
        
		System.out.println("path=" + filePath);
		
		File file = new File(filePath);
		String downName = file.getName(); //다운로드 받을 파일명을 절대경로로  구해옴

		// 이 부분이 한글 파일명이 깨지는 것을 방지해 줍니다
		downName = new String(downName.getBytes("utf-8"), "iso-8859-1");

		// octet-stream은 8비트로 된 일련의 데이터를 뜻합니다. 지정되지 않은 파일 형식을 의미합니다. 
		// response.setHeader("Content-Type", "application/octet-stream");
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + file1.getBo_subject() + "\"");

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
		
		service.down_count(file1);
		
		model.addAttribute("url",
				"/board/view?page=" + page + "&no=" + board.getNo() + "&category=" + board.getCategory());

		return "/down";
	}
	
	/*파일 업로드*/
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String Upload(FileDownload file) {
		
		return "s";
	}

	@PostMapping("/photo_upload")
	public void photoUpload(HttpServletRequest request, HttpServletResponse response) throws IOException {

        System.out.println("사진업로드 호출!");

        try {
            //파일정보
            String sFileInfo = "";
            //파일명을 받는다 - 일반 원본파일명
            String filename = request.getHeader("file-name");
            //파일 확장자
            String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
            //확장자를소문자로 변경
            filename_ext = filename_ext.toLowerCase();
            //파일 기본경로
            String dftFilePath = request.getSession().getServletContext().getRealPath("/");
            //파일 기본경로 _ 상세경로
            String filePath = dftFilePath + "resources" + File.separator + "photo_upload" + File.separator;
            File file = new File(filePath);
            if(!file.exists()) {
                file.mkdirs();
            }
            String realFileNm = "";
            SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
            String today= formatter.format(new java.util.Date());
            realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
            String rlFileNm = filePath + realFileNm;
            ///////////////// 서버에 파일쓰기 /////////////////
            InputStream is = request.getInputStream();
            OutputStream os=new FileOutputStream(rlFileNm);
            int numRead;
            byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
            while((numRead = is.read(b,0,b.length)) != -1){
                os.write(b,0,numRead);
            }
            if(is != null) {
                is.close();
            }
            os.flush();
            os.close();
            ///////////////// 서버에 파일쓰기 /////////////////
            // 정보 출력
            sFileInfo += "&bNewLine=true";
            // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
            sFileInfo += "&sFileName="+ filename;
            sFileInfo += "&sFileURL="+"/resources/photo_upload/"+realFileNm;
            PrintWriter print = response.getWriter();
            print.print(sFileInfo);
            print.flush();
            print.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
	
	/*첨부 파일 수정*/
	@RequestMapping(value = "/file_modify", method = RequestMethod.POST)
	public @ResponseBody String file_modify(Board board, FileDownload file1, HttpServletRequest request)throws Exception {
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		//String today = formatter.format(new java.util.Date());
		String today = "";
		
		//파일 기본경로
        String dftFilePath = request.getSession().getServletContext().getRealPath("/");
        System.out.println("filePath================================>\n"+dftFilePath);
 
        file1.setBo_table(board.getCategory());
        file1.setBo_no(board.getNo());
        file1.setBo_encode(file1.getBo_encode());
        System.out.println("encode======================>"+file1.getBo_encode());
        // 쿼리에서 불러온 파일
     	FileDownload f = service.file_down(file1);
     		today = formatter.format(f.getBo_datetime());
     		String filePath = dftFilePath + "resources" + "\\" + "file_upload" + "\\" + today + "\\";
     		System.out.println("today============>"+today);
     		File file = new File(filePath+f.getBo_encode());
     		System.out.println("FileList===============>"+f);
     		//파일 삭제 처리
     		if(file.exists()) {
     			file.delete();
     		}
     		if(service.file_delete_one(f)) {
     			return "1";
     		}else {
     			return "0";
     		}
     	}

}
