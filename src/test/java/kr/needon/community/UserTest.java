package kr.needon.community;

import kr.needon.community.Model.Member;
import kr.needon.community.Model.UserRole;
import kr.needon.community.Module.User.UserDAOImpl;
import lombok.extern.java.Log;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Arrays;
import java.util.List;

@Log
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class UserTest {

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private UserDAOImpl userDAO;

    @Test
    public void UserPsswordEncoder() {

        String rawPassword = "1234";
        String encodedPassword = passwordEncoder.encode(rawPassword);



        boolean result = passwordEncoder.matches(rawPassword,"$2a$10$4Y7B1IPWyXcSVwTzQoLdvupny3eNx06dlt4zdb8Fpqhavui34izEy");

        System.out.println("패스워드 암호화 ==> " + encodedPassword);
        System.out.println("암호화 패스워드 일치 확인 ==> " + result);
    }


    @Test
    public void UserTest() {

        Member user = userDAO.getFindUser("test");
        UserRole userRole = userDAO.getUserRole("test");

        user.setGetUserRole(Arrays.asList(userRole));

        System.out.println("결과 ==> " + user.toString());

        /*Member user = userDAO.getFindUser("test");
        UserRole userRole = userDAO.geteUserRole("test");


        user.setGetUserRole(Arrays.asList(userRole));


        System.out.println("결과 ==> " + user.toString());*/
    }

    @Test
    public void UserFindCount() {

        List<Member> getLogin = userDAO.getUserLogin("1");

        System.out.println("회원찾음 " + getLogin.size());
    }

}
