<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Controller.DAO" %>
    <%@page import="Model.Report" %>
    <%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
<!-- Data-table plug-in CSS file -->
    <link rel="stylesheet" href="./css/jquery.dataTables.min.css" /> 
  
    <!-- jQuery library file -->
    <script type="text/javascript" src="./js/jquery-3.7.1.js"> </script> 
  
    <!-- Data-table plug-in JS library file -->
    <script type="text/javascript" src="./js/jquery.dataTables.min.js"> </script>

<body>

<canvas id="myChart" style="width:100%;max-width:600px;margin-left:400px;"></canvas>
<%
  String RegionName=request.getParameter("State");
  DAO dao=new DAO();
  int ChildAbuseRate=dao.ChildAbuseRate(RegionName);
  int CyberCrimeRate=dao.CyberCrimeRate(RegionName);
  int DomesticViolenceRate=dao.DomesticViolenceRate(RegionName);
  int ElderAbuseRate=dao.ElderAbuseRate(RegionName);
  int EnvironmentalCrimeRate=dao.EnvironmentalCrimeRate(RegionName);
  int RobberyRate=dao.RobberyRate(RegionName);
  int HomicideRate=dao.HomicideRate(RegionName);
  int SexOffencesRate=dao.SexOffencesRate(RegionName);
  int HumanTraffickingRate=dao.HumanTraffickingRate(RegionName);
  int IdentityTheftRate=dao.IdentityTheftRate(RegionName);
  
%>
<script>
const xValues = ["Child Abuse", "Cybercrime", "Domestic Violence", "Elder Abuse", "Environmental Crime", "Homicide", "Human Trafficking", "Identity Theft", "Robbery", "Sex Offenses"];
const yValues = [<%=ChildAbuseRate%>, <%=CyberCrimeRate%>, <%=DomesticViolenceRate%>, <%=ElderAbuseRate%>, <%=EnvironmentalCrimeRate%>, <%=HomicideRate%>, <%=HumanTraffickingRate%>, <%=IdentityTheftRate%>, <%=RobberyRate%>, <%=SexOffencesRate%>];
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
  "#ffa500"
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
      text: "Crime Rates According to Crime Type in Percentage(%)"
    }
  }
});
</script>
<div class="body">
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
<script> 
  /* Initialization of datatable */ 
  $(document).ready(function() { 
  $('#tableID').DataTable({ }); 
  }); 
</script>
</body>
</html>
