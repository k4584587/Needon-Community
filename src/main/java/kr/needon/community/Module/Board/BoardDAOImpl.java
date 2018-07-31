package kr.needon.community.Module.Board;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.needon.community.Model.Board;

//=====================================
//클래스 설명 : 게시판 DAO 클래스
//작성자 : 박영기
//=====================================

@Repository
public class BoardDAOImpl implements BoardDAO{
	
	@Autowired
    private SqlSession session;

    private static String namespace = "Board";
	
	@Override
	public List<Board> list() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".list");
	}

	@Override
	public void insert(Board board) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".insert", board);
	}

}
