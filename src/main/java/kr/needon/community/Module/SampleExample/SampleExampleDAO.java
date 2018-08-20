package kr.needon.community.Module.SampleExample;


import java.util.List;

import kr.needon.community.Model.Menu;
import kr.needon.community.Model.Sample;

public interface SampleExampleDAO {

    public Sample selectOneItem(Sample sample);
    public List<Sample> getSampleList();
    public void sampleInsert(Sample sample);

    public List<Menu> getMenuList(Menu menu);
    public List<Menu> getSubCategoryList(Menu menu);

    public void categoryADD(Menu menu);
    public void top_categoryDelete(int id);
    public void sub_MenuADD(Menu menu);

}
