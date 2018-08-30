package kr.needon.community.Module.Board;

import java.util.List;

import kr.needon.community.Model.BoTable;
import kr.needon.community.Model.Board;
import kr.needon.community.Model.Criteria;
import kr.needon.community.Model.FileDownload;

//=====================================
//클래스 설명 : 게시판 DAO 인터페이스
//작성자 : 박영기
//=====================================

public interface BoardDAO {
	
	public void insert (Board board)throws Exception;
	
	public void file_upload(FileDownload file)throws Exception;
	
	public Board last_no(Board board)throws Exception;
	
	public FileDownload file_down(FileDownload file)throws Exception;
	
	//public List<Board> list(Board board)throws Exception;
	public List<FileDownload> file_list(FileDownload file)throws Exception;
	
	public void down_count(FileDownload file)throws Exception;
	
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
	
	public void comment_vote(Board board)throws Exception;

	public BoTable getBoardInfo(BoTable boTable);

}
