package kr.needon.community.Module.admin;

import java.util.List;

import kr.needon.community.Model.Member;

//=====================================
//클래스 설명 : 관리자 DAO 인터페이스
//작성자 : 최민승
//=====================================
public interface AdminDAO {
	public int getListCount() throws Exception;
	public List<Member> getUserList(int page) throws Exception;
}
