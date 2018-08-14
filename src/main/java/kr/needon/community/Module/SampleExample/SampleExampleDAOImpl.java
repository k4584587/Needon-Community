package kr.needon.community.Module.SampleExample;

import java.util.List;

import javax.inject.Inject;

import kr.needon.community.Model.Menu;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.needon.community.Model.Sample;

@Repository
public class SampleExampleDAOImpl implements SampleExampleDAO {

    @Inject
    private SqlSession session;

    private static String namespace = "kr.needon.community.Module.SampleExample.SampleExampleDAO";


    @Override
    public Sample selectOneItem(Sample sample) {
        return session.selectOne(namespace + ".selectOneItem",sample);
    }


	@Override
	public List<Sample> getSampleList() {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".getSampleList");
	}


	@Override
	public void sampleInsert(Sample sample) {
		// TODO Auto-generated method stub
		session.insert(namespace + ".sampleInsert",sample);
	}

	@Override
	public List<Menu> getMenuList(Menu menu) {
		return session.selectList(namespace+".getMenuList", menu);
	}

	@Override
	public List<Menu> getSubCategoryList(Menu menu) {
		return session.selectList(namespace + ".getSubCategoryList", menu);
	}

	@Override
	public void categoryADD(Menu menu) {
		session.insert(namespace + ".categoryADD", menu);
	}
}
