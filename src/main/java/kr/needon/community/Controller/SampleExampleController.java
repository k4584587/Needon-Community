package kr.needon.community.Controller;

import kr.needon.community.Model.Menu;
import kr.needon.community.Module.SampleExample.SampleExampleDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.needon.community.Model.Sample;
import kr.needon.community.Module.SampleExample.SampleServiceImpl;

import java.util.List;

@Controller
@RequestMapping("/sample/**")
public class SampleExampleController {
	
	@Autowired
	private SampleServiceImpl service;

	@Autowired
	SampleExampleDAO dao;
	
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

		return "/admin/menu_list";
	}

}
