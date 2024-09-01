<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Controller.DAO" %>
    <%@page import="Model.Report" %>
    <%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% int  id=Integer.parseInt(request.getParameter("id"));
   DAO dao=new DAO();
   int status=dao.DeleteReport(id);
   
   if(status>0)
   {
	   response.sendRedirect("ViewReport.jsp");
   }
   else
   {
	   response.sendRedirect("Error.jsp");
   }
%>
</body>
</html>