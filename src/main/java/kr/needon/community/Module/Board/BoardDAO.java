package kr.needon.community.Module.Board;

import java.util.List;

import kr.needon.community.Model.Board;

//=====================================
//클래스 설명 : 게시판 DAO 인터페이스
//작성자 : 박영기
//=====================================

public interface BoardDAO {
	
	public void insert (Board board)throws Exception;
	
	public List<Board> list()throws Exception;
	
	public Board view(Board board)throws Exception;
	
	public int getListCount() throws Exception;
	
	public void viewCount(Board board)throws Exception;
	
	public int delete(int no)throws Exception;
}
