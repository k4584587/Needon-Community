package kr.needon.community.Controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.needon.community.Model.Member;
import kr.needon.community.Model.Message;
import kr.needon.community.Module.Message.MessageDAOImpl;
import kr.needon.community.Module.Message.MessageServiceImpl;
import kr.needon.community.Module.User.UserDAOImpl;
import kr.needon.community.Module.User.UserService;

@Controller
@RequestMapping("/message/**")
public class MessageController {
	
	@Autowired
	private MessageDAOImpl dao;
	
	@Autowired
	private UserDAOImpl Udao;
	
	@Autowired
	private UserService Uservice;
	
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
	public String ms_sendPost(HttpServletRequest request, Message ms, Model model) throws Exception{

		System.out.println("ms_sendPost>>>>>>>>>>success!!!!");
		String you = request.getParameter("you");
		String content = request.getParameter("content");
		
		Member member = (Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Member mb1=Udao.getFindUser(you);
		
		
		ms.setUsername(member.getUsername());
		ms.setSend_nick(member.getNick());
		ms.setInfo_read_count(0);
		ms.setRead_count(1);
		
		
		int check = Uservice.id_check(you);
		
		
		System.out.println("메세지 데이터>>>>>>>>>>>>"+ms);
		System.out.println("내 데이터>>>>>>>>>>>>>>>"+member);
		System.out.println("상대방 데이터 check>>>>>>>>>>>>"+check);
		System.out.println("상대방 데이터>>>>>>>>>>>>"+mb1);
		
	
		if(mb1 == null) {
			model.addAttribute("msg","id xxxx");
			return "/alert";
		}else {
		if(check==-1) {
			System.out.println("Errer>>>>>>>>>>>>>>>>>>>>>>>>");
			model.addAttribute("msg","해당 아이디가 없습니다.");
			return "/alert";
		}else {
			ms.setYou(mb1.getUsername());
			ms.setRecv_nick(mb1.getNick());
			int result = service.getMessagesend(ms);
			System.out.println("전송 결과>>>>>>>>>>>>>>>>>>>>>>>>"+result);
			model.addAttribute("msg","전송완료");
			return "/popup_msg";
		}
		}
		
	}
	
	@RequestMapping(value="/replyForm")
	public String replyForm(Message ms,@ModelAttribute String name, Model model) {
		System.out.println("replyForm>>>>>>>>>>>>>>>>>success!!!");
		
		
		
		System.out.println("data>>>>>>>>>>>>>>>"+name);
		
		model.addAttribute("data",ms);
		
		return "/message/replyForm";
	}
	
	
	
	

}
