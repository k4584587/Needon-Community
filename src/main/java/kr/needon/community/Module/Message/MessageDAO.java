package kr.needon.community.Module.Message;

import java.util.List;

import kr.needon.community.Model.Criteria;
import kr.needon.community.Model.Message;

public interface MessageDAO {
	
	public List<Message> getMessagelist(Message ms)throws Exception;
	
	public Message getMessageview(Message ms)throws Exception;
	
	public void getMessageupdate(Message ms)throws Exception;
	
	public void getMessagesend(Message ms)throws Exception;
	
	public List<Message> getMessagesendlist(String username)throws Exception;
	
	public int getListCount(Message ms) throws Exception;

}
