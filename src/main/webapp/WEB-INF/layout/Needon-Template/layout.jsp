<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>${ title }</title>

<!-- 메인해드시작 -->
<tiles:insertAttribute name="head" />
<!-- 메인 해드 끝 -->


	<style>


		.pace {
			-webkit-pointer-events: none;
			pointer-events: none;
			-webkit-user-select: none;
			-moz-user-select: none;
			user-select: none;
		}

		.pace-inactive {
			display: none;
		}

		.pace .pace-progress {
			background: #29d;
			position: fixed;
			z-index: 2000;
			top: 0;
			right: 100%;
			width: 100%;
			height: 2px;
		}

		.pace .pace-progress-inner {
			display: block;
			position: absolute;
			right: 0px;
			width: 100px;
			height: 100%;
			box-shadow: 0 0 10px #29d, 0 0 5px #29d;
			opacity: 1.0;
			-webkit-transform: rotate(3deg) translate(0px, -4px);
			-moz-transform: rotate(3deg) translate(0px, -4px);
			-ms-transform: rotate(3deg) translate(0px, -4px);
			-o-transform: rotate(3deg) translate(0px, -4px);
			transform: rotate(3deg) translate(0px, -4px);
		}

		.pace .pace-activity {
			display: block;
			position: fixed;
			z-index: 2000;
			top: 15px;
			right: 15px;
			width: 14px;
			height: 14px;
			border: solid 2px transparent;
			border-top-color: #29d;
			border-left-color: #29d;
			border-radius: 10px;
			-webkit-animation: pace-spinner 400ms linear infinite;
			-moz-animation: pace-spinner 400ms linear infinite;
			-ms-animation: pace-spinner 400ms linear infinite;
			-o-animation: pace-spinner 400ms linear infinite;
			animation: pace-spinner 400ms linear infinite;
		}

		@-webkit-keyframes pace-spinner {
			0% { -webkit-transform: rotate(0deg); transform: rotate(0deg); }
			100% { -webkit-transform: rotate(360deg); transform: rotate(360deg); }
		}
		@-moz-keyframes pace-spinner {
			0% { -moz-transform: rotate(0deg); transform: rotate(0deg); }
			100% { -moz-transform: rotate(360deg); transform: rotate(360deg); }
		}
		@-o-keyframes pace-spinner {
			0% { -o-transform: rotate(0deg); transform: rotate(0deg); }
			100% { -o-transform: rotate(360deg); transform: rotate(360deg); }
		}
		@-ms-keyframes pace-spinner {
			0% { -ms-transform: rotate(0deg); transform: rotate(0deg); }
			100% { -ms-transform: rotate(360deg); transform: rotate(360deg); }
		}
		@keyframes pace-spinner {
			0% { transform: rotate(0deg); transform: rotate(0deg); }
			100% { transform: rotate(360deg); transform: rotate(360deg); }
		}

	</style>

</head>

<script>
    google_adtest = "on";
</script>

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
			<div class="col-3" style="padding-right: 0px!important;padding-left: 0px;">
				<tiles:insertAttribute name="sidebar" />
			</div>
			<!-- 슬라이드 끝 } -->
  
			<!-- 내용시작 { -->
			<div class="col" style="margin-top:10px;padding-left: 0px;">
				<tiles:insertAttribute name="body" />
			</div>
			<!-- 내용 끝 } -->
		</div>
	</div>
	<!-- 풋더시작 { -->
	<tiles:insertAttribute name="footer" />
	<!-- 풋더 끝 } -->
</body>

<script>

    $(document).ready(function () {

		$("#data_loading").hide();

        $("#logout-form").submit(function(){
            $("#btn-logout").prop('disabled', true);

            $("#btn-logout").html("<i class=\"fas fa-spinner fa-spin\"></i>\n" + "\n 로그아웃 중...");
        });
	})

        .ajaxStart(function(){
            $('#Progress_Loading').show(); //ajax실행시 로딩바를 보여준다.
        })
        .ajaxStop(function(){
            $('#Progress_Loading').hide(); //ajax종료시 로딩바를 숨겨준다.
        });

</script>

</html>
