package kr.needon.community;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.needon.community.Model.Message;
import kr.needon.community.Module.Message.MessageServiceImpl;
import lombok.extern.java.Log;

	
	@Log
	@RunWith(SpringJUnit4ClassRunner.class)
	@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
	public class MessageTest {

	    @Autowired
	    private PasswordEncoder passwordEncoder;

	    @Autowired
	    private MessageServiceImpl service;
	    
	    @Test
	    public void MessageInsert() throws Exception {
	    	//`username`,`you`, `info_read_count`, `content`, `read_count`,`recv_nick`,`send_nick
	    	Message ms = new Message();
	    	ms.setUsername("abcd");
	    	ms.setYou("test2");
	    	ms.setContent("연습");
	    	ms.setRecv_nick("1");
	    	ms.setSend_nick("abcd");
	    	
	    	
	    	service.getMessagesend(ms);
	    	System.out.println(ms);
	    	
	    	
	    }

}
