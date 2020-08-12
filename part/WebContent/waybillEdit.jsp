<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page  import="java.sql.Connection"%>
        <%@ page  import="java.sql.PreparedStatement" %>
       	<%@ page import="java.sql.*"%>
		<%@ page import="java.io.*"%>
    	<%@ page  import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime"%>
<%@ page  import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.Base64"%>

<%  
		
           
HttpSession ssss=request.getSession(false);  	
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
	
	<title>Delivery  System</title>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>

</head>
                                            <!----------------- Session    ------------------------------->
<%

	//String company_type = (String) ssss.getAttribute("companyType");
	String s1 = request.getParameter("payment_code");
	String staff_name=(String)ssss.getAttribute("staff_name");

%>

<body>

	<div class="wrapper sidebar_minimize">
		<div class="main-header">
		
			<!-- Logo Header -->
			
			<div class="logo-header" data-background-color="blue">
			
                <a href="adminHome.jsp" class="logo"><h2></h2><p></p>
					<h2 class="text-white pb-2 fw-bold">Delivery System</h2>
				</a>
				
				<button class="navbar-toggler sidenav-toggler ml-auto" type="button"
					data-toggle="collapse" data-target="collapse" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"> <i class="icon-menu"></i>
					</span>
				</button>
				
				<button class="topbar-toggler more">
					<i class="icon-options-vertical"></i>
				</button>
				<div class="nav-toggle">
					<button class="btn btn-toggle toggle-sidebar">
						<i class="icon-menu"></i>
					</button>
					
				</div>
			</div>
			<!-- End Logo Header -->
			

			<!-- --------------------------------Navbar Header ------------------------------------------------------------------------>
			
			<nav class="navbar navbar-header navbar-expand-lg"
				data-background-color="blue2">

				<div class="container-fluid">

					<ul class="navbar-nav topbar-nav ml-md-auto align-items-center">

                                               <!--Start  Message   box dropdown    -->
						<li class="nav-item dropdown hidden-caret"><a
							class="nav-link dropdown-toggle" href="#" id="messageDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fa fa-envelope"></i><span
								class="notification">1</span>
						</a>
							<ul class="dropdown-menu messages-notif-box animated fadeIn"
								aria-labelledby="messageDropdown">
								<li>
									<div
										class="dropdown-title d-flex justify-content-between align-items-center">
										Messages <a href="#" class="small">Mark all as read</a>
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
													<span class="subject">Jimmy Denis</span> <span
														class="block"> How are you ? </span> <span class="time">5
														minutes ago</span>
												</div>
											</a> 
											
										</div>
									</div>
								</li>
								
								<li><a class="see-all" href="javascript:void(0);">See
										all messages<i class="fa fa-angle-right"></i>
								</a></li>
							</ul></li>
							  <!--End  Message   box dropdown    -->
							
							
							  <!------------------  Start  noti   box dropdown  ------------------  -->
						<li class="nav-item dropdown hidden-caret"><a
							class="nav-link dropdown-toggle" href="#" id="notifDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fa fa-bell"></i> <span
								class="notification">4</span>
						</a>
							<ul class="dropdown-menu notif-box animated fadeIn"
								aria-labelledby="notifDropdown">
								<li>
									<div class="dropdown-title">You have 4 new notification</div>
								</li>
								<li>
									<div class="notif-center">
										<a href="#">
											<div class="notif-icon notif-primary">
												<i class="fa fa-user-plus"></i>
											</div>
											<div class="notif-content">
												<span class="block"> New user registered </span> <span
													class="time">5 minutes ago</span>
											</div>
										</a> <a href="#">
											<div class="notif-icon notif-success">
												<i class="fa fa-comment"></i>
											</div>
											<div class="notif-content">
												<span class="block"> Rahmad commented on Admin </span> <span
													class="time">12 minutes ago</span>
											</div>
										</a> <a href="#">
											<div class="notif-icon notif-danger">
												<i class="fa fa-heart"></i>
											</div>
											<div class="notif-content">
												<span class="block"> Farrah liked Admin </span> <span
													class="time">17 minutes ago</span>
											</div>
										</a>
									</div>
								</li>
								<li><a class="see-all" href="javascript:void(0);">See
										all notifications<i class="fa fa-angle-right"></i>
								</a></li>
							</ul></li>
                                                     <!--End  Noti   box dropdown    -->



						<li class="nav-item dropdown hidden-caret"><a
							class="dropdown-toggle profile-pic" data-toggle="dropdown"
							href="#" aria-expanded="false">
								<div class="avatar-sm">
									<img src="assets/img/profile.jpg" alt="..."
										class="avatar-img rounded-circle">
								</div>
								</a>
								
							<ul class="dropdown-menu dropdown-user animated fadeIn">
								<div class="dropdown-user-scroll scrollbar-outer">
									<li>
										<div class="user-box">
											<div class="avatar-lg">
												<img src="assets/img/profile.jpg" alt="image profile"
													class="avatar-img rounded">
											</div>
											<div class="u-text">
												<h4><%=username %></h4>
												</p>
												<a href="#" class="btn btn-xs btn-secondary btn-sm">View
													Profile</a>
											</div>
										</div>
									</li>
									<li>
										<div class="dropdown-divider"></div> <a class="dropdown-item"
										href="#">My Profile</a> <a class="dropdown-item" href="#">Inbox</a>
										<div class="dropdown-divider"></div> <a class="dropdown-item"
										href="#">Account Setting</a>
										<div class="dropdown-divider"></div> <a class="dropdown-item"
										href="kill_session">Logout</a>
									</li>
								</div>
							</ul></li>
					</ul>
				</div>
			</nav>
			<!-- End Navbar -->
		</div>
		
    <!-- -----------------------------------------------------------Sidebar ------------------------------------------------------>
 
 
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

		
		
			<!-- -------------------------------------------	Start  Main-dashboard--------------------------------------------- -->
	
		<div class="main-panel">
		
			<div class="content">
				<div class="page-inner">
					<div class="page-header">
						<ul class="breadcrumbs">
							<li class="nav-home"><a href="#"> <i
									class="flaticon-home"></i>
							</a></li>
							<li class="separator"><i class="flaticon-right-arrow"></i></li>
							<li class="nav-item"><a
								href="agentDetail.jsp?agent_code=<%=s1%>">View Agent Detail</a></li>
							<%
								if (companyType.equals("main")) {
							%>
							<li class="separator"><i class="flaticon-right-arrow"></i></li>
							<li class="nav-item"><a href="addAgent.jsp">Add</a></li>
							<%
								}
							%>
						</ul>
					</div>


					<% 
					
					DateTimeFormatter FOMATTER = DateTimeFormatter.ofPattern("MM/dd/yyyy 'at' hh:mm a");
					   
					//Local date time instance
				LocalDateTime localDateTime = LocalDateTime.now();										  
					 //Get formatted String
				String date = FOMATTER.format(localDateTime);										  
				System.out.println("Local Time:"+date); 
					
					
		try{
		//Connection con=DriverManager.getConnection("jdbc:mysql://localhost/delivery","root","root");
//Connection con=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
Connection con=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
		String query_payment="Select * from paymentmode";
		
		Statement stmt = con.createStatement();
		Statement stmt1 = con.createStatement();
	
		ResultSet rs = stmt.executeQuery(query_payment);
		ResultSet rs1 = stmt1.executeQuery(query_payment);
		
		      while (rs.next()) {
		      String  payment=rs.getString("payment_code");
		      if(payment.equalsIgnoreCase(s1)){
		      %>

					<div class="card">
						<div class="card-body">
							<div class="card-title">Edit WayBill Type</div>
						</div>
					</div>

<form action="EEE" method="post" enctype='multipart/form-data' id="curr_form" >
						<!-- go  to  update Agent.java -->

						<!-- -------------------------------------First  Card---------------------------------- -->
						<div class="card">
							<div class="card-body">
								<div class="row">
									<div class="col-12 col-lg-6">
										<!--  start   one row -->
										<div class="form-group">
											
	               
	               
	                                      
							                
							                <label class="pure-material-textfield-outlined"> 
											
											<input type="hidden" name="modifydate" value="<%=date%>"> 
							                <input type="hidden" name="updateby" value="<%=staff_name %>"> 
										<input type="text" placeholder=""  required="required"
												 oninvalid="this.setCustomValidity('Please Enter company Code')" oninput="setCustomValidity('')" 
												value="<%=rs.getString("company_code")%>" name="payment_companycode" id="payment_companycode">
											 <span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Company Code</span>		
                    
	               </label>
	               
										</div>

										

										<div class=" form-group">
											<label class="pure-material-textfield-outlined"> 
											<input type="text" placeholder="" value="<%=rs.getString("payment_description")%>" id="payment_description"name="payment_description"required  oninvalid="this.setCustomValidity('Please Enter Pyment Description')"
 													oninput="setCustomValidity('')" oninvalid="style.border-color=red" onkeypress="javascript:return isLetter(event)">
                          					<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Waybill Description</span>
            </label>
                                         <span id="payment_description_error"></span>
										</div>
										
									</div>

									<div class="col-12 col-lg-6">
                                 
										<div class=" form-group">
											<label class="pure-material-textfield-outlined"> 
											
											<% String paycode=request.getParameter("payment_code");
											ssss.setAttribute("p_code", paycode);
											%>
											<input type="text" placeholder="" class="form-control" value="<%=rs.getString("payment_code")%>" id="payment_companycode" name="payment_code" maxlength="2"  onkeypress="javascript:return noLetter(event)"  required oninvalid="this.setCustomValidity('Please Enter payment code')" oninput="setCustomValidity('')">
	              						 <span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Waybill Code</span>
											<span id="paymentcode_error"></span> 
            </label>

										</div>
										
										<div class="form-group">
											<label class="pure-material-textfield-outlined">
											<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Valid Code</span>
											 </label>
											 
											 	<%
 	                                        
											String pay_valid=rs.getString("valid_code");
											
											
 				               %>
										
										
										<%if (pay_valid.equalsIgnoreCase("t")){ %>
					               <input type="radio" checked name="payment_validcode"  value="t">valid &nbsp;&nbsp;
                                         <input type="radio" name="payment_validcode"  value="f">invalid
									<%} else if(pay_valid.equalsIgnoreCase("f")){%>	 
									<input type="radio"  name="payment_validcode"  value="t">valid &nbsp;&nbsp;
                                         <input type="radio" name="payment_validcode" checked value="f">invalid
										
										<% } else {%> <h1>404</h1><%} %>
											 
											 

										</div>
										

										

									</div>
								</div>
							</div>
						</div>


						<!-- -------------------------------------Second  Card---------------------------------- -->
						
	

						<!--  end   3 row -->
						&emsp;&emsp;&emsp;
						<div align="center">
							<button type="submit" class="btn btn-success" id="Button1">Submit
								Data</button>
							&emsp;

						</div>
					</form>
					<%                   }
													}con.close();
													} catch (SQLException e) {
														e.printStackTrace();
													}
												%>
				</div>
				</div>
				</div>

<script>


$(document).ready(function(){
	
	$("#payment_code").focusout(function() {
		//alert("hello");
			//var urname= $('#focusout').val();
			var payment_code=document.getElementById("payment_code").value;// payment_companycode
			var payment_companycode=document.getElementById("payment_companycode").value;
			//alert(payment_companycode);
			//city_name.value = city_name;
			 $.ajax({
			    		url: "fetch_waybillAdd.jsp",
			    		type: 'POST',
			    		data: {payment_companycode: payment_companycode,payment_code:payment_code},
			    		success: function(data) {
			    		//$('#city_name').val(data);
			    		//alert(data);
			    			var ur_name = data.trim();
			    		//alert(ur_name);
				    		var error = document.getElementById("paymentcode_error");
				            if (ur_name=="ok")  
				            { 
				            	// Changing content and color of content 
				            	document.getElementById("payment_code").value="";
				                error.textContent = "***Payment Code's already existed***";                
				                error.style.color = "red" ;
				                	
				            } else { 
				            	   
				            	error.textContent = ""; 
				            	} 
			    		}
			}); 
			
			//alert(urname);
		});//End of Address Combobox
		
		
		$("#payment_description").focusout(function() {
			//alert("hello");
				//var urname= $('#focusout').val();
				var payment_description=document.getElementById("payment_description").value;// payment_companycode
				var payment_companycode=document.getElementById("payment_companycode").value;
				//alert(payment_companycode);
				//city_name.value = city_name;
				 $.ajax({
				    		url: "fetch_waybillAdd_paymentDescription.jsp",
				    		type: 'POST',
				    		data: {payment_companycode: payment_companycode,payment_description:payment_description},
				    		success: function(data) {
				    		//$('#city_name').val(data);
				    		//alert(data);
				    			var ur_name = data.trim();
				    		//alert(ur_name);
					    		var error = document.getElementById("payment_description_error");
					            if (ur_name=="ok")  
					            { 
					            	// Changing content and color of content 
					            	document.getElementById("payment_description").value="";
					                error.textContent = "***Payment Code Description's already existed***";                
					                error.style.color = "red" ;
					                	
					            } else { 
					            	   
					            	error.textContent = ""; 
					            	} 
				    		}
				}); 
				
				//alert(urname);
			});//End of Address Combobox
		
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

function noLetter(evt) {
    var iKeyCode = (evt.which) ? evt.which : evt.keyCode

    	if( 65 > iKeyCode || 90 < iKeyCode ){
    		if( 97 > iKeyCode || 122 < iKeyCode){ 
    			return ture;
    			}
    		return false;
    	}
    	

    return false;
}  
	 
</script>

				
	<script src="assets/js/core/jquery.3.2.1.min.js"></script>
	<script src="assets/js/core/popper.min.js"></script>
	<script src="assets/js/core/bootstrap.min.js"></script>
	<!-- jQuery UI -->
	<script src="assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
	<script src="assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>
	
	<!-- jQueryScrollbar -->
	<script src="assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
	<!-- AtlantisJS -->
	<script src="assets/js/atlantis.min.js"></script>
	<!-- AtlantisDEMO methods, don't include it in your project! -->
	<script src="assets/js/setting-demo2.js"></script>
</body>
</html>