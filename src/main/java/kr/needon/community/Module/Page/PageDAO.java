package kr.needon.community.Module.Page;

import kr.needon.community.Model.BoTable;
import kr.needon.community.Model.Board;
import kr.needon.community.Model.Menu;

public interface PageDAO {

	public Board pageView(Board board)throws Exception;

	public BoTable menu_info(Menu menu) throws  Exception;
	
}
