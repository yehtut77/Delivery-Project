<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.util.*"%>
<%@ page import="java.io.*"%><%@ page import="javax.servlet.http.*"%>
<%@ page import="javax.servlet.*"%>
	<%
									HttpSession ssss=request.getSession(false);  
									String n=(String)session.getAttribute("staffName"); 
									String staff_name=(String)ssss.getAttribute("staffName");
									String companyname=(String)ssss.getAttribute("companyType");%>						

    <!DOCTYPE html>
<html lang="en">
<head>

	<title>Delivery System</title>
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
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/atlantis.min.css">
	<!-- CSS Just for demo purpose, don't include it in your project -->
	<link rel="stylesheet" href="assets/css/demo.css">
<script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>
  <script>
var n1='<%=n%>';

if(n1=="null"){
	window.location.replace("https://www.delivery.teamramen.net/Login.jsp");
}



</script>
	<style>

}
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
												<h4></h4>
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
								
								
									<%=n%>
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
                            					<li class="nav-item active">
							<a data-toggle="collapse" href="#com">
								<i class=" 	far fa-building"></i>
								<p>Company</p>
								<span class="caret"></span>
							</a>
							<div class="collapse" id="com">
								<ul class="nav nav-collapse">
									<li>
										<a href="companyList.jsp">
											<span class="sub-item">Company List</span>
										</a>
									</li>
                                                                                                                                                <li>
							                                                                                             <li>
										 <%	if(companyname.equalsIgnoreCase("main"))
{%>                                                                                              <li>
										<a href="#"><!-- companyAdd.jsp -->
											<span class="sub-item">Add new Company</span>
										</a>
									</li><%} else{ %>
									                                                        <li hidden>
										<a href="#" hidden><!-- companyAdd.jsp -->
											<span hidden class="sub-item">Add new Company</span>
										</a>
									</li><%} %>
								</ul>
							</div>
						</li>

						<li class="nav-item active">
							<a data-toggle="collapse" href="#base">
								<i class="fas fa-user"></i>
								<p>Agent</p>
								<span class="caret"></span>
							</a>
							<div class="collapse" id="base">
								<ul class="nav nav-collapse">
									<li>
										<a href="agentList.jsp">
											<span class="sub-item">Agent Lists</span>
										</a>
									</li>
									  
                                        
									<%	if(companyname.equalsIgnoreCase("main"))
{%>                                               
									<li>
										<a href="#"><!-- addAgent.jsp -->
											<span class="sub-item">Add Agent</span>
										</a>
									</li>
									<%} else { %>
									                  
									<li hidden>
										<a hidden href="#"><!-- addAgent.jsp -->
											<span hidden class="sub-item">Add Agent</span>
										</a>
									</li> <%} %>
									
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
									                                               
									 <%	if(companyname.equalsIgnoreCase("main"))
{%>                                                                                  
									<li>
										<a href="staffAdd.jsp">
											<span class="sub-item">Add new staff</span>
										</a>
									</li>
									<%}else { %>
										<li hidden>
										<a hidden href="staffAdd.jsp">
											<span hidden class="sub-item">Add new staff</span>
										</a>
									</li><%} %>
									
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
									 <%	if(companyname.equalsIgnoreCase("main"))
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
										<a href="addOn1.jsp">
											<span class="sub-item">State & Division</span>
										</a>
									</li>
								</ul>
							</div>
						</li>                                                                   
						
						
						
					</ul>
				</div>
			</div>
		</div>
		<!-- End Sidebar -->

		
		<script>
		$(document).ready(function() {
		
			 
			$(".only_numeric").bind("keypress", function (e) {
		          var keyCode = e.which ? e.which : e.keyCode
		               
		          if (!(keyCode >= 48 && keyCode <= 57)) {
		            $(".error").css("display", "inline");
		            return false;
		          }else{
		            $(".error").css("display", "none");
		          }
		      });
			$('.only_letter').keydown(function (e) {
		         if (e.ctrlKey|| e.altKey) {
		             e.preventDefault();
		         } else {
		             var key = e.keyCode;
		             if (!((key == 8) || (key == 32) || (key == 46) || (key >= 35 && key <= 40) || (key >= 65 && key <= 90))) {
		                 e.preventDefault();
		             }
		         }
		     });
		     $("#curr_form").submit(function(e) {
	    		//var urname= $('#focusout').val();
	    		e.preventDefault();
	    		var check=document.getElementById("desc").value;
	    		//city_name.value = city_name;
	    		 $.ajax({
				    		url: "currency_add.jsp",
				    		type: 'POST',
				    		data: {check: check,
				    		    type:"check"
				    		},
				    		success: function(data) {
				    		//$('#city_name').val(data);
				    		//alert(data);
				    			var check = data.trim();
				    		
					    		var error = document.getElementById("desc_error");
					            if (check=="ok")  
					            {  
					            	// Changing content and color of content 
					            	document.getElementById("desc").value="";
					                error.textContent = "***Currency already exists***";                
					                error.style.color = "red" ;
					                
					                	
					            } else { 
					            	  
					            	error.textContent = ""; 
					            	$('#curr_form').unbind("submit");
					            	$('#curr_form').submit() ; 
					            	} 
				    		}
	    		}); 
	    		
	    		//alert(urname);
	    	});
	    	 $("#customSwitch1").click(function(){
            if($(this).prop("checked") == true){
                 $('.disable_text').prop("disabled", false);
            }
            else if($(this).prop("checked") == false){
                 $('.disable_text').prop("disabled", true);
            }
        });
	    	
			
			
		});
		</script>
		<%//Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/delivery1", "root", "root");
		Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
		%>
		<!-- 	Start  Main-dashboard -->
		<div class="main-panel">
		
	<!-- 	Start  Content -->
			<div class="content">
			<br>
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
								<a href="staffList.jsp">Charges</a>
							</li>
							<li class="separator">
								<i class="flaticon-right-arrow"></i>
							</li>
							<li class="nav-item">
								<a href="staffAdd.jsp">Currency</a>
							</li>
						</ul>
					</div>
							
							
							<br>
							<div class="page-inner mt--5">
					<div class="row mt--2">
						<div class="col-md-12">
							
							<div class="card">
					<div class="card-body">
					   <div class="card-title">Add New Currency</div>
					</div>			
						
					</div>
					
					<form action="currency_add.jsp" method="post" id="curr_form" role="form">
						<div class="card">
					<div class="card-body">
					<div class="form-group">   
<h2>Add Currency</h2>	
<script type="text/javascript">
function isNumberKey(evt)
{
   var charCode = (evt.which) ? evt.which : evt.keyCode;
   if (charCode != 46 && charCode > 31 
     && (charCode < 48 || charCode > 57))
      return false;

   return true;
}
</script>
</div>	
					   <div class="row">
					   <%
					
					Statement s1=conn.createStatement();
					ResultSet r1=s1.executeQuery("Select* from curr_desc");
					String curr_code=null;
					int changecode=0;
					while(r1.next()){
						 curr_code=r1.getString("curr_code");
						 changecode = Integer.parseInt(curr_code);
					}
					 
					changecode+=1;
					 curr_code = String.format("%02d", changecode);
					 
					
					%>
											<div class=" col-sm-4 form-group">
												 <label class="pure-material-textfield-outlined">
					
					 							 <input type="text"  value="<%=curr_code%>" name="curr_code" class="only_letter" id="curr_code" readonly/>
					   							<span>Currency Code</span>
             										</label>	
											</div>	
											<div class=" col-sm-4 form-group">
												 <label class="pure-material-textfield-outlined">
					<input type="hidden" id="user" name="user" value="<%=staff_name%>" />
					<input type="hidden" name="type" value="create" />
					 							 <input type="text" class="only_letter" required name="desc" id="desc" />
					   							<span>Description</span>
             										</label>	
             										<span id="desc_error" ></span>
											</div>	
											
											<div class=" col-sm-2 form-group text-center">
											<button type="submit" id="btn" class="btn btn-primary">Add</button>
											</div>	
											
											
											</div>
											<hr style="background-color:#020ae3;">
											
					</div>			
						
					</div>
					</form>
					<div class="card">
					<div class="card-body">
					   <div class="form-group"><h2>Existing Currency in System</h2></div>
					   		   <div class="custom-control custom-switch">
  <input type="checkbox" class="custom-control-input" id="customSwitch1">
  <label class="custom-control-label" for="customSwitch1"><h5><b>Click Here To Edit Data<b></h5></label>
</div>
					   <table class="text-center">
					   <tr>
					   <th>Currency Code</th>
					   <th>Description</th>
					   
					   <th>Option</th>
					   
					   </tr>
					   <tbody ><%Statement ss=conn.createStatement();
					   			ResultSet r11=ss.executeQuery("Select* from curr_desc");
					   			
					   			while(r11.next()){
					   %>
					   
					   <tr>
					   <form action="currency_add.jsp" method="post" role="form">
					   <td><input type="text" value="<%=r11.getString("curr_code")%>" name="curr_code" readonly></td>
					   <td><input type="text" value="<%=r11.getString("description")%>" name="description" class="disable_text" required disabled></td>
					   <input type="hidden"  value="edit_curr"  name="type" />
											<input type="hidden" name="user" value="<%=staff_name%>" />
					   <td> <button class="btn btn-primary btn-sm disable_text" disabled>Submit</button></td>
					   </form>
					   
					   </tr>
					   
					   <%} %>
					   </tbody>
					   </table>
					</div>			
						
					</div>
					
					
					<form action="currency_add.jsp" method="post" id="update_form" role="form">
					
					<div class="card">
					<div class="card-body">
					   <div class="form-group"><h2>Update Exchange Rate</h2></div>
					  <div class="row">
					 
											<div class=" col-sm-4 form-group">
												 <label class="pure-material-textfield-outlined">
												 
												<select required id="from_curr" name="from_currency">
												<option value="" selected>---Select---</option>
												 <%
					  Statement s=conn.createStatement();
					  ResultSet r=s.executeQuery("Select* from curr_desc");
					  while(r.next()){
					  %>
												<option value="<%=r.getString("curr_code")%>"><%=r.getString("description") %></option>
												<%} %>
												</select>
												
					 							 
					   							<span>From Currency</span>
             										</label>	
											</div>	
											<div class=" col-sm-4 form-group">
												 <label class="pure-material-textfield-outlined">
												<select id="to_curr" name="to_currency">
												<option value="MMK" selected>MMK</option>
												
												
												</select>
					 							
					   							<span>To Currency</span>
             										</label>	
											</div>	
											<div class=" col-sm-2 form-group">
											<label class="pure-material-textfield-outlined">
											<input type="hidden"  value="update"  name="type" />
											<input type="hidden" id="user" name="user" value="<%=staff_name%>" />
												<input type="text" class="only_number" required id="exch" name="exchange" />
												<span>Exchange Rate</span>
												</label>
											</div>	
											<div class=" col-sm-2 form-group text-center">
											<button type="submit" class="btn btn-primary">Update</button>
											</div>	
											
											
											</div>
					</div>			
						
					</div>
					

</form>
	<div class="card">
					<div class="card-body">
					   <div class="card-title">Currency List</div>
					   			<div class="table-responsive">
									<table id="basic-datatables" class="display table table-striped table-hover" cellspacing="0" width="100%">
																	<!-- <thead> -->
											<thead>

												<tr>
												<th>From Currency</th>

													<th>To Currency</th>

													<th>Exchange Rate</th>
													<th>Created Time</th>

													<th>Updated Time</th>
													
													
													
												
													
												</tr>
											</thead>
											
											
											
														<!-- <tbody> -->
											<tbody>
												
										<%
																							
													Statement st=conn.createStatement();
													ResultSet rs=st.executeQuery("select * from currency");

													while(rs.next()){
														%>
													<%	
														String b=rs.getString("from_curr");
														String c=rs.getString("to_curr");
														String d=rs.getString("exch_rate");
														String e=rs.getString("createdate");
														String f=rs.getString("modifydate");
														if(e=="" || e==null){
															e="";
														}
														if(f=="" || f==null){
															f="";
														}
														
														%>
																																<tr>
																				
													
													
													<td><%=b %></td>
													<td><%=c %></td>
													<td><%=d %></td>
													<td><%=e %></td>
													<td><%=f %></td>
													
													
													
										<%}conn.close(); %>
											</tbody>
										<!-- 	End tbody -->
									</table>
									
</div>
					</div>			
						
					</div>
					
					
		
					
						
							
							
							
							</div></div></div>
							
							
							
							
							
							
							
							
							
							
						<!-- 	Card -->
				
			</div>
			<!-- 	End  Content -->
			
			
		<!-- 	footer -->
			<footer class="footer">
				<div class="container-fluid">
					<nav class="pull-left">
						<ul class="nav">
							<li class="nav-item">
								<a class="nav-link" href="#">
									Home
								</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="#">
									About Us
								</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="#">
									Contact Us
								</a>
							</li>
						</ul>
					</nav>
					<div class="copyright ml-auto">
						Delivery System
					</div>				
				</div>
			</footer>
		</div>
		<!-- 	End  footer -->
		
		
		
		
		
		
		
		
		
	</div>
	
			
	<!--   Core JS Files   -->
	<script src="assets/js/core/jquery.3.2.1.min.js"></script>
	<script src="assets/js/core/popper.min.js"></script>
	<script src="assets/js/core/bootstrap.min.js"></script>
	<!-- jQuery UI -->
	<script src="assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
	<script src="assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>
	
	<!-- jQuery Scrollbar -->
	<script src="assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
	<!-- Datatables -->
	<script src="assets/js/plugin/datatables/datatables.min.js"></script>
	<!-- Atlantis JS -->
	<script src="assets/js/atlantis.min.js"></script>
	<!-- Atlantis DEMO methods, don't include it in your project! -->
	<script src="assets/js/setting-demo2.js"></script>
	<script >
		$(document).ready(function() {
			
			
			$('#basic-datatables').DataTable({
			});

			$('#multi-filter-select').DataTable( {
				"pageLength": 5,
				initComplete: function () {
					this.api().columns().every( function () {
						var column = this;
						var select = $('<select class="form-control"><option value=""></option></select>')
						.appendTo( $(column.footer()).empty() )
						.on( 'change', function () {
							var val = $.fn.dataTable.util.escapeRegex(
								$(this).val()
								);

							column
							.search( val ? '^'+val+'$' : '', true, false )
							.draw();
						} );

						column.data().unique().sort().each( function ( d, j ) {
							select.append( '<option value="'+d+'">'+d+'</option>' )
						} );
					} );
				}
			});

			// Add Row
			$('#add-row').DataTable({
				"pageLength": 5,
			});

			var action = '<td> <div class="form-button-action"> <button type="button" data-toggle="tooltip" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Edit Task"> <i class="fa fa-edit"></i> </button> <button type="button" data-toggle="tooltip" title="" class="btn btn-link btn-danger" data-original-title="Remove"> <i class="fa fa-times"></i> </button> </div> </td>';

			$('#addRowButton').click(function() {
				$('#add-row').dataTable().fnAddData([
					$("#addName").val(),
					$("#addPosition").val(),
					$("#addOffice").val(),
					action
					]);
				$('#addRowModal').modal('hide');

			});
		});
	</script>
	
	
	
</body>
</html>