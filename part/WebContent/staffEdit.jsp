<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page  import="java.sql.Connection"%>
<%@ page  import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page  import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.util.Calendar" %>
<%

DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MMM-yyyy");
LocalDateTime now = LocalDateTime.now();

String  date=dtf.format(now);



String username = (String)session.getAttribute("username");		
String companyType=(String)session.getAttribute("companyType");
String companyCode=(String)session.getAttribute("companyCode");
String agentCode=(String)session.getAttribute("agentCode");
String staffName=(String)session.getAttribute("staffName");

try{
	//Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/delivery", "root", "root"); 
	Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");

%>

	<script src="assets/js/core/jquery.min.js"></script>
    <!-- Popper -->
    <script src="assets/js/core/popper.min.js"></script>
    <!-- Bootstrap -->
    <script src="assets/js/core/bootstrap.min.js"></script>
    <!-- All Plugins -->
    <script src="assets/js/core/delivery.bundle.js"></script>
    <!-- Active -->
    <script src="js/default-assets/active.js"></script>
    <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/themes/base/jquery-ui.css" rel="stylesheet" />
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/jquery-ui.min.js"></script>
   
    
<!DOCTYPE html>
<html lang="en">
<head>

	
	
	<title>Myanmar Delivery</title>
	<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />


	
	<!-- Fonts and icons -->
	<script src="assets/js/plugin/webfont/webfont.min.js"></script>
	<script>
		WebFont.load({
			google: {"families":["Lato:300,400,700,900"]},
			custom: {"families":["Flaticon", "Font Awesome 5 Solid", "Font Awesome 5 Regular", "Font Awesome 5 Brands", "simple-line-icons"], urls: ['assets/css/fonts.min.css']},
			active: function() {
				sessionStorage.fonts = true;
			}
		});
	</script>

	<!-- CSS Files -->


<style>
body {font-family: Arial, Helvetica, sans-serif;}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: absolute ; /* Stay in place */
  z-index: 1000; /* Sit on top */
  left: 100%;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  -webkit-animation-name: fadeIn; /* Fade in the background */
  -webkit-animation-duration: 0.4s;
  animation-name: fadeIn;
  animation-duration: 0.4s
}

/* Modal Content */
.modal-content {
  position: absolute; 
  bottom: 0;
  background-color: #fefefe;
  width: 100%;
  -webkit-animation-name: slideIn;
  -webkit-animation-duration: 0.4s;
  animation-name: slideIn;
  text-align: center;
  animation-duration: 0.4s
}

/* The Close Button */
.close {
  color: white;
  float: right;
  font-size: 50px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}

.modal-header {
  padding: 2px 5px;
  background-color: #5cb85c;
  color: white;
}

.modal-body {padding:2px 16px;}



/* Add Animation */
@-webkit-keyframes slideIn {
  from {bottom: -100px; opacity: 0} 
  to {bottom: 0; opacity: 1}
}

@keyframes slideIn {
  from {bottom: -100px; opacity: 0}
  to {bottom: 0; opacity: 1}
}

@-webkit-keyframes fadeIn {
  from {opacity: 0} 
  to {opacity: 1}
}

@keyframes fadeIn {
  from {opacity: 0} 
  to {opacity: 1}
}
	
	
	
	
    table{
        width: 100%;
        margin: 20px 0;
        border-collapse: collapse;
    }
    table, th, td{
        border: 1px solid #cdcdcd;
    }
    table th, table td{
        padding: 5px;
    }
     	

   
body{
background-color: #c9cfcf;
}


@charset "UTF-8";

/*span label*/

.pure-material-textfield-outlined {
    --pure-material-safari-helper1: rgb(var(--pure-material-primary-rgb, 33, 150, 243));
    position: relative;
    display:inherit;
    padding-top: 6px;
    font-family: var(--pure-material-font, "Roboto", "Segoe UI", BlinkMacSystemFont, system-ui, -apple-system);
    font-size: 16px;
    line-height: 1.5;
    overflow: hidden;
}

/* Input, Textarea */
.pure-material-textfield-outlined > input,
.pure-material-textfield-outlined > textarea {
    box-sizing: border-box;
    margin: 0;
    border: solid 1px; /* Safari */
    border-color: #d7d9db;
    border-top-color: transparent;
    border-radius: 4px;
    padding: 8px 13px 1px;
    width: 100%;
    height: 40px;
    color: rgba(var(--pure-material-onsurface-rgb, 0, 0, 0), 0.87);
    background-color: transparent;
    box-shadow: none; /* Firefox */
    font-family: inherit;
    font-size: 17px;
    line-height: inherit;
    caret-color: rgb(var(--pure-material-primary-rgb, 33, 150, 243));
    
    transition: border 0.2s, box-shadow 0.2s;
}

/* Span */
.pure-material-textfield-outlined > input + span,
.pure-material-textfield-outlined > textarea + span {
    position: absolute;
    top: 0;
    left: 0;
    display: flex;
    border-color: rgba(var(--pure-material-onsurface-rgb, 0, 0, 0), 0.6);
    width: 100%;
    max-height: 100%;
    color: rgba(var(--pure-material-onsurface-rgb, 0, 0, 0), 0.6);
    font-size: 75%;
    line-height: 15px;
    cursor: text;
    transition: color 0.2s, font-size 0.2s, line-height 0.2s;
}

/* Corners */
.pure-material-textfield-outlined > input + span::before,
.pure-material-textfield-outlined > input + span::after,
.pure-material-textfield-outlined > textarea + span::before,
.pure-material-textfield-outlined > textarea + span::after {
    content: "";
    display:flex;
    box-sizing: border-box;
    margin-top: 6px;
    border-top: solid 1px;
    border-top-color: rgba(var(--pure-material-onsurface-rgb, 0, 0, 0), 0.2);
    min-width: 10px;
    height: 8px;
    pointer-events: none;
    box-shadow: inset 0 1px transparent;
    transition: border-color 0.2s, box-shadow 0.2s;
}

.pure-material-textfield-outlined > input + span::before,
.pure-material-textfield-outlined > textarea + span::before {
    margin-right: 4px;
    border-left: solid 1px transparent;
    border-radius: 4px 0;
}

.pure-material-textfield-outlined > input + span::after,
.pure-material-textfield-outlined > textarea + span::after {
    flex-grow: 1;
    margin-left: 4px;
    border-right: solid 1px transparent;
    border-radius: 0 4px;
}

/* Hover */
.pure-material-textfield-outlined:hover > input,
.pure-material-textfield-outlined:hover > textarea {
    border-color: rgba(var(--pure-material-onsurface-rgb, 0, 0, 0), 0.87);
    border-top-color: transparent;
}

.pure-material-textfield-outlined:hover > input + span::before,
.pure-material-textfield-outlined:hover > textarea + span::before,
.pure-material-textfield-outlined:hover > input + span::after,
.pure-material-textfield-outlined:hover > textarea + span::after {
    border-top-color: rgba(var(--pure-material-onsurface-rgb, 0, 0, 0), 0.87);
}

.pure-material-textfield-outlined:hover > input:not(:focus):placeholder-shown,
.pure-material-textfield-outlined:hover > textarea:not(:focus):placeholder-shown {
    border-color: rgba(var(--pure-material-onsurface-rgb, 0, 0, 0), 0.87);
}

/* Placeholder-shown */
.pure-material-textfield-outlined > input:not(:focus):placeholder-shown,
.pure-material-textfield-outlined > textarea:not(:focus):placeholder-shown {
    border-top-color: rgba(var(--pure-material-onsurface-rgb, 0, 0, 0), 0.2);
}

.pure-material-textfield-outlined > input:not(:focus):placeholder-shown + span,
.pure-material-textfield-outlined > textarea:not(:focus):placeholder-shown + span {
    font-size: 13px;
    line-height: 48px;
}

.pure-material-textfield-outlined > input:not(:focus):placeholder-shown + span::before,
.pure-material-textfield-outlined > textarea:not(:focus):placeholder-shown + span::before,
.pure-material-textfield-outlined > input:not(:focus):placeholder-shown + span::after,
.pure-material-textfield-outlined > textarea:not(:focus):placeholder-shown + span::after {
    border-top-color: transparent;
}

/* Focus */
.pure-material-textfield-outlined > input:focus,
.pure-material-textfield-outlined > textarea:focus {
    border-color: rgb(var(--pure-material-primary-rgb, 33, 150, 243));
    border-top-color: transparent;
    box-shadow: inset 1px 0 var(--pure-material-safari-helper1), inset -1px 0 var(--pure-material-safari-helper1), inset 0 -1px var(--pure-material-safari-helper1);
    outline: none;
}

.pure-material-textfield-outlined > input:focus + span,
.pure-material-textfield-outlined > textarea:focus + span {
    color: rgb(var(--pure-material-primary-rgb, 33, 150, 243));
}

.pure-material-textfield-outlined > input:focus + span::before,
.pure-material-textfield-outlined > input:focus + span::after,
.pure-material-textfield-outlined > textarea:focus + span::before,
.pure-material-textfield-outlined > textarea:focus + span::after {
    border-top-color: var(--pure-material-safari-helper1) !important;
    box-shadow: inset 0 1px var(--pure-material-safari-helper1);
}

/* Disabled */
.pure-material-textfield-outlined > input:disabled,
.pure-material-textfield-outlined > input:disabled + span,
.pure-material-textfield-outlined > textarea:disabled,
.pure-material-textfield-outlined > textarea:disabled + span {
    border-color: rgba(var(--pure-material-onsurface-rgb, 0, 0, 0), 0.38) !important;
    border-top-color: transparent !important;
    color: rgba(var(--pure-material-onsurface-rgb, 0, 0, 0), 0.38);
    pointer-events: none;
}

.pure-material-textfield-outlined > input:disabled + span::before,
.pure-material-textfield-outlined > input:disabled + span::after,
.pure-material-textfield-outlined > textarea:disabled + span::before,
.pure-material-textfield-outlined > textarea:disabled + span::after {
    border-top-color: rgba(var(--pure-material-onsurface-rgb, 0, 0, 0), 0.38) !important;
}

.pure-material-textfield-outlined > input:disabled:placeholder-shown,
.pure-material-textfield-outlined > input:disabled:placeholder-shown + span,
.pure-material-textfield-outlined > textarea:disabled:placeholder-shown,
.pure-material-textfield-outlined > textarea:disabled:placeholder-shown + span {
    border-top-color: rgba(var(--pure-material-onsurface-rgb, 0, 0, 0), 0.38) !important;
}

.pure-material-textfield-outlined > input:disabled:placeholder-shown + span::before,
.pure-material-textfield-outlined > input:disabled:placeholder-shown + span::after,
.pure-material-textfield-outlined > textarea:disabled:placeholder-shown + span::before,
.pure-material-textfield-outlined > textarea:disabled:placeholder-shown + span::after {
    border-top-color: transparent !important;
}

/* Faster transition in Safari for less noticable fractional font-size issue */
@media not all and (min-resolution:.001dpcm) {
    @supports (-webkit-appearance:none) {
        .pure-material-textfield-outlined > input,
        .pure-material-textfield-outlined > input + span,
        .pure-material-textfield-outlined > textarea,
        .pure-material-textfield-outlined > textarea + span,
        .pure-material-textfield-outlined > input + span::before,
        .pure-material-textfield-outlined > input + span::after,
        .pure-material-textfield-outlined > textarea + span::before,
        .pure-material-textfield-outlined > textarea + span::after {
            transition-duration: 0.1s;
        }
    }
}






.pure-material-textfield-outlined {
    --pure-material-safari-helper1: rgb(var(--pure-material-primary-rgb, 33, 150, 243));
    position: relative;
    display: inherit;
    padding-top: 6px;
    font-family: var(--pure-material-font, "Roboto", "Segoe UI", BlinkMacSystemFont, system-ui, -apple-system);
    font-size: 16px;
    line-height: 1.5;
    overflow: hidden;
}

/* Input, Textarea */

.pure-material-textfield-outlined > select,
.pure-material-textfield-outlined > textarea {
    box-sizing: border-box;
    margin: 0;
    border: solid 1px; /* Safari */
    border-color: #d7d9db;
    border-top-color: transparent;
    border-radius: 4px;
    padding: 1px 125px 1px 8px;
    width: 100%;
    height: 40px;
    color: rgba(var(--pure-material-onsurface-rgb, 0, 0, 0), 0.87);
    background-color: transparent;
    box-shadow: none; /* Firefox */
    font-family: inherit;
    font-size: 17px;
    line-height: inherit;
    caret-color: rgb(var(--pure-material-primary-rgb, 33, 150, 243));
    
    transition: border 0.2s, box-shadow 0.2s;
}

/* Span */

.pure-material-textfield-outlined > select + span,
.pure-material-textfield-outlined > textarea + span {
     position: absolute;
    top: 0;
    left: 0;
    display: flex;
    border-color: rgba(var(--pure-material-onsurface-rgb, 0, 0, 0), 0.6);
    width: 100%;
    max-height: 100%;
    color: rgba(var(--pure-material-onsurface-rgb, 0, 0, 0), 0.6);
    font-size: 75%;
    line-height: 15px;
    cursor: text;
    transition: color 0.2s, font-size 0.2s, line-height 0.2s;
}

/* Corners */


.pure-material-textfield-outlined > select + span::before,
.pure-material-textfield-outlined > select + span::after,
.pure-material-textfield-outlined > textarea + span::before,
.pure-material-textfield-outlined > textarea + span::after {
    content: "";
    display:flex;
    box-sizing: border-box;
    margin-top: 6px;
    border-top: solid 1px;
    border-top-color: rgba(var(--pure-material-onsurface-rgb, 0, 0, 0), 0.2);
    min-width: 10px;
    height: 8px;
    pointer-events: none;
    box-shadow: inset 0 1px transparent;
    transition: border-color 0.2s, box-shadow 0.2s;
}


.pure-material-textfield-outlined > select + span::before,
.pure-material-textfield-outlined > textarea + span::before {
    margin-right: 4px;
    border-left: solid 1px transparent;
    border-radius: 4px 0;
}


.pure-material-textfield-outlined > select + span::after,
.pure-material-textfield-outlined > textarea + span::after {
     flex-grow: 1;
    margin-left: 4px;
    border-right: solid 1px transparent;
    border-radius: 0 4px;
}
/* Hover */

.pure-material-textfield-outlined:hover > select,
.pure-material-textfield-outlined:hover > textarea {
     border-color: rgba(var(--pure-material-onsurface-rgb, 0, 0, 0), 0.87);
    border-top-color: transparent;
}


.pure-material-textfield-outlined:hover > select + span::before,
.pure-material-textfield-outlined:hover > textarea + span::before,

.pure-material-textfield-outlined:hover > select + span::after,
.pure-material-textfield-outlined:hover > textarea + span::after {
    border-top-color: rgba(var(--pure-material-onsurface-rgb, 0, 0, 0), 0.87);
}


.pure-material-textfield-outlined:hover > select:not(:focus):placeholder-shown,
.pure-material-textfield-outlined:hover > textarea:not(:focus):placeholder-shown {
    border-color: rgba(var(--pure-material-onsurface-rgb, 0, 0, 0), 0.87);
}

/* Placeholder-shown */

.pure-material-textfield-outlined > select:not(:focus):placeholder-shown,
.pure-material-textfield-outlined > textarea:not(:focus):placeholder-shown {
   border-top-color: rgba(var(--pure-material-onsurface-rgb, 0, 0, 0), 0.2);
}


.pure-material-textfield-outlined > select:not(:focus):placeholder-shown + span,
.pure-material-textfield-outlined > textarea:not(:focus):placeholder-shown + span {
    font-size: 13px;
    line-height: 48px;
}


.pure-material-textfield-outlined > select:not(:focus):placeholder-shown + span::before,
.pure-material-textfield-outlined > textarea:not(:focus):placeholder-shown + span::before,

.pure-material-textfield-outlined > select:not(:focus):placeholder-shown + span::after,
.pure-material-textfield-outlined > textarea:not(:focus):placeholder-shown + span::after {
    border-top-color: transparent;
}

/* Focus */

.pure-material-textfield-outlined > select:focus,
.pure-material-textfield-outlined > textarea:focus {
      border-color: rgb(var(--pure-material-primary-rgb, 33, 150, 243));
    border-top-color: transparent;
    box-shadow: inset 1px 0 var(--pure-material-safari-helper1), inset -1px 0 var(--pure-material-safari-helper1), inset 0 -1px var(--pure-material-safari-helper1);
    outline: none;
}


.pure-material-textfield-outlined > select:focus + span,
.pure-material-textfield-outlined > textarea:focus + span {
    color: rgb(var(--pure-material-primary-rgb, 33, 150, 243));
}


.pure-material-textfield-outlined > select:focus + span::before,
.pure-material-textfield-outlined > select:focus + span::after,
.pure-material-textfield-outlined > textarea:focus + span::before,
.pure-material-textfield-outlined > textarea:focus + span::after {
  border-top-color: var(--pure-material-safari-helper1) !important;
    box-shadow: inset 0 1px var(--pure-material-safari-helper1);
}

/* Disabled */

.pure-material-textfield-outlined > select:disabled,
.pure-material-textfield-outlined > select:disabled + span,
.pure-material-textfield-outlined > textarea:disabled,
.pure-material-textfield-outlined > textarea:disabled + span {
    border-color: rgba(var(--pure-material-onsurface-rgb, 0, 0, 0), 0.38) !important;
    border-top-color: transparent !important;
    color: rgba(var(--pure-material-onsurface-rgb, 0, 0, 0), 0.38);
    pointer-events: none;
}


.pure-material-textfield-outlined > select:disabled + span::before,
.pure-material-textfield-outlined > select:disabled + span::after,
.pure-material-textfield-outlined > textarea:disabled + span::before,
.pure-material-textfield-outlined > textarea:disabled + span::after {
    border-top-color: rgba(var(--pure-material-onsurface-rgb, 0, 0, 0), 0.38) !important;
}

.pure-material-textfield-outlined > select:disabled:placeholder-shown,
.pure-material-textfield-outlined > select:disabled:placeholder-shown + span,
.pure-material-textfield-outlined > textarea:disabled:placeholder-shown,
.pure-material-textfield-outlined > textarea:disabled:placeholder-shown + span {
    border-top-color: rgba(var(--pure-material-onsurface-rgb, 0, 0, 0), 0.38) !important;
}


.pure-material-textfield-outlined > textarea:disabled:placeholder-shown + span::before,
.pure-material-textfield-outlined > textarea:disabled:placeholder-shown + span::after {
    border-top-color: transparent !important;
}

/* Faster transition in Safari for less noticable fractional font-size issue */
@media not all and (min-resolution:.001dpcm) {
    @supports (-webkit-appearance:none) {
      
        .pure-material-textfield-outlined > textarea,
        .pure-material-textfield-outlined > textarea + span,
        .pure-material-textfield-outlined > textarea + span::before,
        .pure-material-textfield-outlined > textarea + span::after {
            transition-duration: 0.1s;
        }
    }
}


    

</style>
	
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/atlantis.min.css">
	<!-- CSS Just for demo purpose, don't include it in your project -->
	<link rel="stylesheet" href="assets/css/demo.css">
</head>



<body>





	<div class="wrapper">
		<div class="main-header">
			<!-- Logo Header -->
			<div class="logo-header" data-background-color="blue">
				
				<a href="../index.html" class="logo">
				<h2></h2><p></p>
					<h2 class="text-white pb-2 fw-bold">Delivery System</h2>
				</a>
				<button class="navbar-toggler sidenav-toggler ml-auto" type="button" data-toggle="collapse" data-target="collapse" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon">
						<i class="icon-menu"></i>
					</span>
				</button>
				<button class="topbar-toggler more"><i class="icon-options-vertical"></i></button>
				<div class="nav-toggle">
					<button class="btn btn-toggle toggle-sidebar">
						<i class="icon-menu"></i>
					</button>
				</div>
			</div>
			<!-- End Logo Header -->

			<!-- Navbar Header -->
			<nav class="navbar navbar-header navbar-expand-lg" data-background-color="blue2">
				
				<div class="container-fluid">
					
					<ul class="navbar-nav topbar-nav ml-md-auto align-items-center">
						
						<li class="nav-item dropdown hidden-caret">
							<a class="nav-link dropdown-toggle" href="#" id="messageDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<i class="fa fa-envelope"></i>
							</a>
							<ul class="dropdown-menu messages-notif-box animated fadeIn" aria-labelledby="messageDropdown">
								<li>
									<div class="dropdown-title d-flex justify-content-between align-items-center">
										Messages 									
										<a href="#" class="small">Mark all as read</a>
									</div>
								</li>
								<li>
									<div class="message-notif-scroll scrollbar-outer">
										<div class="notif-center">
											<a href="#">
												<div class="notif-img"> 
													<img src="assets/img/jm_denis.jpg" alt="Img Profile">
												</div>
												<div class="notif-content">
													<span class="subject">Jimmy Denis</span>
													<span class="block">
														How are you ?
													</span>
													<span class="time">5 minutes ago</span> 
												</div>
											</a>
											<a href="#">
												<div class="notif-img"> 
													<img src="assets/img/chadengle.jpg" alt="Img Profile">
												</div>
												<div class="notif-content">
													<span class="subject">Chad</span>
													<span class="block">
														Ok, Thanks !
													</span>
													<span class="time">12 minutes ago</span> 
												</div>
											</a>
											<a href="#">
												<div class="notif-img"> 
													<img src="assets/img/mlane.jpg" alt="Img Profile">
												</div>
												<div class="notif-content">
													<span class="subject">Jhon Doe</span>
													<span class="block">
														Ready for the meeting today...
													</span>
													<span class="time">12 minutes ago</span> 
												</div>
											</a>
											<a href="#">
												<div class="notif-img"> 
													<img src="assets/img/talha.jpg" alt="Img Profile">
												</div>
												<div class="notif-content">
													<span class="subject">Talha</span>
													<span class="block">
														Hi, Apa Kabar ?
													</span>
													<span class="time">17 minutes ago</span> 
												</div>
											</a>
										</div>
									</div>
								</li>
								<li>
									<a class="see-all" href="javascript:void(0);">See all messages<i class="fa fa-angle-right"></i> </a>
								</li>
							</ul>
						</li>
						<li class="nav-item dropdown hidden-caret">
							<a class="nav-link dropdown-toggle" href="#" id="notifDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<i class="fa fa-bell"></i>
								<span class="notification">4</span>
							</a>
							<ul class="dropdown-menu notif-box animated fadeIn" aria-labelledby="notifDropdown">
								<li>
									<div class="dropdown-title">You have 4 new notification</div>
								</li>
								<li>
									<div class="notif-center">
										<a href="#">
											<div class="notif-icon notif-primary"> <i class="fa fa-user-plus"></i> </div>
											<div class="notif-content">
												<span class="block">
													New user registered
												</span>
												<span class="time">5 minutes ago</span> 
											</div>
										</a>
										<a href="#">
											<div class="notif-icon notif-success"> <i class="fa fa-comment"></i> </div>
											<div class="notif-content">
												<span class="block">
													Rahmad commented on Admin
												</span>
												<span class="time">12 minutes ago</span> 
											</div>
										</a>
										<a href="#">
											<div class="notif-img"> 
												<img src="assets/img/profile2.jpg" alt="Img Profile">
											</div>
											<div class="notif-content">
												<span class="block">
													Reza send messages to you
												</span>
												<span class="time">12 minutes ago</span> 
											</div>
										</a>
										<a href="#">
											<div class="notif-icon notif-danger"> <i class="fa fa-heart"></i> </div>
											<div class="notif-content">
												<span class="block">
													Farrah liked Admin
												</span>
												<span class="time">17 minutes ago</span> 
											</div>
										</a>
									</div>
								</li>
								<li>
									<a class="see-all" href="javascript:void(0);">See all notifications<i class="fa fa-angle-right"></i> </a>
								</li>
							</ul>
						</li>
						
						<li class="nav-item dropdown hidden-caret">
							<a class="dropdown-toggle profile-pic" data-toggle="dropdown" href="#" aria-expanded="false">
								<div class="avatar-sm">
									<img src="assets/img/profile.jpg" alt="..." class="avatar-img rounded-circle">
								</div>
							</a>
							<ul class="dropdown-menu dropdown-user animated fadeIn">
								<div class="dropdown-user-scroll scrollbar-outer">
									<li>
										<div class="user-box">
											<div class="avatar-lg"><img src="assets/img/profile.jpg" alt="image profile" class="avatar-img rounded"></div>
											<div class="u-text">
												<h4><%=username %></h4>
												</p><a href="#" class="btn btn-xs btn-secondary btn-sm">View Profile</a>
											</div>
										</div>
									</li>
									<li>
										<div class="dropdown-divider"></div>
										<a class="dropdown-item" href="#">My Profile</a>
										<a class="dropdown-item" href="#">Inbox</a>
										<div class="dropdown-divider"></div>
										<a class="dropdown-item" href="#">Account Setting</a>
										<div class="dropdown-divider"></div>
										<a class="dropdown-item" href="kill_session">Logout</a>
									</li>
								</div>
							</ul>
						</li>
					</ul>
				</div>
			</nav>
			<!-- End Navbar -->
		</div>


<!-- Sidebar -->
		<div class="sidebar sidebar-style-2">
			<div class="sidebar-wrapper scrollbar scrollbar-inner">
				<div class="sidebar-content">
					<div class="user">
						<div class="avatar-sm float-left mr-2">
							<img src="assets/img/profile.jpg" alt="..." class="avatar-img rounded-circle">
						</div>
						<div class="info">
							<a data-toggle="collapse" href="#collapseExample" aria-expanded="true">
								<span>
															

								
									<%=staffName %>
									<span class="user-level">Administrator</span>
									<span class="caret"></span>
								</span>
							</a>
							<div class="clearfix"></div>

							<div class="collapse in" id="collapseExample">
								<ul class="nav">
									<li>
										<a href="#profile">
											<span class="link-collapse">My Profile</span>
										</a>
									</li>
									<li>
										<a href="#edit">
											<span class="link-collapse">Inbox</span>
										</a>
									</li>
									<li>
										<a href="#settings">
											<span class="link-collapse">Settings</span>
										</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<ul class="nav nav-primary">
					<li class="nav-item">
							<a   data-toggle="collapse"   href="home.html" >
							<i class="fas fa-home"></i>
								<p>Dashboard</p>
							</a>
						</li>
						
						<li class="nav-section">
							<span class="sidebar-mini-icon">
								<i class="fa fa-ellipsis-h"></i>
							</span>
							<h4 class="text-section">Components</h4>
						</li>
						
						<li class="nav-item active">
							
							
							<a href="adminHome.jsp" >
							<i class="fas fa-home"></i>
								<p>Registration Lists</p>
							</a>
						</li>
						
<%	if(companyType.equalsIgnoreCase("main"))	
		{
%>
						
                      <li class="nav-item active">
							<a data-toggle="collapse" href="#com">
								<i class=" 	far fa-building"></i>
								<p>Company</p>
								<span class="caret"></span>
							</a>

							<div class="collapse" id="com">
								<ul class="nav nav-collapse">
									<li>
										<a href="companyList.jsp"><!-- companyList.jsp -->
											<span class="sub-item">Company List</span>
										</a>
									</li>
                                      
										 
                                   <li>
										<a href="companyAdd.jsp"><!-- companyAdd.jsp -->
											<span class="sub-item">Add new Company</span>
										</a>
									</li>
									
									
								</ul>
							</div>

						</li>
<%} %>

						<li class="nav-item active">
							<a data-toggle="collapse" href="#base">
								<i class="fas fa-user"></i>
								<p>Agent</p>
								<span class="caret"></span>
							</a>
							<div class="collapse" id="base">
								<ul class="nav nav-collapse">
									<li>
										<a href="agentList.jsp"><!-- agentList.jsp -->
											<span class="sub-item">Agent Lists</span>
										</a>
									</li>
									               
									<li>
										<a href="addAgent.jsp"><!-- addAgent.jsp -->
											<span class="sub-item">Add Agent</span>
										</a>
									</li>
									
								</ul>
							</div>
						</li>
                            
                            
                           <li class="nav-item active">
							<a data-toggle="collapse" href="#staff">
								<i class=" 	fas fa-user-tie"></i>
								<p>Staff</p>
								<span class="caret"></span>
							</a>
							<div class="collapse" id="staff">
								<ul class="nav nav-collapse">
									<li>
										<a href="staffList.jsp">
											<span class="sub-item">Staff Lists</span>
										</a>
									</li>
									                                                 
									<li>
										<a href="staffAdd.jsp">
											<span class="sub-item">Add new staff</span>
										</a>
									</li>									
								</ul>
							</div>
						</li>

                              <li class="nav-item active">
							<a data-toggle="collapse" href="#charges">
								<i class="fas fa-users-cog"></i>
								<p>Charges</p>
								<span class="caret"></span>
							</a>
							<div class="collapse" id="charges">
								<ul class="nav nav-collapse">
									<li>
										<a href="add_weight.jsp">
											<span class="sub-item">Weight Charges</span>
										</a>
									</li>
									 <%	if(companyType.equalsIgnoreCase("main"))
{%>                                                                                              <li>
										<a href="currency.jsp"><!-- companyAdd.jsp -->
											<span class="sub-item">Currency</span>
										</a>
									</li><%} else{ %>
									                                                        <li hidden>
										<a href="currency.jsp" hidden><!-- companyAdd.jsp -->
											<span hidden class="sub-item">Currency</span>
										</a>
									</li><%} %>
									<li>
										<a href="state_division.jsp">
											<span class="sub-item">State & Division</span>
										</a>
									</li>
								</ul>
							</div>
						</li>  
						<li class="nav-item active">
							<a data-toggle="collapse" href="#location">
								<i class=" 	fas fa-location-arrow"></i>
								<p>Poster</p>
								<span class="caret"></span>
							</a>
							<div class="collapse" id="location">
								<ul class="nav nav-collapse">
									<li>
										<a href="locationList.jsp">
											<span class="sub-item">Location Lists</span>
										</a>
									</li>
									  <%if(companyType.equalsIgnoreCase("main"))
{%>                                                                                  
									<li>
										<a href="state_division.jsp">
											<span class="sub-item">Add new Location</span>
										</a>
									</li>
									<%}else { %>
										<li hidden>
										<a hidden href="state_division.jsp">
											<span hidden class="sub-item">Add new Location</span>
										</a>
									</li><%} %>
								</ul>
							</div>
						</li>
						
						
<%	if(companyType.equalsIgnoreCase("main"))	
		{
%>						
						<li class="nav-item active">
							<a data-toggle="collapse" href="#waybill">
								<i class="fa fa-usd" aria-hidden="true"></i>
								<p>Waybill Type</p>
								<span class="caret"></span>
							</a>
							<div class="collapse" id="waybill">
								<ul class="nav nav-collapse">
									<li>
										<a href="waybillList.jsp"><!-- waybillList.jsp -->
											<span class="sub-item">WayBill Lists</span>
										</a>
									</li>
									                                               
									<li>
										<a href="waybillAdd.jsp"><!-- waybillAdd.jsp -->
											<span class="sub-item">Add Waybill Type</span>
										</a>
									</li>
								</ul>
							</div>
						</li>
						
<%} %>	

<%	if(companyType.equalsIgnoreCase("main"))	
		{
%>						
							
						<li class="nav-item active">
							<a data-toggle="collapse" href="#rcvd">
								<i class=" 	fas fa-user-tie"></i>
								<p>Receive Mode</p>
								<span class="caret"></span>
							</a>
							<div class="collapse" id="rcvd">
								<ul class="nav nav-collapse">
									<li>
										<a href="rcvdList.jsp">
											<span class="sub-item">Receive Mode List</span>
										</a>
									</li>
									                                                                            
									<li>
										<a href="rcvdAdd.jsp">
											<span class="sub-item">Add  Receive Mode</span>
										</a>
									</li>
									
										
									</li>
								</ul>
							</div>
						</li>
						
<%} %>						
						
					</ul>
				</div>
			</div>
		</div>
		
<!-- End Sidebar -->

				
		

<div class="main-panel">
			<div class="content">
				<div class="page-inner">
					<div class="page-header">
						<ul class="breadcrumbs">
							<li class="nav-home">
								<a href="#">
									<i class="flaticon-home"></i>
								</a>
							</li>
							<li class="separator">
								<i class="flaticon-right-arrow"></i>
							</li>
							<li class="nav-item">
								<a href="staffList.jsp">Staff Detail Lists</a>
							</li>
							<li class="separator">
								<i class="flaticon-right-arrow"></i>
							</li>
							<li class="nav-item">
								<a href="staffAdd.jsp">Add</a>
							</li>
						</ul>
					</div>
	
		
<form  action="ZZZZ" method="post" enctype="multipart/form-data" id="myForm">							
<div class="card">
<div class="card-body">
<div class="card-title">Add New Staff</div>
</div>
</div>			
	<div class="row">
		<div class="col-md-12">
		<div class="row">
		<div class="col-md-6 col-lg-12">
			<div class="card">
			<div class="card-body">										
			<div class=" row">
			<div class=" col-sm-4 form-group">
				<label class="pure-material-textfield-outlined">
				<input type="text" placeholder="" class="form-control" id="s_code" name="s_code"  value="<%=request.getParameter("staff_code") %>"   readonly>
				<span>Staff Code</span>
				</label>
 		   </div>	
	
	<div class=" col-sm-4  form-group">
				<label class="pure-material-textfield-outlined">												
				<select required class="browser-default custom-select"  name="company_code"  id="company" >
				<option  value="">--Select Company--</option>
	<%
	PreparedStatement pre_cmp=null;
	if(companyType.equalsIgnoreCase("main")) 	pre_cmp=conn.prepareStatement("select company_code,company_name from company ");
	else{
		
		pre_cmp=conn.prepareStatement("Select company_code,company_name from company where  company_code=?");
		pre_cmp.setString(1, companyCode); 
		
	}
	
	ResultSet rs_cmp=pre_cmp.executeQuery();
			
			while(rs_cmp.next()){ 
				
				if(request.getParameter("company_code").equalsIgnoreCase(rs_cmp.getString("company_code")))
				{
			
	%>
						<option selected value="<%=rs_cmp.getString("company_code") %>" ><%=rs_cmp.getString("company_name") %></option>
		
		<%}else{%>
						<option  value="<%=rs_cmp.getString("company_code") %>" ><%=rs_cmp.getString("company_name") %></option>
			
		<%}
		
				}%>
				</select>
				<span ><i style="color:red; margin-top:1px; font-size:20px;">*</i>Company</span>
				</label>
				<span id="company_error"></span>
			</div>	
			
			<div class=" col-sm-4  form-group">
				<label class="pure-material-textfield-outlined">
				<select required class="browser-default custom-select"  name="agent_code" id="agent"  >
					<option   value="">--Select  Agent--</option>
					
<%

PreparedStatement pre_agent=null;
pre_agent=conn.prepareStatement("select agent_code,agent_name from agent where company_code=?");
pre_agent.setString(1, request.getParameter("company_code")); 
ResultSet rs_agent=pre_agent.executeQuery();
while(rs_agent.next())
{
	
	if(rs_agent.getString("agent_code").equalsIgnoreCase(request.getParameter("agent_code")))
	{
		%>
		
		<option selected  value="<%=rs_agent.getString("agent_code")%>"><%= rs_agent.getString("agent_name")%></option>
		
<%	}else{%>
	
	<option   value="<%=rs_agent.getString("agent_code")%>"><%= rs_agent.getString("agent_name")%></option>
	
	
<%}
}
%>
					
				</select>
				<span  ><i style="color:red; margin-top:1px; font-size:20px;">*</i>Agent</span>
				</label>
				<span id="agent_error"></span>
		   </div>
		   	
	</div>
	<br>
	<hr style="background-color:#020ae3;">
</div>
</div>

<%

PreparedStatement pre_staff=null;
pre_staff=conn.prepareStatement("select * from staff where staff_code=? and agent_code=? and company_code=?");
pre_staff.setString(1, request.getParameter("staff_code")); 
pre_staff.setString(2, request.getParameter("agent_code"));
pre_staff.setString(3, request.getParameter("company_code"));
ResultSet rs_staff=pre_staff.executeQuery();

while(rs_staff.next())
{
	
	%>


<div class="card">
<div class="card-body">		
<div class="form-group">   
<h2>Personal Information Details</h2>	
</div>			
<div class="row">

<div class="col-12 col-lg-6">

		<div class="form-group">   
			 <label class="pure-material-textfield-outlined">
					 <!--  <input type="text" placeholder="" name="name"   required> -->
					  <input type="text"  value="<%=rs_staff.getString("staff_name") %>" name="name" onkeypress="javascript:return isLetter(event)" required />
					   <span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Name</span>
             </label>	
		</div>		
<div class="form-group"> 
					 <label class="pure-material-textfield-outlined">
							<select required class="browser-default custom-select"  name="position"   >
<%
			if(rs_staff.getString("staff_position").equalsIgnoreCase("Staff"))
			{
%>
												<option selected value="Staff">Staff</option>
												<option value="CEO"> CEO</option>
												<option value="Manager"> Manager</option>
												<option value="Agent"> Agent</option>
												<option value="Driver"> Driver</option>
<%}
else if(rs_staff.getString("staff_position").equalsIgnoreCase("CEO")){
%>
												<option  value="Staff">Staff</option>
												<option selected value="CEO"> CEO</option>
												<option value="Manager"> Manager</option>
												<option value="Agent"> Agent</option>
												<option value="Driver"> Driver</option>

<%}
else if(rs_staff.getString("staff_position").equalsIgnoreCase("Manager")){
%>

												<option  value="Staff">Staff</option>
												<option  value="CEO"> CEO</option>
												<option selected value="Manager"> Manager</option>
												<option value="Agent"> Agent</option>
												<option value="Driver"> Driver</option>
	
<%
}
else if(rs_staff.getString("staff_position").equalsIgnoreCase("Agent"))
{%>
												<option  value="Staff">Staff</option>
												<option  value="CEO"> CEO</option>
												<option  value="Manager"> Manager</option>
												<option selected value="Agent"> Agent</option>
												<option value="Driver"> Driver</option>

<%}

else{%>

												<option  value="Staff">Staff</option>
												<option  value="CEO"> CEO</option>
												<option  value="Manager"> Manager</option>
												<option  value="Agent"> Agent</option>
												<option selected value="Driver"> Driver</option>
	
	
<%}

%>
												
							</select>
							<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Position</span>
			         </label>						
			</div>
			
			<div class="form-group"> 
			 <label class="pure-material-textfield-outlined">
				<select required requiredclass="browser-default custom-select"  name="dept">
					
<%

if(rs_staff.getString("staff_dept").equalsIgnoreCase("Sale"))
{	
%>					
					
					<option selected value="Sale">Sale </option>
					<option value="Delivery">Delivery </option>
					<option value="Management">Management</option>
<%}
else if(rs_staff.getString("staff_dept").equalsIgnoreCase("Delivery"))
{
	%>
					<option  value="Sale">Sale </option>
					<option selected value="Delivery">Delivery </option>
					<option value="Management">Management</option>
	
<%}
else{%>
	
					<option  value="Sale">Sale </option>
					<option  value="Delivery">Delivery </option>
					<option selected value="Management">Management</option>
	
<%}

%>
				</select>
				<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Department</span>
	        </label>						
	</div>	
</div>

<div class="col-12 col-lg-6">

		 <div class="form-group">   								
					<label class="pure-material-textfield-outlined">								
					 <input type="text"  name="username" value="<%=rs_staff.getString("staff_username") %>" id="username" required />
					 <span><i style="color:red; margin-top:1px; font-size:20px;">*</i>UserName</span>
		             </label>	
		             <span id="urname_error" ></span>
			 </div>

			
		<div class="form-group">   	 
				<label class="pure-material-textfield-outlined">	
				<input type="password" value="<%=rs_staff.getString("staff_password") %>" name="staff_password"  id="staff_password" required>
					<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Password</span>
				</label>
				<span id="staff_ps_error"></span> 	
 		</div>
														
	<div class="form-group">   
			<label class="pure-material-textfield-outlined">	
					<input type="password" value="<%=rs_staff.getString("staff_password") %>" name="staff_cpassword" id="staff_cpassword" required />
					<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>ConfrimedPassword</span>
			</label>	
			<span id="staff_cps_error"></span> 												
    </div>
	


</div>
</div>
</div>
</div>

									
	
<div class="card">
<div class="card-body">		
<div class="form-group">   
<h2>Personal Information Details</h2>	
</div>

<div class="row">
<div class="col-12 col-lg-6">	
	
             <!-- here  -->
             
             <div class="form-group">   
				<label class="pure-material-textfield-outlined">	
					<input type="date" value="<%=rs_staff.getString("staff_dob")%>" data-date="" class="form-control"   name="staff_dob" id="staff_dob" required >					
							<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Date Of Brith</span>
	            </label>
	            <span id="staff_dob_error"></span> 	
			</div>	
			
			<div class="form-group"> 
			 <label class="pure-material-textfield-outlined">
					<select required class="browser-default custom-select"  name="marital"   >
							
<%
	if(rs_staff.getString("staff_maritalstatus").equalsIgnoreCase("Single"))
	{%>
	
							<option selected value="Single">Single </option>
							<option value="Married">Married </option>
							<option value="Divorced">Divorced</option>
		
<%	}

else if(rs_staff.getString("staff_maritalstatus").equalsIgnoreCase("Married"))
	{%>
	
							<option  value="Single">Single </option>
							<option selected value="Married">Married </option>
							<option value="Divorced">Divorced</option>
		
<%	}
else{%>

							<option  value="Single">Single </option>
							<option  value="Married">Married </option>
							<option selected value="Divorced">Divorced</option>
	
<%}

%>							
							
					</select>
						<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Marital Status</span>
	            </label>	
		</div>
		
		<div class="form-group"> 
			  		<label class="pure-material-textfield-outlined">	
						<select required class="browser-default custom-select"  name="gender"   >
								
<%
if(rs_staff.getString("staff_gender").equalsIgnoreCase("Male"))
{
	%>
	
								<option selected value="Male">Male</option>
								<option value="Female">Female </option>
	
	
<%}
else{
	%>
	
								<option  value="Male">Male</option>
								<option selected value="Female">Female </option>
	
<%}

%>
								
								
						</select>
						 <span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Gender</span>
	            	</label>	
		</div>

		<div class="form-group"> 
				 <label class="pure-material-textfield-outlined">
				 <input required type="text" placeholder="" value="<%= rs_staff.getString("staff_phone")%>" name="phno"  onkeypress="javascript:return isNumber(event)" />
				<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Phone Number</span>
	            </label>						
		</div>	
 </div>
			
<div class="col-12 col-lg-6">		
	
	<div class="form-group"> 													
               <label class="pure-material-textfield-outlined">
						<input type="text" value="<%=rs_staff.getString("staff_addr1")%> " name="address1" id="address1"required>
						<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Address1</span>
	            </label>
	            <span id="address1_error"></span>			
	            </div>	
	
	<div class="form-group"> 													
               <label class="pure-material-textfield-outlined">
						<input type="text" value="<%=rs_staff.getString("staff_addr2")%> " name="address2" id="address2" >
						<span>Address2(Optional)</span>
	            </label>
	             <span id="address2_error"></span>				
	            </div>	
	            
	            <div class="form-group"> 													
               <label class="pure-material-textfield-outlined">
						<input type="text" value="<%=rs_staff.getString("staff_addr3")%> " name="address3" id="address3">
						<span>Address3(Optional)</span>
	            </label>
	             <span id="address3_error"></span>				
	            </div>	
	            
	            <div class="form-group"> 													
               <label class="pure-material-textfield-outlined">
						<input type="text" value="<%=rs_staff.getString("staff_addr4")%> " name="address4" id="address4" >
						<span>Address4(Optional)</span>
	            </label>
	             <span id="address4_error"></span>				
	            </div>	
	
				</div>				
	</div>
</div>
</div>



<div class="card">
<div class="card-body">		
 <div class="form-group">   
<h2>Address  Details</h2>	
</div>			
<div class="row">
<div class="col-12 col-lg-6">
    <div class="form-group"> 
			<label class="pure-material-textfield-outlined">
					<select class="browser-default custom-select"  name="country"   >

<%
if(rs_staff.getString("staff_country").equalsIgnoreCase("Myanm"))

%>
						<option about="01" value="Myanmar" selected>Myanmar</option>						
						<option about="02" value="Singapore"> Singapore</option>
						<option about="03" value="China"> China</option>
					</select>
					<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Country</span>
	            </label>						
	</div>
										
					
		<div class="form-group"> 
			<label class="pure-material-textfield-outlined">
				<select required class="custom-select custom-select-md"  name="select1" id="select1"  >
           			
	       <%
	       	String p_code=rs_staff.getString("staff_postal");
	       	String s_code=p_code.substring(0, 2);
  			String t_code=p_code.substring(2,4);
  			String w_code=p_code.substring(4,6);
  			String st_code=p_code.substring(6);
						PreparedStatement pre_state =conn.prepareStatement("Select state_code,state_name from state");
						ResultSet rs_state=pre_state.executeQuery();
						while(rs_state.next()){
						
					if(rs_state.getString("state_code").equalsIgnoreCase("s_code")){	
		%>
						<option selected value="<%=rs_state.getString("state_name") %>" about="<%=rs_state.getString("state_code")%>" ><%=rs_state.getString("state_name") %></option>
				<%}
						else{%>
						
						<option  value="<%=rs_state.getString("state_name") %>" about="<%=rs_state.getString("state_code")%>" ><%=rs_state.getString("state_name") %></option>
							
					<%	}
				}
				%>
  				</select>
  				<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>State/Division</span>
	            </label>						
			</div>
					
										
	<div class="form-group"> 
		<label class="pure-material-textfield-outlined">
			<select required class="custom-select custom-select-md"  name="select2" id="select2"   >   
   <%
    
   			
   			
						PreparedStatement pre_township =conn.prepareStatement("Select township_code,township_name from township where state_code=? ");
						pre_township.setString(1,s_code); 
						ResultSet rs_township=pre_township.executeQuery();
						while(rs_township.next()){
							
			if(rs_township.getString("township_code").equalsIgnoreCase(t_code))
			{%>
				<option selected value="<%=rs_township.getString("township_code") %>" about="<%=rs_township.getString("township_code")%>" ><%=rs_township.getString("township_name") %></option>
							
					<%	}
			else{%>
			
			<option  value="<%=rs_township.getString("township_name") %>" about="<%=rs_township.getString("township_code")%>" ><%=rs_township.getString("township_name") %></option>
				
		<%	}
		}
   				
  %> 				
 			</select>		
	 	<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Township</span>
	    </label>
	   </div>
	</div>
													
	
	<div class="col-12 col-lg-6">	
		<div class="form-group"> 
			<label class="pure-material-textfield-outlined">
				<select class="custom-select custom-select-md"   name="select3" id="select3"  >
	 			
	 	<%
	 	

		PreparedStatement pre_ward =conn.prepareStatement("Select ward_code,ward_name from ward where state_code=? and township_code=? ");
	 	pre_ward.setString(1,s_code); 
	 	pre_ward.setString(2,t_code);
		ResultSet rs_ward=pre_ward.executeQuery();
	 	int f=0;
		while(rs_ward.next())
		{
			f=1;
		if(rs_ward.getString("ward_code").equalsIgnoreCase(w_code))
		{
			%>
			
			<option selected about="<%=rs_ward.getString("ward_code")%>" value="<%=rs_ward.getString("ward_name") %>" ><%=rs_ward.getString("ward_name") %></option>
			
		<%}
		
		else{%>
		
		<option  about="<%=rs_ward.getString("ward_code")%>" value="<%=rs_ward.getString("ward_name") %>" ><%=rs_ward.getString("ward_name") %></option>
		
			
		<%}
			}
		
		if(f==0){
			
			%>
		<option selected  value="0" >No Ward</option>
			
	<%	}
	 	
	 	%>
	 				 
	 		</select>		
	  		<span>Ward(Optional)</span>
	    </label>
	</div>
		
	<div class="form-group"> 
			<label class="pure-material-textfield-outlined">
				<select class="custom-select custom-select-md"  name="select4" id="select4" >
				
		<%
	 	

		PreparedStatement pre_street=conn.prepareStatement("Select street_code,street_name from street where state_code=? and township_code=? and ward_code=?");
		pre_street.setString(1,s_code); 
		pre_street.setString(2,t_code);
		pre_street.setString(3,w_code);
		ResultSet rs_street=pre_street.executeQuery();
	 	int ff=0;
		while(rs_street.next())
		{
			ff=1;
		if(rs_street.getString("street_code").equalsIgnoreCase(st_code))
		{
			%>
			
			<option selected about="<%=rs_street.getString("street_code")%>" value="<%=rs_street.getString("street_name") %>" ><%=rs_street.getString("street_name") %></option>
			
		<%}
		
		else{%>
		
		
			<option  about="<%=rs_street.getString("street_code")%>" value="<%=rs_street.getString("street_name") %>" ><%=rs_street.getString("street_name") %></option>
			
		
			
		<%}
			}
		
		if(ff==0){
			
			%>
		<option selected  value="0" >No Street</option>
			
	<%	}
	 	
	 	%>
					
 	 			</select>
 			<span>Street(Optional)</span>
	     </label>
	</div>
	
														
	<div class="form-group"> 
		
	    <label class="pure-material-textfield-outlined">
			 <input type="text" id="s_postcode" value="<%=rs_staff.getString("staff_postal") %>"   name="s_pcode" pattern="[0-9]{8}"  required />             
			<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>ZipCode</span>
		</label>
	</div>	
			
</div>
</div>
</div>
</div>
	

									
<div class="card">
<div class="card-body">	
<div class="row">
<div class="col-12 col-lg-6">
<div class="form-group"> 
		<label class="pure-material-textfield-outlined">
			<input type="text" value="<%=rs_staff.getString("staff_highedu") %>"   name="edu"   required>
			<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Highest Education</span>
		</label>
		</div>
									
<div class="form-group"> 
	<label class="pure-material-textfield-outlined">
			
			<select required class="browser-default custom-select"  name="auth"   >
		<%
		if(rs_staff.getString("staff_authorizationcode").equalsIgnoreCase("Staff"))
		{
			%>
			
					<option selected value="Staff">Staff</option>
					<option value="Admin">Admin</option>		
			
		<%}
		else{
			%>
			
					<option  value="Staff">Staff</option>
					<option selected value="Admin">Admin</option>
			
	<%	}
		%>			
																		
			</select>
			<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Authorization</span>
	</label>
</div>			
	
	<div class="form-group"> 
		<label class="pure-material-textfield-outlined">
					<select required class="browser-default custom-select"  name="acctype"   >
				<%
		if(rs_staff.getString("staff_accounttype").equalsIgnoreCase("Active"))
		{
			%>
			
							<option selected value="Active">Active </option>
							<option value="Locked Out">Locked Out</option>
							<option value="Disable">Disable</option>		
			
		<%}
		else if(rs_staff.getString("staff_accounttype").equalsIgnoreCase("Locked Out")){
			%>
			
							<option  value="Active">Active </option>
							<option selected value="Locked Out">Locked Out</option>
							<option value="Disable">Disable</option>	
			
	<%	}
		else{
			%>
			
							<option  value="Active">Active </option>
							<option  value="Locked Out">Locked Out</option>
							<option selected value="Disable">Disable</option>
			
	<%	}
		%>					
							
					 </select>
					 <span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Account Type</span>
	</label>
	</div>
	
	<div class="form-group"> 
		<label class="pure-material-textfield-outlined">
				 <input required type="text"  value="<%=rs_staff.getString("staff_salary") %>" name="salary" onkeypress="javascript:return isNumber(event)" required />
				 <span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Salary</span>
	    </label>
							
	</div>
</div>			
		<div class="col-12 col-lg-6">
		    <div class="form-group"> 
			<label class="pure-material-textfield-outlined">				      	
				       	<select name="currency">
				 
	<%
		if(rs_staff.getString("staff_currency").equalsIgnoreCase("Kyats"))
		{
	%>
			
								<option value="Kyats" selected>Kyats</option>
								<option value="USD" >USD </option>
								<option value="SGD">SGD </option>
								<option value="JPY">JPY</option>
								<option value="CNY">CNY </option>			
			
		<%}
		else if(rs_staff.getString("staff_currency").equalsIgnoreCase("USD")){
			%>
			
								<option value="Kyats" >Kyats</option>
								<option selected value="USD" >USD </option>
								<option value="SGD">SGD </option>
								<option value="JPY">JPY</option>
								<option value="CNY">CNY </option>		
			
	<%	}
		else if(rs_staff.getString("staff_currency").equalsIgnoreCase("SGD")){
			%>
			
								<option value="Kyats" >Kyats</option>
								<option value="USD" >USD </option>
								<option selected value="SGD">SGD </option>
								<option value="JPY">JPY</option>
								<option value="CNY">CNY </option>	
			
	<%	}
		else if(rs_staff.getString("staff_currency").equalsIgnoreCase("JPY"))
		{
			%>
			
								<option value="Kyats" >Kyats</option>
								<option value="USD" >USD </option>
								<option  value="SGD">SGD </option>
								<option selected value="JPY">JPY</option>
								<option value="CNY">CNY </option>
	<%	}
		else{
			%>
								<option value="Kyats" >Kyats</option>
								<option value="USD" >USD </option>
								<option  value="SGD">SGD </option>
								<option  value="JPY">JPY</option>
								<option selected value="CNY">CNY </option>
			
	<%	}
		%>		
				       			
																			
						</select>
				<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Currency</span>
	    	</label>
	</div>
		
<div class="form-group"> 
		<label class="pure-material-textfield-outlined">			
		<textarea value="<%=rs_staff.getString("staff_otherscert") %>" name="cert" rows="3" class="form-control"></textarea>
  		<span>Other Certificates</span> 
	    </label>
</div>								
		
		
<div class="form-group"> 

			<label class="pure-material-textfield-outlined">
			<textarea value="<%=rs_staff.getString("staff_skills") %>" rows="3" class="form-control" name="skill"></textarea>
			<span>Skill</span>
	    </label>
</div>
</div>
</div>
</div>
</div>								
	

<div class="card">
<div class="card-body">
<div class="form-group"><h3>Emergency Contact Information</h3></div>
<div class="row">
	<div class="col-12 col-lg-6">
	<div class="form-group">
		<label  class="pure-material-textfield-outlined">
				<input type="text" value="<%=rs_staff.getString("staff_emergency_contact") %>" name="e_c"   required>
				<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Emergency Contact</span>
	    </label>
				</div>										
	</div>
	<div class="col-12 col-lg-6">								
	<div class="form-group">
		<label class="pure-material-textfield-outlined">
				
				<input type="text"  value="<%=rs_staff.getString("staff_emergency_phone") %>" placeholder="" class="form-control"   name="e_p"    onkeypress="javascript:return isNumber(event)" required/>
					<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Emergency Contact Phone</span>
	    </label>
		</div>
	</div>
	
	</div>
  </div>
  </div>	


<div class="card">
<div class="card-body">
<div class="form-group"><h2>Experiences Details</h2></div>	
<div class="row">
	<div class="col-12 col-lg-12">	
		
			<div class="form-group">
							<input type="button" class="add-row"  value="Add Row">&emsp;
						 	<button type="button" class="delete-row"  >Delete Row</button>
							
			</div>
		
								
	<div class=" form-group">
		<div class="table-responsive">
				<table id="basic-datatables" class="display table table-striped table-hover" cellspacing="0" width="100%">
					<thead>
					<tr>
					<th>Select</th>
					<th>Staff Code</th>
					<th><span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Company Name</span></th>
					<th><span><i style="color:red; margin-top:1px; font-size:20px;">*</i>(from) Month</span></th>
					<th><span><i style="color:red; margin-top:1px; font-size:20px;">*</i>(from) Year</span></th>
					<th><span><i style="color:red; margin-top:1px; font-size:20px;">*</i>(to) Month</span></th>
					<th><span><i style="color:red; margin-top:1px; font-size:20px;">*</i>(to) Year</span></th>
					<th><span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Experience(Years)</span></th>
					<th><span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Details</span></th>
				</tr>													            
			</thead>
		<tbody>
		
		<%
		
		PreparedStatement pre_staff_exp=conn.prepareStatement("Select * from staff_exp_info where staff_code=? and agent_code=? and company_code=?");
		pre_staff_exp.setString(1,request.getParameter("staff_code")); 
		pre_staff_exp.setString(2,request.getParameter("agent_code"));
		pre_staff_exp.setString(3,request.getParameter("company_code"));
		ResultSet rs_pre_staff_exp=pre_staff_exp.executeQuery();
		
		while(rs_pre_staff_exp.next())
		{
		%>
		
		  <tr>
		    	  <td><input type="checkbox"    name="record"></td>
		    	  <td><input  type="text"   name="record"    value="<%=rs_pre_staff_exp.getString("staff_code")%>"   ></td>
		    	  <td><input  type="text"   name="record"    value="<%=rs_pre_staff_exp.getString("company_name")%>"></td>
		    	  <td><input  type="text"   name="record"    value="<%=rs_pre_staff_exp.getString("from_year")%>"></td>
		    	  <td><input  type="text"   name="record"    value="<%=rs_pre_staff_exp.getString("from_month")%>"></td>
		    	  <td><input  type="text"   name="record"    value="<%=rs_pre_staff_exp.getString("to_year")%>"></td>
		    	  <td><input  type="text"   name="record"    value="<%=rs_pre_staff_exp.getString("to_month")%>"></td>
		    	  <td><input  type="text"   name="record"    value="<%=rs_pre_staff_exp.getString("experience")%>"></td>
		    	  <td><input  type="text"   name="record"    value="<%=rs_pre_staff_exp.getString("exp_details")%>"></td>
		   </tr>
			<%
		}
			%>										           
		</tbody>
	</table>
</div>
</div>
													
					
					
	<div class="form-group">
			<label class="pure-material-textfield-outlined">
							<textarea value="<%=rs_staff.getString("remark") %>" rows="5" class="form-control" name="remark"></textarea>
							<span>Remark</span>
			</label>
																
   </div>	
					
</div>    
</div>					
</div>
</div>	




<div class="card">
<div class="card-body">		
	<div class="form-group"><h2>Staff Bank Card Information</h2></div>
	<div class="row">
	<div class="col-12 col-lg-6">	
	<div class="form-group">
		<label class="pure-material-textfield-outlined">			
				<input required type="text"  value="<%=rs_staff.getString("staff_bankname") %>"  name="bname"    />
				<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>BankName</span>
				</label>
		</div>		
	
<div class="form-group">
	<label class="pure-material-textfield-outlined">		
			<input required type="text"  value="<%=rs_staff.getString("staff_bankusername") %>"   name="busername"  />
			<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>UserName</span>
	</label>
</div>		
													
<div class="form-group">
	<label class="pure-material-textfield-outlined">	 
	    <input required type="text"  name="ano"  class="creditCardText" value="<%=rs_staff.getString("staff_bankacctno") %>" onkeypress="javascript:return isNumber(event)"  />
	   	<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Account Number</span>
	</label>
</div>	
			
</div>											
	<div class="col-12 col-lg-6">												
			<div class="form-group">
					<label class="pure-material-textfield-outlined">
							<select required class="browser-default custom-select"  name="bcard"   >
								
<%
			if(rs_staff.getString("staff_bankcardtype").equalsIgnoreCase("Visa"))
			{
	%>
	
								<option selected value="Visa" >Visa </option>
								<option value="MasterCard" >MasterCard </option>
				
<%	}else
{
	%>
	
								<option  value="Visa" >Visa </option>
								<option selected value="MasterCard" >MasterCard </option>
	
<%}
		
%>
								
								
															
							</select>
							<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Card Type</span>
					</label>
			</div>									
														
			<div class="form-group">
				<label>Expire Date (mm/yyyy)</label>
				<label class="pure-material-textfield-outlined">				
						<!-- <input type="date" placeholder="Enter  Here.." class="form-control"   > -->
						<select required class="browser-default custom-select"  name="emonth" id="emonth"    >
								
		<%
		String bankexp=rs_staff.getString("staff_bankexprdate");
		String m_y[]=bankexp.split("/");
		
		if(m_y[0].equalsIgnoreCase("1")){
			%>
			
								<option selected value="1" >January </option>
								<option value="2">February </option>
								<option value="3">March</option>
								<option value="4">April </option>
								<option value="5">May </option>
								<option value="6">June </option>
								<option value="7">July </option>
								<option value="8">August </option>
								<option value="9">September </option>
								<option value="10">October </option>
								<option value="11">November </option>
								<option value="12">December </option>	
	<%	}
		else if(m_y[0].equalsIgnoreCase("2"))
		{
			%>
			
								<option  value="1" >January </option>
								<option selected value="2">February </option>
								<option value="3">March</option>
								<option value="4">April </option>
								<option value="5">May </option>
								<option value="6">June </option>
								<option value="7">July </option>
								<option value="8">August </option>
								<option value="9">September </option>
								<option value="10">October </option>
								<option value="11">November </option>
								<option value="12">December </option>	
			
		<%}
		else if(m_y[0].equalsIgnoreCase("3"))
	{
			%>
			
								<option  value="1" >January </option>
								<option  value="2">February </option>
								<option selected value="3">March</option>
								<option value="4">April </option>
								<option value="5">May </option>
								<option value="6">June </option>
								<option value="7">July </option>
								<option value="8">August </option>
								<option value="9">September </option>
								<option value="10">October </option>
								<option value="11">November </option>
								<option value="12">December </option>	
			
		<%}
		else if(m_y[0].equalsIgnoreCase("4"))
	{
			%>
			
								<option  value="1" >January </option>
								<option  value="2">February </option>
								<option  value="3">March</option>
								<option selected value="4">April </option>
								<option value="5">May </option>
								<option value="6">June </option>
								<option value="7">July </option>
								<option value="8">August </option>
								<option value="9">September </option>
								<option value="10">October </option>
								<option value="11">November </option>
								<option value="12">December </option>	
			
		<%}else if(m_y[0].equalsIgnoreCase("5"))
	{
			%>
			
								<option  value="1" >January </option>
								<option  value="2">February </option>
								<option  value="3">March</option>
								<option  value="4">April </option>
								<option selected value="5">May </option>
								<option value="6">June </option>
								<option value="7">July </option>
								<option value="8">August </option>
								<option value="9">September </option>
								<option value="10">October </option>
								<option value="11">November </option>
								<option value="12">December </option>	
			
		<%}else if(m_y[0].equalsIgnoreCase("6"))
	{
			%>
			
								<option  value="1" >January </option>
								<option  value="2">February </option>
								<option  value="3">March</option>
								<option  value="4">April </option>
								<option  value="5">May </option>
								<option selected value="6">June </option>
								<option value="7">July </option>
								<option value="8">August </option>
								<option value="9">September </option>
								<option value="10">October </option>
								<option value="11">November </option>
								<option value="12">December </option>	
			
		<%}else if(m_y[0].equalsIgnoreCase("7"))
	{
			%>
			
								<option  value="1" >January </option>
								<option  value="2">February </option>
								<option  value="3">March</option>
								<option  value="4">April </option>
								<option  value="5">May </option>
								<option  value="6">June </option>
								<option selected value="7">July </option>
								<option value="8">August </option>
								<option value="9">September </option>
								<option value="10">October </option>
								<option value="11">November </option>
								<option value="12">December </option>	
			
		<%}else if(m_y[0].equalsIgnoreCase("8"))
	{
			%>
			
								<option  value="1" >January </option>
								<option  value="2">February </option>
								<option  value="3">March</option>
								<option  value="4">April </option>
								<option  value="5">May </option>
								<option  value="6">June </option>
								<option  value="7">July </option>
								<option selected value="8">August </option>
								<option value="9">September </option>
								<option value="10">October </option>
								<option value="11">November </option>
								<option value="12">December </option>	
			
		<%}else if(m_y[0].equalsIgnoreCase("9"))
	{
			%>
			
								<option  value="1" >January </option>
								<option  value="2">February </option>
								<option  value="3">March</option>
								<option  value="4">April </option>
								<option  value="5">May </option>
								<option  value="6">June </option>
								<option  value="7">July </option>
								<option  value="8">August </option>
								<option selected value="9">September </option>
								<option value="10">October </option>
								<option value="11">November </option>
								<option value="12">December </option>	
			
		<%}else if(m_y[0].equalsIgnoreCase("10"))
	{
			%>
			
								<option  value="1" >January </option>
								<option  value="2">February </option>
								<option  value="3">March</option>
								<option  value="4">April </option>
								<option  value="5">May </option>
								<option  value="6">June </option>
								<option  value="7">July </option>
								<option  value="8">August </option>
								<option  value="9">September </option>
								<option selected value="10">October </option>
								<option value="11">November </option>
								<option value="12">December </option>	
			
		<%}else if(m_y[0].equalsIgnoreCase("11"))
	{
			%>
			
								<option  value="1" >January </option>
								<option  value="2">February </option>
								<option  value="3">March</option>
								<option  value="4">April </option>
								<option  value="5">May </option>
								<option  value="6">June </option>
								<option  value="7">July </option>
								<option  value="8">August </option>
								<option  value="9">September </option>
								<option  value="10">October </option>
								<option selected value="11">November </option>
								<option value="12">December </option>	
			
		<%}else if(m_y[0].equalsIgnoreCase("12"))
	{
			%>
			
								<option  value="1" >January </option>
								<option  value="2">February </option>
								<option  value="3">March</option>
								<option  value="4">April </option>
								<option  value="5">May </option>
								<option  value="6">June </option>
								<option  value="7">July </option>
								<option  value="8">August </option>
								<option  value="9">September </option>
								<option  value="10">October </option>
								<option selected value="11">November </option>
								<option value="12">December </option>	
			
		<%}
		%>			
		
			</select>
						<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Month</span>
				</label>
				<label class="pure-material-textfield-outlined">				
						
						<select required class="browser-default custom-select"  name="eyear" id="eyear" >
						
						<%
																	
						int year = Calendar.getInstance().get(Calendar.YEAR);
						
						String y=String.valueOf(year);
						
						for(int i=0;i<21;i++)
						{
						if(m_y[1].equalsIgnoreCase(String.valueOf(year)))	
						{
							%>
															
								<option selected value="<%=year%>"><%=year%> </option>
						<% }
						else{%>
							
							<option value="<%=year%>"><%=year%> </option>
					<%}
						
						year++;} %>															
						</select>
						<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Year</span>
		</label>
	</div>		
																						
								
</div>									
</div>
</div>
</div>
	
				
<input type="hidden" value="" name="records" id="records">
		
		<div align="center">
						 <button type="submit" class="btn btn-success" id="submit">Submit</button>&emsp;	
		</div>	
			
</div>
</div>
</div>
</div>
</form>		
</div>
</div>
</div>


	
<%

}//end of while(rs_staff.next())
	conn.close();
			
	}catch(SQLException e){
		e.printStackTrace();}
	%> 	

	
<script>

$( "form" ).submit(function( event ) {  
	
	 var myTab = document.getElementById('basic-datatables');
     var values = new Array();
   
          
     for (row = 1; row < myTab.rows.length ; row++) {
         for (c = 0; c < myTab.rows[row].cells.length; c++) {   // EACH CELL IN A ROW.

             var element = myTab.rows.item(row).cells[c];
             if (element.childNodes[0].getAttribute('type') == 'checkbox' ) {}
             else{
                 values.push( element.childNodes[0].value );
             }
         }
     }
     document.getElementById('records').value=values;
	
});





//$('#s_postcode').on('input', function() {
$('#s_postcode').keyup(function() {	
	var post_code=document.getElementById("s_postcode").value;
	var module="postalcode";
	
	 $.ajax({
	    		url: "fetch_postal.jsp",
	    		type: 'POST',
	    		data: {post_code: post_code,module:module},
	    		success: function(data)
	    		{	    		
	    			var agentList = data.trim();
	    			var str=agentList.split("$");
	    			//alert("first="+str[0]+"||second="+str[1])
	    			
	    			if(str[1].search("AAAA")>-1)
	    			{
	    				$('#select1').children('option').remove();
	    				$('#select2').children('option').remove();
	    				$('#select3').children('option').remove();
	    				$('#select4').children('option').remove();
		    			$('#select1').append(str[0]); 
	    			}
	    			else if(str[1].search("BBBB")>-1)
	    			{
	    				$('#select2').children('option').remove();
	    				$('#select3').children('option').remove();
	    				$('#select4').children('option').remove();
		    			$('#select2').append(str[0]); 
	    			}
	    			
	    			else if(str[1].search("CCCC")>-1)
	    			{
	    				$('#select3').children('option').remove();
	    				$('#select4').children('option').remove();
		    			$('#select3').append(str[0]); 
		    			$('#select3').prop("disabled", false);
	    			}
	    			
	    			else if(str[1].search("DDDD")>-1)
	    			{
		    			$('#select4').children('option').remove();
		    			$('#select4').append(str[0]);		    			
		   			 	$('#select4').prop("disabled", false);
	    			}
	    			else if(str[1].search("EEEE")>-1)
	    				{
		    				$('#select1').children('option').remove();
		    				$('#select2').children('option').remove();
		    				$('#select3').children('option').remove();
		    				$('#select4').children('option').remove();
		    				$('#select1').append(str[0]); 
		    				$('#select2').append(str[0]); 
		    				$('#select3').append(str[0]); 
		    				$('#select4').append(str[0]); 
	    				}
	    			
	    			
	    		}
	}); 
	
	
});

$("#select1").change(function()  {
	
	//var state_code=document.getElementById("select1").value;
	var state_code=$('#select1').children(":selected").attr("about");
	//alert(s1_about);
	var module="select1";
	 $.ajax({
	    		url: "fetch_postal.jsp",
	    		type: 'POST',
	    		data: {state_code: state_code,module:module},
	    		success: function(data)
	    		{	    		
	    			var agentList = data.trim();
	    		//alert(agentList);
	    			$('#select2').children('option').remove();
	    			$('#select2').append(data); 
	    			document.getElementById("s_postcode").value=state_code+"000000";
	    		}
	}); 
	
	
});
$("#select2").change(function()  {
	$('#select3').prop("disabled", false);
	//var state_code=document.getElementById("select1").value;
	//var township_code=document.getElementById("select2").value;
	var township_code=$('#select2').children(":selected").attr("about");
	var state_code=$('#select1').children(":selected").attr("about");
	var module="select2";
	 $.ajax({
	    		url: "fetch_postal.jsp",
	    		type: 'POST',
	    		data: {state_code: state_code,township_code:township_code,module:module},
	    		success: function(data)
	    		{	    		
	    			var agentList = data.trim();
	    		//alert(agentList);
	    			$('#select3').children('option').remove();
	    			$('#select3').append(data); 
	    			document.getElementById("s_postcode").value=state_code+township_code+"0000";
	    		}
	}); 
	
	
});

$("#select3").change(function()  {
	$('#select4').prop("disabled", false);
	//var state_code=document.getElementById("select1").value;
	//var township_code=document.getElementById("select2").value;
	//var ward_code=document.getElementById("select3").value;	
	var state_code=$('#select1').children(":selected").attr("about");
	var township_code=$('#select2').children(":selected").attr("about");
	var ward_code=$('#select3').children(":selected").attr("about");
	var module="select3";
	 $.ajax({
	    		url: "fetch_postal.jsp",
	    		type: 'POST',
	    		data: {state_code: state_code,township_code:township_code,ward_code:ward_code,module:module},
	    		success: function(data)
	    		{	    		
	    			var agentList = data.trim();
	    		//alert(agentList);
	    			$('#select4').children('option').remove();
	    			$('#select4').append(data); 
	    			document.getElementById("s_postcode").value=state_code+township_code+ward_code+"00";
	    		}
	}); 
	
	
});

$("#select4").change(function()  {
	
	//var state_code=document.getElementById("select1").value;
	//var township_code=document.getElementById("select2").value;
	//var ward_code=document.getElementById("select3").value;
	//var street_code=document.getElementById("select4").value;
	//var state_code=$('#select1').children(":selected").attr("about");
	var township_code=$('#select2').children(":selected").attr("about");
	var ward_code=$('#select3').children(":selected").attr("about");
	var state_code=$('#select4').children(":selected").attr("about");
	document.getElementById("s_postcode").value=state_code+township_code+ward_code+street_code;
	
});

$(document).ready(function(){
	
	$('.creditCardText').keyup(function() {
	  var foo = $(this).val().split("-").join(""); // remove hyphens
	  if (foo.length > 0) {
	    foo = foo.match(new RegExp('.{1,4}', 'g')).join("-");
	  }
	  $(this).val(foo);
	});
});

//address1

	$("#address1").focusout(function() {
		
		var address1=document.getElementById("address1").value;
		var address1_error=document.getElementById("address1_error");
		if(address1.length>31)
			{
			
			address1_error.textContent="**Address accepts no more 30 characters**"
				document.getElementById("address1").value="";
			address1_error.style.color = "red" ;
		}
		else{
			
			address1_error.textContent="";
		}
	  
	});
$("#address2").focusout(function() {
		
		var address2=document.getElementById("address2").value;
		
		var address2_error=document.getElementById("address2_error");
		if(address2.length>31)
			{
			
			address2_error.textContent="**Address accepts no more 30 characters**"
				document.getElementById("address2").value="";
			address2_error.style.color = "red" ;
		}
		else{
			
			address2_error.textContent="";
		}
	  
	});
$("#address3").focusout(function() {
	
	var address3=document.getElementById("address3").value;
	var address3_error=document.getElementById("address3_error");
	document.getElementById("address3").value="";
	if(address3.length>31)
		{
		
		address3_error.textContent="**Address accepts no more 30 characters**"
		address3_error.style.color = "red" ;
	}
	else{
		
		address3_error.textContent="";
	}
  
});
$("#address4").focusout(function() {
	
	var address4=document.getElementById("address4").value;
	var address4_error=document.getElementById("address4_error");
	document.getElementById("address4").value="";
	if(address4.length>31)
		{
		
		address4_error.textContent="**Address accepts no more 30 characters**"
		address4_error.style.color = "red" ;
	}
	else{
		
		address4_error.textContent="";
	}
  
});


$("#company").change(function()  {
	
	var company_code=document.getElementById("company").value;
	var agent_code=document.getElementById("agent").value;
	if(company_code=="")
		{
			company_error.textContent = "***Fill Company field first***";   
			agent_error.textContent = "***Fill Agent field first***"; 			
			company_error.style.color = "red" ;
			agent_error.style.color = "red" ;
		}
	else {
		company_error.textContent = ""; 
        agent_error.textContent = ""; 
        document.getElementById("username").value="";
		}
	
});

$("#username").focusout(function() {
	//var urname= $('#focusout').val();
	var urname=document.getElementById("username").value;
	var company_code=document.getElementById("company").value;
	var agent_code=document.getElementById("agent").value;
	var module="staff";
	var error = document.getElementById("urname_error");
	var company_error=document.getElementById("company_error");
	var agent_error=document.getElementById("agent_error");
	
	if(company_code=="" || agent_code=="" )
	{
		
		company_error.textContent = "***Fill Company field first***";   
		agent_error.textContent = "***Fill Agent field first***";  
		company_error.style.color = "red" ;
		agent_error.style.color = "red" ;
		}
	else if (urname.length>4)
	{
		document.getElementById("username").value="";
        error.textContent = "***Username should not be larger than 4 characters***";                
        error.style.color = "red" ;
        company_error.textContent = ""; 
        agent_error.textContent = ""; 
	}
	else
		{
		
				error.textContent = ""; 
				company_error.textContent = ""; 
				agent_error.textContent = "";
				
				 $.ajax({
				    		url: "fetch.jsp",
				    		type: 'POST',
				    		data: {urname: urname,company_code:company_code,agent_code:agent_code,module:module},
				    		success: function(data) {
				    		var ur_name = data.trim();
				    	 		
					    			if (ur_name=="ok")  
					    		
							            { 
							            	 
							            	document.getElementById("username").value="";
							                error.textContent = "***Username already exists***";                
							                error.style.color = "red" ;
							                	
							            }
					    			else { 
						            	   
						            	error.textContent = ""; 
						            	} 
					    		
					    		
				    		}
				}); 
		}
	
	//alert(urname);
});


$('#eyear').change(function() {
	
	var e_year=$(this).children(":selected").attr("value");
	var e_month=$('#emonth').children(":selected").attr("value"); 
	
	var x = new Date()
	var today_month=x.getMonth()+1; 
	var today_year=x.getYear()+1900;
	//var x1=x.getMonth() + 1+ "/" + x.getDate() + "/" + x.getYear()+1900; 
	
	var diff_month=e_month-today_month;
	var diff_year=e_year-today_year;
	
	var months = diff_year*12 + diff_month;
	
	if(months<3) { 
		alert("Atleast you must have three months !!");
		document.getElementById("emonth").value="--Select Month--";
		//$('#emonth').children(":selected").attr("value")="--Select Month--";
		$('#eyear').focus();
	}
	 		
	  
  });

$('#emonth').change(function() {
	
	var e_year=$('#eyear').children(":selected").attr("value");
	//alert(e_year);
	if(e_year>0)
		{
        	var e_month=$('#emonth').children(":selected").attr("value"); 
        	
        	var x = new Date()
			var today_month=x.getMonth()+1; 
        	var today_year=x.getYear()+1900;
        	//var x1=x.getMonth() + 1+ "/" + x.getDate() + "/" + x.getYear()+1900; 
        	
        	var diff_month=e_month-today_month;
        	var diff_year=e_year-today_year;
        	
        	var months = diff_year*12 + diff_month;
        	if(months<3){
        		alert("Atleast you must have three months !!"); 
        		document.getElementById("emonth").value="--Select Month--";
        		$('#emonth').focus();
        	}
		}	
	  
  });

$("#company").change(function()  {
	//var urname= $('#focusout').val();
	var c_code=document.getElementById("company").value;
	
	 $.ajax({
	    		url: "fectch_staffAgentName.jsp",
	    		type: 'POST',
	    		data: {c_code: c_code},
	    		success: function(data)
	    		{	    		
	    			var agentList = data.trim();
	    		//alert(agentList);
	    			$('#agent').children('option').remove();
	    			$('#agent').append(data); 
	              
	    		}
	}); 
	
	
});

$('#staff_dob').focusout(function() {
	//.ejDatePicker()
	//var e_year=$('#eyear').children(":selected").attr("value");
	var x = document.getElementById("staff_dob").value;
	var staff_dob=new Date(x);
	var staff_dob_error = document.getElementById("staff_dob_error");
	var staff_flag=0;
	
	if(document.getElementById("staff_dob").value=="" || staff_dob=="Invalid Date")
	{
		
		staff_dob_error.textContent = "***Please enter valid date***" ;
		staff_dob_error.style.color = "red";
		document.getElementById("staff_dob").value="dd/mm/yyyy";
		$("#staff_dob").focus(); 
		staff_flag=1;
		
		}
	else{
		
			
			var staff_dob_month=staff_dob.getMonth()+1;
			var staff_dob_year=staff_dob.getYear()+1900;
			var staff_dob_day=staff_dob.getDate();
			
			var staff_date = new Date()
			var today_month=staff_date.getMonth()+1; 
        	var today_year=staff_date.getYear()+1900;
        	var today_date=staff_date.getDate();	
        	
        	var diff_year=today_year-staff_dob_year;
        	
        	if(staff_dob_year<1970)
	        	{
	        		
	        		staff_dob_error.textContent = "***Your DOB is invalid ***" ;
		            document.getElementById("staff_dob").value="dd/mm/yyyy";
		            $("#staff_dob").focus();
		            staff_dob_error.style.color = "red";
		            staff_flag=1;
        		}
        	else if(diff_year<16)
        		{
	        		
	        		staff_dob_error.textContent = "***Your age must be over 15 years old***" ;
		            document.getElementById("staff_dob").value="dd/mm/yyyy";
		            $("#staff_dob").focus();
		            staff_dob_error.style.color = "red";
		            staff_flag=1;
        		}
		}
	
	if(staff_flag==0){
		staff_dob_error.textContent =""; staff_flag=0;
	}
	
});


$('#staff_password').focusout(function() {
	 
	 var staff_password = document.getElementById("staff_password").value;
	 var staff_ps_error = document.getElementById("staff_ps_error");
	 var staff_ps_length=staff_password.length;
	// alert(staff_ps_length);
	 if(staff_password=="")
		 {
		 	
		 	staff_ps_error.textContent = "***Please fill the password field. *** " 
			staff_ps_error.style.color = "red" 
			document.getElementById("staff_password").value="";
			$("#staff_password").focus();
		 }
	 else if(staff_ps_length>8){
		 
		 staff_ps_error.textContent = "***Your password must be at most 8 characters long. *** " 
		 staff_ps_error.style.color = "red" 
		 document.getElementById("staff_password").value="";
		 $("#staff_password").focus();
		
	 }
	 else{
		 staff_ps_error.textContent = ""
	 }
});

$('#staff_cpassword').focusout(function() {
			 
			 
		var staff_cpassword = document.getElementById("staff_cpassword").value;
		var staff_cps_error = document.getElementById("staff_cps_error");
			 
		var staff_password = document.getElementById("staff_password").value;
		var staff_ps_error = document.getElementById("staff_ps_error");
		var staff_ps_length=staff_password.length;
		var staff_cps_length=staff_cpassword.length;
			
			 if(staff_cpassword=="")
			 {
			 	staff_cps_error.textContent = "*** Please fill the confirmed password field. *** " 
				staff_cps_error.style.color = "red" 
				document.getElementById("staff_cpassword").value="";
				$("#staff_cpassword").focus();
			 }
			 else if(staff_cps_length>8) {
				 staff_cps_error.textContent = "*** Your confirmed password must be at most 8 characters long. ***";
				 document.getElementById("staff_cpassword").value="";
				 $("#staff_cpassword").focus();
				 staff_cps_error.style.color = "red" 
			 }
			 else if(staff_cpassword!=staff_password)
			{
				 staff_cps_error.textContent = "*** Password and confirmed password must be matched ***"; 
				 $("#staff_password").focus();
				 document.getElementById("staff_password").value="";
		         document.getElementById("staff_cpassword").value="";
		         staff_cps_error.style.color = "red" 
			}
			 else{
				 staff_cps_error.textContent = ""
			 }
});


$(document).ready(function(){    	
	
	  /* for datepicker showing only year */
	  
	 
	
    $(".add-row").click(function(){
    	
    	var staff_code=document.getElementById("s_code").value;//s_code
    	 
    	 var x = new Date()
			var year=x.getYear()+1900;
    	var start_year=year-70;
    	 
    	 var e="<select required   name='record'><option value=''>--select Year--</option>";
    	  for(var i=start_year;i<=year;i++)
    		 e=e+"<option value="+i+">"+i+"</option>"; 
   		
    	e=e+"</select>"
    	
         var markup ="<tr><td><input type='checkbox' name='record'></td><td><input type='text' name='record'  value="+staff_code+" readonly></td><td><input required type='text' name='record' value='' ></td><td>"
         +"<select required  name='record'><option value=''>--select month--</option><option value='January' >January </option><option value='February'>February </option><option value='March'>March</option><option value='April'>April </option><option value='May'>May </option><option value='June'>June </option><option value='July'>July </option><option value='August'>August </option><option value='September'>September </option><option value='October'>October </option><option value='November'>November </option><option value='December'>December </option></select></td><td>"
         +e+"</td><td>"
         +"<select required  name='record'><option value=''>--select month--</option><option value='January' >January </option><option value='February'>February </option><option value='March'>March</option><option value='April'>April </option><option value='May'>May </option><option value='June'>June </option><option value='July'>July </option><option value='August'>August </option><option value='September'>September </option><option value='October'>October </option><option value='November'>November </option><option value='December'>December </option></select></td><td>"
         +e+"</td><td><input required type='number' value='' name='record'></td><td><input required type='text' name='record' value=''></td>";
       
         $("table tbody").append(markup);
        
    });
	  
   
  
    
    // Find and remove selected table rows
    $(".delete-row").click(function(){
        $("table tbody").find('input[name="record"]').each(function(){
            if($(this).is(":checked")){
                $(this).parents("tr").remove();
            }
        });
    });
    
});

    function isLetter(evt) {
        var iKeyCode = (evt.which) ? evt.which : evt.keyCode
         if ((event.keyCode > 64 && event.keyCode < 91) || (event.keyCode > 96 && event.keyCode < 123) || event.keyCode == 8 || event.keyCode==32)
            return true; 
        
        return false;
    }  
    
    function isNumber(evt) {
        var iKeyCode = (evt.which) ? evt.which : evt.keyCode
        if (iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57))
            return false;

        return true;
    }   
  

   
</script>


	
	<!--   Core JS Files   -->
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> 
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script src="assets/js/core/jquery.3.2.1.min.js"></script>
	<script src="assets/js/core/popper.min.js"></script>
	<script src="assets/js/core/bootstrap.min.js"></script>
	<!-- jQuery UI -->
	
	<script src="assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>
	
	<!-- jQuery Scrollbar -->
	<script src="assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
	<!-- Atlantis JS -->
	<script src="assets/js/atlantis.min.js"></script>
	<!-- Atlantis DEMO methods, don't include it in your project! -->
	<script src="assets/js/setting-demo2.js"></script>
</body>
</html>