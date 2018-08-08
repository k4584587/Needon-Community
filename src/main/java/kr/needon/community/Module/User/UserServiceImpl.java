package kr.needon.community.Module.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.needon.community.Model.Member;

//=====================================
//클래스 설명 : 회원관리 서비스 클래스
//작성자 : 김현우
//=====================================

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAO userDAO;
	
	@Override
	public int member_Join(Member member) {
		// TODO Auto-generated method stub
		return userDAO.member_Join(member);
	}
	
}
