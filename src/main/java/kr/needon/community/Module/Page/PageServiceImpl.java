package kr.needon.community.Module.Page;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.needon.community.Model.Board;

@Service
public class PageServiceImpl implements PageService{
	
	@Inject
	private PageDAO dao;

	@Override
	public Board pageView() throws Exception {
		// TODO Auto-generated method stub
		return dao.pageView();
	}
	
	

}
