package kr.needon.community.Module.SampleExample;

import java.util.List;

import kr.needon.community.Model.Menu;
import kr.needon.community.Model.Sample;

public interface SampleService {

	public void selectOneItem(Sample sample);
	public List<Sample> getSampleList();
	public Boolean sampleInsert(Sample sample);
	public Boolean categoryADD(Menu menu);
}
