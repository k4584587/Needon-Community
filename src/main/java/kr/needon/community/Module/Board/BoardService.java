package kr.needon.community.Module.Board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.needon.community.Model.Board;
import kr.needon.community.Model.Criteria;

//=====================================
//클래스 설명 : 게시판 Service 인터페이스
//작성자 : 박영기
//=====================================

public interface BoardService {
	
	//public List<Board> list(Board board)throws Exception;
	
	public List<Board> listpage(Criteria cri)throws Exception;
	
	public boolean insert(HttpServletRequest request, Board board)throws Exception;
	
	public Board view(Board board)throws Exception;
	
	public void viewCount(Board board)throws Exception;
	
	public boolean delete(Board board)throws Exception;
	
	public boolean modify(HttpServletRequest request, Board board)throws Exception;
}
