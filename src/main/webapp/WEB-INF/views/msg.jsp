<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.io.*" %>
<%

out.clear();
out = pageContext.pushBody();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
    <script src="//cdnjs.cloudflare.com/ajax/libs/pace/1.0.2/pace.min.js"></script>
    <script
            src="//code.jquery.com/jquery-3.3.1.js"
            integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
            crossorigin="anonymous"></script>

</head>
<body>
<style>
    .pace.pace-inactive {
        display: none;
    }

    .pace {
        -webkit-pointer-events: none;
        pointer-events: none;

        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;

        z-index: 2000;
        position: fixed;
        height: 60px;
        width: 100px;
        margin: auto;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
    }

    .pace .pace-progress {
        z-index: 2000;
        position: absolute;
        height: 60px;
        width: 100px;

        -webkit-transform: translate3d(0, 0, 0) !important;
        -ms-transform: translate3d(0, 0, 0) !important;
        transform: translate3d(0, 0, 0) !important;
    }

    .pace .pace-progress:before {
        content: attr(data-progress-text);
        text-align: center;
        color: #fff;
        background: #29d;
        border-radius: 50%;
        font-family: "Helvetica Neue", sans-serif;
        font-size: 14px;
        font-weight: 100;
        line-height: 1;
        padding: 20% 0 7px;
        width: 50%;
        height: 40%;
        margin: 10px 0 0 30px;
        display: block;
        z-index: 999;
        position: absolute;
    }

    .pace .pace-activity {
        font-size: 15px;
        line-height: 1;
        z-index: 2000;
        position: absolute;
        height: 60px;
        width: 100px;

        display: block;
        -webkit-animation: pace-theme-center-atom-spin 2s linear infinite;
        -moz-animation: pace-theme-center-atom-spin 2s linear infinite;
        -o-animation: pace-theme-center-atom-spin 2s linear infinite;
        animation: pace-theme-center-atom-spin 2s linear infinite;
    }

    .pace .pace-activity {
        border-radius: 50%;
        border: 5px solid #29d;
        content: ' ';
        display: block;
        position: absolute;
        top: 0;
        left: 0;
        height: 60px;
        width: 100px;
    }

    .pace .pace-activity:after {
        border-radius: 50%;
        border: 5px solid #29d;
        content: ' ';
        display: block;
        position: absolute;
        top: -5px;
        left: -5px;
        height: 60px;
        width: 100px;

        -webkit-transform: rotate(60deg);
        -moz-transform: rotate(60deg);
        -o-transform: rotate(60deg);
        transform: rotate(60deg);
    }

    .pace .pace-activity:before {
        border-radius: 50%;
        border: 5px solid #29d;
        content: ' ';
        display: block;
        position: absolute;
        top: -5px;
        left: -5px;
        height: 60px;
        width: 100px;

        -webkit-transform: rotate(120deg);
        -moz-transform: rotate(120deg);
        -o-transform: rotate(120deg);
        transform: rotate(120deg);
    }

    @-webkit-keyframes pace-theme-center-atom-spin {
        0%   { -webkit-transform: rotate(0deg) }
        100% { -webkit-transform: rotate(359deg) }
    }
    @-moz-keyframes pace-theme-center-atom-spin {
        0%   { -moz-transform: rotate(0deg) }
        100% { -moz-transform: rotate(359deg) }
    }
    @-o-keyframes pace-theme-center-atom-spin {
        0%   { -o-transform: rotate(0deg) }
        100% { -o-transform: rotate(359deg) }
    }
    @keyframes pace-theme-center-atom-spin {
        0%   { transform: rotate(0deg) }
        100% { transform: rotate(359deg) }
    }
</style>
<script>
	alert('${msg}'+'${t}');
	location.href='<c:out value="${pageContext.request.contextPath}"/>${url}';
</script>

</body>
</html>