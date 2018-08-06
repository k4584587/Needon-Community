package kr.needon.community.Module.User;

import kr.needon.community.Model.Member;
import kr.needon.community.Model.UserRole;
import lombok.Getter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Arrays;

//=====================================================
// 	클래스 설명 : 시큐리티 커스텀 로그인 서비스 클래스
//	작성자 : 김현우
//=====================================================

@Service
@Getter
public class UserSecurityService implements UserDetailsService {

    @Autowired
    UserDAOImpl userDAO;

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {

        Member user = userDAO.getFindUser(s);
        UserRole userRole = userDAO.getUserRole(s);

        user.setGetUserRole(Arrays.asList(userRole));

        if(user == null) {
            throw new UsernameNotFoundException(s);
        }

        return user;
    }

}
