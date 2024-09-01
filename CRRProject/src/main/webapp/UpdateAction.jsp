<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="Controller.DAO" %>
<%@page import="Model.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>UpdateAction</title>
</head>
<body>
<%
	User u=new User();
	u.setId(Integer.parseInt(request.getParameter("id")));
	u.setUsername(request.getParameter("username"));
	u.setPassword(request.getParameter("password"));
	u.setPoliceId(request.getParameter("policeId"));
	u.setEmail(request.getParameter("email"));
	u.setState(request.getParameter("state"));
	DAO dao=new DAO();
	int status=dao.UpdateUser(u);
	if(status>0)
	{
		response.sendRedirect("ViewUsers.jsp");
	}
	else
	{
		response.sendRedirect("UpdateUser.jsp?id="+u.getId()+"");
	}
%>
</body>
</html>