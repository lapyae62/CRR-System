<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="u" class="Model.User"/>
<jsp:setProperty name="u" property="*"/>
<%@page import="Controller.DAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	DAO dao=new DAO();
	int status=0;
	String result=dao.CheckName(u.getUsername());
	if(result==null)
	{
		status=dao.insertSignup(u);
	}
	if(status>0)
	{
		response.sendRedirect("ViewUsers.jsp");
	}
	else
	{
		response.sendRedirect("AddUser.jsp");
	}
%>
</body>
</html>