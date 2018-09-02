<%--
  Created by IntelliJ IDEA.
  User: k4584587
  Date: 2018. 8. 30.
  Time: AM 10:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<sql:setDataSource var="datasource" driver="net.sf.log4jdbc.sql.jdbcapi.DriverSpy"
                   url="jdbc:log4jdbc:mysql://125.183.115.12/admin_project?useUnicode=true&characterEncoding=utf8&allowMultiQueries=true&serverTimezone=UTC"
                   user="admin_project" password="3class"/>

<sql:query dataSource="${datasource}" var="post_count">
    SELECT no FROM nb_blog_${user_info.username} ORDER BY no DESC limit 1 ;
</sql:query>

<c:forEach items="${post_count.rows}" var="count_result">
    <c:set var="last_count" value="${count_result.no}"/>
</c:forEach>
<style>

    .main_profile {
        margin-bottom: 10px;
    }

    .blog .category {
        margin-bottom: 5px;
    }

    .blog .subject {
        font-size: 15px;
        font-weight: 600;
    }

    .blog .content {
        color: #666;
    }

    .blog .profile {
        margin-bottom: 10px;
    }

    #news_loading {
        display: none;
    }
</style>

<div style="margin-left: 10px;" class="blog">
    <div class="main_profile" style="margin-bottom: 0px!important;">
        <div class="row">
            <div class="col" style="padding-left: 0px;padding-right: 0px">
                <div class="jumbotron" style="margin-bottom: 10px;margin-left: 15px">
                    <h4>
                        <c:choose>
                            <c:when test="${blog_info.blog_title eq null}">
                                ${user_info.nick} 님의 블로그
                            </c:when>
                            <c:otherwise>
                                ${blog_info.blog_title}
                            </c:otherwise>
                        </c:choose>
                    </h4>
                    <span>팔로우 ${user.follow}명</span> <span>구독 0명</span>
                    <div style="margin-top: 5px">
                        <button class="btn btn-danger btn-sm">관리</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <sec:authorize access="isAuthenticated()">
        <form id="timeLineInsertForm" action="<c:url value="/blog/timeline_post" />" method="post">

            <input type="text" id="subject" name="subject" class="form-control" placeholder="글 제목"
                   style="margin-bottom: 10px" required>
            <div style="background-color: white; margin-bottom: 10px;">
                        <textarea name="content" id="smarteditor" class="form-control"
                                  style="margin-bottom: 10px;background-color: white;width: 100%;" placeholder="글 내용"
                                  required></textarea>
            </div>


            <button type="button" id="timeLineInsert" class="btn btn-success btn-block" style="margin-bottom: 10px;">글 등록</button>
        </form>
    </sec:authorize>

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb" style="background-color: #d4d4d4!important;">
            <li class="breadcrumb-item active" aria-current="page">잡담</li>
            <li class="breadcrumb-item active" aria-current="page">리뷰</li>
            <li class="breadcrumb-item active" aria-current="page">IT</li>
            <li class="breadcrumb-item active" aria-current="page">게임</li>
        </ol>
    </nav>
    <div id="blog_timeline">

    </div>
    <span id="more_btn_ajax"></span>
    <%--<button class="btn btn-primary btn-sm btn-block" id="more_btn">더보기</button>--%>
</div>

<!-- Post View Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="timeline_title"></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="conatiner" id="view_content"></div>
            </div>
        </div>
    </div>
</div>

<script>

    var last_no = ${last_count};

    function test() {

        last_no += 1;

        console.log("번호 ==> " +last_no);
    }


    //스마트에디터 적용
    $(function () {


        <sec:authorize access="isAuthenticated()">
        //전역변수선언
        var editor_object = [];

        nhn.husky.EZCreator
            .createInIFrame({
                oAppRef: editor_object,
                elPlaceHolder: "smarteditor",
                sSkinURI: "<c:url value='/resources/smarteditor/SmartEditor2Skin.html'/>",
                htParams: {
                    // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
                    bUseToolbar: true,
                    // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
                    bUseVerticalResizer: true,
                    // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
                    bUseModeChanger: true,
                }
            });
        <sec:authorize access="isAuthenticated()">
        //타임라인 글추가
        $("#timeLineInsert").click(function () {
            console.log("글쓰기 버튼 클릭함");

            $("#timeLineInsert").prop('disabled', true);
            $("#timeLineInsert").html("<i class=\"fas fa-spinner fa-spin\"></i>\n" + "\n 글 등록 중...");


            last_no += 1;

            console.log("글 등록 번호 ==> " + last_no);

            var subject = $("#subject").val();
            var content_body = editor_object.getById["smarteditor"].getIR();
            console.log("제목 ==> " + subject);
            console.log("내용 ==> " + content_body);

            $.ajax({
                type: 'POST',
                url: '<c:url value="/blog/timeline_post" />',
                data: {"subject": subject, "content": content_body},
                success: function (result) {
                    if (result == 1) {

                        varContent = content_body;

                        varContent = removeStyleAndImage(varContent, '<img src=', '">', '');      // 스마트에디터 내부의 이미지 제거
                        varContent = removeStyleAndImage(varContent, '<br', ';">');    // 스마트에디터 내부의 스타일 제거
                        varContent = removeStyleAndImage(varContent, '<pre', ';">', '</pre>');    // 스마트에디터 내부의 스타일 제거
                        varContent = removeStyleAndImage(varContent, '<p', ';">', '</p>');  // 스마트에디터 내부의 스타일 제거
                        varContent = removeStyleAndImage(varContent, '<span', ';">', '</span>');  // 스마트에디터 내부의 스타일 제거


                        var timeline_insert_html = "<div class=\"row\" style=\"background-color: white;margin-left: 0px;margin-right: 0px;margin-bottom: 10px;\" id=\"blog_timeline\">\n" +
                            "    <div class=\"col-8 p-3\">\n" +
                            "        <div class=\"profile\">\n" +
                            "            10분전\n" +
                            "        </div>\n" +
                            "        <div class=\"category\">\n" +
                            "            <a href=\"#\">잡담</a>\n" +
                            "        </div>\n" +
                            "        <div class=\"subject\" style=\"margin-bottom: 10px;\">\n" +
                            "            <a onclick=\"post_view("+last_no+")\" href=\"#\" data-toggle=\"modal\" data-target=\"#exampleModalCenter\">"+subject+"</a>\n" +
                            "        </div>\n" +
                            "        <div class=\"content\">\n" +
                            "            <a href=\"#\" onclick=\"post_view("+last_no+")\" data-toggle=\"modal\" data-target=\"#exampleModalCenter\">\n" +
                            ""+varContent+"</a>\n" +
                            "        </div>\n" +
                            "        <div style=\"margin-top: 10px;color: #959595\"><span>공감 0</span> <span>댓글 0</span></div>\n" +
                            "    </div>\n" +
                            "    <div class=\"col p-3\" style=\"text-align: right\">\n" +
                            "        <img src=\"https://via.placeholder.com/165\">\n" +
                            "    </div>\n" +
                            "</div>\n";

                        $("#blog_timeline").prepend(timeline_insert_html);
                        console.log("등록성공!");

                        $("#timeLineInsert").prop('disabled', false);
                        $("#timeLineInsert").html("글 등록");

                    } else {
                        console.log("등록실패!");
                    }
                }
            })
        });
        </sec:authorize>

        </sec:authorize>

        //타임라인 글 가져오기
        $(document).ready(function () {
            console.log("ajax load!!");


            $.ajax({
                type: 'POST',
                url: '<c:url value="/blog/time_line" />',
                data: {"username": "${user_info.username}", "count": 0},
                success: function (result) {
                    console.log("blog timeline list ==> " + result);

                    var jonData = JSON.parse(result);

                    $.each(jonData, function (index, item) {
                        varContent = item.content;

                        var img_tag = $(item.content).find('img').attr('src');

                        console.log("이미지 링크 ==> " + img_tag);


                        varContent = removeStyleAndImage(varContent, '<img src=', '">', '');      // 스마트에디터 내부의 이미지 제거
                        varContent = removeStyleAndImage(varContent, '<br', ';">');    // 스마트에디터 내부의 스타일 제거
                        varContent = removeStyleAndImage(varContent, '<pre', ';">', '</pre>');    // 스마트에디터 내부의 스타일 제거
                        varContent = removeStyleAndImage(varContent, '<p', ';">', '</p>');  // 스마트에디터 내부의 스타일 제거
                        varContent = removeStyleAndImage(varContent, '<span', ';">', '</span>');  // 스마트에디터 내부의 스타일 제거

                        timeline_html = "<div class=\"row\" style=\"background-color: white;margin-left: 0px;margin-right: 0px;margin-bottom: 10px;\" id=\"blog_timeline\">\n" +
                            "        <div class=\"col-8 p-3\">\n" +
                            "            <div class=\"profile\">\n" +
                            "                10분전\n" +
                            "            </div>\n" +
                            "            <div class=\"category\">\n" +
                            "                <a href=\"#\">잡담</a>\n" +
                            "            </div>\n" +
                            "            <div class=\"subject\" style=\"margin-bottom: 10px;\">\n" +
                            "                <a onclick='post_view(" + item.no + ")' href=\"#\" data-toggle=\"modal\" data-target=\"#exampleModalCenter\">" + item.subject + "</a>\n" +
                            "            </div>\n" +
                            "            <div class=\"content\">\n" +
                            "                <a href=\"#\" onclick='post_view(" + item.no + ")' data-toggle=\"modal\" data-target=\"#exampleModalCenter\">\n" + varContent +
                            "                </a>\n" +
                            "            </div>\n" +
                             "            <div style=\"margin-top: 10px;color: #959595\"><span>공감 0</span> <span>댓글 " + item.cm_count + "</span></div>\n" +
                            "        </div>\n" +
                            "        <div class=\"col p-3\" style=\"text-align: right\">\n" 
                            "           <img src=\"https://via.placeholder.com/165\">\n" +
                            "        </div>\n" +
                            "    </div>";

                        var more_btn = "<button onclick='more_btn(" + item.no + ")' class=\"btn btn-primary btn-sm btn-block\" id=\"more_btn\">더보기</button>";

                        $("#more_btn_ajax").html(more_btn);
                        $("#blog_timeline:last").append(timeline_html);
                    });
                }
            })

        });


        //form 데이터 json 으로 변환 함수
        $.fn.serializeObject = function () {

            var o = {};
            var a = this.serializeArray();
            $.each(a, function () {
                if (o[this.name]) {
                    if (!o[this.name].push) {
                        o[this.name] = [o[this.name]];
                    }

                    o[this.name].push(this.value || '');
                } else {
                    o[this.name] = this.value || '';
                }
            });
            return o;
        };
    });

    /**
     * argBody 안의 내용 중 지정 문자열 삭제
     * argBody : 삭제본문 ( ex : 가나다 <pre style="width:100px">안녕하세요</pre> )
     * argStartSection : 삭제 시작 문자 ( ex : <pre )
     * argEndSection : 삭제 끝 문자 ( ex : ;"> )
     * argRemoveSection : 별도 replace 문자 ( ex : </pre> )
     */
    var removeStyleAndImage  = function(argBody, argStartSection, argEndSection, argRemoveSection){

        var bodyString = argBody;

        var sectionChk = bodyString.match(new RegExp(argStartSection,'g'));

        if(sectionChk != null){
            for(var i=0; i < sectionChk.length; i++){
                var tmpImg = bodyString.substring(bodyString.indexOf(argStartSection), (bodyString.indexOf(argEndSection)+(argEndSection.length)));
                bodyString = bodyString.replace(tmpImg, '').replace(/<br>/gi, '').replace(/&nbsp;/gi, ' ').replace(/<p>/gi, '').replace(/<\/p>/gi, ' ').replace(new RegExp(argRemoveSection,'gi'), '');
            }
        }

        return bodyString;
    };

</script>

<script>

    //타임라인 글 보기
    function post_view(no) {
        console.log("타임라인 뷰 데이터 번호 ==> " + no);

        $.ajax({
            type: 'POST',
            url: '<c:url value="/blog/getTimeLineView" />',
            data: {"username": "${user_info.username}", "no": no},
            success: function (result) {
                console.log("blog timeline list ==> " + result);
                var jsonData = JSON.parse(result);
                $("#timeline_title").html(jsonData.subject);
                $("#view_content").html(jsonData.content);
            }
        });
    }


    //더보기 버튼
    function more_btn(no) {
        console.log("더보기 버튼 클릭 ==> " + no);
        $("#more_btn").prop('disabled', true);
        $("#more_btn").html("<i class=\"fas fa-spinner fa-spin\"></i>\n" + "\n 로딩중...");

        $.ajax({
            type: 'POST',
            url: '<c:url value="/blog/time_line" />',
            data: {"username": "${user_info.username}", "count": 1, "no": no},
            success: function (result) {
                console.log("blog timeline list ==> " + result);

                var jsonData = JSON.parse(result);

                $.each(jsonData, function (index, item) {

                    varContent = item.content;

                    varContent = removeStyleAndImage(varContent, '<img src=', '">', '');      // 스마트에디터 내부의 이미지 제거
                    varContent = removeStyleAndImage(varContent, '<br', ';">');    // 스마트에디터 내부의 스타일 제거
                    varContent = removeStyleAndImage(varContent, '<pre', ';">', '</pre>');    // 스마트에디터 내부의 스타일 제거
                    varContent = removeStyleAndImage(varContent, '<p', ';">', '</p>');  // 스마트에디터 내부의 스타일 제거
                    varContent = removeStyleAndImage(varContent, '<span', ';">', '</span>');  // 스마트에디터 내부의 스타일 제거

                    timeline_html = "<div class=\"row\" style=\"background-color: white;margin-left: 0px;margin-right: 0px;margin-bottom: 10px;\" id=\"blog_timeline\">\n" +
                        "        <div class=\"col-8 p-3\">\n" +
                        "            <div class=\"profile\">\n" +
                        "                10분전\n" +
                        "            </div>\n" +
                        "            <div class=\"category\">\n" +
                        "                <a href=\"#\">잡담</a>\n" +
                        "            </div>\n" +
                        "            <div class=\"subject\" style=\"margin-bottom: 10px;\">\n" +
                        "                <a onclick='post_view(" + item.no + ")' href=\"#\" data-toggle=\"modal\" data-target=\"#exampleModalCenter\">" + item.subject + "</a>\n" +
                        "            </div>\n" +
                        "            <div class=\"content\">\n" +
                        "                <a href=\"#\" onclick='post_view(" + item.no + ")' data-toggle=\"modal\" data-target=\"#exampleModalCenter\">\n" + varContent +
                        "                </a>\n" +
                        "            </div>\n" +
                        "            <div style=\"margin-top: 10px;color: #959595\"><span>공감 0</span> <span>댓글 " + item.cm_count + "</span></div>\n" +
                        "        </div>\n" +
                        "        <div class=\"col p-3\" style=\"text-align: right\">\n" +
                        "           <img src=\"https://via.placeholder.com/165\">\n" +
                        "        </div>\n" +
                        "    </div>";

                    var more_btn = "<button onclick='more_btn(" + item.no + ")' class=\"btn btn-primary btn-sm btn-block\" id=\"more_btn\">더보기</button>";

                    $("#more_btn_ajax").html(more_btn);
                    $("#blog_timeline:last").append(timeline_html);

                    if (item.no == 1) {
                        $("#more_btn").remove();
                    }

                });
            }
        });

        /**
         * argBody 안의 내용 중 지정 문자열 삭제
         * argBody : 삭제본문 ( ex : 가나다 <pre style="width:100px">안녕하세요</pre> )
         * argStartSection : 삭제 시작 문자 ( ex : <pre )
         * argEndSection : 삭제 끝 문자 ( ex : ;"> )
         * argRemoveSection : 별도 replace 문자 ( ex : </pre> )
         */
        var removeStyleAndImage  = function(argBody, argStartSection, argEndSection, argRemoveSection){

            var bodyString = argBody;

            var sectionChk = bodyString.match(new RegExp(argStartSection,'g'));

            if(sectionChk != null){
                for(var i=0; i < sectionChk.length; i++){
                    var tmpImg = bodyString.substring(bodyString.indexOf(argStartSection), (bodyString.indexOf(argEndSection)+(argEndSection.length)));
                    bodyString = bodyString.replace(tmpImg, '').replace(/<br>/gi, '').replace(/&nbsp;/gi, ' ').replace(/<p>/gi, '').replace(/<\/p>/gi, ' ').replace(new RegExp(argRemoveSection,'gi'), '');
                }
            }

            return bodyString;
        };

    }
</script>