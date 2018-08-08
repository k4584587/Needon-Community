package kr.needon.community.Module.admin;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

//=====================================
//클래스 설명 : 관리자 DAO 클래스
//작성자 : 최민승
//=====================================
public class AdminDAOImpl {
	@Autowired
	SqlSession session;
	
	//유저 총 카운트 받아오기
	public int getListCount() throws Exception{
		session.selectOne("Member.getUserCount");
		return 0;
	}
}
