<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>${ title }</title>

<!-- 메인해드시작 -->
<tiles:insertAttribute name="head" />
<!-- 메인 해드 끝 -->

</head>

<body>
	<!-- 해더 시작 { -->
	<header>
		<tiles:insertAttribute name="top" />
		<tiles:insertAttribute name="menu" />
	</header>
	<!-- 해더 끝 } -->
	<div class="container">
		<div class="row">
			<!-- 슬라이드 시작 { -->
			<div class="col-3 left-side">
				<tiles:insertAttribute name="sidebar" />
			</div>
			<!-- 슬라이드 끝 } -->
  
			<!-- 내용시작 { -->
			<div class="col" style="margin-top:10px;">
				<tiles:insertAttribute name="body" />
			</div>
			<!-- 내용 끝 } -->
		</div>
	</div>
	<!-- 풋더시작 { -->
	<tiles:insertAttribute name="footer" />
	<!-- 풋더 끝 } -->
</body>
  
</html>
