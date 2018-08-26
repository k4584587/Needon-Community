package kr.needon.community.Module.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.needon.community.Model.BoTable;
import kr.needon.community.Model.Member;
import kr.needon.community.Model.UserRole;

//=====================================
//클래스 설명 : 관리자 service 인터페이스
//작성자 : 최민승
//=====================================
public interface AdminService {
	public Map<String,Object> user_List(HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	
	public Member findUser(String username) throws Exception;
	
	public int modifyTheUser(Member member) throws Exception;
	public void modifyTheUserRole(UserRole role) throws Exception;
	public Map<String,Object> getFindUserList(HttpServletRequest request, Map<String,Object> keys) throws Exception;

	public Boolean AddBoard(BoTable boTable) throws Exception;

	public Boolean BoardDelete(BoTable boTable) throws  Exception;

}
