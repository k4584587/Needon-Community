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
	
	/*게시판 목록보기*/
	@Override
	public List<Board> list() throws Exception {
		// TODO Auto-generated method stub
		return dao.list();
	}
	
	/*게시판 글쓰기*/
	@Override
	public boolean insert(Board board) throws Exception {
		// TODO Auto-generated method stub
		try {
			
			board.setWr_no(0);
			board.setIp("192.168.30.16");
			
			dao.insert(board);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
		
		return true;
	}
	
	/*게시판 조회*/
	@Override
	public Board view(Board board) throws Exception {
		// TODO Auto-generated method stub
		return dao.view(board);
	}
	
	/*게시판 조회수 증가*/
	@Override
	public void viewCount(Board board) throws Exception {
		// TODO Auto-generated method stub
		dao.viewCount(board);
	}
	
	/*게시판 삭제*/
	@Override
	public boolean delete(Board board) throws Exception {
		// TODO Auto-generated method stub
		try{
			dao.delete(board);
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

}
