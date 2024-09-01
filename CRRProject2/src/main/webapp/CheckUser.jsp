<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="Controller.DAO" %>
<%@page import="Model.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String name=request.getParameter("username");
	String password=request.getParameter("password");
	DAO dao=new DAO();
	User valid=dao.isValidUser(name,password);
	
	if(password.equals(valid.getPassword()))
	{
		HttpSession Session=request.getSession();
		Session.setAttribute("name", name);
		response.sendRedirect("PoliceViewCrimeRates.jsp?State="+valid.getState()+"");
	}
	else
	{
		response.sendRedirect("Error.jsp");
	}
%>

</body>
</html>