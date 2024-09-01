<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@page import="java.util.*" %>
    <%@page import="Controller.DAO" %>
    <%@page import="Model.Report" %>
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
            width:150px;
            
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
        .button{
        	border:3px solid black;
        	width:80px;
        	height:30px;
        	margin-left:200px;
        	margin-top:20px;
        	border-radius:5px;
        	background-color:grey;
        }
        .button a{
        	font-size:21px;
        	align-self:center;
        	padding:10px 10px 10px 10px;
        	color:black;
        }
        .body{
        	margin-left:15px;
        }
        table{
        	border:4px solid grey;
        	margin-top:5px;
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
    
    <div class="body">
    <%
	int id=Integer.parseInt(request.getParameter("id"));
	ArrayList<Report> rp1=new ArrayList<Report>();
	DAO dao=new DAO();
	rp1=dao.ViewReportsById(id);
	ArrayList<Report> s1=dao.ViewEvidentImagesByID(id);
	ArrayList<Report> s2=dao.ViewEvidentVideosByID(id);
	ArrayList<Report> s3=dao.ViewEvidentFilesByID(id);
%>

<h2>Reported Crime Description</h2><br>
	<%for(Report cd:rp1){ %>
		<table>
		<tr>
			<th>Crime ID</th>
			<td style="width:300px;"><%=cd.getId() %></td>
		</tr>
		</table>
		<table>
		<tr>
			<th>State</th>
			<td style="width:300px;"><%=cd.getRegion() %></td>
		</tr>
		</table>
		<table>
		<tr>
			<th>Crime Type</th>
			<td style="width:300px;"><%=cd.getCrimeType() %></td>
		</tr>
		</table>
		<table>
		<tr>
			<th>Description</th>
			<td style="width:300px;"><%=cd.getDescription() %></td>
		</tr>
		</table>
		<table>
		<tr>
			<th>Date</th>
			<td style="width:300px;"><%=cd.getDate() %></td>
		</tr>
		</table>
	<%} %>	
<table>
<tr>
	<th>Photo Evidence</th>
	<%for(Report image:s1){ %>
	<td>
	<img src="data:image/jpg;base64,<%=image.getDatafile() %>" width="150" height="150"/>
	</td>
	<%} %>
</tr>
</table>

<table>
<tr>
	<th>Video Evidence</th>
	<%for(Report video:s2){ %>
	<td>
		<video width="320" height="240" controls>
  			<source src="data:video/mp4;base64,<%=video.getDatafile() %>" type="video/mp4">
		</video>
	</td>
	<%} %>
</tr>
</table>

<table>
<tr>
	<th>PDF Files</th>
	<%for(Report pdf:s3){ %>
	<td style="width:500px;height:500px;">
		<embed  type="application/pdf" src="data:application/pdf;base64,<%=pdf.getDatafile()%>"  style="width:500px;height:500px;">
	</td>
	<%} %>
</tr>

</table>
    </div>
    
    <div class="button">
    	<a href="adDashboard.jsp">Back</a>
    </div>
</div>
</body>
</html>