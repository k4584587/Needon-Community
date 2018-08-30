package kr.needon.community.Controller;

import kr.needon.community.Model.Member;
import kr.needon.community.Module.Blog.BlogDAOImpl;
import kr.needon.community.Module.User.UserDAOImpl;
import kr.needon.community.Module.User.UserServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;

@Controller
@RequestMapping("/blog/**")
public class BlogController {

    @Inject
    private UserDAOImpl userDAO;

    @Inject
    private BlogDAOImpl dao;

    @RequestMapping("/{username}")
    public String BlogHome(@PathVariable("username") String username, Model model) {


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

}
