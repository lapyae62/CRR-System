<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


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

  <title>Polices</title>

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

  <!-- fonts style -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700|Poppins:400,600,700&display=swap" rel="stylesheet" />

  <!-- Custom styles for this template -->
  <link href="css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="css/responsive.css" rel="stylesheet" />
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
                <li class="nav-item">
                  <a class="nav-link" href="crimeRate.jsp"> Crime Rates </a>
                </li>
                <li class="nav-item active">
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

  <!-- Login and Sign-Up form -->

  <div class="cont" style="width:43%">
    <div class="form sign-in">
      <form action="CheckUser.jsp" method="get">
        <h2>Welcome</h2>
        <span>
            	<%
            	String failMessage = (String)request.getAttribute("failMessage");
		  		if(failMessage != null){
		  			out.println("<p style='color:red;'>" + failMessage + "</p>");
		  		}
            	%>
            </span>
        <label>
            <span>Name</span>
            <input type="text" name="username" required/>
        </label>
        <label>
            <span>Password</span>
            <input type="password" name="password" maxlength="16" required />
        </label>
        <p class="forgot-pass">Forgot password?</p>
        <button type="submit" class="submit">Sign In</button>
      </form>
    </div>
    
</div>
<script>
    document.querySelector('.img__btn').addEventListener('click', function() {
        document.querySelector('.cont').classList.toggle('s--signup');
    });
</script>

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

  <script src="js/jquery-3.4.1.min.js"></script>
  <script src="js/bootstrap.js"></script>
  <script src="js/custom.js"></script>
</body>

</html>