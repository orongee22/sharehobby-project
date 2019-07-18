<%@page import="sharehobby.model.BoardPost"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	// 임의로 속성 값 추가, 처리 실제 sessiong값 얻어올 거임
	String uNum = (String)session.getAttribute("u_num");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
<script
  src="https://code.jquery.com/jquery-2.2.4.js"></script>

</head>
<body>
<%
boolean isLogin = false;

%>
	<div id="wrapper">
		<div id="header">
			<h1 id="main-title">취미 공유 커뮤니티</h1>
			<div id="nav">
				<ul class="nav-list">
					<li>홈</li>
					<li>로그인</li>
					<li>회원가입</li>
					<li>마이페이지</li>
					<li>맛집</li>
					<li>여행</li>
					<li>전시</li>
					<li>음악</li>
				</ul>
			</div>
		</div>
		<div id="main">
			<div id="container">
				<div id="content-wrapper">
					<h3>리뷰 보기</h3>
					<div id="content">
						
					</div>
				</div>
			</div>
		</div>
		<div id="footer">
			
		</div>
	</div>
</body>
</html>