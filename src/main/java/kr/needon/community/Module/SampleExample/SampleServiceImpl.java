package kr.needon.community.Module.SampleExample;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import kr.needon.community.Model.BoTable;
import kr.needon.community.Model.Board;
import kr.needon.community.Model.Menu;
import kr.needon.community.Module.admin.AdminDAOImpl;
import kr.needon.community.Module.admin.AdminServiceImpl;
import org.springframework.stereotype.Service;

import kr.needon.community.Model.Sample;

@Service
public class SampleServiceImpl implements SampleService {

	@Inject
	private SampleExampleDAOImpl dao;

	@Inject
	private AdminDAOImpl adminDAO;
	
	public void selectOneItem(Sample sample) {
		// TODO Auto-generated method stub
		dao.selectOneItem(sample);
	}

	@Override
	public List<Sample> getSampleList() {
		// TODO Auto-generated method stub
		return dao.getSampleList();
	}

	@Override
	public Boolean sampleInsert(Sample sample) {
		// TODO Auto-generated method stub
		
		try {
			dao.sampleInsert(sample);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
		
		return true;
	}

	@Override
	public Boolean categoryADD(Menu menu) {

		try {
			dao.categoryADD(menu);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public Boolean top_categoryDelete(int id) {

		try{
			dao.top_categoryDelete(id);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

		return true;
	}

	@Override
	public Boolean sub_MenuADD(Menu menu) {

		try{
			dao.sub_MenuADD(menu);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

		return true;
	}


}
