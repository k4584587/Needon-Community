package kr.needon.community.Module.Board;

import java.util.List;

import kr.needon.community.Model.Board;
import kr.needon.community.Model.Criteria;

//=====================================
//클래스 설명 : 게시판 DAO 인터페이스
//작성자 : 박영기
//=====================================

public interface BoardDAO {
	
	public void insert (Board board)throws Exception;
	
	//public List<Board> list(Board board)throws Exception;
	
	public List<Board> listPage(Criteria cri)throws Exception;
	
	public List<Board> replyList(Board board)throws Exception;
	
	public Board view(Board board)throws Exception;
	
	public int getListCount(Criteria cri) throws Exception;
	
	public void viewCount(Board board)throws Exception;
	
	public void delete(Board board)throws Exception;
	
	public void modify(Board board)throws Exception;
	
	public void repInsert(Board board)throws Exception;
	
	public void repUpdate(Board board)throws Exception;
	
	public void repDelete(Board board)throws Exception;

	public void board_vote(Board board)throws Exception;
}
