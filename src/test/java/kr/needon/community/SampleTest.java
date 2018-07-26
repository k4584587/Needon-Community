package kr.needon.community;

import java.util.List;

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
    
    

}
