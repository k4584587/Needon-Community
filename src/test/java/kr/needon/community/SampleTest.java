package kr.needon.community;

import java.util.ArrayList;
import java.util.List;

import kr.needon.community.Model.BoTable;
import kr.needon.community.Model.Board;
import kr.needon.community.Module.SampleExample.SampleExampleDAO;
import kr.needon.community.Module.SampleExample.SampleExampleDAOImpl;
import kr.needon.community.Module.admin.AdminDAOImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.needon.community.Model.Sample;
import kr.needon.community.Module.SampleExample.SampleServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class SampleTest {

	@Autowired
    private SampleServiceImpl service;

	@Autowired
    private SampleExampleDAOImpl dao;

	@Autowired
    private AdminDAOImpl adminDAO;

    @Test
    public void SelectOneTest() { // Where절 사용 예제
        Sample sample = new Sample();
        sample.setId(2);
        service.selectOneItem(sample);
    }
    
    @Test
    public void SampleListTest() { //전체 리스트 사용 예제
    	List<Sample> list = service.getSampleList();
    	System.out.println(list.toString());
    }
    
    @Test
    public void InsertTest() { //데이터 삽입 예제
    	Sample sample = new Sample();
    	
    	sample.setName("name");
    	sample.setContext("Test!!");
    	
    	Boolean result = service.sampleInsert(sample);
    	System.out.println("결과 ==> " + result);
    }

    @Test
    public void BoardTableList() {

        BoTable boTable = new BoTable();

        List<BoTable> getBoardTableList = adminDAO.getBoTable();

        List<String> list = new ArrayList<String>();

        for(BoTable getBoardTable : getBoardTableList) {
            System.out.println("테이블 리스트 ==> " + getBoardTable.getBo_table());
            list.add(getBoardTable.getBo_table());
        }

        System.out.println("테이블 리스트 ==> " + list.toString());

    }

    @Test
    public void SiteSearch() {

        Board board = new Board();

        board.setKeyword("t");
        dao.getSearch(board);

    }

}
