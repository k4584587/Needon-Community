package kr.needon.community.Controller;

import kr.needon.community.Model.Board;
import kr.needon.community.Model.Criteria;
import kr.needon.community.Module.Board.BoardServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;

@Controller
public class HomeController {

	@Autowired
	BoardServiceImpl boardService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, Board board, Criteria cri) throws Exception {



		//pc 카테고리 최신글
		List<String> pc_category = new ArrayList<String>();
		pc_category.add("pc_hw");
		pc_category.add("pc_game");
		pc_category.add("online_game");
		pc_category.add("inde_game");
		pc_category.add("game_shophot");

		board.setTable_list(pc_category);
		model.addAttribute("new_pc",boardService.getNew_board(board));


		//콘솔 카테고리 최신글
		List<String> game_category = new ArrayList<String>();
		game_category.add("ps4_info");
		game_category.add("switch_info");
		game_category.add("xbox_info");

		board.setTable_list(game_category);
		model.addAttribute("game_news",boardService.getNew_board(board));


		//콘솔 카테고리 최신글
		List<String> new_game = new ArrayList<String>();
		new_game.add("ps4_info");
		new_game.add("ps4game_story");
		new_game.add("pc_game");
		new_game.add("switch_info");
		new_game.add("xbox_info");

		board.setTable_list(new_game);
		model.addAttribute("new_game",boardService.getNew_board(board));


		cri.setCategory("freeboard");
		cri.setPerPageNum(5);
		cri.setPage(1);
		model.addAttribute("new_freeboard",boardService.listpage(cri));

		cri.setCategory("fun");
		cri.setPerPageNum(5);
		cri.setPage(1);
		model.addAttribute("new_fun",boardService.listpage(cri));
		
		cri.setCategory("notice");
		cri.setPerPageNum(5);
		cri.setPage(1);
		model.addAttribute("new_notice",boardService.listpage(cri));

		cri.setCategory("comic");
		cri.setPerPageNum(5);
		cri.setPage(1);
		model.addAttribute("new_comic",boardService.listpage(cri));
		
		
		return "home";
	}
	
}
