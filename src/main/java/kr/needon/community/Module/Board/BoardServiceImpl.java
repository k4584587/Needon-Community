package kr.needon.community.Module.Board;

import kr.needon.community.Model.Board;
import kr.needon.community.Model.Criteria;
import kr.needon.community.Model.FileDownload;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

//=====================================
//클래스 설명 : 게시판 Service 클래스
//작성자 : 박영기
//=====================================

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAOImpl dao;

	/* 게시판 목록보기 */
	@Override
	public List<Board> listpage(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listPage(cri);
	}

	/* 게시판 글쓰기 */
	@Override
	public boolean insert(HttpServletRequest request, Board board) throws Exception {
		// TODO Auto-generated method stub
		try {
			String ip = request.getHeader("X-FORWARDED-FOR");
			if (ip == null)
				ip = request.getRemoteAddr();

			board.setIp(ip);

			dao.insert(board);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}

		return true;
	}

	/* 게시판 조회 */
	@Override
	public Board view(Board board) throws Exception {
		// TODO Auto-generated method stub
		return dao.view(board);
	}

	/* 게시판 조회수 증가 */
	@Override
	public void viewCount(Board board) throws Exception {
		// TODO Auto-generated method stub
		dao.viewCount(board);
	}

	/* 게시판 삭제 */
	@Override
	public boolean delete(Board board) throws Exception {
		// TODO Auto-generated method stub
		try {
			dao.delete(board);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	/* 게시판 수정 */
	@Override
	public boolean modify(HttpServletRequest request, Board board) throws Exception {
		// TODO Auto-generated method stub
		try {

			String ip = request.getHeader("X-FORWARDED-FOR");
			if (ip == null)
				ip = request.getRemoteAddr();

			board.setIp(ip);

			dao.modify(board);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	/*게시판 총 갯수*/
	@Override
	public int getListCount(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.getListCount(cri);
	}
	
	/*게시판 댓글 목록*/
	@Override
	public List<Board> replyList(Board board) throws Exception {
		// TODO Auto-generated method stub
		return dao.replyList(board);
	}
	
	/*댓글 추가*/
	@Override
	public boolean repInsert(Board board, HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		try {

			String ip = request.getHeader("X-FORWARDED-FOR");
			if (ip == null)
				ip = request.getRemoteAddr();

			board.setIp(ip);

			dao.repInsert(board);
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	/*댓글 수정*/
	@Override
	public boolean repUpdate(Board board) throws Exception {
		// TODO Auto-generated method stub
		try {
			dao.repUpdate(board);
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	/*댓글 삭제*/
	@Override
	public boolean repDelete(Board board) throws Exception {
		// TODO Auto-generated method stub
		try {
			dao.repDelete(board);
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	/*게시판 좋아요 및 싫어요*/
	@Override
	public boolean board_vote(Board board) throws Exception {

		try {
			dao.board_vote(board);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

		return true;
	}
	
	/*댓글 좋아요 및 싫어요*/
	@Override
	public boolean comment_vote(Board board) throws Exception {
		// TODO Auto-generated method stub
		try {
			dao.comment_vote(board);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

		return true;
	}
	
	/*파일 업로드*/
	@Override
	public boolean file_upload(FileDownload file) throws Exception {
		// TODO Auto-generated method stub
		try {
			dao.file_upload(file);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("error ==> " + e);
			return false;
		}
		return true;
	}
	
	/*마지막 번호 구하기*/
	@Override
	public Board last_no(Board board) throws Exception {
		// TODO Auto-generated method stub
		return dao.last_no(board);
	}
	
	/*파일 리스트 구하기*/
	@Override
	public List<FileDownload> file_list(FileDownload file) throws Exception {
		// TODO Auto-generated method stub
		return dao.file_list(file);
	}
	
	/*파일 다운로드*/
	@Override
	public FileDownload file_down(FileDownload file) throws Exception {
		// TODO Auto-generated method stub
		return dao.file_down(file);
	}
	
	/*다운로드 횟수*/
	@Override
	public void down_count(FileDownload file) throws Exception {
		// TODO Auto-generated method stub
		dao.down_count(file);
	}

}
