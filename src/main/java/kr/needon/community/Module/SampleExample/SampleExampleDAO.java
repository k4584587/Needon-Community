package kr.needon.community.Module.SampleExample;


import java.util.List;

import kr.needon.community.Model.Sample;

public interface SampleExampleDAO {

    public Sample selectOneItem(Sample sample);
    public List<Sample> getSampleList();
    public void sampleInsert(Sample sample);

}
