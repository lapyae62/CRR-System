<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Controller.DAO" %>
    <%@page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>
<head>
	<!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
  <title>Crime Record & Report</title>
  <style>
  	.all{
  		display:flex;
  		justify-content: space-around;
  		height:700px;
  	}
  	.all .circle{
  		margin-top:30px;
  	}
  	.all .circle p{
  		margin-top:50px;
  	}
  	.all .data{
  		margin-top:30px;
  	}
  	.all .data table{
  		border:3px solid black;
  		background-color:#F5F5F5;
  	}
  	th,td{
  		padding:7px 7px 7px 7px;
  	}
  	th{
  		background-color:grey;
  		border:3px solid white;
  		text-align:center;
  	}
  	td{
  	 	border:3px solid white;
  	 	text-align:center;
  	}
  	
  	
  </style>

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

  <!-- fonts style -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700|Poppins:400,600,700&display=swap" rel="stylesheet" />

  <!-- Custom styles for this template -->
  <link href="css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="css/responsive.css" rel="stylesheet" />
</head>
<body>
<header>
	<body class="sub_page">
  <div class="hero_area">
    <!-- header section strats -->
    <div class="hero_bg_box">
      <div class="img-box">
        <img src="images/hero-bg.jpg" alt="">
      </div>
    </div>

    <header class="header_section">
      
      <div class="header_bottom">
        <div class="container-fluid">
          <nav class="navbar navbar-expand-lg custom_nav-container">
            <a class="navbar-brand" href="index.html">
              <span>
                Crime Record & Report
              </span>
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class=""></span>
            </button>

            <div class="collapse navbar-collapse ml-auto" id="navbarSupportedContent">
              <ul class="navbar-nav  ">
                <li class="nav-item ">
                  <a class="nav-link" href="Home.jsp">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="about.jsp"> About</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="service.jsp"> Services </a>
                </li>
                <li class="nav-item active">
                  <a class="nav-link" href="crimeRate.jsp"> Crime Rates </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="guard.jsp"> Polices </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="contact.jsp">Report</a>
                </li>
              </ul>
            </div>
          </nav>
        </div>
      </div>
    </header>
    <!-- end header section -->
  </div>
    
 	<!-- circle, body -->
<div class="all">
<div class="circle">
	<canvas id="myChart" style="max-width:680px; width:680px;"></canvas>
	
	<p>We think by watching this dynamic pie chat and table,</p>
	<p>Please be safe your trip or joourney.</p>
	<p>Always be with us</p>
	<p>Have a nice day!</p>

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
const xValues = ["Kachin", "Kayah", "Kayin", "Chin", "Mon", "Rakhine", "Shan", "Sagaing", "Bago", "Magwe", "Mandalay", "Yangon", "Ayeyarwady", "Tanintharyi"];
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
</div>
<%
int KachinRate2=dao.KaChinRate();
int KaYahRate2=dao.KaYahRate();
int KaYinRate2=dao.KaYinRate();
int ChinRate2=dao.ChinRate();
int MonRate2=dao.MonRate();
int RaKhineRate2=dao.RaKhineRate();
int ShanRate2=dao.ShanRate();
int SagaingRate2=dao.SaGaingRate();
int BagoRate2=dao.BaGoRate();
int MagweRate2=dao.MaGweRate();
int MandalayRate2=dao.MandalayRate();
int YangonRate2=dao.YangonRate();
int AyeyarwadyRate2=dao.AyeyarwadyRate();
int TanintharyiRate2=dao.TanintharyiRate();
%>
<div class="data">
	<table>
		<tr>
			<th>States</th>
			<th>Recorded Crimes</th>
		</tr>
		<tr>
			<td style="color:red;">Kachin</td>
			<td style="color:red;"><%=KachinRate2 %></td>
		</tr>
		<tr>
			<td style="color:#00ffff;">Kayah</td>
			<td style="color:#00ffff;"><%=KaYahRate2 %></td>
		</tr>
		<tr>
			<td style="color:#0000ff">Kayin</td>
			<td style="color:#0000ff"><%=KaYinRate2 %></td>
		</tr>
		<tr>
			<td style="color:#00008b">Chin</td>
			<td style="color:#00008b"><%=ChinRate2 %></td>
		</tr>
		<tr>
			<td style="color:#add8e6">Mon</td>
			<td style="color:#add8e6"><%=MonRate2 %></td>
		</tr>
		<tr>
			<td style="color:#800080">Rakhine</td>
			<td style="color:#800080"><%=RaKhineRate2 %></td>
		</tr>
		<tr>
			<td style="color:#ffff00">Shan</td>
			<td style="color:#ffff00"><%=ShanRate2 %></td>
		</tr>
		<tr>
			<td style="color:#00ff00">Sagaing</td>
			<td style="color:#00ff00"><%=SagaingRate2 %></td>
		</tr>
		<tr>
			<td style="color:#808080">Bago</td>
			<td style="color:#808080"><%=BagoRate2 %></td>
		</tr>
		<tr>
			<td style="color:#ffa500">Magwe</td>
			<td style="color:#ffa500"><%=MagweRate2 %></td>
		</tr>
		<tr>
			<td style="color:#a52a2a">Mandalay</td>
			<td style="color:#a52a2a"><%=MandalayRate2 %></td>
		</tr>
		<tr>
			<td style="color:#800000">Yangon</td>
			<td style="color:#800000"><%=YangonRate2 %></td>
		</tr>
		<tr>
			<td style="color:#008000">Ayeyarwady</td>
			<td style="color:#008000"><%=AyeyarwadyRate2 %></td>
		</tr>
		<tr>
			<td style="color:#7777d4">Tanintharyi</td>
			<td style="color:#7777d4"><%=TanintharyiRate2 %></td>
		</tr>
		
	</table>
</div>
</div>

  <!-- info section -->
  <section class="info_section ">
    <div class="container">
      <div class="row">
        <div class="col-md-3">
          <div class="info_logo">
            <a class="navbar-brand" href="index.html">
              <span>
                Guarder
              </span>
            </a>
            <p>
              Maybe you can enlist and We can make the world a little bit better, Mr.Policeman!
            </p>
          </div>
        </div>
        <div class="col-md-3">
          <div class="info_links">
            <h5>
              Useful Link
            </h5>
            <ul>
              <li>
                <a href="https://ocindex.net/country/myanmar">
                  The Organized Crime Index
                </a>
              </li>
              <li>
                <a href="https://www.gnlm.com.mm/category/local-news/crime-news/">
                  Global New Light Of Myanmar
                </a>
              </li>
              <li>
                <a href="https://www.irrawaddy.com/news/burma/crime-wave-in-myanmars-major-cities-sparked-by-juntas-coup.html">
                  The Irrawaddy
                </a>
              </li>
              <li>
                <a href="https://myanmar-now.org/en/news/cyber-scams-flourish-in-myanmar-under-watch-of-local-authorities-report-says/">
                  Myanmar Now
                </a>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-md-3">
          <div class="info_info">
            <h5>
              Contact Us
            </h5>
          </div>
          <div class="info_contact">
            <a href="" class="">
              <i class="fa fa-map-marker" aria-hidden="true"></i>
              <span>
                CRRMainTeam,
              </span>
            </a>
            <a href="" class="">
              <i class="fa fa-phone" aria-hidden="true"></i>
              <span>
                Call : +95 9752406601
              </span>
            </a>
            <a href="" class="">
              <i class="fa fa-envelope" aria-hidden="true"></i>
              <span>
                demo@gmail.com
              </span>
            </a>
          </div>
        </div>
        <div class="col-md-3">
          <div class="info_form ">
            <h5>
              Newsletter
            </h5>
            <form action="#">
              <input type="email" placeholder="Enter your email">
              <button>
                Subscribe
              </button>
            </form>
            <div class="social_box">
              <a href="">
                <i class="fa fa-facebook" aria-hidden="true"></i>
              </a>
              <a href="">
                <i class="fa fa-twitter" aria-hidden="true"></i>
              </a>
              <a href="">
                <i class="fa fa-youtube" aria-hidden="true"></i>
              </a>
              <a href="">
                <i class="fa fa-instagram" aria-hidden="true"></i>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- end info_section -->




  <!-- footer section -->
  <footer class="container-fluid footer_section">
    <p>
      &copy; <span id="currentYear"></span> All Rights Reserved. Design by
      <a href="https://html.design/">CRR Project Team</a>
    </p>
  </footer>
  <!-- footer section -->
  
</body>
</html>