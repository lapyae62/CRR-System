<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@page import="java.util.*" %>
    <%@page import="Controller.DAO" %>
    <%@page import="Model.User" %>
    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Admin Dashboard</title>

    <link rel="stylesheet" href="dashboard/style.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
    <style>
    	
    	.btn{
    		margin-left:680px;
		}
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
        a
        {
        	color: red;
        }
        td{
        	text-align:center;
        }
        .body{
        	background-color:grey;
        	margin-left:300px;
        	
        	padding:30px 30px 30px 30px;
        	border-radius:20px;
        	width:500px;
        }
        .body form{
        	font-weight:bold;
        	font-size:20px;
        	
        }
        .body input{
        	width:300px;
        	height:50px;
        	border-radius:15px;
        	padding:20px;
        	display:inline-block;
        }
        .body .name{
        margin-left:35px;
        }
        .body .text{
        	margin-left:10px;
        }
        .body .email{
        	margin-left:40px;
        }
        .body select{
        	margin-left:30px;
        	width:170px;
        	height:35px;
        	border-radius:15px;
        	padding:8px;
        }
        .body .but{
        	width:150px;
        	height:40px;
        	padding:2px 0px 3px 0px;
        	margin-top:20px;
        	margin-left:150px;
        	background-color:wheat;
        	font-size:23px;
        }
        	
    </style>

</head>
<body>
    <div class="side-bar" style="background-color:black">
        <div class="logo-name" >
            <img src="dashboard/logo.png" id="plogo" alt="">
            <h1 style="color:wheat">CRR System</h1>
        </div>

        <ul style="margin-top: 20px">
            <li><a style="color:wheat" href="adDashboard.jsp" marked>Reports</a></li>
            <li><a style="color:wheat" href="ViewUsers.jsp">View Polices</a></li>
            <li><a style="color:wheat" href="AddUser.jsp">Add Polices</a></li>
            <li><a style="color:wheat" href="ViewCrimeRates.jsp">Crime-Rates</a></li>
            <li><a style="color:wheat" href="ViewFeedback.jsp">Feedbacks</a></li>
        </ul>
    </div>
    

    <div class="container">
        <div class="header">
            <div class="nav">
                

                <div class="user">
                	<h2>Admin Dashboard</h2>
                    <a href="Home.jsp" class="btn">Home</a>
                    
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
    <%
    	int id=Integer.parseInt(request.getParameter("id"));
    	DAO dao=new DAO();
    	User list=new User();
    	list=dao.ViewUserById(id);
    %>
    <div class="body">
    	<form method="get" action="UpdateAction.jsp">
			Name : <input type="text" name="username" class="name" value="<%=list.getUsername() %>" required><br><br>
			Password : <input type="text" name="password" class="password" value="<%=list.getPassword() %>" required><br><br>
			Police Id : <input type="text" name="policeId" class="text" pattern="\d{6}" value="<%=list.getPoliceId() %>" required><br><br>
			Email : <input type="email" name="email" class="email" value="<%=list.getEmail() %>" required><br><br>
			State : &nbsp;
			<select name="state" class="state"><br><br>
				<option value="Kachin" selected>Kachin</option>
				<option value="Kayah">Kayah</option>
				<option value="Kayin">Kayin</option>
				<option value="Chin">Chin</option>
				<option value="Mon">Mon</option>
				<option value="Rakhine">Rakhine</option>
				<option value="Shan">Shan</option>
				<option value="Mandalay">Mandalay</option>
				<option value="Yangon">Yangon</option>
				<option value="Magwe">Magwe</option>
				<option value="Bago">Bago</option>
				<option value="Ayeyarwady">Ayeyarwady</option>
				<option value="Sagaing">Sagaing</option>
				<option value="Tanintharyi">Tanintharyi</option>
			</select><br>
			<input type="hidden" value="<%=list.getId() %>" name="id">
			<input type="submit" class="but" value="Update">
		</form>
    </div>
</div>

    </body>
</html>