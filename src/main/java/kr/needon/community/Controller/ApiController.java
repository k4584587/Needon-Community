package kr.needon.community.Controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/api/**")
public class ApiController {
	
	//뉴스 API
	@RequestMapping(value="/news", produces ="text/html; charset=UTF-8")
	public @ResponseBody
    byte[] API_news() throws UnsupportedEncodingException {
		StringBuffer response = new StringBuffer();
		String clientId = "jIMehn5ftjYzRUqqn8mQ";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "WPHycD3kfM";//애플리케이션 클라이언트 시크릿값";
        int display=5;
        try {
            String text = URLEncoder.encode("스포츠", "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/search/news.json?query="+text+"&display="+display; // json 결과
           // String apiURL = "https://openapi.naver.com/v1/search/news.xml?query="+ text+"&display="+display; // xml 결과
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
           
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            
            
            
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            System.out.println(response.toString());
            //response담기
        } catch (Exception e) {
            System.out.println(e);
        }
        
   	
   	return response.toString().getBytes("UTF-8");
	}

}
