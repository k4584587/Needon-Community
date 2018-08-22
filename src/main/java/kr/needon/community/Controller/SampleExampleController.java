package kr.needon.community.Controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import kr.needon.community.Model.Member;
import kr.needon.community.Model.Menu;
import kr.needon.community.Model.Message;
import kr.needon.community.Module.Message.MessageDAOImpl;
import kr.needon.community.Module.SampleExample.SampleExampleDAO;
import kr.needon.community.Module.SampleExample.SampleExampleDAOImpl;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.http.HttpRequest;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import kr.needon.community.Model.Sample;
import kr.needon.community.Module.SampleExample.SampleServiceImpl;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.CookieGenerator;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/sample/**")
public class SampleExampleController {
	
	@Autowired
	private SampleServiceImpl service;

	@Autowired
	SampleExampleDAOImpl dao;

	@Autowired
	MessageDAOImpl messageDAO;
	
	@RequestMapping("/list")
	public String ListExample(Model model) { //리스트 출력 예제
		
		
		model.addAttribute("list", service.getSampleList());
		return "sample/list";
	}
	
	@RequestMapping("/insert")
	public String InsertExample(Sample sample) {
		
		return "sample/insert";
	}
	
	@RequestMapping(value = "/insert.post", method = RequestMethod.POST)
	public String InsertExamplePost(Sample sample) {
	
		Boolean result = service.sampleInsert(sample);
		
		if(result = true ) {
			
			System.out.println("성공");
			return "redirect:/sample/list";
			
		} else {
				
			System.out.println("실패");
		}
		
		return "redirect:/sample/insert";
	}

	@RequestMapping("/menu_list") //메뉴 추가
	public String MenuList(Menu menu, Model model) {

		List<Menu> getMenuList = dao.getMenuList(menu);
		model.addAttribute("menu_list",getMenuList);

		List<Menu> getSubCategoryList = dao.getSubCategoryList(menu);
		model.addAttribute("sub_list",getSubCategoryList);

		return "/admin/menu_list";
	}

	@PostMapping("/menu_add")
	public  @ResponseBody String MenuADD(Menu menu, Model model) {

		menu.setInsert_count(0);
		if(service.categoryADD(menu)) {
			model.addAttribute("msg","성공적으로 추가 되었습니다.");
			return "1";

		} else {
			model.addAttribute("msg","메뉴 추가 실패!");
			return "0";
		}
	}

	@GetMapping(value = "/api/menu_list", produces = "text/html; charset=UTF-8")
	public @ResponseBody String GetMenuListJson(Menu menu, Model model) {


		List<Menu> getMenuListJson = dao.getMenuList(menu);


		Gson gson = new Gson();
		String jsonPlace = gson.toJson(getMenuListJson);

		model.addAttribute("test_list",getMenuListJson);

		return jsonPlace;
	}

	@PostMapping(value = "/top_menu.delete",  produces = "text/html; charset=UTF-8")
	public  @ResponseBody String TopMenuDelete(int id) {

		if(service.top_categoryDelete(id)) {
			return "1";
		} else {
			return "2";
		}
	}

	@PostMapping(value = "/sub_insert",  produces = "text/html; charset=UTF-8")
	public  @ResponseBody String Sub_Insert(Menu menu) {

		System.out.println("서브메뉴 ==> " + menu.toString());

		if(service.sub_MenuADD(menu)) {
			return "1";
		} else {
			return "2";
		}
	}

	@GetMapping(value = "/message/list", produces = "text/html; charset=UTF-8")
	public @ResponseBody String MessageApi(Message mssage) throws Exception {

		Gson gson = new Gson();
		Member member = (Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		mssage.setUsername(member.getUsername());
		mssage.setCount(1);
		return gson.toJson(messageDAO.getMessagelist(mssage));
	}

}
