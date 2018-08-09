package kr.needon.community.Module.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.needon.community.Model.Member;

//=====================================
//클래스 설명 : 관리자 DAO 클래스
//작성자 : 최민승
//=====================================
@Repository
public class AdminDAOImpl implements AdminDAO{
	@Autowired
	SqlSession session;
	
	//유저 총 카운트 받아오기
	public int getListCount() throws Exception{
		return session.selectOne("Member.getUserCount");
	}
	
	@Override
	//유저리스트 받아오기
	public List<Member> getUserList( Map<String,Integer> param) throws Exception{
		return session.selectList("Member.getUserList", param);
	}

	
}
