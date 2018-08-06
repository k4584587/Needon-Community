package kr.needon.community.Module.Page;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.needon.community.Model.Board;

@Repository
public class PageDAOImpl implements PageDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace = "Page";
	
	@Override
	public Board pageView(Board board) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".pageView",board);
	}

	
	

}
