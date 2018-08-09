package kr.needon.community.Module.User;

import kr.needon.community.Model.Member;
import kr.needon.community.Model.UserRole;

import java.util.List;

//=====================================
//클래스 설명 : 회원관리 DAO 인터페이스
//작성자 : 김현우, 박건우
//=====================================

public interface UserDAO {

    public List<Member> getUserLogin(String username);

    public UserRole getUserRole(String username);

    public Member getFindUser(String username);
    
    public int member_Join(Member member);
    
    public void getUpdate(Member member);
    
    public int id_check(String username);
}
