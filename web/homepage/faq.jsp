<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Mi2 - Frequently Asked Questions</title>
    <!-- Favicon -->
    <link rel="icon" type="image/png" href="common/images/favicon.png" />
    <!-- Font Awesome -->
    <link href="assets/css/font-awesome.css" rel="stylesheet">
    <!-- Bootstrap -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!-- Slick slider -->
    <link rel="stylesheet" type="text/css" href="assets/css/slick.css"/>
    <!-- Animate css -->
    <link rel="stylesheet" type="text/css" href="assets/css/animate.css"/>
    <!-- Progress bar  -->
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap-progressbar-3.3.4.css"/>
    <!-- Theme color -->
    <link id="switcher" href="assets/css/theme-color/fountain-blue-theme.css" rel="stylesheet">

    <!-- Main Style -->
    <link href="style.css" rel="stylesheet">

    <!-- Fonts -->

    <!-- Open Sans for body font -->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
    <!-- Lato for Title -->
    <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<!-- BEGAIN PRELOADER -->
<div id="preloader">
    <div id="status">&nbsp;</div>
</div>
<!-- END PRELOADER -->

<!-- SCROLL TOP BUTTON -->
<a class="scrollToTop" href="#"><i class="fa fa-angle-up"></i></a>
<!-- END SCROLL TOP BUTTON -->

<!-- Start header -->
<header id="header">
    <marquee behavior="scroll" direction="left">Announcements to be placed here</marquee>
    <!-- header bottom -->
    <div class="header-bottom">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-6">
                    <div class="header-contact">
                        <ul>
                            <li>
                                <div class="phone">
                                    <i class="fa fa-phone"></i>
                                    +65 6550 1548
                                </div>
                            </li>
                            <li>
                                <div class="mail">
                                    <i class="fa fa-envelope"></i>
                                    contactus@hospital.com
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-6">
                    <div class="header-login">
                        <a class="login modal-form" data-target="#login-form" data-toggle="modal" href="#">Login / Sign Up</a>
                        <a  class="active" class="login modal-form" href="faq.jsp">FAQ</a>
                        <a class="login modal-form" href="contact.jsp">Mail Us</a>
                    </div>

                </div>
            </div>
        </div>
    </div>
</header>
<!-- End header -->

<!-- Start login modal window -->
<div aria-hidden="false" role="dialog" tabindex="-1" id="login-form" class="modal leread-modal fade in">
    <div class="modal-dialog">
        <!-- Start login section -->
        <div id="login-content" class="modal-content">
            <div class="modal-header">
                <button aria-label="Close" data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span></button>
                <h4 class="modal-title"><i class="fa fa-unlock-alt"></i>Login</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <input type="text" placeholder="Patient ID" class="form-control">
                    </div>
                    <div class="form-group">
                        <input type="password" placeholder="Password" class="form-control">
                    </div>
                    <div class="loginbox">
                        <button class="btn signin-btn" type="submit" formaction="/medicationDashboard.jsp">SIGN IN</button>
                    </div>
                </form>
            </div>
            <div class="modal-footer footer-box">
                <a href="#">Forgot password ?</a>
                <span>No account ? <a id="signup-btn" href="#">Sign Up.</a></span>
            </div>
        </div>
        <!-- Start signup section -->
        <div id="signup-content" class="modal-content">
            <div class="modal-header">
                <button aria-label="Close" data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span></button>
                <h4 class="modal-title"><i class="fa fa-lock"></i>Sign Up</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <input placeholder="NRIC" class="form-control">
                    </div>
                    <div class="form-group">
                        <input placeholder="Patient ID" class="form-control">
                    </div>
                    <div class="form-group">
                        <input placeholder="Email" class="form-control">
                    </div>
                    <div class="form-group">
                        <input type="password" placeholder="Password" class="form-control">
                    </div>
                    <div class="signupbox">
                        <span>Already got account? <a id="login-btn" href="#">Sign In.</a></span>
                    </div>
                    <div class="loginbox">
                        <label><input type="checkbox"><span>Remember me</span><i class="fa"></i></label>
                        <button class="btn signin-btn" type="button">SIGN UP</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- End login modal window -->

<!-- BEGIN MENU -->
<section id="menu-area">
    <nav class="navbar navbar-default" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <!-- FOR MOBILE VIEW COLLAPSED BUTTON -->
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <!-- LOGO -->
                <!-- TEXT BASED LOGO -->
                <a class="navbar-brand" href="index.html">Mi² Healthcare</a>
                <!-- IMG BASED LOGO  -->
                <!--            <a class="navbar-brand" href="index.html"><img src="assets/images/logo.png" alt="logo"></a> -->
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul id="top-menu" class="nav navbar-nav navbar-right main-nav">
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href ="aboutus.jsp">About us</a></li>
                    <li><a href="doctors.jsp">Our Doctors</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Clinics<span class="fa fa-angle-down"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="aboutclinics.jsp">Our Clinics</a></li>
                            <li><a href="cliniclocations.jsp">Locations of Clinics</a></li>
                        </ul>
                    </li>
                    <li><a href="career.jsp">Career Opportunities</a></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </nav>
</section>
<!-- END MENU -->

<!-- END OF NAVBAR, HEADER AND RESOURCES-->

<!-- Start single page header -->
<section id="single-page-header">
    <div class="overlay">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <div class="single-page-header-left">
                        <h2>Frequently Asked Questions</h2>
                        <p>Search all question!</p>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <div class="single-page-header-right">
                        <ol class="breadcrumb">
                            <li><a href="#">Home</a></li>
                            <li class="active">FAQ</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End single page header -->
<!-- Start search section  -->
<section id="error">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="errror-page-area">
                    <h1 class="error-title" style="font-size: 50px;"><span class="fa fa-search"></span></h1>
                   <br />
                    <div class="title-area">
                        <h2 class="title">Have any Questions?</h2>
                        <span class="line"></span>
                        <p>Do ask if you have them!</p>

                        <form action="" class="subscrib-form">
                            <input type="text" id="searchBox" placeholder="Ask me!">
                            <button class="subscribe-btn" type="submit">Search</button>
                        </form>

                        <script type="text/javascript">


                            function CallBtnclick(e) {
                                var code = e.keyCode ? e.keyCode : e.which;
                                if (code === 13) {
                                    //event.preventDefault ? event.preventDefault() : event.returnValue = false;

                                    $('#subscribe-btn').click();
                                }
                            }
                            function RedirectToSearch() {

                                var TextVal = document.getElementById('searchBox').value;
                                if (TextVal.length > 0) {
                                    var url = "/search?q=" + TextVal
                                    location.href = url;
                                }
                            }

                        </script>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End search section  -->



<!-- Start latest news -->
<section id="latest-news">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="latest-news-content">
                    <div class="row">
                        <!-- start single latest news -->
                        <div class="col-md-4">
                            <article class="blog-news-single">
                                <div class="blog-news-img">
                                    <a href="blog-single-with-right-sidebar.html"><img src="assets/images/blog-img-1.jpg" alt="image"></a>
                                </div>
                                <div class="blog-news-title">
                                    <h2><a href="blog-single-with-right-sidebar.html">Hand, Foot and Mouth Disease</a></h2>
                                    <p>By <a class="blog-author" href="#">Daryl Tan</a> <span class="blog-date">|14 December 2016</span></p>
                                </div>
                                <div class="blog-news-details">
                                    <p>Hand, Foot and Mouth Disease sounds like it should be more common among livestock than humans, but in recent years the virus has been very prevalent in Singapore;</p>
                                    <a class="blog-more-btn" href="blog-single-with-right-sidebar.html">Read More <i class="fa fa-long-arrow-right"></i></a>
                                </div>
                            </article>
                        </div>
                        <!-- start single latest news -->
                        <div class="col-md-4">
                            <article class="blog-news-single">
                                <div class="blog-news-img">
                                    <a href="blog-single-with-right-sidebar.html"><img src="assets/images/blog-img-2.jpg" alt="image"></a>
                                </div>
                                <div class="blog-news-title">
                                    <h2><a href="blog-single-with-right-sidebar.html">Type 2 Diabetes</a></h2>
                                    <p>By <a class="blog-author" href="#">Daryl Tan</a> <span class="blog-date">|14 December 2016</span></p>
                                </div>
                                <div class="blog-news-details">
                                    <p>Diabetes is epidemic in Singapore with estimates running as high as 10% of the adult population being affected.</p>
                                    <a class="blog-more-btn" href="blog-single-with-right-sidebar.html">Read More <i class="fa fa-long-arrow-right"></i></a>
                                </div>
                            </article>
                        </div>
                        <!-- start single latest news -->
                        <div class="col-md-4">
                            <article class="blog-news-single">
                                <div class="blog-news-img">
                                    <a href="blog-single-with-right-sidebar.html"><img src="assets/images/blog-img-3.jpg" alt="image"></a>
                                </div>
                                <div class="blog-news-title">
                                    <h2><a href="blog-single-with-right-sidebar.html">Influenza (Common Flu)</a></h2>
                                    <p>By <a class="blog-author" href="#">Daryl Tan</a> <span class="blog-date">|14 December 2016</span></p>
                                </div>
                                <div class="blog-news-details">
                                    <p>As an international business hub, Singapore’s millions of annual visitors do their best to ensure that the country doesn’t get left out when flu season rolls around. </p>
                                    <a class="blog-more-btn" href="blog-single-with-right-sidebar.html">Read More <i class="fa fa-long-arrow-right"></i></a>
                                </div>
                            </article>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End latest news -->



<!-- Start footer -->
<footer id="footer">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-6">
                <div class="footer-left">
                    <p>Designed by <a href="http://www.markups.io/">Nanyang Polytechnic <i class="fa fa-copyright"></i>2016</a></p>
                </div>
            </div>
            <div class="col-md-6 col-sm-6">
                <div class="footer-right">
                    <a href="http://www.facebook.com/"><i class="fa fa-facebook"></i></a>
                    <a href="http://www.twitter.com/"><i class="fa fa-twitter"></i></a>
                    <a href="http://www.instagram.com/"><i class="fa fa-instagram"></i></a>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- End footer -->

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<!-- Bootstrap -->
<script src="assets/js/bootstrap.js"></script>
<!-- Slick Slider -->
<script type="text/javascript" src="assets/js/slick.js"></script>
<!-- counter -->
<script src="assets/js/waypoints.js"></script>
<script src="assets/js/jquery.counterup.js"></script>
<!-- Wow animation -->
<script type="text/javascript" src="assets/js/wow.js"></script>
<!-- progress bar   -->
<script type="text/javascript" src="assets/js/bootstrap-progressbar.js"></script>


<!-- Custom js -->
<script type="text/javascript" src="assets/js/custom.js"></script>

</body>
</html>