<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>

   <% 
    
     String username = (String)session.getAttribute("username");		
	  String companyCode=(String)session.getAttribute("companyCode"); 
	  String companyType=(String)session.getAttribute("companyType"); 		 
	  String role=(String)session.getAttribute("role");
	  String staffName=(String)session.getAttribute("staffName"); 
	  String staffCode=(String)session.getAttribute("staffCode"); 
	  String parent_agent_code=(String)session.getAttribute("parent_agent_code"); 
	  String agentCode=(String)session.getAttribute("agentCode"); 
	  System.out.println("companyCode="+companyCode);
		 
%>
    
<!DOCTYPE html>


<html lang="en">
<head>
	  <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
    <!-- Title -->
    <title>Myanamr Delivery</title>

    <!-- Favicon -->
    <link rel="icon" href="./img/core-img/aaa.png">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="style.css">
    
   <style>
  body{
  background-color: #c9cfcf;
  }
  


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

  <script type="text/javascript" src="test.js" ></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
 


<script type="text/javascript"    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB7J1zsErb9_7jxNu5KU5kIENFObAQEbl0&sensor=false"></script>


<body>
	<div class="wrapper sidebar_minimize">
		<div class="main-header">
			<!-- Logo Header -->
			<div class="logo-header" data-background-color="blue">
				
				<a href="index.html" class="logo">
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
					<div class="collapse" id="search-nav">
						
					</div>
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
													<img src="../../assets/img/chadengle.jpg" alt="Img Profile">
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
													<img src="../../assets/img/mlane.jpg" alt="Img Profile">
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
													<img src="../../assets/img/talha.jpg" alt="Img Profile">
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
												<img src="../../assets/img/profile2.jpg" alt="Img Profile">
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
						<br>
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
												<h4>Min Khant</h4>
												<p class="text-muted">minkhant@gmail.com</p><a href="profile.html" class="btn btn-xs btn-secondary btn-sm">View Profile</a>
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
										<a class="dropdown-item" href="#">Logout</a>
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
								<a href="companyList.jsp">Company Detail Lists</a>
							</li>
							<li class="separator">
								<i class="flaticon-right-arrow"></i>
							</li>
							<li class="nav-item">
								<a href="companyAdd.jsp">Add</a>
							</li>
						</ul>
					</div>
					              
					              
					              
<!-- *****************Card header start *************-->


	 <%
	 //Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/delivery1", "root", "root");
	 Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
					String company_code=request.getParameter("company_code");
					System.out.println("company_code from details page="+company_code);
					Statement st=conn.createStatement();
					ResultSet rsss=st.executeQuery("select * from company where company_code=\'"+ company_code + "\' ");
					String code="",name="";
					String addr1="",addr2="",addr3="",addr4="",postal="",division="",country="",phone="",company_email="",nickname="",createdby="",updatedby="",createdate="",modifydate="",township="";
				
				String company_type="";
				String delivery_charges="";
				String transportation_charges="";
				String contract_date="";
				String contract_expiredate="";
				String contact_name="";
				String contact_phone="";
				
				
				Blob blob=null;
					while(rsss.next()){
					// if(rsss.next())
					// {													
						 company_code=rsss.getString("company_code");
						 
						 name=rsss.getString("company_name");
						 addr1=rsss.getString("company_addr1");
						 addr2=rsss.getString("company_addr2");
						 addr3=rsss.getString("company_addr3");
						 addr4=rsss.getString("company_addr4");
						 postal=rsss.getString("company_postal");
						 division=rsss.getString("company_division");
						 country=rsss.getString("company_country");
						 phone=rsss.getString("company_phone");

						 company_email=rsss.getString("company_email");
						 nickname=rsss.getString("nick_name");
						 createdby=rsss.getString("createdby");
						 updatedby =rsss.getString("updatedby");
						 createdate=rsss.getString("createdate");
						 modifydate=rsss.getString("modifydate");
						 township=rsss.getString("company_township");
						 company_type=rsss.getString("company_type");
						  blob=rsss.getBlob("logo");
						  delivery_charges=rsss.getString("delivery_charges");
						  transportation_charges=rsss.getString("transportation_charges");
						  contract_date=rsss.getString("contract_createdate");
						  contract_expiredate=rsss.getString("contract_expiredate");
						  contact_name=rsss.getString("contact_name");
						  contact_phone=rsss.getString("contact_phone");
						  
					}
					
					%>
					
					
					
<div class="card">
	<div class="card-body">
		<div class="card-title">Edit Company</div>
	</div>
</div>
				      				<!-- Card header start -->
					
				
<form  method="post"  action="XX"   enctype='multipart/form-data' id="curr_form" >
<div class="card">
	<div class="card-body">								
		<div class="row">
			<div class="col-12 col-lg-6">
					<div class="form-group">
					     <label class="pure-material-textfield-outlined">
						        <input type="text" placeholder=""  name="company_code"  value="<%=company_code %>"  readonly>
						        <span>Company Code</span>
						  </label>									
					</div>												
					<div class="form-group">
						 <label class="pure-material-textfield-outlined">
								<input type="text" placeholder="" name="company_name"  value="<%=name%>"  required>
								 <span>Company Name</span>
						  </label>												
					</div>
			</div>
			<div class="col-12 col-lg-6">
				<div class=" form-group">
		     		<label class="pure-material-textfield-outlined">
						<input  type="text" placeholder="" value="<%=nickname %>" name="nick"    readonly>
						<span>NickName</span>
					</label>
				</div>														
				<div class="form-group">
					<label class="pure-material-textfield-outlined">
						<select required class="browser-default custom-select"    name="company_type" >
						
						<% if(company_type.equalsIgnoreCase("Main"))
							{%>
								<option value="Main" selected>Main</option>
								<option value="Partner">Partner</option>
								<option value="Rental">Rental</option>
							<%}else if(company_type.equalsIgnoreCase("Partner")){ %>	
								<option value="Main" >Main</option>
								<option value="Partner" selected>Partner</option>
								<option value="Rental">Rental</option>
							<%}else{ %>								
								<option value="Main" >Main</option>
								<option value="Partner" >Partner</option>
								<option value="Rental" selected>Rental</option>		
								<%} %>		   
						</select>
				        <span>Company Type</span>
		       		 </label>
		    	 </div> 
			</div>										
				
		</div>
		</div>
</div>
<br>
	
<div class="card">
	<div class="card-body">								
		<div class="row">
			<div class="col-12 col-lg-6">
					<div class="form-group">
					     <label class="pure-material-textfield-outlined">
						        <input type="text" placeholder=""  name="company_addr1"  value="<%=addr1 %>" required>
						        <span>Address 1</span>
						  </label>									
					</div>												
					<div class="form-group">
						 <label class="pure-material-textfield-outlined">
								<input type="text" placeholder="" name="company_addr2"  value="<%=addr2%>" >
								 <span>Address 2</span>
						  </label>												
					</div>
					<div class="form-group">
						 <label class="pure-material-textfield-outlined">
								<input type="text" placeholder="" name="company_addr3"  value="<%=addr3%>" >
								 <span>Address 3</span>
						  </label>												
					</div>
					<div class="form-group">
						 <label class="pure-material-textfield-outlined">
								<input type="text" placeholder="" name="company_addr4"  value="<%=addr4%>" >
								 <span>Address 4</span>
						  </label>												
					</div>
			</div>
			<div class="col-12 col-lg-6">
				<div class=" form-group">
		     		<label class="pure-material-textfield-outlined">
						<input type="text" placeholder="" value="<%=phone %>" name="company_phone"   required>
						<span>Phone Number</span>
					</label>
				</div>														
				<div class=" form-group">
		     		<label class="pure-material-textfield-outlined">
						<input type="text" placeholder="" value="<%=company_email %>" name="company_email"   required>
						<span>Email Address</span>
					</label>
				</div>
				<div class=" form-group">
		     		<div class=" form-group">
							<label class="pure-material-textfield-outlined">
								<input type="file" name="logo_file"  >
								<span>Company Logo</span>
					        </label>
					</div>
				</div>
			</div>										
				
		</div>
	</div>
</div>
<br>

<div class="card">
<div class="card-body">
<div class="row">

<div class="col-12 col-lg-6">
     <div class=" form-group">
			<label class="pure-material-textfield-outlined">
					<select required class="browser-default custom-select"    name="country" >
					<% if(country.equalsIgnoreCase("Myanmar")){ %>
								  <option value="Myanmar" selected>Myanmar</option>
								   <option value="Singapore">Singapore</option>
								   <option value="China">China</option>
						<%}else if(country.equalsIgnoreCase("Singapore")){ %>
						 		   <option value="Myanmar" >Myanmar</option>
								   <option value="Singapore" selected>Singapore</option>
								   <option value="China">China</option>
						<%}else{ %>
									<option value="Myanmar" >Myanmar</option>
								   <option value="Singapore" >Singapore</option>
								   <option value="China" selected>China</option>
								   <%} %>
					</select>
					<span>Country</span>
            </label>
	 </div>	

 <%
 

try{  
		
			
									
%>
			
	<div class="form-group"> 
		<label class="pure-material-textfield-outlined">
			<select required class="custom-select custom-select-md"  name="select1" id="select1"  >
				<%-- <option selected><%=rs.getString("staff_division")%></option> --%> 
						
			<%
						PreparedStatement pre =conn.prepareStatement("Select* from state");
						ResultSet r_state=pre.executeQuery();
				while(r_state.next())
				{
					String state_name=r_state.getString("state_name").trim();
					String staff_division=division;
					
						if(state_name.equalsIgnoreCase(staff_division))
						{
							
							%>
							<option value="<%=r_state.getString("state_name") %>" about="<%=r_state.getString("state_code")%>" selected><%=r_state.getString("state_name") %></option>
						
							<%}else{ %>	
							<option value="<%=r_state.getString("state_name") %>" about="<%=r_state.getString("state_code")%>" ><%=r_state.getString("state_name") %></option>
						
							<%
						}
				}
				
		%>
																       
				</select>
		  		<span>State/Division</span>
	    	 </label>			
		</div>
		<div class="form-group"> 
		<label class="pure-material-textfield-outlined">
			<select required class="custom-select custom-select-md"  name="select2" id="select2"  disabled>   
   				 <%-- <option  selected><%=rs.getString("staff_township")%></option> --%> 
  
 <% 
				  	PreparedStatement ps;
					ps=conn.prepareStatement("select * from  township "); 		
					ResultSet r_township=ps.executeQuery();  
					String township_name=township;
					System.out.println("Edit page township_name="+township_name);
					while(r_township.next()){  
			
					String id=r_township.getString("state_code")+r_township.getString("township_code");
					
					
					
					
					if(r_township.getString("township_name").equalsIgnoreCase(township_name)){
						
%>
						<option value="<%=r_township.getString("township_name") %>" id="<%=id%>" about="<%=r_township.getString("state_code")%>" state="<%=id%>" selected><%=r_township.getString("township_name") %></option>
		<%}else{ %>
						<option value="<%=r_township.getString("township_name") %>" id="<%=id%>" about="<%=r_township.getString("state_code")%>" state="<%=id%>" ><%=r_township.getString("township_name") %></option>
	
				<%	}}%>
                                             
	 		</select>	
	 		<span>Township</span>
	     	</label>					
		</div>
	</div>
	
<div class="col-12 col-lg-6">
    <div class="form-group"> 
		<label class="pure-material-textfield-outlined">
											
			<select class="custom-select custom-select-md"   name="select3" id="select3"  disabled>
	 			<%-- <option  selected> <%=rs.getString("staff_ward")%></option>  --%>
	 			<option  selected value="">  </option>
	 			<%
					PreparedStatement ps1=conn.prepareStatement("select * from  ward "); 		
					ResultSet r_ward=ps1.executeQuery();  
					
		
					while(r_ward.next()){  
						
						String id1="";
						String id2;
						id1=r_ward.getString("state_code")+r_ward.getString("township_code");
						id2=r_ward.getString("state_code")+r_ward.getString("township_code")+r_ward.getString("ward_code");
						String ward_name=r_ward.getString("ward_name");
				%>
						
				
						<option value="<%=r_ward.getString("ward_name") %>" id="<%=id1%>" about="<%=id2%>" ward="<%=id2%>" ><%=r_ward.getString("ward_name") %></option>
					
					<%}%>
	 		</select>		
 			<span>Ward</span>
	   </label>						
	</div>


	<div class="form-group"> 
		<label class="pure-material-textfield-outlined">
			<select class="custom-select custom-select-md"  name="select4" id="select4" disabled>
		
		 	 <option  selected>  </option>  
   			<%
			
			 	 PreparedStatement ps2=conn.prepareStatement("select * from  street "); 		
				 ResultSet r_street=ps2.executeQuery();  
					while(r_street.next())
					{  
						
								String id1=r_street.getString("state_code")+r_street.getString("township_code")+r_street.getString("ward_code")+r_street.getString("street_code");			
								String id2=r_street.getString("state_code")+r_street.getString("township_code")+r_street.getString("ward_code");
								String street_name=r_street.getString("street_name");
				
				%>
						<option value="<%=r_street.getString("street_name")%>" id="<%=id2%>" about="<%=id1%>" street="<%=id1%>"><%=r_street.getString("street_name") %></option>
				<%}%>
	                                      
		 </select>
  		<span>Street(Optional)</span>
	 </label>															
	</div>
		<div class="form-group"> 
			<label class="pure-material-textfield-outlined">
				<input type="text" id="s_postcode"   value="<%=postal%>"  name="s_postcode" pattern="[0-9]{8}" title="Please enter valid Postalcode"  placeholder=" "required /> 
				<span>ZipCode</span>
			</label>	
		</div>	
	
	
	</div>
   </div>
  </div>
</div>	
<br>

<div class="card">
	<div class="card-body">
		<div class="form-group"><h3>Business Agreement</h3>
			<div class="row">
	
				<div class="col-12 col-lg-6">
			
			
				<table>
					<tr>
						<td style="width:95%">
							<div class="form-group"> 
								<label class="pure-material-textfield-outlined">
				            		<input required type="text" value="<%=delivery_charges %>"  class="form-control"   name="delivery_charges" id="delivery_charges" onkeypress="javascript:return isNumber(event)" >          
									<span>Delivery Charges</span>						
					    		</label>
			    		
			    				<span id="contract_date_error"></span>
							</div>
						</td>
						<td style="width:5%">
							<div class="form-group"> 
								<label class="pure-material-textfield-outlined">
				            		<label   class="form-control"  >%</label>        
														
					    		</label>
			    		
			    				<span id="contract_date_error"></span>
							</div>
						
						</td>
					
					</tr>	
				
				</table>
				

			</div>
			
			<div class="col-12 col-lg-6">
			
			
				<table>
					<tr>
						<td style="width:95%">
							<div class="form-group"> 
								<label class="pure-material-textfield-outlined">
				            		<input required type="text" value="<%=transportation_charges %>"  class="form-control"   name="transportation_charges" id="transportation_charges" onkeypress="javascript:return isNumber(event)" >          
									<span>Transportation Charges</span>						
					    		</label>
			    		
			    				<span id="contract_date_error"></span>
							</div>
						</td>
						<td style="width:5%">
							<div class="form-group"> 
								<label class="pure-material-textfield-outlined">
				            		<label   class="form-control"  >%</label>        
														
					    		</label>
			    		
			    				<span id="contract_date_error"></span>
							</div>
						
						</td>
					
					</tr>	
				
				</table>
				
				</div>
			</div>
		
		</div>	
	</div>
</div>

<br>
<div class="card">
	<div class="card-body">
		<div class="row">

			<div class="col-12 col-lg-6">
			
				<div class="form-group"> 
					<label class="pure-material-textfield-outlined">
	            		<input required type="date" value="<%=contract_date%>" data-date="" class="form-control"   name="contract_date" id="contract_date"  >	           
						<span>Contract Create Date</span>
		    		</label>
		    		<span id="contract_date_error"></span>
				</div>	
				<div class="form-group"> 
					<label class="pure-material-textfield-outlined">
	            		<input required type="date" value="<%=contract_expiredate %>" data-date="" class="form-control"   name="contract_expiredate" id="contract_expiredate"  >	           
						<span>Contract Expire Date</span>
		    		</label>
		    		<span id="contract_expiredate_error"></span>
				</div>

			</div>
			<div class="col-12 col-lg-6">
			
				<div class="form-group"> 
					<label class="pure-material-textfield-outlined">
	            		<input required type="text" value="<%=contact_name %>"  class="form-control"   name="contact_name" id="contract_name"  >	           
						<span>Contact Name</span>
		    		</label>
		    		<span id="contract_date_error"></span>
				</div>	
				<div class="form-group"> 
					<label class="pure-material-textfield-outlined">
	            		<input required type="text" value="<%=contact_phone %>"  class="form-control"   name="contact_phone" id="contact_phone" onkeypress="javascript:return isNumber(event)"  >	           
						<span>Contact Phone Number</span>
		    		</label>
		    		<span id="contract_phone_error"></span>
				</div>

			</div>
		
		</div>	
	</div>
</div>

<br>	

	<input  type="text" name="createdby" value="<%=createdby %>"  hidden >	
	<input  type="text" name="createdate" value="<%=createdate %>"  hidden >
		
<div align="center">
        <!-- <button  type="submit"   class="btn btn-success" id="Button1"  onclick="sumbit()" >Submit</button>&emsp; -->
        <button  type="submit"   class="btn btn-success" id="Button1"   >Submit</button>&emsp;
		
	</div>
											
</form>


<script>
$(document).ready(function(){
	
	var s1_id="hello";
	var s2_id;
	var s3_id;
	var s4_id;
	var post_code;
	var f_state;
	var t_state;
	var f_township;
	var t_township;
	
	$('#s_postcode').on('input', function() {
		 $('#select2').prop("disabled", true);
		 $('#select3').prop("disabled", true);
		 $('#select4').prop("disabled", true);
		 $("#select1").val("---Select---").prop("selected", true);
		 $("#select2").val("---Select---").prop("selected", true);
		 $("#select3").val("---Select---").prop("selected", true);
		 $("#select4").val("---Select---").prop("selected", true);
		 
		var input1=document.getElementById("s_postcode").value;
		 
		var f=input1.substring(0,2);
		var f1=input1.substring(0,4);
		var f2=input1.substring(0,6);
		var f3=input1.substring(0,8);
		
		var s1=input1.substring(0,2);
		var s2=input1.substring(2,4);
		var s3=input1.substring(4,6);
		var s4=input1.substring(6,8);
		
		f_state=$("#select1 option").filter('[about=' + f + ']').prop("selected", true).attr("value");
		
		if(s2=="00" || s2=="0" || s2==""){} 
		else 
			{
				$('#select2').removeAttr("disabled");	
				
				
				f_state=$('#select1').children(":selected").attr("value");
				s1_id=$('#select1').children(":selected").attr("about");
				
				
				
				  if ($('#select1').data('options') === undefined) {
				    /*Taking an array of all options-2 and kind of embedding it on the select1*/
				    $('#select1').data('options', $('#select2 option').clone());
				  }	 
			  	var options = $('#select1').data('options').filter('[about=' + s1_id + ']');  
			  	$('#select2').html(options);
			  	f_township=$("#select2 option").filter('[id=' + f1 + ']').prop("selected", true).attr("value");
			 		//$("#select2").val($("#select2 option:first").prop("selected",true));
				
			}
		
		if(s3=="00" || s3=="0"|| s3=="" ){} 
		else {
			
			$('#select3').removeAttr("disabled");
			
			 f_township=$('#select2').children(":selected").attr("value");
			  if ($('#select2').data('options') === undefined) {
			    /*Taking an array of all options-2 and kind of embedding it on the select1*/
			    $('#select2').data('options', $('#select3 option').clone());
			  }
			  
			  s2_id=$('#select2').children(":selected").attr("id");		  
			  var option = $('#select2').data('options').filter('[id=' + s2_id + ']');
			  $('#select3').html(option);
			  $("#select3 option").filter('[about=' + f2 + ']').prop("selected", true).attr("value");
		}
		
		if(s4=="00" || s4=="0" || s4==""){} 
		else 
			{
				$('#select4').removeAttr("disabled");
				
				if ($('#select3').data('options') === undefined) {
				    /*Taking an array of all options-2 and kind of embedding it on the select1*/
				    $('#select3').data('options', $('#select4 option').clone());
				  }
				
				s3_id=$('#select3').children(":selected").attr("about");
				var option = $('#select3').data('options').filter('[id=' + s3_id + ']');
				$('#select4').html(option);
				$("#select4 option").filter('[about=' + f3 + ']').prop("selected", true).attr("value");
				
			}
	});


	$("#select1").change(function() {
		
		$('#select2').removeAttr("disabled");
		f_state=$(this).children(":selected").attr("value");
		s1_id=$(this).children(":selected").attr("about");
		
		if($('#select3').data('options')===undefined){}
		else {
			 $('#select3').prop("disabled", true);
			 $('#select4').prop("disabled", true);
			// $('#select3').attr("value","");
			 $('#select3').html("");
			 $('#select4').html("");
		}
		
		  if ($(this).data('options') === undefined) {
		    /*Taking an array of all options-2 and kind of embedding it on the select1*/
		    $(this).data('options', $('#select2 option').clone());
		  }	 
	  		var options = $(this).data('options').filter('[about=' + s1_id + ']');  
	  		$('#select2').html(options);
	 		$("#select2").val($("#select2 option:first").prop("selected",true));
	 		post_code=s1_id;
		/* var input=document.getElementById("s_postcode");
		//alert(post_code);
		input.value=post_code; */
		$("#s_postcode").val(post_code+"000000");
	  
	  
	  $('#select2').change(function() {	
		  $('#select3').removeAttr("disabled");
		  f_township=$(this).children(":selected").attr("value");
		  if ($(this).data('options') === undefined) {
		    /*Taking an array of all options-2 and kind of embedding it on the select1*/
		    $(this).data('options', $('#select3 option').clone());
		  }
		  
		  s2_id=$(this).children(":selected").attr("id");		  
		  var option = $(this).data('options').filter('[id=' + s2_id + ']');
		  $('#select3').html(option);
		  $("#select3").val($("#select3 option:first").prop("selected",true));
		  post_code=s2_id;
			
			//alert(post_code);
			$("#s_postcode").val(post_code+"0000");
		  
		  $('#select3').change(function() {
			  $('#select4').removeAttr("disabled");
			  if ($(this).data('options') === undefined) {
				    /*Taking an array of all options-2 and kind of embedding it on the select1*/
				    $(this).data('options', $('#select4 option').clone());
				  }
				
				s3_id=$(this).children(":selected").attr("about");
				var option = $(this).data('options').filter('[id=' + s3_id + ']');
				$('#select4').html(option);
				$("#select4").val($("#select4 option:first").prop("selected",true));
			
				post_code=s3_id;
				var input=document.getElementById("s_postcode");
				//alert(post_code);
				$("#s_postcode").val(post_code+"00");
				
				
				$("#select4").change(function() {				
					
								
				  var id3= $(this).children(":selected").attr("about");	 
				  post_code=id3;
				  var input1=document.getElementById("s_postcode");
					//alert(post_code);
					input1.value=post_code;
			  
		  });

				 
				 
		  
		  });//end of #select3
		  
		 
	  
	  });
	  
	  
	});
	
	$("#curr_form").submit(function() {
		  
		  $('.select2').prop("disabled", false);
		  $('.select3').prop("disabled", false);
		  $('.select4').prop("disabled", false);
		  
	});
	
	
	 $("#nick_name").focusout(function() {
 		//var urname= $('#focusout').val();
 		var urname=document.getElementById("nick_name").value;
 		//city_name.value = city_name;
 		 $.ajax({
			    		url: "fetch_companyAdd.jsp",
			    		type: 'POST',
			    		data: {urname: urname},
			    		success: function(data) {
			    		//$('#city_name').val(data);
			    		//alert(data);
			    			var ur_name = data.trim();
			    		//alert(ur_name);
				    		var error = document.getElementById("nick_name_error");
				            if (ur_name=="ok")  
				            { 
				            	// Changing content and color of content 
				            	document.getElementById("nick_name").value="";
				                error.textContent = "***Nickname already exists***";                
				                error.style.color = "red" ;
				                	
				            } else { 
				            	   
				            	error.textContent = ""; 
				            	} 
			    		}
 		}); 
 		
 		//alert(urname);
 	});
	
	   
});
</script>

<script type="text/javascript">

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

		function getInfo(){  
			if(request.readyState==4){  
				popup_save();
				location.reload();
		
			}  
		}
		
		function popup_save()
		{
			alert("Successfully  Insert");
			// alert(encoded_url);
		}
</script>



 
<br>


							
										
										
</div>
</div>
</div>
</div>
	
		<div align="center"><button  type="submit"   class="btn btn-success"  >Submit</button>&emsp;</div>
</form>





<% conn.close();}catch(Exception e){e.printStackTrace();}  
%>
 
 
  

	<!--   Core JS Files   -->
	<script src="assets/js/core/jquery.3.2.1.min.js"></script>
	<script src="assets/js/core/popper.min.js"></script>
	<script src="assets/js/core/bootstrap.min.js"></script>
	<!-- jQuery UI -->
	<script src="assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
	<script src="assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>
	
	<!-- jQuery Scrollbar -->
	<script src="assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
	<!-- Atlantis JS -->
	<script src="assets/js/atlantis.min.js"></script>
	<!-- Atlantis DEMO methods, don't include it in your project! -->
	<script src="assets/js/setting-demo2.js"></script>
</body>
</html>