package kr.needon.community.Module.Message;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.needon.community.Model.Criteria;
import kr.needon.community.Model.Message;

@Repository
public class MessageDAOImpl implements MessageDAO{
	
	@Autowired
    private SqlSession session;

    private static String namespace = "Message";

	@Override
	public List<Message> getMessagelist(Message ms) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".getMessagelist",ms);
	}

	@Override
	public List<Message> getMessagesendlist(Message ms) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".getMessageSendlist",ms);
	}
	
	@Override
	public Message getMessageview(Message ms) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".getMessageView",ms);
	}

	@Override
	public void getMessageupdate(Message ms) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace+".getMessageUpdate",ms);
	}

	@Override
	public void getMessagesend(Message ms) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".getMessageSend",ms);
	}

	@Override
	public int getListCount(Message ms) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".listcount",ms);
	}

	@Override
	public int getSendListCount(Message ms) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".sendlistcount",ms);
	}

	


}
