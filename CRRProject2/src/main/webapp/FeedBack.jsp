<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*" %>
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
        	width: 60%;
  			height: 150px;
  			padding: 12px 20px;
  			box-sizing: border-box;
  			border: 2px solid #ccc;
  			border-radius: 4px;
  			background-color: #f8f8f8;
  			font-size: 16px;
  			resize: none;
  			margin-top:50px;
  			margin-left:280px
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
  			margin-left:282px;
		}
    </style>

</head>
<body>
<body>
    

    <div class="container" style="width: 100%">
        <div class="header" style="width: 100%">
        	
            <div class="nav" style="margin-right:500px">
			<h2 style="margin-left:500px">Please Feedback about your Experience</h2>
                <div class="user">
                    
                </div>
            </div>
    </div>
    
    <div class="body">
    	<form action="SubmitFeedback.jsp" method="get" class="form">
			<textarea name="feedback"></textarea><br><br>
			<input type="hidden" value="<%=new Date()%>" name="Date">
			<input type="submit" value="Give Feedback" class="button">
			<a href="Home.jsp" class="button">Go Back</a>
		</form>	
		
    </div>
</div>
</body>
</html>