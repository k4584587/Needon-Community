package kr.needon.community.Controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.needon.community.Model.Member;
import kr.needon.community.Model.Message;
import kr.needon.community.Model.MsPageMaker;
import kr.needon.community.Model.PageMaker;
import kr.needon.community.Module.Message.MessageDAOImpl;
import kr.needon.community.Module.Message.MessageServiceImpl;
import kr.needon.community.Module.User.UserDAOImpl;
import kr.needon.community.Module.User.UserService;

//=====================================
//클래스 설명 : 쪽지 컨트롤러 클래스
//작성자 : 박건우
//=====================================

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
	
	//받은 쪽지 리스트
	@RequestMapping(value = "/ms_list")
	public String ms_list(Message ms, Model model) throws Exception {
		
		Member member = (Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		ms.setPerPageNum(10);
		ms.setUsername(member.getUsername());
		ms.setCount(1);
		model.addAttribute("list",dao.getMessagelist(ms));
		
		
		MsPageMaker pageMaker = new MsPageMaker();
		pageMaker.setMs(ms);
		pageMaker.setTotalCount(dao.getListCount(ms));
		System.out.println("데이터>>>>>>>>>>>>>>>>>>>"+pageMaker);
		model.addAttribute("pageMaker", pageMaker);
		
		return "message/ms_list";
	}
	
	//보낸 쪽지 리스트
	@RequestMapping(value = "/send_list")
	public String send_list(Message ms, Model model) throws Exception {
		
		System.out.println("send_list>>>>>>>>>>>>>>>success!!!");
		
		Member member = (Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		ms.setUsername(member.getUsername()); 
		System.out.println("list>>>>>>>>>>>>>"+dao.getMessagesendlist(ms));
		ms.setPerPageNum(10);
		model.addAttribute("list",dao.getMessagesendlist(ms));
		
		MsPageMaker pageMaker = new MsPageMaker();
		pageMaker.setMs(ms);
		pageMaker.setTotalCount(dao.getSendListCount(ms));
		System.out.println("데이터>>>>>>>>>>>>>>>>>>>"+pageMaker);
		model.addAttribute("pageMaker", pageMaker);
		
		return "message/send_list";
	}
	
	
	//쪽지 정보 확인
	@RequestMapping(value = "/ms_view")
	public String ms_view(Message ms,Model model) throws Exception {
		
		model.addAttribute("ms",dao.getMessageview(ms));
		
		dao.getMessageupdate(ms);
		
		return "message/ms_view";
	}
	
	//쪽지 전송 폼 이동
	@RequestMapping(value = "/ms_send")
	public String ms_send() {
		
		Member member = (Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal();	
		
		return "message/ms_send";
	}
	
	//쪽지 전송
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
			model.addAttribute("msg","상대방 아이디를 정확히 입력하세요");
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
	
	// 쪽지 답장 폼 이동
	@PostMapping(value="/replyForm")
	public String replyForm(HttpServletRequest request, Model model) {
		System.out.println("replyForm>>>>>>>>>>>>>>>>>success!!!");
		
		
		String username = request.getParameter("username");
		
		System.out.println("data>>>>>>>>>>>>>>>"+username);
		
		model.addAttribute("data",username);
		
		return "/message/replyForm";
	}
	
	//쪽지 답장 전송
	@PostMapping(value="/reply")
	public String reply(HttpServletRequest request, Message ms, Model model) throws Exception {
		
		System.out.println("reply>>>>>>>>>>>>>>>success!!");
		
		String you = request.getParameter("username");
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
			model.addAttribute("msg","상대방 아이디를 정확히 입력하세요");
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
	
	
	
	

}
