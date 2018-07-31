package kr.needon.community;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.needon.community.Model.Board;
import kr.needon.community.Module.Board.BoardServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class BoardTest {
	
	@Autowired
	private BoardServiceImpl board;
	
	@Test
	public void List() throws Exception{
		List<Board> list = board.list();
    	System.out.println(list.toString());
	}
}
