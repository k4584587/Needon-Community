package kr.needon.community.Module.admin;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.needon.community.Model.Member;
import kr.needon.community.Model.UserRole;
import kr.needon.community.Module.User.UserDAO;

//=====================================
//클래스 설명 : 관리자 service 클래스
//작성자 : 최민승
//=====================================
@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminDAO adminDao;

	@Autowired
	UserDAO userDao;

	// 유저 목록 보기
	public Map<String, Object> user_List(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("service user_List");
		List<Member> userList = new ArrayList<Member>();

		// page와 limit값을 dao로 전달해줄 변수
		Map<String, Integer> param = new HashMap<String, Integer>();

		int page = 1;
		int limit = 20;// 한 화면에 출력할 유저 수

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		param.put("page", page);
		param.put("limit", limit);

		// 총 리스트 수를 받아온다
		int listcount = adminDao.getListCount();
		userList = adminDao.getUserList(param);// 리스트 받기

		// 총 페이지 수
		int maxpage = (int) ((double) listcount / limit + 0.95);

		// 현제 페이지에 보여줄 시작 페이지 수(1,11,21 등)
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;

		// 현제 페이지에 보여줄 마지막 페이지 수(10,20,30등...)
		int endpage = maxpage;

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		// 유저 리스트 페이지로 보낼 변수들을 맵으로 저장해서 보낸다
		Map<String, Object> resultMap = new HashMap<String, Object>();

		// 유저 권한 받아오기
		List<String> roleList = new ArrayList<String>();

		System.out.println("userList start");
		// 롤 리스트로 받아오기
		
		for (int i = 0; i < userList.size(); i++) {
			UserRole userRole = userDao.getUserRole(userList.get(i).getUsername());
			userList.get(i).setGetUserRole(Arrays.asList(userRole));
			
		}

		resultMap.put("page", page);
		resultMap.put("limit", limit);
		resultMap.put("startpage", startpage);
		resultMap.put("endpage", endpage);
		resultMap.put("maxpage", maxpage);
		resultMap.put("listcount", listcount);
		resultMap.put("userList", userList);

		return resultMap;

	}
	
	//유저 정보 하나 갖고오기
	@Override
	public Member findUser(String username) throws Exception {
		// TODO Auto-generated method stub
		Member user=userDao.getFindUser(username);
		UserRole userRole = userDao.getUserRole(username);
		List<UserRole> roleList = new ArrayList<UserRole>();
		roleList.add(userRole);
		user.setGetUserRole(roleList);
		
		return user;
	}
}
