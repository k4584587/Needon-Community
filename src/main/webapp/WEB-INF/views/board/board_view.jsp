<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<sql:setDataSource var="datasource" driver="net.sf.log4jdbc.sql.jdbcapi.DriverSpy"
                   url="jdbc:log4jdbc:mysql://125.183.115.12/admin_project?useUnicode=true&characterEncoding=utf8&allowMultiQueries=true&serverTimezone=UTC"
                   user="admin_project" password="3class"/>
${pwd }
<sql:query dataSource="${datasource}" var="command_count">
    select count(*) as count from nb_board_${param.category}
    where parent = ${param.no} and cm_count=1 order by no;
</sql:query>

<c:forEach items="${command_count.rows}" var="comment_count">
    <c:set var="comment_count_" value="${comment_count.count}" ></c:set>
</c:forEach>


<div style="margin-left: 10px;">
	<header style="background-color: white;border-bottom: 1px solid #b1b1b1;">
		<div class="p-3 board_head">
			<h3>${info.bo_title }</h3>
		</div>
	</header>

	<style>
		.myAd1290 { max-width: 765px!important; width:765px; }
	</style>

	<!-- 반응형 광고(1) -->
	<center style="margin-top: 10px; margin-bottom: 10px;">
		<ins class="adsbygoogle myAd1290"
			 style="display:block"
			 data-ad-client="ca-pub-9442764132014732"
			 data-ad-slot="1288679214"

			 data-ad-format="auto"></ins>
	</center>
    <article>
  
        <div class="board-view">
            <div class="subject p-3" style="background-color: white; border-bottom: 1px solid #b1b1b1; font-size: 22px;height: 100%!important;">
                <b>${board.subject} <span style="color: blue;">[${comment_count_}]</span></b>
            </div>
            <div class="board-info p-2" style="background-color: #f5f5f5;color: #333;border: 1px solid #dee3eb;">
                <div class="row">
                    <div class="col-auto">
                        <i class="fas fa-user"></i> ${board.wr_nick}
                    </div>
                    <div class="col-auto">
                        <i class="far fa-comment-dots"></i> 0
                    </div>
                    <div class="col-auto">
                        <i class="far fa-eye"></i> ${board.read_count}
                    </div>
                </div>
            </div>
            <div class="p-3" style="border: 1px solid #dee3eb;background-color: white;height: 100%!important;">
                <div class="row">
                    <div class="col-auto">
                        <img width="110" src="<c:url value="/resources/img/profile_img.png"/>">
                    </div>
                    <div class="col">
                        <div class="board-head_btn">
                            <button class="btn btn-primary">작성글 보기</button> <button class="btn btn-success">쪽지 보내기</button> <button class="btn btn-success">블로그 보기</button> <button class="btn btn-success">팔로우하기</button> <button class="btn btn-success">구독하기</button>
                        </div>
                        <div style="margin-top: 10px;">
                            <div style="margin-bottom: 10px;"><span>출석일수 : <b>000 일</b></span> | <span><b>Lv.100</b></span>                           
                            <div class="progress">
                                <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%">Exp. 75 %</div>
                            </div>
                            
                            <div style="margin-top: 10px;">
                                <span>추천수 : ${board.bo_good}</span> | <span>등록일시 : ${board.register_date}</span> | <span>아이피 : ${board.ip}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="board-body p-4" style="background-color: white;width: 100%; height: 100%!important;border: 1px solid #dee3eb;border-bottom-color: white;">
                <c:forEach items="${test }" var="a">														 
                            <a href="<c:url value="/board/download?fname=${a.bo_subject }&page=${param.page}&no=${param.no }&category=${param.category } "/>" >${a.bo_subject }</a>
                            <span><c:if test="${a.bo_filesize != 0 }"><fmt:formatNumber value="${a.bo_filesize / 1024 }" pattern=".#" var="filesize"/>(${filesize }K)</c:if></span>&nbsp;
                            <span><i class="far fa-clock"></i>&nbsp;<fmt:formatDate value="${a.bo_datetime }" pattern="yyyy.MM.dd"/></span><br>
                </c:forEach>
                ${board.content}
            </div>
            <div class="row justify-content-center" style="background-color: white;margin-right: 0px!important;margin-left: 0px!important; border-left: 1px solid #dee3eb; border-right: 1px solid #dee3eb;">
                <div onclick="bo_good1()" class="col-auto p-3" style="text-align: center;font-size: 15px;border: 1px solid #dee3eb;margin-right: 10px;cursor: pointer;">
                    <!-- 좋아요 버튼 -->
                    <b id="bo_good" style="color: red;">${board.bo_good}</b><br>
                    <i class="far fa-thumbs-up"></i>
                </div>
                    <!-- 싫어요 버튼 -->
                <div onclick="bo_bad()" class="col-auto p-3" style="text-align: center;font-size: 15px;border: 1px solid #dee3eb;cursor: pointer;">
                    <b id="bo_bad" style="color: red;">${board.bo_bad}</b><br>
                    <i class="far fa-thumbs-down"></i>
                </div>
            </div>
            <div class="p-2 board-share_btn" style="border: 1px solid #dee3eb;border-top-color: white;background-color: white;">
                <span style="margin-right: 5px;"><i style="font-size: 35px;color: #006dbf;" class="fab fa-twitter"></i> </span><span><i style="font-size: 35px;color: #3b5998;" class="fab fa-facebook"></i></span>
            </div>     
            <hr>
            <div class="row">
                <div class="col">
                    <button onclick="location.href='<c:url value="/board/write_form?page=${param.page }&category=${param.category}" />'" class="btn btn-success">글쓰기</button>
                    <button class="btn btn-success" onclick="location.href='<c:url value="/board/modify_form?page=${param.page }&category=${param.category}&no=${param.no }" />'" >글 수정</button> 
                    <sec:authorize access="isAuthenticated()">
                    
                    <button onclick="delete1(${board.no})" class="btn btn-danger">글 삭제</button>
                    
                    </sec:authorize>   
                    <div style="float: right">
                        <button onclick="location.href='<c:url value="/board/${param.category}/list" />'" class="btn btn-success">목록으로</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- 댓글 시작 -->
        <hr>
        <h5><b><i class="far fa-comment-dots"></i> ${comment_count_} Comments</b></h5>
        <!-- 댓글 출력 시작 -->
        <hr>
        <div id="comment_list">
            <c:choose>
                <c:when test="${fn:length(comment) != 0 }">
                    <c:forEach var="rb" items="${comment}">
                        <div id="comment_item_${rb.no}">
                            <c:set var="comment_no" value="${rb.no}" />
                            <div class="row p-3 " style="margin-left: 10px; background-color: white;margin-left: 0px!important;margin-right: 0px; ">
                                <div class="col-auto" style="padding-left: 0px!important;">
                                    <img width="58" src="http://localhost:8080/resources/img/profile_img.png">
                                </div>
                                <div class="col">
                                    <div style="width: 100%!important;margin-bottom: 10px;">
                                        <b>${rb.cm_nick}</b> ${rb.cm_regdate}
                                        <div style="float: right;">신고 <a href="#" onclick="comment_delete(${rb.no})">삭제</a></div><br>
                                        <div style="float: right;margin-top: 10px;">
                                            <div class="row">
                                                <div class="col-auto" style="padding-right: 0px!important;padding-left: 0px!important;cursor: pointer;">
                                                    <div onclick="cm_good1(${rb.no}, ${rb.cm_good })" class="p-2" style="border: 1px solid #bbb;border-right: none;"><i class="far fa-thumbs-up"></i> <b id="cm_good" style="color: red;">${rb.cm_good} </b> </div>
                                                </div>
                                                <div class="col-auto" style="padding-right: 0px!important;padding-left: 0px!important;cursor: pointer;">
                                                    <div onclick="cm_bad1(${rb.no}, ${rb.cm_bad })"class="p-2" style="border: 1px solid #bbb;"><i class="far fa-thumbs-down"></i> <b id="cm_bad" style="color: red;">${rb.cm_bad}</b> </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div style="width: 630px; margin-top: 10px;">${rb.cm_body}</div>
                                    </div>
                                </div>
                            </div>
                            <hr>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="alert alert-secondary" role="alert" id="none_comment">
                        <center>
                            <b>작성된 댓글이 없습니다.</b>
                        </center>
                    </div>
                </c:otherwise>
            </c:choose>
            <!-- 댓글 출력 끝 -->
        </div>
    </article>

    <!-- 댓글 작성 시작 -->
    <div class="p-3" align="center">

        <!-- 로그인을 안했을시 -->
        <sec:authorize access="!isAuthenticated()">
            <div class="alert alert-secondary" role="alert">
                <b>로그인을 해야 댓글을 작성할수 있습니다.</b>
            </div>
        </sec:authorize>

        <sec:authorize access="isAuthenticated()">
            <sec:authentication property="principal" var="user" />
            <!-- 로그인 시 -->
            <form id="board_comment_post" action="#" method="post">
                <input type="hidden" name="cm_password" value="${user.password }">
                <input type="hidden" id="cm_nick" name="cm_nick" value="${board.wr_nick}">
                <input type="hidden" name="parent" value="${param.no}">
                <input type="hidden" name="category" value="${param.category }">
                <input type="hidden" id="cm_regdate" name="cm_regdate" value="${board.cm_regdate }" />
                <div class="row" id="comment_input">
                    <div class="col-auto">
                        <textarea name="cm_body" id="cm_body" class="form-control" style="width: 660px!important;height: 113px" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요."></textarea>
                    </div>
                    <div class="col-auto">
                        <button id="btn_comment_submit" type="button" onclick="comment_post()" class="btn btn-success btn-lg" style="height: 110px!important;">댓글 쓰기</button>
                    </div>
                </div>
            </form>
        </sec:authorize>

    </div>
    <!-- 댓글 작성 끝 -->

	<script>

        (adsbygoogle = window.adsbygoogle || []).push({});


        var comment_no = "${comment_no}";
        var comment_no_int = parseInt(comment_no)+1;


        function comment_post() {

            var board_comment_post_data = $("#board_comment_post").serialize();
            $("#btn_comment_submit").prop('disabled', true);
            $("#btn_comment_submit").html("<i class=\"fas fa-spinner fa-spin\"></i>" + "등록중");

            $.ajax({
                type: 'POST',
                url: "<c:url value="/board/repInsert" />",
                data: board_comment_post_data,
                success: function (result) {



                    //onsole.log("댓글 내용 ==> " + $("textarea#cm_body").val());
                    //console.log("댓글 닉네임 ==> " + $("input#cm_nick").val());
                    //console.log("댓글 작성시간 ==> " + $("input#cm_regdate").val());

                                 var comment_html_none = "<div id='comment_item'>\n" +
                        "        <div class=\"row p-3 \" style=\"margin-left: 10px; background-color: white;margin-left: 0px!important;margin-right: 0px; \">\n" +
                        "            <div class=\"col-auto\" style=\"padding-left: 0px!important;\">\n" +
                        "                <img width=\"58\" src=\"http://localhost:8080/resources/img/profile_img.png\">\n" +
                        "            </div>\n" +
                        "            <div class=\"col\">\n" +
                        "                <div style=\"width: 100%!important;margin-bottom: 10px;\">\n" +
                        "                    <b>"+$("input#cm_nick").val()+"</b> "+$("input#cm_regdate").val()+"\n" +
/*
                        "                    <div style=\"float: right;\">신고 <a href='#' onclick='comment_delete("+eval(next_comment_count()-1)+")'>삭제</a></div><br>\n" +
*/
                        // "                    <div style=\"float: right;margin-top: 10px;\">\n" +
                        // "                        <div class=\"row\">\n" +
                        // "                            <div class=\"col-auto\" style=\"padding-right: 0px!important;padding-left: 0px!important;cursor: pointer;\">\n" +
                        // "                                <div class=\"p-2\" style=\"border: 1px solid #bbb;border-right: none;\"><i class=\"far fa-thumbs-up\"></i> <b>0</b> </div>\n" +
                        // "                            </div>\n" +
                        // "                            <div class=\"col-auto\" style=\"padding-right: 0px!important;padding-left: 0px!important;cursor: pointer;\">\n" +
                        // "                                <div class=\"p-2\" style=\"border: 1px solid #bbb;\"><i class=\"far fa-thumbs-down\"></i> <b>0</b> </div>\n" +
                        // "                            </div>\n" +
                        // "                        </div>\n" +
                        // "                    </div>\n" +
                        "                    <div style=\"width: 630px; margin-top: 10px;\">"+$("textarea#cm_body").val()+"</div>\n" +
                        "                </div>\n" +
                        "            </div>\n" +
                        "        </div>\n" +
                        "        <hr>\n" +
                        "    </div>";

                    var comment_html = "<div id=\"comment_item\">\n" +
                        "        <div class=\"row p-3 \" style=\"margin-left: 10px; background-color: white;margin-left: 0px!important;margin-right: 0px; \">\n" +
                        "            <div class=\"col-auto\" style=\"padding-left: 0px!important;\">\n" +
                        "                <img width=\"58\" src=\"http://localhost:8080/resources/img/profile_img.png\">\n" +
                        "            </div>\n" +
                        "            <div class=\"col\">\n" +
                        "                <div style=\"width: 100%!important;margin-bottom: 10px;\">\n" +
                        "                    <b>"+$("input#cm_nick").val()+"</b> "+$("input#cm_regdate").val()+"\n" +
  /*                      "                    <div style=\"float: right;\">신고 <a href='#' onclick='comment_delete("+eval(next_comment_count()-1)+")'>삭제</a></div><br>\n" +
                        "                    <div style=\"float: right;margin-top: 10px;\">\n" +
                        "                        <div class=\"row\">\n" +
                        "                            <div class=\"col-auto\" style=\"padding-right: 0px!important;padding-left: 0px!important;cursor: pointer;\">\n" +
                        "                                <div class=\"p-2\" style=\"border: 1px solid #bbb;border-right: none;\"><i class=\"far fa-thumbs-up\"></i> <b>0</b> </div>\n" +
                        "                            </div>\n" +
                        "                            <div class=\"col-auto\" style=\"padding-right: 0px!important;padding-left: 0px!important;cursor: pointer;\">\n" +
                        "                                <div class=\"p-2\" style=\"border: 1px solid #bbb;\"><i class=\"far fa-thumbs-down\"></i> <b>0</b> </div>\n" +
                        "                            </div>\n" +
                        "                        </div>\n" +
                        "                    </div>\n" +*/
                        "                    <div style=\"width: 630px; margin-top: 10px;\">"+$("textarea#cm_body").val()+"</div>\n" +
                        "                </div>\n" +
                        "            </div>\n" +
                        "        </div>\n" +
                        "        <hr>\n" +
                        "    </div>";


                    if(result == 1) {

                        if(comment_no == "") {

                            alert("댓글 등록 성공!");
                            $("#none_comment").remove();
                            $("#comment_list").append(comment_html);

                            $("#btn_comment_submit").prop('disabled', false);
                            $("#btn_comment_submit").html("댓글 쓰기");

                        } else {
                            alert("등록 되었습니다.");
                            $("#btn_comment_submit").prop('disabled', false);
                            $("#btn_comment_submit").html("댓글 쓰기");

                            $("#comment_list:last").append(comment_html);


                        }

                    } else {
                        alert("댓글 등록 실패!")
                    }
                }
            })
        }

        function comment_delete(no) {

            var formData="no="+no+"&category=${param.category}";
            console.log(no + " 번째의 댓글 삭제 버튼을 클릭함");


            if (confirm('정말로 삭제하시겠습니까 ?')) {
                $.ajax({
                    type: 'POST',
                    url: '<c:url value='/board/repDelete'/>',
                    data: formData,
                    success: function (result) {

                        if(result == 1) {

                            alert("삭제 되었습니다.");
                            $("#comment_item_" + no).remove();

                        } else {
                            alert("삭제 실패!");
                        }

                    }
                })
            } else {
                // no click
            }

        }

        var good_count = ${board.bo_good};
        var bad_count = ${board.bo_bad};

        var good_count_int = parseInt(good_count)+1;
        var bad_count_int = parseInt(bad_count)+1;
        
        //var cm_good = ${board.cm_good};
        var cm_bad = ${board.cm_bad};



        function bo_good1() {
            console.log("좋아요 버튼 클릭함");

            $.ajax({
                type: "POST",
                url: "<c:url value="/board/bo_good" />",
                data:{"category":"${param.category}","no":"${param.no}"},
                success: function (result) {
                    if(result == 1) {
                        console.log("추천 성공");
                        $("#bo_good").html(good_count_int++);
                    } else {
                        console.log("추천 실패");
                    }
                }
            })

        }

        function bo_bad() {
            console.log("싫어요 버튼 클릭함");

            $.ajax({
                type: "POST",
                url: "<c:url value="/board/bo_bad" />",
                data:{"category":"${param.category}","no":"${param.no}"},
                success: function (result) {
                    if(result == 1) {
                        console.log("싫어요 성공");
                        $("#bo_bad").html(bad_count_int++);
                    } else {
                        console.log("싫어요 실패");
                    }
                }
            })

        }
        
            function cm_good1(no, good_count) {
                console.log("좋아요 버튼 클릭함");
                console.log("댓글 좋아요 갯수" +good_count);
                //var cm_good_int = parseInt(cm_good);

                $.ajax({
                    type: "POST",
                    url: "<c:url value="/board/cm_good" />",
                    data:{"category":"${param.category}","no":no},
                    cache: false,
                    success: function (result) {
                        if(result == 1) {
                            console.log("추천 성공");
                            $("#cm_good").html(Number(good_count)+1);
                        } else {
                            console.log("추천 실패");
                        }
                    }
                })

            }
            
                function cm_bad1(no, bad_count) {
                    console.log("싫어요 버튼 클릭함");
					
                    bad_count = document.getElementById("cm_bad"); 
                    console.log("개수"+Number(bad_count));
                    /* $.ajax({
                        type: "POST",
                        url: "<c:url value="/board/cm_bad" />",
                        data:{"category":"${param.category}","no":no},
                        success: function (result) {
                            if(result == 1) {
                                console.log("싫어요 성공");
                                $("#cm_bad").html(bad_count++);
                            } else {
                                console.log("싫어요 실패");
                            }
                        }
                    }) */

                }
                function delete1(no){
                	if(confirm("정말로 삭제하시겠습니까 ?")){
                	$.ajax({
                        type: "POST",
                        url: "<c:url value="/board/delete" />",
                        data:{"category":"${param.category}","no":no,"page":"${param.page}"},
                        cache: false,
                        success: function (result) {
                            if(result == 1) {
                                console.log("삭제 성공");
                                alert("삭제 되었습니다.");
                                location.href = "<c:url value="/board/${param.category}/list?page=${param.page}" />";
                            } else {
                                console.log("삭제 실패");
                            }
                        }
                    })
                		
                	}
                }

	</script>

</div>