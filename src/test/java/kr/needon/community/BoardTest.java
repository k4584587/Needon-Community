package kr.needon.community;

import kr.needon.community.Model.Board;
import kr.needon.community.Model.Criteria;
import kr.needon.community.Model.FileDownload;
import kr.needon.community.Module.Board.BoardDAOImpl;
import kr.needon.community.Module.Board.BoardServiceImpl;
import lombok.extern.java.Log;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.servlet.http.HttpServletRequest;

import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Log
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class BoardTest {

	@Mock
	HttpServletRequest request;

	@Autowired
	private BoardServiceImpl service;
	
	@Autowired
	private BoardDAOImpl dao;

	@Autowired
	private BoardServiceImpl boardService;

	@Before
	public void setUp() throws Exception {
		MockitoAnnotations.initMocks(this);
	}
	@Test
	public void mybatis()throws Exception{
		
		Criteria cri = new Criteria();
		
		List<Board> result = service.listpage(cri);
		System.out.println("결과 ==> " + result);
	}
	
	
	@Test
	public void insert() throws Exception{
		Board board = new Board();

		board.setSubject("name");
		board.setContent("Test!!");
		board.setIp("192.168.30.8");


		Boolean result = service.insert(request,board);
		System.out.println("결과 ==> " + result);
	}
	
	@Test
	public void file() throws Exception{
		FileDownload file = new FileDownload();
		
		file.setBo_subject("subject");
		file.setBo_table("free");
		file.setBo_download(0);
		file.setBo_filesize(1);
		file.setBo_no(1);
		file.setBo_encode("sfaasvasv");
		//파일 기본경로
        String dftFilePath = request.getSession().getServletContext().getRealPath("/");
        System.out.println("filePath================================>\n"+dftFilePath);
        //파일 기본경로 _ 상세경로
      /*  String filePath = dftFilePath + "resources" + "/" + "file_upload" + "/";
        System.out.println("filePath================================>\n"+filePath);*/
		
		Boolean result = service.file_upload(file);
		System.out.println("결과==>"+result);
	}
	@Test
	public void last_no()throws Exception{
		Board board = new Board();
		board.setNo(10);
		board.setCategory("freeboard");
		
		service.last_no(board);
		System.out.println("결과==>"+board.getNo());
	}
	
	@Test
	public void file_list()throws Exception{
		FileDownload file = new FileDownload();
		file.setBo_no(41);
		file.setCategory("freeboard");
		List<FileDownload> file_list = service.file_list(file);
		System.out.println("결과==>"+file_list);
	}

	@Test
	public void BoardListSelect() throws Exception {

		Criteria cri = new Criteria();

		cri.setCategory("freeboard");
		cri.setPerPageNum(5);
		cri.setPage(1);
		boardService.listpage(cri);




	}


	@Test
	public void BoardView() throws Exception {

		Board board = new Board();

		board.setCategory("freeboard");
		board.setNo(97);
		Board view = service.view(board);


		String str = view.getContent();
		Pattern nonValidPattern = Pattern
				.compile("<img[^>]*src=[\\\"']?([^>\\\"']+)[\\\"']?[^>]*>");
		int imgCnt = 0;
		String content = "";
		Matcher matcher = nonValidPattern.matcher(str);
		while (matcher.find()) {
			content = matcher.group(1);
			imgCnt++;
			if(imgCnt == 1){
				break;
			}
		}



		System.out.println("이미지 ==> " + content);

	}

	@Test
	public void TestBoardNewList() {
		Board board = new Board();

		List<String> list = new ArrayList<String>();
		list.add("freeboard");
		list.add("notice");

		board.setTable_list(list);
		dao.getNew_board(board);
	}
	
}
