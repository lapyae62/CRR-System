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
	<!-- Data-table plug-in CSS file -->
    <link rel="stylesheet" href="./css/jquery.dataTables.min.css" /> 
  
    <!-- jQuery library file -->
    <script type="text/javascript" src="./js/jquery-3.7.1.js"> </script> 
  
    <!-- Data-table plug-in JS library file -->
    <script type="text/javascript" src="./js/jquery.dataTables.min.js"> </script>
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

    <div class="buttons">
        <form action="">
            <button>Button1</button>
            <button>Button2</button>
        </form>
    </div>
    
    <div class="body">
    	<%DAO dao=new DAO();
	   	ArrayList<User> list=new ArrayList<User>();
	   	list=dao.ViewUsers();
	   	int i=1;
	 	%>
        <table class="display" id="tableID" style="width:50%">
        <thead>
        <tr>
        		<th>No.</th>
                <th>User Name</th>
                <th>Password</th>
                <th>Police Id</th>
                <th>Email</th>
                <th>State</th>
                <th>Further</th>
        </tr>
        </thead>
        <tbody>
        	<%for(User u:list){ %>
			 <tr>
			 <td><%=i++ %></td>
			 <td><%=u.getUsername() %></td>
			 <td><%=u.getPassword() %></td>
			 <td><%=u.getPoliceId() %></td>
			 <td><%=u.getEmail() %></td>
			 <td><%=u.getState() %></td>
			 <td><a href="DeleteUser.jsp?UserName=<%=u.getUsername() %>">Delete</a>,<a href="UpdateUser.jsp?id=<%=u.getId() %>">Update</a></td>
			 </tr>
			 <%} %>
        </tbody>
        </table>
    </div>
    <div class="header">
            <div class="nav">
                <div class="user">
                	<h2>Admin Dashboard</h2>
                    <a href="adDashboard.jsp" class="btn">Home</a>
                    
                    <div class="img-design">
                        <img src="dashboard/user.jpg" id="puser" alt="">
                    </div>
                </div>
            </div>
    </div>
</div>
<script> 
  /* Initialization of datatable */ 
  $(document).ready(function() { 
  $('#tableID').DataTable({ }); 
  }); 
</script> 
    </body>
</html>