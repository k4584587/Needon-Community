package kr.needon.community.Module.SampleExample;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.needon.community.Model.Sample;

@Service
public class SampleServiceImpl implements SampleService {

	@Inject
	private SampleExampleDAOImpl dao;
	
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

	

}
