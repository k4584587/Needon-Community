package kr.needon.community.Controller;

import com.google.gson.Gson;
import kr.needon.community.Model.Board;
import kr.needon.community.Model.Member;
import kr.needon.community.Module.Blog.BlogDAOImpl;
import kr.needon.community.Module.Blog.BlogServiceImpl;
import kr.needon.community.Module.User.UserDAOImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;
import java.util.List;

@Controller
@RequestMapping("/blog/**")
public class BlogController {

    @Inject
    private UserDAOImpl userDAO;

    @Inject
    private BlogDAOImpl dao;

    @Inject
    private BlogServiceImpl service;

    @RequestMapping("/{username}")
    public String BlogHome(@PathVariable("username") String username, Model model,Board board) {


        Member user_info = userDAO.getFindUser(username);
        model.addAttribute("user_info", user_info);
        model.addAttribute("blog_info", dao.getBlogInfo(user_info.getNo()));

        try {
            user_info.getUsername();
        } catch (NullPointerException e) {
            System.out.println("사용자를 찾을수 없습니다.");
            return "/page/blog_404";
        }


        return "blog/main";
    }

    @PostMapping(value = "/time_line", produces ="text/html; charset=UTF-8")
    public @ResponseBody String TimeLineApi(Board board) {

        Gson gson = new Gson();
        List<Board> getBlogTimeLine = dao.getBlogTimeLine(board);

        return gson.toJson(getBlogTimeLine);
    }

    @PostMapping("/timeline_post")
    public @ResponseBody String timeLineInsert(Board board) {

        if(service.timeLineInsert(board)) {

            return "1";

        } else {

            return "0";

        }
    }

    @PostMapping(value = "/getTimeLineView", produces ="text/html; charset=UTF-8")
    public @ResponseBody String getTimeLineView(Board board) {

        Gson gson = new Gson();
        return gson.toJson(dao.getTimeLineView(board));
    }
}
