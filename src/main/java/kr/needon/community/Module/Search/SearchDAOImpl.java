package kr.needon.community.Module.Search;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.needon.community.Model.BoTable;
import kr.needon.community.Model.Board;
import kr.needon.community.Model.Criteria;
import kr.needon.community.Module.admin.AdminDAOImpl;

@Repository
public class SearchDAOImpl implements SearchDAO{
	
	@Inject
    private SqlSession session;
	
    private static String namespace = "Search";
    
    @Inject
    private AdminDAOImpl adminDAO;


	@Override
	public List<Board> getSearch(Board board) {
		// TODO Auto-generated method stub
		List<BoTable> getBoardTableList = adminDAO.getBoTable();

		List<String> list = new ArrayList<String>();
		//Board board = new Board();

		for(BoTable getBoardTable : getBoardTableList) {
			System.out.println("테이블 리스트 ==> " + getBoardTable.getBo_table());
			list.add(getBoardTable.getBo_table());
		}

		board.setTable_list(list);

		System.out.println("테이블 리스트 ==> " + list.toString());

		return session.selectList(namespace + ".getSearch",board);
	}


	/* 게시판 총 갯수 */
	public int getListCount(Criteria cri) throws Exception {
	
		return session.selectOne(namespace+".listcount", cri);

	}
}
