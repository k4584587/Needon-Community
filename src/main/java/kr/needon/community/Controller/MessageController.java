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
	public @ResponseBody String ms_sendPost(HttpServletRequest request, Message ms,Member mb, Model model)throws Exception {
		String you = request.getParameter("you");
		String content = request.getParameter("content");
		System.out.println("ms_sendPost>>>>>>>>>>success!!!!");
		System.out.println("ms>>>>>>>>>>"+you+">>>>>>>"+content);
		
		Member member = (Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println("mb1시작>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		Member mb1=Udao.getFindUser(you);
		System.out.println("mb1받음>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		System.out.println("상대방 데이터>>>>>>>>>>>>"+mb1);
		
		
/*		ms.setUsername(member.getUsername());
		//ms.setYou(mb1.getUsername());
		System.out.println("대상 데이터 입니다>>>>>>>>>>>>>>"+member);
		System.out.println("대상 데이터 입니다>>>>>>>>>>>>>>"+ms.getYou());
		ms.setSend_nick(member.getNick());
		//ms.setRecv_nick(mb1.getNick());
		ms.setInfo_read_count(0);
		ms.setRead_count(1);
		*/
	
		
		//model.addAttribute("test", service.getMessagesend(ms));
		
		/*if(!ms.getYou().equals(Udao.getFindUser(ms.getYou()))) {
			model.addAttribute("msg","해당 아이디가 없습니다.");
			return"/alert";
		}else {
			model.addAttribute("msg","전송완료");
		}*/
		
		return ms.toString();
	}
	
	
	
	

}
