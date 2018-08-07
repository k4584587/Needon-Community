package kr.needon.community.Controller;

import kr.needon.community.Model.Member;
import kr.needon.community.Module.User.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;

//=========================================
//	클래스 설명 : 파일 관리 컨트롤러 클래스
//  작성자 : 김현우
//=========================================

@Controller
@RequestMapping("/file/**")
public class FileController {

    @Autowired
    UserDAO dao;

    @GetMapping({"/profile.jpg", "/profile.png", "/profile.bmp"})
    public void ProfileImg(HttpServletResponse res, String username) throws IOException {

        Member getUser = dao.getFindUser(username);

        byte[] image = getUser.getPhoto();

        //응답 내용의 유형을 설정
        res.setContentType("image/jpg");
        //응답에 대한 길이(byte)를 설정
        res.setContentLength(image.length);

        //OutputStream 생성
        OutputStream os = res.getOutputStream();

        //지정된 바이트 배열의 b.length바이트를 이 출력 스트림에 기입.
        os.write(image);
    }

}
