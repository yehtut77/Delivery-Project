<%@ page language="java" contentType="text/html; charset=ISO-8859-1"   pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>


<%  

String username = (String)session.getAttribute("unsername");			
String companyType=(String)session.getAttribute("companyType");
String companyCode=(String)session.getAttribute("companyCode");
String staffName=(String)session.getAttribute("staffName");
		
		HttpSession ssss=request.getSession(false);  
		//String ccode=(String)ssss.getAttribute("companycode"); 
        //  String company_code=(String)ssss.getAttribute("companyCode");  
		 
%>
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
						<%String n=(String)session.getAttribute("amname");   %>		</div>
							</a>
							<ul class="dropdown-menu dropdown-user animated fadeIn">
								<div class="dropdown-user-scroll scrollbar-outer">
									<li>
										<div class="user-box">
											<div class="avatar-lg"><img src="assets/img/profile.jpg" alt="image profile" class="avatar-img rounded"></div>
											<div class="u-text">
												<h4><%=n %></h4>
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
		
		
		
		
		<!-- -------------------------------------------Sidebar --------------------------------------------------->



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

		

		<!-- -------------------------------------------End Sidebar------------------------------------------- -->

		
		
		<!-- 	Start  Main-dashboard -->
		<div class="main-panel">
		
	<!-- 	Start  Content -->
			<div class="content">
								<div class="panel-header bg-primary-gradient">
									<div class="page-inner py-5">
										<div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
											<div>
												<h2 class="text-white pb-2 fw-bold">Receive mode Detail  Lists</h2>
											
											</div>
											<div class="ml-md-auto py-2 py-md-0">
											          <a href="rcvdAdd.jsp"  class="btn btn-secondary btn-round">Add New Receive</a>
											</div>
										</div>
									</div>
							</div>
							
							
							
							<div class="page-inner mt--5">
					<div class="row mt--2">
						<div class="col-md-12">
							<div class="card full-height">
								<div class="card-body">
									<div class="card-title">Receive   information    in system</div>
									<br>
							<div class="table-responsive">
									<table id="basic-datatables" class="display table table-striped table-hover" cellspacing="0" width="100%">
																	<!-- <thead> -->
											<thead>

												<tr>
												
												
												 	<th>Company Code</th>
													<th>Receive Code</th>

													<th>Receive Description</th>
													 
													 <th>Valid Code</th>
													 <th>View in Detail</th>

													
												</tr>
											</thead>
											
											
											
														<!-- <tbody> -->
											<tbody>
												
											<input type="hidden" name ="company_code" value="<%=companyCode%>"/>	
											
												
												<% 
		try{
			//Connection con=DriverManager.getConnection("jdbc:mysql://localhost/delivery","root","root");
			//Connection con=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_pkyoedb","teamrame_pkyoe","arkar");
            Connection con=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
		
		
		Statement stmt = con.createStatement();
		    
		Blob  image = null;
		byte[] imgData = null;
		String base64Image=null;
		
		ResultSet rs=null;
		PreparedStatement preparedStmt = null;
		if(companyType.equalsIgnoreCase("main"))		
		 preparedStmt=con.prepareStatement("Select * from rcvdmode ");
		else{
			preparedStmt=con.prepareStatement("Select * from rcvdmode where company_code=?");
		 	preparedStmt.setString(1, companyCode); 
		}
		 rs = preparedStmt.executeQuery(); 
		
		      while (rs.next()) {
		    	  
		    	 
		%>
												<tr>
												
												    
													<td><%=rs.getString("company_code")%></td>
													<td><%=rs.getString("rcvd_code")%></td>

													<td><%=rs.getString("rcvd_description")%></td>
													
													<% 
												String s="";
												if(rs.getString("valid_code").equalsIgnoreCase("t")) 
												{
													 s="Valid";
												}else{s="Invalid";}
												
												%>

													<td><%=s%></td>

																							<!-- start  option -->
													<td>
														<div class="form-button-action">
														<form action="RDDETT"  method="post">
														  <input  type="hidden"   value="<%=rs.getString("rcvd_code")%>"   name="rcvd_code">
														   <input  type="hidden"   value="<%=rs.getString("company_code")%>"   name="company_code">
															<button type="submit" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Edit">
																<i class="fa fa-edit"></i>
															</button>
															</form>
														
														</div>
													</td>
													<!-- end option -->

												</tr>
												<%
												
													}
		      con.close();
													} catch (SQLException e) {
														e.printStackTrace();
													}
												%>
											
											</tbody>
										<!--End body -->
									</table>
									
</div>

</div></div></div></div></div>
							
						<!-- 	Card -->
				
			</div>
			<!-- 	End  Content -->
			
			
		
	</div>
			
	<!--   Core JS Files   -->
	<script src="assets/js/core/jquery.3.2.1.min.js"></script>
	<script src="assets/js/core/popper.min.js"></script>
	<script src="assets/js/core/bootstrap.min.js"></script>
	<!-- jQuery UI -->
	<script src="assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
	<script src="assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>
	
	<!-- jQueryScrollbar -->
	<script src="assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
	<!-- Data table -->
	<script src="assets/js/plugin/datatables/datatables.min.js"></script>
	<!-- AtlantisJS -->
	<script src="assets/js/atlantis.min.js"></script>
	<!-- AtlantisDEMO methods, don't include it in your project! -->
	<script src="assets/js/setting-demo2.js"></script>
	
	
	<script >
		
	</script>
</body>
</html>