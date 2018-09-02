<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="p-3" style="margin-left: 10px; background-color: white;border: 1px solid #dee3eb;">
	<div>><b style="font-size: 15px;"> 검색 : ${param.keyword}</b></div>
	<div style="margin-top: 20px;">
		검색결과 : 약 ${pageMaker.totalCount }개
		<hr>
	</div>
	<div class="search_result">
		<c:choose>
			<c:when test="${pageMaker.totalCount eq 0 }" >
				<div style="color: red;"><b>검색결과 없음</b></div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="list">
					<div class="" style="margin-bottom: 10px;">
						<div style="font-size: 16px;"><a href="https://3project.needon.kr/board/view?category=${list.category}&no=${list.no}">${list.subject }</a></div>
						<div style="margin-bottom: 5px"><a style="color: #008000;" href="https://3project.needon.kr/board/view?category=${list.category}&no=${list.no}">https://3project.needon.kr/board/view?category=${list.category}&no=${list.no}</a></div>
						<div class="row p-3" style="padding-top: 0px!important;">
							<div class="col-uato" style="margin-right: 5px;"><img src="https://via.placeholder.com/70x50"></div>
							<div class="col-uato"><a href="/board/view?category=${list.category}&no=${list.no}"><c:out value='${fn:substring(list.content.replaceAll("\\\<.*?\\\>",""),0, 50)}' />...</a></div>
						</div>
					</div>
					<hr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<center>
			<c:choose>
				<c:when test="${fn:length(key) != 0 }" >
					<c:if test="${pageMaker.board.page != 1 }">
						<a	 href="<c:url value="/search/view${pageMaker.uri(pageMaker.start)}&keyword=${key }"/>">&laquo;
							처음</a>
					</c:if>
					<c:if test="${pageMaker.startPage >= 11 }">
						<a href="<c:url value="/search/view${pageMaker.uri(pageMaker.start - 1)}&keyword=${key }"/>">&lt;
							이전</a>
					</c:if>
					<c:forEach var="a" begin="${pageMaker.startPage }"
							   end="${pageMaker.totalPage }">
						<a href="<c:url value="/search/view${pageMaker.uri(a)}&keyword=${key }"/>">${a }</a>
					</c:forEach>
					<c:if test="${pageMaker.next  }">
						<a href="<c:url value="/search/view${pageMaker.uri(pageMaker.totalPage + 1)}&keyword=${key } "/>">다음
							&gt;</a>
						<a href="<c:url value="/search/view${pageMaker.uri(pageMaker.endPage)}&keyword=${key } "/>">&raquo;
							마지막</a>
					</c:if>
				</c:when>
			</c:choose>
		</center>

	</div>
	<%--<table>
		<c:choose>
			<c:when test="${fn:length(key) != 0 }" >
				<tr>
					<td>검색 수 :</td>
					<td>${pageMaker.totalCount }</td>
				</tr>
				<tr>
					<span><h2><th>검색:</th></h2></span>
					<th>${key }</th>
				</tr>
				<c:forEach items="${list }" var="list">
					<tr>
						<td>${list.subject }</td>
					</tr>
					<tr>
						<td>${list.wr_nick}</td>
					</tr>
					<tr>
						<td>${list.content}</td>
					</tr>
					<tr>
						<td>${list.bo_good}</td>
						<td>${list.read_count}</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${ list.register_date }" /></td>
					</tr>


				</c:forEach>
			</c:when>

			<c:otherwise>
				<tr>
					<span><h2><th>검색:</th></h2></span>
					<th>0</th>
				</tr>
				<tr>
					<td colspan="6">검색된 데이터가 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>

	<c:choose>
		<c:when test="${fn:length(key) != 0 }" >
			<c:if test="${pageMaker.board.page != 1 }">
				<a	 href="<c:url value="/search/view${pageMaker.uri(pageMaker.start)}&keyword=${key }"/>">&laquo;
					처음</a>
			</c:if>
			<c:if test="${pageMaker.startPage >= 11 }">
				<a href="<c:url value="/search/view${pageMaker.uri(pageMaker.start - 1)}&keyword=${key }"/>">&lt;
					이전</a>
			</c:if>
			<c:forEach var="a" begin="${pageMaker.startPage }"
					   end="${pageMaker.totalPage }">
				<a href="<c:url value="/search/view${pageMaker.uri(a)}&keyword=${key }"/>">${a }</a>
			</c:forEach>
			<c:if test="${pageMaker.next  }">
				<a href="<c:url value="/search/view${pageMaker.uri(pageMaker.totalPage + 1)}&keyword=${key } "/>">다음
					&gt;</a>
				<a href="<c:url value="/search/view${pageMaker.uri(pageMaker.endPage)}&keyword=${key } "/>">&raquo;
					마지막</a>
			</c:if>
		</c:when>
	</c:choose>--%>
</div>