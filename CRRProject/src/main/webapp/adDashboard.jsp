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
        

   
    
    <div class="body">
    	<%DAO dao=new DAO();
	   	ArrayList<Report> list=new ArrayList<Report>();
	   	list=dao.ViewReports();
	 	%>
        <table class="display" id="tableID">
        <thead>
            <tr>
                <th>Report No.</th>
                <th>Region</th>
                <th>CrimeType</th>
                <th>Date</th>
                <th>Descriptions</th>
                <th>Furthers</th>
            </tr>
            </thead>
            <tbody>
            <%for(Report r:list){ %>
			 <tr>
			 <td><%=r.getId() %></td>
			 <td><%=r.getRegion() %></td>
			 <td><%=r.getCrimeType() %></td>
			 <td><%=r.getDate() %></td>
			 <td><%=r.getDescription()%></td>
			 <td><a href="Details.jsp?id=<%=r.getId()%>">Details</a></td>
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