<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*" %>
<%@page import="java.time.format.DateTimeFormatter" %>
<%@page import="java.time.LocalDateTime" %>
<!DOCTYPE html>
<html>

<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">

  <title>Contact</title>
	
  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

  <!-- fonts style -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700|Poppins:400,600,700&display=swap" rel="stylesheet" />

  <!-- Custom styles for this template -->
  <link href="css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="css/responsive.css" rel="stylesheet" />
  <style>
  	
  </style>
</head>

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
            <img src="images/logo.png" class="logo">
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
                <li class="nav-item ">
                  <a class="nav-link" href="crimeRate.jsp">Crime Rates</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="guard.jsp"> Polices </a>
                </li>
                <li class="nav-item active">
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

  <!-- contact section -->

  <section class="contact_section layout_padding">
    <div class="contact_bg_box">
      <div class="img-box">
        <img src="images/contact-bg.jpg" alt="">
      </div>
    </div>
    <div class="container">
      <div class="heading_container heading_center">
        <h2>
          FILL THE FORM TO REPORT
        </h2>
      </div>
      <div class="">
        <div class="row">
          <div class="col-md-7 mx-auto">
          
            <form style="margin-left:100px;" action="SubmitReport" method="post" enctype="multipart/form-data">
              <div class="contact_form-container">
                <div>
                  
                  <div>
                  	<span>Please Select a Region</span><br>
                    <select name="Region" style="width:200px; height:35px; padding-left:10px; border-radius:10px;" required >
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
                    </select>
                  </div>
                  <div>
                  	<span>Please Select a Crime Type</span><br>
                    <select name="CrimeType" style="height:35px; width:200px; padding-left:10px; border-radius:10px;" required>
                    	<option value="Child Abuse">Child Abuse</option>
                    	<option value="Cybercrime">Cybercrime</option>
                    	<option value="Domestic Violence">Domestic Violence</option>
                    	<option value="Elder Abuse">Elder Abuse</option>
                    	<option value="Environmental Crime">Environmental Crime</option>
                    	<option value="Homicide" selected>Homicide</option>
                    	<option value="Human Trafficking">Human Trafficking</option>
                    	<option value="Identity Theft">Identity Theft</option>
                    	<option value="Robbery">Robbery</option>
                    	<option value="Sex Offenses">Sex Offenses</option>
                    </select>
                  </div>
                  <br>
                    <textarea required name="description" rows="4" cols="50" style="border-radius:10px; padding:10px 5px 5px 10px;" placeholder="Describe about the incident in here!(max-900 characters)"></textarea>
                  
                  
                    <input type="file" name="Evidence" style="
                    background-color:none;
                    width:430px; 
                    height:50px;
                    padding:10px 10px 10px 10px;
                    border-radius:10px;
                    "  multiple required/>
                  
                
                  <div class="btn-box ">
                  <input type="hidden" value="<%=new Date()%>" name="Date">
                    <button type="submit" style="margin-left:110px;">
                      Report!
                    </button>
                  </div>
                  
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- end contact section -->

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
      &copy; <span id="currentYear"></span> All Rights Reserved. Designed by
      <a href="https://html.design/">CRR Project Team</a>
    </p>
  </footer>
  
  <!-- footer section -->

  <script src="js/jquery-3.4.1.min.js"></script>
  <script src="js/bootstrap.js"></script>
  <script src="js/custom.js"></script>
</body>

</html>