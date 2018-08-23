<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 상단시작 -->
<div class="container">
	<div class="top p-4">
		<span class="logo"> <a href="<c:url value="/" />"><img
				src="<c:url value="/resources/img/logo.png" />"></a>
		</span>
		<img style="float: right" id="data_loading" src="<c:url value="/resources/img/loading.gif" />">

		<!-- 날짜 출력될 곳 --><%--<span id="date" style="float: right;"></span>--%>
		<!-- 데이터 출력될 곳 --><span id="weather_data" style="float: right!important;"></span>
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

                    // local 태그의 수 만큼 반복
              	    xml.find("local").each(function() {
                        // 개별 요소에서 도시 이름과 설명, 기온을 추출
                        var city = $(this).text();
                        var desc = $(this).attr("desc");
                        var ta = $(this).attr("ta");
                        
                        if(city == '서울') {

                            var weather_img;
                            console.log("서울 날씨 ==> " + desc);
                            if(desc == '맑음') {
                                weather_img = "<span class='weather_ico1'></span>" + "<span style='font-size: 15px;'>" + city + " " + ta + " 도 " + desc + "</span>";
							} else if (desc == '흐림') {
                                weather_img = "<span class='weather_ico2'></span>" + "<span style='font-size: 15px;'>" + city + " " + ta + " 도 " + desc + "</span>";
                            } else if (desc == '비') {
                                weather_img = "<span class='weather_ico3'></span>" + "<span style='font-size: 15px;'>" + city + " " + ta + "도 " + desc + "</span>";

                            }
                            // 동적요소를 생성하여 <ul>태그 안에 출력
                            var weather_data = $("<div>").html(weather_img);
                            $("#weather_data").append(weather_data);
                        }
                    }); 
                });
            });
        </script>