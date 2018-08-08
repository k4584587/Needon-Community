package kr.needon.community.Module.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

//=====================================
//클래스 설명 : 관리자 service 인터페이스
//작성자 : 최민승
//=====================================
public interface AdminService {
	public Map<String,Object> user_List(HttpServletRequest request,
			HttpServletResponse response) throws Exception;
}
