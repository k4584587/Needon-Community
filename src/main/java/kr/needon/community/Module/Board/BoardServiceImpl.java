package kr.needon.community.Module.Board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.needon.community.Model.Board;

//=====================================
//클래스 설명 : 게시판 Service 클래스
//작성자 : 박영기
//=====================================

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDAOImpl dao;
	
	@Override
	public List<Board> list() throws Exception {
		// TODO Auto-generated method stub
		return dao.list();
	}

	@Override
	public boolean insert(Board board) throws Exception {
		// TODO Auto-generated method stub
		try {
			dao.insert(board);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
		
		return true;
	}

	@Override
	public Board view(Board board) throws Exception {
		// TODO Auto-generated method stub
		return dao.view(board);
	}

}
