package kr.needon.community.Module.Board;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.needon.community.Model.Board;
import kr.needon.community.Model.Criteria;

//=====================================
//클래스 설명 : 게시판 DAO 클래스
//작성자 : 박영기
//=====================================

@Repository
public class BoardDAOImpl implements BoardDAO{
	
	@Autowired
    private SqlSession session;

    private static String namespace = "Board";
	
    /*게시판 목록보기*/
	@Override
	public List<Board> listPage(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".listpage", cri);
	}
	
	/*게시판 글쓰기*/
	@Override
	public void insert(Board board) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".insert", board);
	}
	
	/*게시판 조회*/
	@Override
	public Board view(Board board) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".view", board);
	}
	
	/* 게시판 총 갯수 */
	public int getListCount() throws Exception {
		int count = 0;	
		count = ((Integer) session.selectOne(namespace+".listcount")).intValue();

		return count;
	}
	
	/*게시판 조회수 증가*/
	@Override
	public void viewCount(Board board) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace+".viewcount",board);
	}
	
	/*게시판 삭제*/
	@Override
	public void delete(Board board) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace+".delete",board);
	}
	
	/*게시판 수정*/
	@Override
	public void modify(Board board) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace+".modify", board);
	}

}
