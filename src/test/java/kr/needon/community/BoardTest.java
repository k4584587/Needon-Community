package kr.needon.community;

import kr.needon.community.Model.Board;
import kr.needon.community.Model.Criteria;
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
import java.util.List;

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
	public void getListCount() throws Exception{
		int result = dao.getListCount();
		System.out.println(result);
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
