package kr.needon.community.Module.User;

import kr.needon.community.Model.Member;
import kr.needon.community.Model.UserRole;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

//=====================================
//클래스 설명 : 회원관리 DAO 클래스
//작성자 : 김현우
//=====================================

@Repository
public class UserDAOImpl implements UserDAO {

    @Autowired
    private SqlSession session;

    private static String namespace = "Member";

    @Override
    public List<Member> getUserLogin(String username) {
        return session.selectList(namespace + ".getUserLogin", username);
    }

    @Override
    public UserRole getUserRole(String username) {
        return session.selectOne(namespace + ".geteUserRole", username);
    }

    @Override
    public Member getFindUser(String username) {
        return session.selectOne(namespace + ".getFindUser", username);
    }
}
