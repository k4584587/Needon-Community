package kr.needon.community;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import kr.needon.community.Model.Board;
import kr.needon.community.Model.Criteria;
import kr.needon.community.Module.Board.BoardDAOImpl;
import kr.needon.community.Module.Board.BoardServiceImpl;
import lombok.extern.java.Log;

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

	@Before
	public void setUp() throws Exception {
		MockitoAnnotations.initMocks(this);
	}


	@Test
	public void insert() throws Exception{
		Board board = new Board();

		board.setSubject("name");
		board.setContent("Test!!");
		board.setIp("192.168.30.8");
		board.setWr_no(1);


		Boolean result = service.insert(request,board);
		System.out.println("결과 ==> " + result);
	}
	
	@Test
	public void uri(int page) {
		UriComponents uriComponets = UriComponentsBuilder.newInstance()
													.path("/board/view")
													.queryParam("no", 12)
													.queryParam("perPageNum", 20)
													.build();
		log.info("/board/view?no=12&perPageNum=20");
		log.info(uriComponets.toString());
	}
	
	@Test
	public void ListCri()throws Exception{
		Criteria cri = new Criteria();
		cri.setPage(2);
		cri.setPerPageNum(20);
		
		List<Board> list = dao.listPage(cri);
		
		for(Board board : list) {
			log.info(board.getNo()+" : "+board.getSubject());
		}
	}
	
}
