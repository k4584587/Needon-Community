package kr.needon.community;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.needon.community.Model.Board;
import kr.needon.community.Module.Board.BoardDAOImpl;
import kr.needon.community.Module.Board.BoardServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class BoardTest {

	@Autowired
	private BoardServiceImpl service;
	
	@Autowired
	private BoardDAOImpl dao;

	@Test
	public void List() throws Exception {
		List<Board> list = service.list();
		System.out.println(list.toString());
	}

	@Test
	public void insert() throws Exception{
		Board board = new Board();

		board.setSubject("name");
		board.setContent("Test!!");
		board.setIp("192.168.30.8");
		board.setWr_no(1);

		Boolean result = service.insert(board);
		System.out.println("결과 ==> " + result);
	}
	
	@Test
	public void getListCount() throws Exception{
		int result = dao.getListCount();
		System.out.println(result);
	}
	
}
