package kr.needon.community.Module.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.needon.community.Model.Member;

//=====================================
//클래스 설명 : 관리자 service 클래스
//작성자 : 최민승
//=====================================
@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	AdminDAO adminDao;
	
	public Map<String,Object> user_List(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		
		List<Member> userList = new ArrayList<Member>();
		int page=1;
		int limit=10;//한 화면에 출력할 레코드 수
		
		if(request.getParameter("page")!=null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		//총 리스트 수를 받아온다
		int listcount=adminDao.getListCount();
		
		
		//유저 리스트 페이지로 보낼 변수들을 맵으로 저장해서 보낸다
		Map<String,Object> resultMap=new HashMap<String,Object>();
		
		
		return resultMap;
	}
}
