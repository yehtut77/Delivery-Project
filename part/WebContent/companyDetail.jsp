<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page  import="java.sql.Connection"%>
    <%@ page  import="java.sql.PreparedStatement" %>
    <%@ page import="java.sql.*"%>
	<%@ page import="java.io.*"%>
	<%@ page import="java.util.Base64"%>
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
    <script src="assets/js/core/jquery.min.js"></script>
    <!-- Popper -->
    <script src="assets/js/core/popper.min.js"></script>
    <!-- Bootstrap -->
    <script src="assets/js/core/bootstrap.min.js"></script>
    <!-- All Plugins -->
    <script src="assets/js/core/delivery.bundle.js"></script>
    <!-- Active -->
    <script src="js/default-assets/active.js"></script>
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
	
	<style>
   /*  table{
        width: 100%;
        margin: 20px 0;
        border-collapse: collapse;
    }
    table, th, td{
        border: 1px solid #cdcdcd;
    }
    table th, table td{
        padding: 5px;
    } */
</style>
	
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/atlantis.min.css">
	<!-- CSS Just for demo purpose, don't include it in your project -->
	<link rel="stylesheet" href="assets/css/demo.css">
</head>



<%  
		HttpSession ssss=request.getSession(false);  
		String companyname=(String)ssss.getAttribute("companyType"); 
			String company_code=request.getParameter("company_code");
			//System.out.println("company_code from list="+company_code);
			
%>

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
												<p class="text-muted"></p><a href="profile.html" class="btn btn-xs btn-secondary btn-sm">View Profile</a>
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
			
		<form action="companyEdit.jsp" >
		
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
								<a href="M_staff.jsp">Staff Detail</a>
							</li>
							<li class="separator">
								<i class="flaticon-right-arrow"></i>
							</li>
							<li class="nav-item">
								<a href="staffAdd.jsp">Add</a>
							</li>
						</ul>
				<div class="ml-md-auto py-2 py-md-0">
						<%	if(companyname.equalsIgnoreCase("main"))
						{%>
						
								<!-- <button type="submit"  align="center" class="btn btn-secondary btn-round">Edit Company</button> -->
								<a href="companyEdit.jsp?company_code=<%=company_code%>"   class="btn btn-secondary btn-round"  >Edit Company</a>
								
						<%}else{ %>
						
								<a href="companyEdit.jsp?company_code=<%=company_code%>"   class="btn btn-secondary btn-round"  >Edit Company</a>
								
						<%} %>
								
								<%	if(companyname.equalsIgnoreCase("main"))
						{%>
						 	<a href="companyDelete.jsp?company_code=<%=company_code%>"   class="btn btn-secondary btn-round"  onclick="return confirm('Are you sure you want to delete this Company?');">Delete Company</a>
						 	
						 <%}else{ %>
									
									<a   class="btn btn-secondary btn-round" >Delete Company</a>
							<%} %>	
				</div>
		</div>
					
					
																	
																	<%
																	//Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/delivery", "root", "root");
																	//Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery","teamrame_yhk2","J@v@1234");
																		Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
																		int id=0;
																
																	//System.out.println(company_code);
																	Statement st=conn.createStatement();
																	ResultSet rsss=st.executeQuery("select * from company where company_code=\'"+ company_code + "\' ");
																	
																	
																	
																	Blob  image = null;
																	byte[] imgData = null;
																	String base64Image=null;
																	
																	//while(rsss.next()){
																		 if(rsss.next())
																		 {
																			 
																			 
																			 Blob blob=rsss.getBlob("logo");
																				
																				InputStream inputStream=blob.getBinaryStream();
																				
																				ByteArrayOutputStream outputStream=new ByteArrayOutputStream();
																				byte[] buffer=new byte[4096];
																				
																				int bytesRead= -1;
																				
																				while ((bytesRead=inputStream.read	(buffer)) != -1) {
																					outputStream.write(buffer,0,bytesRead);
																				}
																				byte[] imageBytes=outputStream.toByteArray();
																				base64Image=Base64.getEncoder().encodeToString(imageBytes);
																		 
																			 
																				
																		
																		 
																			 id=rsss.getInt("id"); 
																	%>			
					
<!-------------------------------------------------------------------- Card  Registration------------------------------------------------------------------------------------------------------------------------------------------- -->
	
			
					
<div class="card">
		<div class="card-header">
		<div class="card-title">Company Details</div>
		</div>
								
		<div class="card-body">	
		<div class="row">							
			<div class="col-12 col-lg-6">	
				<div class="form-group">				           
				<div class=" row">
					<div class="col-4">
						<label> Company Code</label>
					</div>
					<div class="col-4">
						<h4><%=rsss.getString("company_code")%></h4>
					</div>
				</div>
				<div class=" row">
					<div class="col-4">
						<label> Company Name</label>
					</div>
					<div class="col-4">
							<h4><%=rsss.getString("company_name")%></h4>
					</div>
				</div>
				</div>
			</div>	
			
			<div class="col-12 col-lg-6">	
				<div class="form-group">				           
					<div class=" row">
						<div class="col-4">
							<label>Company Nickname</label>
						</div>
						<div class="col-4">
							<h4><%=rsss.getString("nick_name")%></h4>
						</div>
					</div>
					<div class=" row">
						<div class="col-4">
							<label> Company Type</label>
						</div>
						<div class="col-4">
								<h4><%=rsss.getString("company_type")%></h4>
						</div>
					</div>
				</div>
			</div>				
			</div>										
		</div>
</div>
<br>	

<div class="card">
		<div class="card-header">
		<div class="card-title">Company Address</div>
		</div>
								
		<div class="card-body">	
		
			<div class="row">							
				<div class="col-12 col-lg-6">
					
					<div class="form-group">				           
							<div class=" row">
								<div class="col-4">
									<label>Address 1</label>
								</div>
								<div class="col-4">
									<h4><%=rsss.getString("company_addr1")%></h4>
								</div>
							</div>
							<div class=" row">
								<div class="col-4">
									<label> Address 2</label>
								</div>
								<div class="col-4">
										<h4><%=rsss.getString("company_addr2")%></h4>
								</div>
							</div>
							<div class=" row">
								<div class="col-4">
									<label> Address 3</label>
								</div>
								<div class="col-4">
										<h4><%=rsss.getString("company_addr3")%></h4>
								</div>
							</div>
							<div class=" row">
								<div class="col-4">
									<label> Address 4</label>
								</div>
								<div class="col-4">
										<h4><%=rsss.getString("company_addr4")%></h4>
								</div>
							</div>
					</div>
				</div>	
				
				<div class="col-12 col-lg-6">	
					<div class="form-group">				           
					<div class=" row">
						<div class="col-4">
							<label>Phone number</label>
						</div>
						<div class="col-4">
							<h4><%=rsss.getString("company_phone")%></h4>
						</div>
					</div>
					<div class=" row">
						<div class="col-4">
							<label>Email Address</label>
						</div>
						<div class="col-4">
							<h4><%=rsss.getString("company_email")%></h4>
						</div>
					</div>
					<div class=" row">
						<div class="col-4">
							<label>Logo</label>
						</div>
						<div class="col-4">
							<img width="200px"	src="data:img/jpg;base64, <%=base64Image%>" />
						</div>
					</div>
				</div>
			</div>
		</div>
</div>
</div>
<br>



<div class="card">
		<div class="card-header">
		<div class="card-title">Company Address</div>
		</div>
								
		<div class="card-body">	
		
				<div class="row">							
					<div class="col-12 col-lg-6">
						<div class="form-group">
								<div class=" row">
									<div class="col-4">
										<label>Country</label>
									</div>
									<div class="col-4">
										<h4><%=rsss.getString("company_country")%></h4>
									</div>
								</div>
								<div class=" row">
									<div class="col-4">
										<label>State/Division</label>
									</div>
									<div class="col-4">
										<h4><%=rsss.getString("company_division")%></h4>
									</div>
								</div>	
						</div>
					</div>
					
					<div class="col-12 col-lg-6">
						<div class="form-group">
								<div class=" row">
									<div class="col-4">
										<label>Township</label>
									</div>
									<div class="col-4">
										<h4><%=rsss.getString("company_township")%></h4>
									</div>
								</div>
								<div class=" row">
									<div class="col-4">
										<label>Postal Code</label>
									</div>
									<div class="col-4">
										<h4><%=rsss.getString("company_postal")%></h4>
									</div>
								</div>	
						</div>
					</div>
					
				</div>	
		
		</div>
</div>
<br>	


<div class="card">
		<div class="card-header">
		<div class="card-title">Business Agreement</div>
		</div>
								
		<div class="card-body">	
		
			<div class="row">			
					<div class="col-12 col-lg-6">
						<div class="form-group">
								<div class=" row">
									<div class="col-4">
										<label>Delivery Charges</label>
									</div>
									<div class="col-4">
										<h4><%=rsss.getString("delivery_charges")%></h4>
									</div>
								</div>
								
						</div>
					</div>
					<div class="col-12 col-lg-6">
						<div class="form-group">
								
								<div class=" row">
									<div class="col-4">
										<label>Transportation Charges</label>
									</div>
									<div class="col-4">
										<h4><%=rsss.getString("transportation_charges")%></h4>
									</div>
								</div>	
						</div>
					</div>					
			</div>			
		</div>
</div>
<br>	

<div class="card">
		<div class="card-header">
		<div class="card-title"></div>
		</div>
								
		<div class="card-body">	
		
			<div class="row">
			
					<div class="col-12 col-lg-6">
						<div class="form-group">
								
								<div class=" row">
									<div class="col-4">
										<label>Contract Create Date</label>
									</div>
									<div class="col-4">
										<h4><%=rsss.getString("contract_createdate")%></h4>
									</div>
								</div>	
								<div class=" row">
									<div class="col-4">
										<label>Contract Expire Date</label>
									</div>
									<div class="col-4">
										<h4><%=rsss.getString("contract_expiredate")%></h4>
									</div>
								</div>	
						</div>
					</div>
					
					<div class="col-12 col-lg-6">
						<div class="form-group">
								
								<div class=" row">
									<div class="col-4">
										<label>Contact Name</label>
									</div>
									<div class="col-4">
										<h4><%=rsss.getString("contact_name")%></h4>
									</div>
								</div>
								<div class=" row">
									<div class="col-4">
										<label>Contact Phone Number</label>
									</div>
									<div class="col-4">
										<h4><%=rsss.getString("contact_phone")%></h4>
									</div>
								</div>	
						</div>
					</div>					
			
			</div>
		</div>
</div>
<br>

<br>
															
				
<!-------------------------------------------------------------------- Card  Registration------------------------------------------------------------------------------------------------------------------------------------------- -->
				
			
			<input type="text" value="<%=company_code%>" name="company_code" hidden="hidden" >
			
			
											  
											  
<%} conn.close(); %>								
</div></form></div></div></div>											  
												
						
								
<!----------------------------------------------------------------- End  Card  body----------------------------------------------------------------------------------------------------------------- -->
								
																	
						
	
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>	
	
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