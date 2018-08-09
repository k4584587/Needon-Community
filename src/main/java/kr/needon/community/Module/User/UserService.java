package kr.needon.community.Module.User;

import kr.needon.community.Model.Member;

//=====================================
//클래스 설명 : 회원관리 서비스 인터페이스
//작성자 : 김현우
//=====================================
public interface UserService {
	
	public int member_Join(Member member);
	
	public Boolean getUpdate(Member member);
	
	public int id_check(String username);
}
