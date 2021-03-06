package kr.needon.community.Module.admin;

import kr.needon.community.Model.BoTable;
import kr.needon.community.Model.Member;
import kr.needon.community.Model.UserRole;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

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
	
	@Override
	public int modifyTheUser(Member member) throws Exception {
		// TODO Auto-generated method stub
		
		return session.update("Member.modifyTheUser", member);
	}
	
	@Override
	public void modifyTheUserRole(UserRole role) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("adminDAO");
		session.update("Member.modifyTheUserRole",role);
	}
	
	@Override
	public List<Member> getFindUsers(Map<String, Object> keys) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("DAOgetFindUsers");
	
		return session.selectList("Admin.getFindUser", keys);
	}

	@Override
	public int getFindListCount(Map<String,Object> param) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("DAO getFindListCount");
		return session.selectOne("Admin.getFindListCount",param);
	}

	@Override
	public List<BoTable> getBoTable() {
		return session.selectList("Admin.getBoTable");
	}

	@Override
	public void AddBoard(BoTable boTable) throws Exception {
		session.insert("Admin.AddBoard",boTable);
	}

	@Override
	public void BoardDelete(BoTable boTable) throws Exception {
		session.delete("Admin.BoardDelete",boTable);
	}

	@Override
	public void PageInsert(BoTable boTable) throws Exception {
		session.insert("Admin.PageInsert",boTable);
	}

}
