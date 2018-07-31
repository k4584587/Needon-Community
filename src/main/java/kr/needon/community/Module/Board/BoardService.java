package kr.needon.community.Module.Board;

import java.util.List;

import kr.needon.community.Model.Board;

//=====================================
//클래스 설명 : 게시판 Service 인터페이스
//작성자 : 박영기
//=====================================

public interface BoardService {
	public List<Board> list()throws Exception;
	
	public boolean insert(Board board)throws Exception;
	
	public Board view(Board board)throws Exception;
	
	public void viewCount(int no)throws Exception;
}
