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
        <div class="login-info p-3" style="margin-bottom: 0px!important;">
            <center>
                <img width="58" src="<c:url value="/resources/img/profile_img.png" />">
            </center>

                <div class="col-xs-auto p-3">
                    <div class="login-body">
                        <span class="nick"><b>${user.nick} 님</b></span> <span><a href="<c:url value="/user/myinfo" />">내정보</a></span> <span><a style="color: blue;" href="<c:url value="/admin/" />"><b>관리자</b></a> </span>
                    </div>
                    <div class="login-body2">
                        <span>팔로우 ${user.follow } <a href="#" onclick="ms_list()">쪽지 ${message_new_count}</a> </span> <span>포인트 ${user.point} 점</span>
                    </div>
                    <form id="logout-form" action="<c:url value="/logout" />">
                        <button id="btn-logout" style="margin-top: 10px;" class="btn btn-primary btn-sm btn-block">로그아웃</button>
                    </form>
                </div>

        </div>
        <div class="" style="background-color: white;border: 1px solid #dee3eb;border-top: none">
           <div class="row" style="width: 100%;margin-left: 0px;margin-right: 0px">
               <div class="col" style="border-right: 1px solid #dee3eb;margin-left: 0px;margin-right: 0px;padding-left: 0px;padding-right: 0px">
                   <div id="btn_user_info" style="cursor: pointer;margin: 15px;text-align: center;cursor: pointer;">
                       <div  style="cursor: pointer;text-align: center;font-size: 15px;"><b><i style="color: #b694fa" class="fas fa-bell"></i></b></div>
                       <div  style="cursor: pointer;text-align: center;font-size: 15px;" id="user_info">
                           알림
                       </div>
                   </div>
               </div>
               <div class="col" style="border-right: 1px solid #dee3eb;margin-left: 0px;margin-right: 0px;padding-left: 0px;padding-right: 0px">
                   <div id="btn_message_list" style="margin: 15px;text-align: center;cursor: pointer;">
                       <div style="text-align: center;font-size: 15px;"><b><i style="color: #b694fa" class="fas fa-envelope"></i></b></div>
                       <div style="text-align: center;font-size: 15px;">
                           쪽지
                       </div>
                   </div>
               </div>
               <div class="col" style="border-right: 1px solid #dee3eb;margin-left: 0px;margin-right: 0px;padding-left: 0px;padding-right: 0px;border-right: none;">
                   <div id="btn_myblog" style="margin: 15px;text-align: center;cursor: pointer;">
                       <div style="text-align: center;font-size: 15px;"><b><i style="color: #b694fa" class="fab fa-wordpress"></i></b></div>
                       <div style="text-align: center;font-size: 15px;">
                           블로그
                       </div>
                   </div>
               </div>
           </div>
            <div class="btn_user_item" id="btn_user_item" style="display:none; border-top: 1px solid #dee3eb;border-bottom: none;">
                <div style="border-bottom: 1px solid #dee3eb;">
                    <div>
                        <ul class="item_list" id="item_list">
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- 로그인 됨 끝 } -->
    </sec:authorize>

    <c:if test="${board_page eq 1}">
        <c:if test="${info.category_no != 0}">
            <sql:query dataSource="${datasource}" var="sidebar_category">
                SELECT
                *
                from
                nb_menu_list
                where
                main_category_id = ${info.category_no}
            </sql:query>
            <div class="list-group" style="margin-top: 10px;">
                <c:forEach items="${sidebar_category.rows}" var="sidebar_menu">
                    <a href="<c:url value="${sidebar_menu.category_link}" />" class="list-group-item">${sidebar_menu.category_name}</a>
                </c:forEach>
            </div>
        </c:if>
    </c:if>


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

        $("#user_info_").hide();

        $(document).ready(function() {

            console.log("ajax load!!");

            $("#btn_user_info").click(function () {

                console.log("알림 버튼을 클릭함");

                var con = document.getElementById("btn_user_item");
                if (con.style.display == 'none') {
                    con.style.display = 'block';
                    console.log("보임");

                    $.ajax({
                        type: 'GET',
                        url: "<c:url value="/sample/message/list" />",
                        success: function (result) {

                            var jonData = JSON.parse(result);

                            console.log("message list ==> " + result);

                            console.log("쪽지 갯수  ==> " + result.toString().length);

                            if(result.toString().length > 3) {
                                console.log("쪽지 있음");
                            } else {
                                console.log("쪽지 없음");
                                $("#item_list").append("<p><b>새로운 알림이 없습니다.</b></p>");
                            }

                            $.each(jonData, function (index, item) {

                                var item_list = "<p><b>새로운 쪽지기 ${message_new_count}개 있습니다.</b></p><li>\n  <a onclick='view_message("+item.no+")' href='#'>" + item.content + "</a></li>";

                                $("#item_list").append(item_list);

                                console.log("result ==> " + item.content);
                            })
                        }
                    })

                } else {
                    con.style.display = 'none';
                    console.log("감춤");
                    $("#item_list").html("");
                }
            });



            $("#btn_myblog").click(function () {

                console.log("쪽지 버튼을 클릭함");

                var con = document.getElementById("btn_user_item");
                if (con.style.display == 'none') {
                    con.style.display = 'block';
                    console.log("보임");

                    $.ajax({
                        type: 'GET',
                        url: "<c:url value="/sample/message/list" />",
                        success: function (result) {

                            var jonData = JSON.parse(result);

                            console.log("message list ==> " + result);

                            console.log("쪽지 갯수  ==> " + result.toString().length);

                            if(result.toString().length > 3) {
                                console.log("쪽지 있음");
                            } else {
                                console.log("쪽지 없음");
                                $("#item_list").append("<p><b>팔로우된 블로거 들의 최신글이 없습니다.</b></p>"+
                                "<br><p><a href='<c:url value="/blog/${user.username}" />'>내 블로그</a></p>"
                                );
                            }

                            $.each(jonData, function (index, item) {

                                var item_list = "<p><b>새로운 쪽지기 ${message_new_count}개 있습니다.</b></p><li>\n  <a onclick='view_message("+item.no+")' href='#'>" + item.content + "</a></li>";

                                $("#item_list").append(item_list);

                                console.log("result ==> " + item.content);
                            })
                        }
                    })

                } else {
                    con.style.display = 'none';
                    console.log("감춤");
                    $("#item_list").html("");
                }
            });

            $("#btn_message_list").click(function () {

                console.log("쪽지 버튼을 클릭함");

                var con = document.getElementById("btn_user_item");
                if (con.style.display == 'none') {
                    con.style.display = 'block';
                    console.log("보임");

                    $.ajax({
                        type: 'GET',
                        url: "<c:url value="/sample/message/list" />",
                        success: function (result) {

                            var jonData = JSON.parse(result);

                            console.log("message list ==> " + result);

                            console.log("쪽지 갯수  ==> " + result.toString().length);

                            if(result.toString().length > 3) {
                                console.log("쪽지 있음");
                            } else {
                                console.log("쪽지 없음");
                                $("#item_list").append("<p><b>새로운 쪽지가 없습니다.</b></p>");
                            }

                            $.each(jonData, function (index, item) {

                                var item_list = "<p><b>새로운 쪽지기 ${message_new_count}개 있습니다.</b></p><li>\n  <a onclick='view_message("+item.no+")' href='#'>" + item.content + "</a></li>";

                                $("#item_list").append(item_list);

                                console.log("result ==> " + item.content);
                            })
                        }
                    })

                } else {
                    con.style.display = 'none';
                    console.log("감춤");
                    $("#item_list").html("");
                }
            });




   /*             $.ajax({
                    type: 'GET',
                    url: "<c:url value="/sample/message/list" />",
                    success: function (result) {

                        var jonData = JSON.parse(result);

                        console.log("message list ==> " + result);

                        $.each(jonData, function (index, item) {

                            var item_list = "<li>\n" + item.content + "</li>";

                            $("#item_list").append(item_list);

                            console.log("result ==> " + item.content);
                        })
                    }
                })
            });*/

           /* $("#btn_user_info").click(function () {

                var item_list =
                    "<li>\n" +
                    "알림\n" +
                    "</li>" +
                    "<li>\n" +
                    "리스트\n" +
                    "</li>";

                console.log("알림버튼 클릭함");
                $("#btn_user_item").toggle();
                $("#item_list").html(item_list);
            });*/

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

        function view_message(no) {
            window.open("<c:url value="/message/ms_view?no=" />"+no+"","메세지 확인","width=400,height=400");
            $("#message_count").html("0");
        }



    </script>

</div>