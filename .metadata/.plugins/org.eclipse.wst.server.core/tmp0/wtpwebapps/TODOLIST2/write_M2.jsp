<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="userdata.UserData" %>
<%@ page import="userdata.UserDataDAO" %>
<%@ page import = "user.UserDAO" %>
<%@ page import="java.util.ArrayList" %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-with", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>JSP 일정관리</title>
<style>
.container {
  width: 50%;
}
body {
  		background-image: url("ect.jpg");
	}
	nav>div>ul>li>a:hover{
	font-weight:900;}
</style>
</head>
<body>
	<%
		 String userID =null;
		if (session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class ="navbar-brand">TODAY LIST</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li ><a href="Register_main_M2.jsp?userID=<%=userID %>">오늘의 일정</a></li>
				<li ><a href="Register_main_Month.jsp?userID=<%=userID %>">날짜별 일정</a></li>							
				<li><a href="bbs.jsp?userID=<%=userID %>">전체 일정</a></li>								
				<li><a href="Title_search.jsp?userID=<%=userID %>">일정 출력</a></li>							
				</ul>
			<%
				if(userID == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspoppup="ture"
						aria-expanded="false">시작하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>			
			</ul>
			<%
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspoppup="ture"
						aria-expanded="false"><%=userID %>님 나가기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
				</li>			
			</ul>
			
			<% 
				}
			%>
			
		</div>
	</nav>	
	<div class="container">
		<div class="row">
		<form method="post" action="writeAction_M2.jsp?userID=<%=userID %>">
			<table class="table" style="text-align: center;border-radius: 5px; box-shadow: rgba(0,0,0,0.8) 0 0 10px;">
			<thead>
				<tr>
					<th colspan="2" style="background-color: #42579D; text-align:center; color: white"><h4>일정 등록하기</h4></th>
				</tr>			
			</thead>		
			<tbody>
				<tr>
					<td style="background-color: #fafafa; text-align: center;"><h5>Title</h5></td>
					<td style="background-color: #fafafa; text-align: center;"><input class="form-control" type="text" name="userTitle" size="20" maxlength="20" placeholder="(20자 이내)"></td>				
				</tr>
				<tr>
					<td style="background-color: #fafafa; text-align: center;"><h5>Date</h5></td>
					<td style="background-color: #fafafa; text-align: center;"><input class="form-control" type="date" name="userDate" size="20"></td>				
				</tr>
				<tr>
					<td style="background-color: #fafafa; text-align: center;"><h5>Memo</h5></td>
					<td style="background-color: #fafafa; text-align: center;"><input class="form-control" type="text" name="userMemo" size="20" maxlength="30" placeholder="(30자 이내)"></td>				
				</tr>
				<tr>
					<td style="background-color: #fafafa; text-align: center;border-bottom-left-radius: 5px;"> <h5>Importance</h5></td>
					<td style="background-color: #fafafa; text-align: center;border-bottom-right-radius:5px;">
						<div class="form-group" style="text-align:center; margin: 0 auto;">
				 			<div class="btn-group" data-toggle="buttons">
				 				<label class="btn btn-primary active">
				 					<input type="radio" name="userCompletion" autocomplete="off" value="상" checked>상
				 				</label>
				 				<label class="btn btn-primary">
				 					<input type="radio" name="userCompletion" autocomplete="off" value="중" >중
				 				</label>
				 				<label class="btn btn-primary">
				 					<input type="radio" name="userCompletion" autocomplete="off" value="하">하
				 					<!-- 이부분도 수정 -->
				 				</label>			 				
				 			</div>
				 		</div>				
					</td>
				</tr>			
			</tbody>
		</table>
		
			<a href="Register_main_M2.jsp?userID=<%=userID %>" style="box-shadow: rgba(0,0,0,0.8) 0 0 3px;"  class="btn btn-primary">목록</a>
			<input type="submit" href="write.jsp"  style="box-shadow: rgba(0,0,0,0.8) 0 0 3px;"  class="btn btn-primary pull-right" value="추가">
				
		</form>
		</div>
	</div>
 	<script src= "https://code.jquery.com/jquery-3.5.1.min.js"></script>
 	<script src="js/bootstrap.js"></script>
</body>
</html>

