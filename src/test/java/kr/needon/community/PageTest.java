package kr.needon.community;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.needon.community.Module.Page.PageDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class PageTest {
	
	@Inject
	private PageDAO dao;
	
	private static Logger logger= LoggerFactory.getLogger(PageTest.class);
	
	@Test
	public void testRead()throws Exception{
		
		logger.info(dao.pageView().toString());
	}

}
