<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<style>
.input-group {
	width: 35%;
}
</style>
<div class=""
	style="background-color: white; height: 150px; margin-bottom: 10px;">
	구글광고</div>

<!-- 게시판 목록 시작-->
<table class="table table-hover" style="margin-top: 10px;">
	<thead style="background-color: white;">
		<tr>
			<th scope="col">번호</th>
			<th scope="col">제목</th>
			<th scope="col">작성자</th>
			<th scope="col">조회수</th>
			<th scope="col">작성일</th>
		</tr>
	</thead>
	<tbody>
		<!-- 화면 출력 번호  변수 정의 -->
		<c:set var="num"
			value="${pageMaker.totalCount-(pageMaker.cri.page-1)*10}" />
		<c:choose>
			<c:when test="${fn:length(list) != 0 }">
				<c:forEach items="${list }" var="list">
					<tr>
						<td>
							<!-- 번호 출력 부분 --> <c:out value="${num}" /> <c:set var="num"
								value="${num-1}" />
						</td>
						<td><a
							href="<c:url value="/board/view${pageMaker.uri(pageMaker.cri.page) }&no=${list.no }&category=${category }" />">${ list.subject }</a></td>
						<td>${list.wr_nick}</td>
						<td>${ list.read_count }</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
								value="${ list.register_date }" /></td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="5">작성된 글이 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>
<!-- 게시판 목록 끝 -->

<!-- 검색 처리 시작 -->
<center>
	<form class="input-group" style="margin-bottom: 10px;">
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
<%--<form action="<c:url value="/board/${category }/list?page=${pageMaker.cri.page }" />" align=center>
	<select name="search">
		<option value="subject"
			<c:if test="${search=='subject'}">selected="selected" </c:if>>제목</option>
		<option value="content"
			<c:if test="${search=='content'}">selected="selected" </c:if>>내용</option>
		<option value="wr_nick"
			<c:if test="${search=='wr_nick'}">selected="selected" </c:if>>작성자</option>
		<option value="subcon"
			<c:if test="${search=='subcon'}">selected="selected" </c:if>>제목+내용</option>
	</select> <input type="text" name="keyword"> <input type="submit" value="검색">
</form>--%>
<!-- 검색 처리 끝 -->

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

<button class="btn btn-info" style="float: right; margin-bottom: 10px;"
	onClick="location= '<c:url value="/board/write_from?page=${pageMaker.cri.page }&category=${category }"/>'">글쓰기</button>