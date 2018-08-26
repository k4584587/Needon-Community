package kr.needon.community.Module.Board;

import kr.needon.community.Model.Board;
import kr.needon.community.Model.Criteria;
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

}
