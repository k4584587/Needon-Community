<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<sql:setDataSource var="datasource" driver="net.sf.log4jdbc.sql.jdbcapi.DriverSpy"
                   url="jdbc:log4jdbc:mysql://13.125.208.101/admin_project?useUnicode=true&characterEncoding=utf8&allowMultiQueries=true&serverTimezone=UTC&useSSL=false&autoReconnectForPools=true&autoReconnection=true&testWhileIdle=false"
                   user="admin_project" password="3class"/>

<script src="<c:url value="/resources/plugins/xdomain/jquery.xdomainajax.js" />"></script>
<script>
    function ms_list(){
        window.open("<c:url value="/message/ms_list" />","쪽지","width=400,height=400");
    }
</script>

<div style="margin-top: 10px;">
    <sec:authorize access="!isAuthenticated()">
        <div class="card">
            <div class="card-body">
                <div onclick="location.href='<c:url value="/user/login" />'" style="cursor: pointer;background-color: #00a7d0; height: 37px; color: white;text-align: center;padding-top: 10px;margin-bottom: 10px;">
                  <b>니드온 로그인</b>
                </div>
                <div>
                    <span><a href="<c:url value="/user/login#join" />">비밀번호 찾기</a></span>
                </div>
            </div>
        </div>
    </sec:authorize>
    <sec:authorize access="isAuthenticated()">
        <sec:authentication property="principal" var="user"/>
        <sql:query dataSource="${datasource}" var="message_count">
            SELECT
            COUNT(IF(info_read_count = 1, null, 0)) AS count
            FROM
            nb_message
            WHERE
            you = '${user.username}'
        </sql:query>

        <c:forEach items="${message_count.rows}" var="message">
            <c:set value="${message.count}" var="message_new_count" />
        </c:forEach>
        <!-- 여기서부턴 로그인 됨 { -->
        <div class="login-info p-3">
            <div class="row">
                <div class="col-xs-auto p-3 profile">
                    <img width="58" src="<c:url value="/resources/img/profile_img.png" />">
                </div>
                <div class="col-xs-auto p-3">
                    <div class="login-body">
                        <span class="nick"><b>관리자 님</b></span> <span>내정보</span> <span><a style="color: blue;" href="/admin/"><b>관리자</b></a> </span>
                    </div>
                    <div class="login-body2">
                        <span>팔로우 ${user.follow } <a href="#" onclick="ms_list()">쪽지 ${message_new_count}</a> </span> <span>포인트 ${user.point} 점</span>
                    </div>
                    <form id="logout-form" action="<c:url value="/logout" />">
                        <button id="btn-logout" style="margin-top: 10px;" class="btn btn-primary btn-sm">로그아웃</button>
                    </form>
                </div>
            </div>
        </div>
        <!-- 로그인 됨 끝 } -->
    </sec:authorize>
    <!-- 뉴스 -->
    <div class="lat" style="margin-top: 10px;">
        <h2 class="lat_title">뉴스</h2>
        <img id="news_loading" src="<c:url value="/resources/img/loading.gif" />">
        <ul id="news_item"></ul>
    </div>

    <!-- 반응형 광고(1) -->
    <ins class="adsbygoogle"
         style="margin-top: 10px; display:block"
         data-ad-client="ca-pub-9442764132014732"
         data-ad-slot="1288679214"
         data-ad-format="auto"></ins>
    <script>
        (adsbygoogle = window.adsbygoogle || []).push({});
    </script>

    <script>

        $(document).ready(function() {
            console.log("ajax load!!");

            $("#news_loading").hide();

            $.ajax({
                type:'GET',
                url:"<c:url value="/api/news" />",
                success: function(result) {

                    var newsData = JSON.parse( result );

                    for(i=0; i<newsData.display; i++){
                        //console.log("title ==>"+newsData.items[i].title);
                        //console.log("description ==>"+newsData.items[i].description);
                        //console.log("link ==>"+newsData.items[i].link);
                        var url=newsData.items[i].link;

                        var news_item = "<li>\n" +
                            "                <a href='"+newsData.items[i].link+"'>"+newsData.items[i].title+"</a>\n" +
                            "            </li>";

                        $("#news_item").append(news_item);
                    }
                }
            })

        })

            .ajaxStart(function(){
                $('#news_loading').show(); //ajax실행시 로딩바를 보여준다.
            })
            .ajaxStop(function(){
                $('#news_loading').hide(); //ajax종료시 로딩바를 숨겨준다.
            });

    </script>

</div>