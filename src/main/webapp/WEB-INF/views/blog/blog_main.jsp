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
<sec:authentication property="principal" var="user"/>
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
                    <div style="margin-top: 5px"><button class="btn btn-danger btn-sm">관리</button></div>
                </div>
            </div>
        </div>
    </div>
    <div>
        <form id="timeLineInsertForm" action="<c:url value="/blog/timeline_post" />" method="post">
            <input type="text" name="subject" class="form-control" placeholder="글 제목" style="margin-bottom: 10px">
            <textarea name="content" class="form-control" style="margin-bottom: 10px;">test</textarea>
            <button type="button" onclick="timeLineInsert()" class="btn btn-success" style="margin-bottom: 10px;">글 등록</button>
        </form>
    </div>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb" style="background-color: #d4d4d4!important;">
            <li class="breadcrumb-item active" aria-current="page">잡담</li>
            <li class="breadcrumb-item active" aria-current="page">리뷰</li>
            <li class="breadcrumb-item active" aria-current="page">IT</li>
            <li class="breadcrumb-item active" aria-current="page">게임</li>
        </ol>
    </nav>
    <div id="blog_timeline">
        <center>
            <img id="news_loading" src="<c:url value="/resources/img/loading.gif" />">
        </center>

    </div>
    <span id="more_btn_ajax"></span>
    <%--<button class="btn btn-primary btn-sm btn-block" id="more_btn">더보기</button>--%>
</div>

<!-- Post View Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="timeline_title">제목....</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="conatiner">
                    test
                </div>
            </div>
        </div>
    </div>
</div>


<script>



    $(document).ready(function() {
        console.log("ajax load!!");

        $.ajax({
            type: 'POST',
            url: '<c:url value="/blog/time_line" />',
            data:{"username":"${user_info.username}","count":0},
            success: function (result) {
                console.log("blog timeline list ==> " + result);

                var jonData = JSON.parse(result);

                $.each(jonData, function (index, item) {
                    timeline_html = "<div class=\"row\" style=\"background-color: white;margin-left: 0px;margin-right: 0px;margin-bottom: 10px;\" id=\"blog_timeline\">\n" +
                        "        <div class=\"col-8 p-3\">\n" +
                        "            <div class=\"profile\">\n" +
                        "                10분전\n" +
                        "            </div>\n" +
                        "            <div class=\"category\">\n" +
                        "                <a href=\"#\">잡담</a>\n" +
                        "            </div>\n" +
                        "            <div class=\"subject\" style=\"margin-bottom: 10px;\">\n" +
                        "                <a onclick='timeline_view("+item.no+")' href=\"#\" data-toggle=\"modal\" data-target=\"#exampleModalCenter\">"+item.subject+"</a>\n" +
                        "            </div>\n" +
                        "            <div class=\"content\">\n" +
                        "                <a href=\"#\" data-toggle=\"modal\" data-target=\"#exampleModalCenter\">\n" + item.content +
                        "                </a>\n" +
                        "            </div>\n" +
                        "            <div style=\"margin-top: 10px;color: #959595\"><span>공감 0</span> <span>댓글 "+item.cm_count+"</span></div>\n" +
                        "        </div>\n" +
                        "        <div class=\"col p-3\" style=\"text-align: right\">\n" +
                        "           <img src=\"https://via.placeholder.com/165\">\n" +
                        "        </div>\n" +
                        "    </div>";

                    var more_btn = "<button onclick='more_btn("+item.no+")' class=\"btn btn-primary btn-sm btn-block\" id=\"more_btn\">더보기</button>";

                    $("#more_btn_ajax").html(more_btn);
                    $("#blog_timeline:last").append(timeline_html);
                });
            }
        })
    })

    function timeLineInsert() { // 타임라인 글 추가
        var form_json = JSON.stringify($("#timeLineInsertForm").serializeObject());
        var jsonData = JSON.parse(form_json);

        console.log("글 등록버튼 누름!!");
        console.log("form data ==> " + form_json.toString());

        console.log("제목 ==> " + jsonData.subject);
        console.log("내용 ==> " + jsonData.content);

        $.ajax({
            type: 'POST',
            url: '<c:url value="/blog/timeline_post" />',
            data: jsonData,
            success: function (result) {

                if(result == 1) {

                    var timeline_insert_html = "<div class=\"row\" style=\"background-color: white;margin-left: 0px;margin-right: 0px;margin-bottom: 10px;\" id=\"blog_timeline\">\n" +
                        "    <div class=\"col-8 p-3\">\n" +
                        "        <div class=\"profile\">\n" +
                        "            10분전\n" +
                        "        </div>\n" +
                        "        <div class=\"category\">\n" +
                        "            <a href=\"#\">잡담</a>\n" +
                        "        </div>\n" +
                        "        <div class=\"subject\" style=\"margin-bottom: 10px;\">\n" +
                        "            <a href=\"#\" data-toggle=\"modal\" data-target=\"#exampleModalCenter\">"+jsonData.subject+"</a>\n" +
                        "        </div>\n" +
                        "        <div class=\"content\">\n" +
                        "            <a href=\"#\" data-toggle=\"modal\" data-target=\"#exampleModalCenter\">\n" +
                        " "+jsonData.content+"            </a>\n" +
                        "        </div>\n" +
                        "        <div style=\"margin-top: 10px;color: #959595\"><span>공감 10</span> <span>댓글 10</span></div>\n" +
                        "    </div>\n" +
                        "    <div class=\"col p-3\" style=\"text-align: right\">\n" +
                        "        <img src=\"https://via.placeholder.com/165\">\n" +
                        "    </div>\n" +
                        "</div>";

                    $("#blog_timeline:first").before(timeline_insert_html);
                    console.log("등록성공!");



                } else {
                    console.log("등록실패!");
                }
            }
        });

    }


    function timeline_view(no) {
        console.log("타임라인 뷰 데이터 번호 ==> " + no);
        $("#timeline_title").html("test " + no);

        $.ajax({
            type: 'POST',
            url: '<c:url value="/blog/getTimeLineView" />',
            data: {"username":"${user_info.username}","no":no},
            success: function (result) {
                console.log("데이터 ==>" + result)
            }
        });
    }



    function more_btn(no) {
        console.log("더보기 버튼 클릭 ==> " + no);

        $.ajax({
            type: 'POST',
            url: '<c:url value="/blog/time_line" />',
            data:{"username":"${user.username}","count":1,"no":no},
            success: function (result) {
                console.log("blog timeline list ==> " + result);

                var jonData = JSON.parse(result);

                $.each(jonData, function (index, item) {
                    timeline_html = "<div class=\"row\" style=\"background-color: white;margin-left: 0px;margin-right: 0px;margin-bottom: 10px;\" id=\"blog_timeline\">\n" +
                        "        <div class=\"col-8 p-3\">\n" +
                        "            <div class=\"profile\">\n" +
                        "                10분전\n" +
                        "            </div>\n" +
                        "            <div class=\"category\">\n" +
                        "                <a href=\"#\">잡담</a>\n" +
                        "            </div>\n" +
                        "            <div class=\"subject\" style=\"margin-bottom: 10px;\">\n" +
                        "                <a onclick='timeline_view(" + item.no + ")' href=\"#\" data-toggle=\"modal\" data-target=\"#exampleModalCenter\">" + item.subject + "</a>\n" +
                        "            </div>\n" +
                        "            <div class=\"content\">\n" +
                        "                <a href=\"#\" data-toggle=\"modal\" data-target=\"#exampleModalCenter\">\n" + item.content +
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

                    if(item.no == 1) {
                      $("#more_btn").remove();
                    }

                });
            }
        });

    }

    $.fn.serializeObject = function() {

        var o = {};
        var a = this.serializeArray();
        $.each(a, function() {
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

</script>