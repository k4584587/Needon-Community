<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div style="margin-left: 10px;">
    <header style="background-color: white;border-bottom: 1px solid #b1b1b1;">
        <div class="p-3 board_head">
            <h3>${info.bo_title}</h3>
        </div>
    </header>
    <div style="margin-top: 10px;" class="alert alert-secondary" role="alert">
        <b>${info.bo_info}</b>
    </div>

    <style>
        .myAd1290 { max-width: 765px!important; width:765px; }
    </style>

    <!-- 반응형 광고(1) -->
    <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
    <center style="margin-bottom: 10px;">
        <ins class="adsbygoogle myAd1290"
             style="display:block"
             data-ad-client="ca-pub-9442764132014732"
             data-ad-slot="1288679214"

             data-ad-format="auto"></ins>
    </center>
    <script>
        (adsbygoogle = window.adsbygoogle || []).push({});
    </script>


    <div style="margin-bottom: 10px;">Total ${pageMaker.totalCount} 건 ${param.page} 페이지</div>

	<table class="table table-striped table-hover">
		<thead>
		<tr>
			<th scope="col" style="width: 60px;">번호</th>
			<th scope="col">제목</th>
			<th scope="col" style="width: 100px;">글쓴이</th>
			<th scope="col" style="width: 140px;">날짜</th>
			<th scope="col" style="width: 60px;">추전수</th>
			<th scope="col" style="width: 60px;">조회</th>
		</tr>
		</thead>
		<tbody>
		<c:set var="num" value="${pageMaker.totalCount-(pageMaker.cri.page-1)*10}" />
		<c:choose>
			<c:when test="${fn:length(list) != 0 }">
				<c:forEach items="${list }" var="list">
					<tr>
						<th scope="row">
							<c:out value="${num}" /> <c:set var="num" value="${num-1}" />
						</th>
						<td style="text-align:left;"><a href="<c:url value="/board/view${pageMaker.uri(pageMaker.cri.page) }&no=${list.no }&category=${category }" />">${list.subject}</a> <span style="color: red;">[${list.comment_count}]</span></td>
						<td>${list.wr_nick}</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${ list.register_date }" /></td>
						<td>${list.bo_good}</td>
						<td>${list.read_count}</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="6">작성된 글이 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
		</tbody>
	</table>
	<div>
		<span>
			<button class="btn btn-info"  onClick="location= '<c:url value="/board/write_form?page=${pageMaker.cri.page }&category=${category }"/>'">글쓰기</button>
		</span>
		<span style="float: right;">
			<button class="btn btn-info"  onClick="location= '<c:url value="/board/write_form?page=${pageMaker.cri.page }&category=${category }"/>'">배스트</button>
			<button class="btn btn-info"  onClick="location= '<c:url value="/board/${category }/list?page=1"/>'">목록</button>
		</span>
	</div>
	<!-- 페이징 처리 시작 -->
	<%-- ${pageMaker } <br>
    ${pageMaker.cri.page} --%>

	<center>
		<ul class="pagination justify-content-center">
			<c:if test="${empty keyword}">
				<c:if test="${pageMaker.cri.page != 1 }">
					<li class="page-item"><a class="page-link"
											 href="<c:url value="/board/${category }/list${pageMaker.uri(pageMaker.start)}"/>">&laquo;
						처음</a></li>
				</c:if>
				<c:if test="${pageMaker.startPage >= 11 }">
					<li class="page-item"><a class="page-link"
											 href="<c:url value="/board/${category }/list${pageMaker.uri(pageMaker.startPage - 1)}"/>">&lt;
						이전</a></li>
				</c:if>
				<c:forEach var="a" begin="${pageMaker.startPage }"
						   end="${pageMaker.totalPage }">
					<li class="page-item"><a class="page-link"
											 href="<c:url value="/board/${category }/list${pageMaker.uri(a)}"/>">${a }</a></li>
				</c:forEach>
				<c:if test="${pageMaker.next  }">
					<li class="page-item"><a class="page-link"
											 href="<c:url value="/board/${category }/list${pageMaker.uri(pageMaker.totalPage + 1)} "/>">다음
						&gt;</a></li>
					<li class="page-item"><a class="page-link"
											 href="<c:url value="/board/${category }/list${pageMaker.uri(pageMaker.endPage)} "/>">&raquo;
						마지막</a></li>
				</c:if>
			</c:if>

			<c:if test="${not empty keyword}">
				<c:if test="${pageMaker.cri.page != 1 }">
					<li class="page-item"><a class="page-link"
											 href="<c:url value="/board/${category }/list${pageMaker.uri(pageMaker.start)}&search=${search}&keyword=${keyword}"/>">&laquo;
						처음</a></li>
				</c:if>
				<c:if test="${pageMaker.startPage >= 11 }">
					<li class="page-item"><a class="page-link"
											 href="<c:url value="/board/${category }/list${pageMaker.uri(pageMaker.startPage - 1)}&search=${search}&keyword=${keyword}"/>">&lt;
						이전</a></li>
				</c:if>
				<c:forEach var="a" begin="${pageMaker.startPage }"
						   end="${pageMaker.totalPage }">
					<li class="page-item"><a class="page-link"
											 href="<c:url value="/board/${category }/list${pageMaker.uri(a)}&search=${search}&keyword=${keyword}"/>">${a }</a></li>
				</c:forEach>
				<c:if test="${pageMaker.next  }">
					<li class="page-item"><a class="page-link"
											 href="<c:url value="/board/${category }/list${pageMaker.uri(pageMaker.totalPage + 1)}&search=${search}&keyword=${keyword} "/>">다음
						&gt;</a></li>
					<li class="page-item"><a class="page-link"
											 href="<c:url value="/board/${category }/list${pageMaker.uri(pageMaker.endPage)}&search=${search}&keyword=${keyword} "/>">&raquo;
						마지막</a></li>
				</c:if>
			</c:if>
		</ul>
	</center>
	<!-- 페이징 처리 끝 -->
	<!-- 검색 처리 시작 -->
	<center>
		<form class="input-group" style="margin-bottom: 10px;width: 330px;">
			<div class="input-group-prepend">
			<span> <select class="form-control" name="search">
					<option value="subject"
							<c:if test="${search=='subject'}">selected="selected" </c:if>>제목</option>
					<option value="content"
							<c:if test="${search=='content'}">selected="selected" </c:if>>내용</option>
					<option value="wr_nick"
							<c:if test="${search=='wr_nick'}">selected="selected" </c:if>>작성자</option>
					<option value="subcon"
							<c:if test="${search=='subcon'}">selected="selected" </c:if>>제목+내용</option>
			</select>
			</span>
			</div>
			<input type="text" class="form-control" name="keyword">
			<div class="input-group-append">
				<span><input type="submit" class="btn btn-success" value="검색"></span>
			</div>
		</form>
	</center>
	<hr>
</div>
