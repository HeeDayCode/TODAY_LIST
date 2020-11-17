<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-with, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>JSP 일정관리</title>
<script type="text/javascript">
//전체보기 페이지

 		var searchRequest = new XMLHttpRequest();
 		var deleteRequest = new XMLHttpRequest();
 		
 		function searchParam(key) {
			  return new URLSearchParams(location.search).get(key);
		};		 		
		function printFunction(){
			window.print();
		}
		
 		function searchFunction(){//search action
 			searchRequest.open("Post","./UserDSearchServlet4?userDate=" + encodeURIComponent(document.getElementById("userDate").value)+
 									"&userID=" + searchParam('userID'), true);
 			searchRequest.onreadystatechange = searchProcess;
 			searchRequest.send(null);
 		}
 		function searchProcess(){ // 각각의 행의 데이터 들을 가지고 오는 과정
 			var table = document.getElementById("ajaxTable");
 			table.innerHTML ="";
 			if (searchRequest.readyState == 4 && searchRequest.status == 200){
 				var object = eval('(' + searchRequest.responseText + ')');
 				var result = object.result; // 배열을 가져오겠다			
 				for(var i = 0; i < result.length; i++) {
 					var row = table.insertRow(0);
 					for(var j = 0; j < result[i].length; j++){
 						var cell = row.insertCell(j);
 						cell.innerHTML = result[i][j].value;
 					}					
 				}			
 			}		
 		}
 		window.onload = function() {
 			searchFunction();	
 		}
 		
 	</script>
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
				<li class="active"><a href="Register_main_M2.jsp?userID=<%=userID %>">오늘의 일정</a></li>
				<li ><a href="Register_main_Month.jsp?userID=<%=userID %>">날짜별 일정</a></li>							
				<li><a href="bbs.jsp?userID=<%=userID %>">전체 일정</a></li>								
				<li><a href="Title_search.jsp?userID=<%=userID %>">추가 검색</a></li>							
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
						aria-expanded="false">나가기<span class="caret"></span></a>
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
		<table class="table" style="text-align: center; border: 1px solid #dddddd">
			<thead>
			<tr>			
			<td colspan="4" style="background-color: #fafafa; align: right;">
			 <div class="from-group row pull-right">
				<div class="col-xs-8 col-md-pull-3">				
				<input class="form-control" onkeyup="searchFunction()" type="date" id="userDate" size="20" placeholder="날짜로 찾기">			
			</div>
			<div class="col-xs-2 col-md-pull-3">
				<button type="button" onclick="searchFunction();" class="btn btn-primary">검색</button>
			</div>
			<div class="col-xs-2 col-md-pull-3">
				<button type="button" onclick="printFunction();" class="btn btn-primary">P</button>
			</div>
			</div>
			</td>			
			</tr>
		 	<tr>	
		 		<th style="background-color: #fafafa; text-align: center;">Title</th>
		 		<th  class="col-md-2" style="background-color: #fafafa; text-align: center;">Date</th>
		 		<th style="background-color: #fafafa; text-align: center;">Memo</th>
		 		<th style="background-color: #fafafa; text-align: center;">Importance</th>		 		
		 	</tr>	 
		 	</thead>
		 	<tbody id="ajaxTable">		
		 	</tbody>	 	
		 </table>
	</div>
	
 	<script src= "https://code.jquery.com/jquery-3.5.1.min.js"></script>
 	<script src="js/bootstrap.js"></script>
</body>
</html>