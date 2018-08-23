package kr.needon.community.Controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.needon.community.Model.Member;
import kr.needon.community.Model.Message;
import kr.needon.community.Module.Message.MessageDAOImpl;
import kr.needon.community.Module.Message.MessageServiceImpl;
import kr.needon.community.Module.User.UserDAOImpl;

@Controller
@RequestMapping("/message/**")
public class MessageController {
	
	@Autowired
	private MessageDAOImpl dao;
	
	@Autowired
	private UserDAOImpl Udao;
	
	@Autowired
	private MessageServiceImpl service;
	
	@RequestMapping(value = "/ms_list")
	public String ms_list(Message ms, Model model) throws Exception {
		
		Member member = (Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		ms.setUsername(member.getUsername());
		ms.setCount(0);
		model.addAttribute("list",dao.getMessagelist(ms));
		
		
		return "message/ms_list";
	}
	
	@RequestMapping(value = "/ms_view")
	public String ms_view(Message ms,Model model) throws Exception {
		
		model.addAttribute("ms",dao.getMessageview(ms));
		
		dao.getMessageupdate(ms);
		
		return "message/ms_view";
	}
	
	@RequestMapping(value = "/ms_send")
	public String ms_send() {
		
		Member member = (Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal();	
		
		return "message/ms_send";
	}
	

	@PostMapping(value = "/ms_sendPost")
	public String ms_sendPost(HttpServletRequest request, Message ms, Model model) {

		System.out.println("ms_sendPost>>>>>>>>>>success!!!!");
		String you = request.getParameter("you");
		String content = request.getParameter("content");
		
		Member member = (Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Member mb1=Udao.getFindUser(you);
		
		
		ms.setUsername(member.getUsername());
		ms.setYou(mb1.getUsername());
		ms.setSend_nick(member.getNick());
		ms.setRecv_nick(mb1.getNick());
		ms.setInfo_read_count(0);
		ms.setRead_count(1);
		
		System.out.println("메세지 데이터>>>>>>>>>>>>"+ms);
		System.out.println("내 데이터>>>>>>>>>>>>>>>"+member);
		System.out.println("상대방 데이터>>>>>>>>>>>>"+mb1);
		
	try {
		
		if(!ms.getYou().equals(mb1.getUsername())) {
			model.addAttribute("msg","해당 아이디가 없습니다.");
			return"/alert";
		}else {
			int result = service.getMessagesend(ms);
			System.out.println("전송 결과>>>>>>>>>>>>>>>>>>>>>>>>"+result);
			model.addAttribute("msg","전송완료");
			return "/popup_msg";
		}
	} catch (Exception e) {
		// TODO: handle exception
		model.addAttribute("msg","전송 오류");
	}
		
		return"/msg";
	}
	
	
	
	

}
