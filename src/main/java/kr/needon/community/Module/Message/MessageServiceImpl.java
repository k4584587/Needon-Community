package kr.needon.community.Module.Message;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.needon.community.Model.Message;

@Service
public class MessageServiceImpl implements MessageService{
	
	@Autowired
	private MessageDAO dao;

	@Override
	public int getMessagesend(Message ms) throws Exception {
		// TODO Auto-generated method stub
		try {
			dao.getMessagesend(ms);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}

		return 1;
	} 

}
