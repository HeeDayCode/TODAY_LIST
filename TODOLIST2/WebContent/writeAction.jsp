<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import ="userdata.UserDataDAO"%>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:useBean id="userdata" class="userdata.UserData" scope="page" />
<jsp:setProperty name="userdata" property="userTitle" />
<jsp:setProperty name="userdata" property="userDate" />
<jsp:setProperty name="userdata" property="userMemo" />
<jsp:setProperty name="userdata" property="userCompletion" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP</title>
</head>
<body>
<%			

		String userID= null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
	}
		if (userID == null){
			PrintWriter script =response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href ='login.jsp'");
			script.println("</script>");
	} else{
			if (userdata.getUserTitle() == null || userdata.getUserDate() == null || userdata.getUserMemo() == null || userdata.getUserCompletion() == null) {
					PrintWriter script =response.getWriter();
					script.println("<script>");
					script.println("alert('입력이 안 된 사항이 있습니다.')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					UserDataDAO userdataDAO = new UserDataDAO();
					int result = userdataDAO.write(userdata.getUserTitle(), userID, userdata.getUserDate(), userdata.getUserMemo(), userdata.getUserCompletion() );
					if (result == -1){
						PrintWriter script =response.getWriter();
						script.println("<script>");
						script.println("alert('글쓰기에 실패했습니다.')");
						script.println("history.back()");
						script.println("</script>");
					}
					else {
						session.setAttribute("userID", user.getUserID());
						String name = user.getUserID()+"'";
						PrintWriter script =response.getWriter();
						script.println("<script>");
						script.println("location.href ='Register_main_M1.jsp"+"?userID="+name);	
						script.println("</script>");
					} 		
	}
		
	}
%>
</body>
</html>