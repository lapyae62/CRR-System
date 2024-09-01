<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@page import="java.util.*" %>
    <%@page import="Controller.DAO" %>
    <%@page import="Model.Report" %>
    <!DOCTYPE html>
<html lang="en">
<head>
    
</head>
<body>
    <%
    	  String Username=request.getParameter("UserName");
    	  DAO dao=new DAO();
    	  int status=dao.UserLogOut(Username);
    	  
    	  if(status>0)
    	  {
    		  response.sendRedirect("ViewUsers.jsp");
    	  }
    	  else
    	  {
    		  response.sendRedirect("Error.jsp");
    	  }
    	  
    	%>
    </body>
</html>