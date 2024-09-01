<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*" %>
    <%@page import="Controller.DAO" %>
    <%@page import="Model.Feedback" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Admin Dashboard</title>

    <link rel="stylesheet" href="dashboard/style.css">

    <style>
        .content-table{
            border-collapse: collapse;
            margin: 25px 0;
            font-size: 0.9em;
            width: 100%;
            height: auto;
        }
        .content-table th tr{
            background-color: #47143a;
            color: #f1f1f1;
            text-align: left;
            font-weight: bold;
        }
        th{
            background-color: grey;
            color: #f1f1f1;
        }
        .content-table th,
        .content-table td {
            padding: 12px 15px;
        }
        .content-table tbody tr {
            border-bottom: 1px solid #dddddd;
        }
        .content-table tbody tr:nth-of-type(even){
            background-color: #f3f3f3;
        }
        .content-table tbody tr:last-of-type {
            border-bottom: 2px solid gray;
        }
        .form
        {
         	margin-left: 20px;
         	text-decoration: none;
         	font-family:serif;
        }
        .form textarea
        {
        	width: 90%;
  			height: 150px;
  			padding: 12px 20px;
  			box-sizing: border-box;
  			border: 2px solid #ccc;
  			border-radius: 4px;
  			background-color: #f8f8f8;
  			font-size: 16px;
  			resize: none;
        }
        .button {
  			background-color: #0390FE;
  			border: none;
  			color: white;
  			padding: 15px 32px;
  			text-align: center;
  			text-decoration: none;
  			display: inline-block;
  			font-size: 16px;
  			margin: 4px 2px;
  			cursor: pointer;
		}
    </style>

</head>
<body>
<body>
    <div class="side-bar">
        <div class="logo-name">
            <img src="dashboard/logo.png" id="plogo" alt="">
            <h1>CRR System</h1>
        </div>

        <ul>
            <li><a href="adDashboard.jsp">Reports</a></li>
            <li><a href="ViewUsers.jsp">'Sign-up'ed Users</a></li>
            <li><a href="ViewCrimeRates.jsp">Crime-Rates</a></li>
            <li><a href="ViewFeedback.jsp">Feedbacks</a></li>
            <li><a href="DeleteUser.jsp">Log-out</a></li>
        </ul>
    </div>

    <div class="container">
        <div class="header">
            <div class="nav">
                <div class="search">
                    <input type="text" name="" placeholder="Search.." >
                    <button type="submit"><img src="dashboard/search.png" alt=""></button>
                </div>

                <div class="user">
                    <a href="#" class="btn">Home</a>
                    <img src="dashboard/notification.png" alt="">
                    <div class="img-design">
                        <img src="dashboard/user.jpg" id="puser" alt="">
                    </div>
                </div>
            </div>
    </div>

    <div class="buttons">
        <form action="">
            <button>Button1</button>
            <button>Button2</button>
        </form>
    </div>
    
    <div class="body">
    	<% Feedback f=new Feedback();
   f.setFeedback(request.getParameter("feedback"));
   f.setDate(request.getParameter("Date"));
   DAO dao=new DAO();
   int status=dao.insertFeedback(f);
   
   if(status>0)
   {
	   response.sendRedirect("Home.jsp");
   }
   else
   {%>
	   <h2>There seems to be a slight problem! We'll try to fix it!</h2><br>
	   <h3>Meanwhile, You can <a href="Home.jsp">go home. </a></h3>
   <%}
%>
    </div>
</div>
</body>
</html>

