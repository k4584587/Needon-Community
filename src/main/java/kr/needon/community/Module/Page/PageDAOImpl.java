package kr.needon.community.Module.Page;

import javax.inject.Inject;

import kr.needon.community.Model.BoTable;
import kr.needon.community.Model.Menu;
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

	@Override
	public BoTable menu_info(Menu menu) throws Exception {
		return session.selectOne(namespace + ".menu_info", menu);
	}


}
