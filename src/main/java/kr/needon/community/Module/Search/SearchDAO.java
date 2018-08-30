package kr.needon.community.Module.Search;

import java.util.List;

import kr.needon.community.Model.Board;
import kr.needon.community.Model.Criteria;

public interface SearchDAO {
	
	public List<Board> getSearch(Board board);
	
	public int getListCount(Board board) throws Exception;

}
