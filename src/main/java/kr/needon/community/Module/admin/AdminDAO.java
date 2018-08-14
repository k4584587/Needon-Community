package kr.needon.community.Module.admin;

import java.util.List;
import java.util.Map;

import kr.needon.community.Model.Member;
import kr.needon.community.Model.UserRole;

//=====================================
//클래스 설명 : 관리자 DAO 인터페이스
//작성자 : 최민승
//=====================================
public interface AdminDAO {
	//유저 수 받아오기
	public int getListCount() throws Exception;
	//유저 리스트 받아오기
	public List<Member> getUserList(Map<String, Integer> param) throws Exception;
	//유저 한명 수정하기
	public int modifyTheUser(Member member) throws Exception;
	//유저 한명 수정할 때 롤 값도 수정
	public void modifyTheUserRole(UserRole role) throws Exception;
}
