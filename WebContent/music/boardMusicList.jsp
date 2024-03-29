<%@page import="java.text.SimpleDateFormat"%>
<%@page import="sharehobby.model.member.LoginInfo"%>
<%@page import="sharehobby.model.music.BoardMusicList"%>
<%@page import="sharehobby.service.music.BoardMusicListService"%>
<%@page import="sharehobby.model.music.BoardPost"%>
<%@page import="sharehobby.service.music.WritePostService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%
	
	
	String uId = (String)session.getAttribute("u_id");
		
	String pageNumberstr = request.getParameter("page");
	
	int pageNumber = 1;
	
	if(pageNumberstr != null){
		pageNumber = Integer.parseInt(pageNumberstr);
	}
	
	BoardMusicListService listService = BoardMusicListService.getInstance();
	BoardMusicList viewData = listService.getBoardMusicListService(pageNumber);
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/default_board_music.css">

<script src="https://code.jquery.com/jquery-2.2.4.js"></script>

</head>
<body>

	<script>
	</script>
	<!-- 로그인 된 id가 있을 경우 페이징 처리 -->

	<%@include file="../frame/nav.jsp"%>
	<%@include file="../frame/header.jsp"%>
	<div id="main">
		<div id="container">
			<% if(uId != null){ %>
			<h3 class="title-header">음악 리뷰 게시판</h3>
			<%
				if(viewData.isEmpty()){
					
			%>
			
			<h3 class="viewStatus">등록된 게시글이 없습니다.<a class="btn-write" href="${pageContext.request.contextPath}/music/boardMusicWriteForm.jsp">글쓰기</a></h3>
			<div id="content-wrap">
			<%	} else { %>
				<h3 class="viewStatus"><%=viewData.getPostTotalCount() %>개의 게시글이 있습니다.
					<a class="btn-write" href="${pageContext.request.contextPath}/music/boardMusicWriteForm.jsp">글쓰기</a>
				</h3>
				<% for(BoardPost postlist : viewData.getPostList()){ %>
				<div class="content-wrap">
					<div class="cont-wrap-left">
						<p><%=postlist.getBmNum() %><br>
							<span class="content-time"><%= postlist.getBmTime() %>
						</span></p>
					</div>
					<div class="cont-wrap-center">
						<div class="img-cont">
							<img src="<%=postlist.getmPhoto() %>" alt="" width="150">
						</div>
						<%-- <div class="musicinfo">
							<p><%= postlist.getHmTitle() %></p>
							<p><%=postlist.getmSinger() %></p> 
						</div> --%>
					</div>
					<a class="cont-wrap-right" href="${pageContext.request.contextPath}/music/viewPostContent.jsp?bmNum=<%=postlist.getBmNum()%>">
						<h4 class="content-title"><div
								><%= postlist.getBmTitle() %></div></h4>
						<p class="content-writer">작성자 : <%= postlist.getuId() %>
						</p>
						<span class="content-star"> 평점 : 
							<%= postlist.getBmStar() %>
						</span>
						<span class="content-count"> 조회수 : 
							<%= postlist.getBmCnt() %>
						</span>
						<span class="content-"></span>
						<p class="content-review"><%= postlist.getBmCont() %></p>
					</a>
				</div>
				<%} %>
				
			<%	} %>
			<div class="paging">
			<% for(int i=1;i<=viewData.getPageTotalCount();i++){ %>
				<a class="paging-num" href="${pageContext.request.contextPath}/music/boardMusicList.jsp?page=<%= i %>"><%=i %>
				</a>
			<% } %>
			</div>
			</div>
			
	<% } else {%>													
			<div class="not-login">
				로그인이 필요한 서비스 입니다. 로그인 해주세요.
				<a style="text-decoration:underline"href="${pageContext.request.contextPath}/member/loginForm.jsp">로그인 페이지로 이동</a>
			</div>
	<% } %>
		</div>
	</div>
	<div id="footer">
	<%@ include file="../frame/footer.jsp" %>
	</div>

	

</body>
</html>