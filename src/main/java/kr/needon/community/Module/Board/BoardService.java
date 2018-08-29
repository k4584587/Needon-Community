package kr.needon.community.Module.Board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.needon.community.Model.Board;
import kr.needon.community.Model.Criteria;
import kr.needon.community.Model.FileDownload;

//=====================================
//클래스 설명 : 게시판 Service 인터페이스
//작성자 : 박영기
//=====================================

public interface BoardService {
	
	//public List<Board> list(Board board)throws Exception;
	
	public List<Board> listpage(Criteria cri)throws Exception;
	
	public List<Board> replyList(Board board)throws Exception;
	
	public Board last_no(Board board)throws Exception;
	
	public boolean insert(HttpServletRequest request, Board board)throws Exception;
	
	public boolean file_upload(FileDownload file)throws Exception;
	
	public Board view(Board board)throws Exception;
	
	public int getListCount(Criteria cri) throws Exception;
	
	public void viewCount(Board board)throws Exception;
	
	public boolean delete(Board board)throws Exception;
	
	public boolean modify(HttpServletRequest request, Board board)throws Exception;
	
	public boolean repInsert(Board board, HttpServletRequest request)throws Exception;
	
	public boolean repUpdate(Board board)throws Exception;
	
	public boolean repDelete(Board board)throws Exception;

	public boolean board_vote(Board board) throws Exception;
	
	public boolean comment_vote(Board board) throws Exception;
}
