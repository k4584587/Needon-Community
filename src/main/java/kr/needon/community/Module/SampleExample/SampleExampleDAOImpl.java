package kr.needon.community.Module.SampleExample;

import kr.needon.community.Model.Menu;
import kr.needon.community.Model.Sample;
import kr.needon.community.Module.admin.AdminDAOImpl;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class SampleExampleDAOImpl implements SampleExampleDAO {

    @Inject
    private SqlSession session;

    @Inject
	private AdminDAOImpl adminDAO;

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

	@Override
	public void top_categoryDelete(int id) {
		session.delete(namespace+ ".top_categoryDelete", id);
	}

	@Override
	public void sub_MenuADD(Menu menu) {
		session.insert(namespace + ".sub_MenuADD", menu);
	}


}
