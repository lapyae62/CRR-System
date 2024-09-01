<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@page import="java.util.*" %>
    <%@page import="Controller.DAO" %>
    <%@page import="Model.Report" %>
    <%@page import="java.text.DecimalFormat" %>
    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
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

    <div class="buttons">
        <form action="">
            <button>Button1</button>
            <button>Button2</button>
        </form>
    </div>
    
    <div class="body">
    <canvas id="myChart" style="width:100%;max-width:600px;margin-left:300px;"></canvas>
<%
  DecimalFormat df=new DecimalFormat("#."+"0".repeat(2));
  DAO dao=new DAO();
  double KachinRate=dao.getReportPercent("Kachin");
  double KaYahRate=dao.getReportPercent("Kayah");
  double KaYinRate=dao.getReportPercent("Kayin");
  double ChinRate=dao.getReportPercent("Chin");
  double MonRate=dao.getReportPercent("Mon");
  double RaKhineRate=dao.getReportPercent("Rakhine");
  double ShanRate=dao.getReportPercent("Shan");
  double SagaingRate=dao.getReportPercent("Sagaing");
  double BagoRate=dao.getReportPercent("Bago");
  double MagweRate=dao.getReportPercent("Magwe");
  double MandalayRate=dao.getReportPercent("Mandalay");
  double YangonRate=dao.getReportPercent("Yangon");
  double AyeyarwadyRate=dao.getReportPercent("Ayeyarwady");
  double TanintharyiRate=dao.getReportPercent("Tanintharyi");
  
%>
<script>
const xValues = ["KaChin", "KaYah", "KaYin", "Chin", "Mon", "RaKhine", "Shan", "SaGaing", "BaGo", "MaGwe", "Mandalay", "YanGon", "AyeYarWady", "TaNinTharyi"];
const yValues = [<%=df.format(KachinRate)%>, <%=df.format(KaYahRate)%>, <%=df.format(KaYinRate)%>, <%=df.format(ChinRate)%>, <%=df.format(MonRate)%>, <%=df.format(RaKhineRate)%>, <%=df.format(ShanRate)%>, <%=df.format(SagaingRate)%>, <%=df.format(BagoRate)%>, <%=df.format(MagweRate)%>, <%=df.format(MandalayRate)%>, <%=df.format(YangonRate)%>, <%=df.format(AyeyarwadyRate)%>, <%=df.format(TanintharyiRate)%>];
const barColors = [
  "#ff0000",
  "#00ffff",
  "#0000ff",
  "#00008b",
  "#add8e6",
  "#800080",
  "#ffff00",
  "#00ff00",
  "#808080",
  "#ffa500",
  "#a52a2a",
  "#800000",
  "#008000",
  "#7777d4"
];

new Chart("myChart", {
  type: "pie",
  data: {
    labels: xValues,
    datasets: [{
      backgroundColor: barColors,
      data: yValues
    }]
  },
  options: {
    title: {
      display: true,
      text: "Crime Rates of States and Divisions in Percentage(%)"
    }
  }
});
</script>
    	<%
	   	ArrayList<Report> list=new ArrayList<Report>();
	   	list=dao.ViewCrimes();
	   	int i=1;
	 	%>
        <table class="display" id="tableID">
        <thead>
            <tr>
                <th>No.</th>
                <th>RegionName</th>
                <th>Crime Type</th>
                <th>Reported Times</th>
            </tr>
            </thead>
            <tbody>
            <%for(Report r:list){ %>
			 <tr>
			 <td><%=i++ %></td>
			 <td><%=r.getRegion() %></td>
			 <td><%=r.getCrimeType() %></td>
			 <td><%=r.getDatafile() %></td>
			 </tr>
			 <%} %>
            </tbody>
        </table>
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