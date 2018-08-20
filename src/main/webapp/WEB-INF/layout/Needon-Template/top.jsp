<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 상단시작 -->
<div class="container">
	<div class="top p-4">
		<span class="logo"> <a href="/"><img
				src="<c:url value="/resources/img/logo.png" />"></a>
		</span>
		<!-- 날짜 출력될 곳 --><span id="date" style="float: right;">날짜</span></h1>
		<!-- 데이터 출력될 곳 --><ul id="list" style="float: right;">날씨</ul>
	</div>
</div>
<!-- 상단 끝 -->
	  <script  src="<c:url value="/resources/plugins/xdomain/jquery.xdomainajax.js" />"></script> 
      <!-- 사용자 스크립트 블록 -->
        <script>        
            $(function() {
                // 페이지 열리면 데이터 로드
                $.get("http://www.kma.go.kr/XML/weather/sfc_web_map.xml", {}, function(data) {	

                    // 읽은 결과의 responseText 속성을 사용하여 XML본문을 얻는다.
                    var xml_text = data.responseText;
                    // XML 본문을 jQuery 객체로 변환
                    var xml = $(xml_text);
                    	
                    // weather 태그에서 년/월/일/시 추출
                    var weather = xml.find("weather");                    
                    var yy = weather.attr("year");
			        var mm = weather.attr("month");
                    var dd = weather.attr("day");
                    var hh = weather.attr("hour"); 
                    
                    $("#date").append("(" + yy + "년 " + mm + "월 " + dd + "일 " + hh + "시)");                  
                    	
                    

                    // 시간 출력

                    // local 태그의 수 만큼 반복
              	    xml.find("local").each(function() {
                        // 개별 요소에서 도시 이름과 설명, 기온을 추출
                        var city = $(this).text();
                        var desc = $(this).attr("desc");
                        var ta = $(this).attr("ta");
                        
                        if(city == '서울'){

                      		  // 동적요소를 생성하여 <ul>태그 안에 출력
                      		  var li = $("<li>").html("[" + city + "] " + desc + " / 현재 기온: " + ta);
                       	     $("#list").append(li);
              	       } 
                        
                    }); 
                });
            });
        </script>
    