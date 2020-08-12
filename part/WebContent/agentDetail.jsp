<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page  import="java.sql.Connection"%>
<%@ page  import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>	
<%@ page import="java.util.Base64"%>
	
	
	                       <!-- Start  Session -->
<%  

     HttpSession ssss=request.getSession(false); 
     String username = (String)session.getAttribute("username");
     String staffName = (String)session.getAttribute("staffName");
     String companyType=(String)ssss.getAttribute("companyType"); 
     String  agentCode=(String)ssss.getAttribute("agentCode");
	String companyCode=(String)ssss.getAttribute("companyCode");
		
		
		/* Get  agent code  from   agent List */
		
		String agent_code=request.getParameter("agent_code");
		String company_name=request.getParameter("comp_name");
		System.out.println("Agent Code="+agent_code);
		System.out.println("AgentList CompanyCode-->"+companyCode);	 
		
%>
                      <!-- End  Session -->

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
</style>
	
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/atlantis.min.css">
	
</head>


<!-- -----------------------------------------------Start  Body ------------------------------------------------------>
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
												<h4><%=staffName %></h4>
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
							<li class="nav-item"><a href="agentList.jsp">agent   Detail  List</a></li>
							<%
										if (companyType.equalsIgnoreCase("main")) {
									%>
							<li class="separator"><i class="flaticon-right-arrow"></i></li>
							<li class="nav-item"><a href="addAgent.jsp">Add</a></li>
							<%} %>
						</ul>
						<div class="ml-md-auto py-2 py-md-0">
							<a href="agentEdit.jsp?agent_code=<%=agent_code %>&p_agent_code=<%=request.getParameter("p_agent_code") %>&company_code=<%=request.getParameter("comp_code") %>" align="center"
								class="btn btn-secondary btn-round">Edit Agent</a> <a
								href="agentDelete.jsp?agent_code=<%=agent_code%>"
								onclick="return confirm('Are you sure you want to delete this agent?');"
								class="btn btn-secondary btn-border btn-round mr-2">Delete
								Agent</a>
						</div>
					</div>


					<% 
		try{
		//	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/delivery","root","root");
		Connection con=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
		
		
		Blob  image = null;
		byte[] imgData = null;
		String base64Image=null;
		
		Statement stmt = con.createStatement();
		Statement stmt1 = con.createStatement();
		Statement stmt2 = con.createStatement();
		Statement stmt3= con.createStatement();
		
		
		
		String query_agent="";
		PreparedStatement pre_agList=con.prepareStatement("Select * from agent where company_code=? and agent_code=?");
		pre_agList.setString(1, request.getParameter("comp_code")); 
		pre_agList.setString(2, agent_code);	 
		ResultSet rs=pre_agList.executeQuery();
		

	
		if (rs.next()) 
		{
		    	  
		    	    Blob blob=rs.getBlob("shop_pic");
					
					InputStream inputStream=blob.getBinaryStream();
					
					ByteArrayOutputStream outputStream=new ByteArrayOutputStream();
					byte[] buffer=new byte[4096];
					
					int bytesRead= -1;
					
					while ((bytesRead=inputStream.read	(buffer)) != -1) {
						outputStream.write(buffer,0,bytesRead);
					}
					byte[] imageBytes=outputStream.toByteArray();
					base64Image=Base64.getEncoder().encodeToString(imageBytes);
		      %>

					<!-------------------------------------------------------------------- Card  Registration------------------------------------------------------------------------------------------------------------------------------------------- -->

					<div class="card">
						<div class="card-header">
							<div class="card-title">Agent Details </div>

						</div>
						<div class="card-body">


							<!--  start   first row -->

							<div class=" row">

								<div class="col-12 col-lg-6">

									<div class=" row">

										<div class="col-6 col-lg-3">
											<img width="200px"
												src="data:img/jpg;base64, <%=base64Image%>" />
										</div>
									</div>

								</div>

								<div class="col-12 col-lg-6">

									<div class=" row">
										<div class="col-6 col-lg-3">
											<label>Agent Code</label>
										</div>
										<div class="col-6 col-lg-3">
											<h4>
												<%=rs.getString("agent_code")%></h4>
												<input type="hidden" value="<%=rs.getString("agent_code")%>" name="agent_code">
										</div>
									</div>


									<div class=" row">
										<div class="col-6 col-lg-3">
											<label> Parent Agent</label>
										</div>
										<div class="col-6 col-lg-3"> 
										 
											<h4> <%=rs.getString("parent_agent_code")%></h4>
											<input type="hidden" value="<%=rs.getString("parent_agent_code")%>" name="p_agent_code">
										</div>
									</div>


									<div class=" row">
										<div class="col-6 col-lg-3">
											<label>Company Name</label>
										</div>
										<div class="col-6 col-lg-3">
											<h4><%=company_name%></h4>
											<input type="hidden" value="<%=company_name%>" name="company_name">
										</div>
									</div>

									<div class=" row">
										<div class="col-6 col-lg-3">
											<label> Agent Type</label>
										</div>
									<div class="col-6 col-lg-3">
											<%
												String ma = rs.getString("main_agent");
															if (ma != null) {
											%>
											<h4>Main</h4>
											<%
												} else {
											%>
											<h4>Partner</h4>
											<%
												}
											%>
										</div>
									</div>

								</div>

							</div>
						</div>
					</div>
					<!--  End  first row -->


					<!--  start   second   row -->
					<div class="card">
						<div class="card-header">
							<div class="card-title">Personal Information Details</div>

						</div>
						<div class="card-body">


							<div class="row">
								<div class="col-12 col-lg-6">

									<div class="row">
										<div class="col-4">
											<label>Agent Name</label>
										</div>
										<div class="col-6">
											<h4><%=rs.getString("agent_name")%></h4>
										</div>

									</div>

									<div class="row">
										<div class="col-4">
											<label>Username</label>
										</div>
										<div class="col-6">
											<h4><%=rs.getString("agent_username")%></h4>
										</div>

									</div>

									<div class="row">
										<div class="col-4">
											<label>Password</label>
										</div>
										<div class="col-6">
											<h4><%=rs.getString("agent_password")%></h4>
										</div>

									</div>


								</div>

								<div class="col-12 col-lg-6">

									<div class="row">
										<div class="col-4">
											<label>Agent Owner</label>
										</div>
										<div class="col-6">
											<h4><%=rs.getString("agent_ownername")%></h4>
										</div>

									</div>

									<div class="row">
										<div class="col-4">
											<label>Email</label>
										</div>
										<div class="col-6">
											<h4><%=rs.getString("agent_email")%></h4>
										</div>

									</div>

									<div class="row">
										<div class="col-4">
											<label>Phone</label>
										</div>
										<div class="col-6">
											<h4><%=rs.getString("agent_phone")%></h4>
										</div>

									</div>

								</div>


							</div>



						</div>
					</div>
					<!--  End  second   row -->



<!-----------------------------------------------  Address Details -------------------------------------------------------- -->

					<div class="card">
						<div class="card-header">
							<div class="card-title">Address Details</div>

						</div>
						<div class="card-body">


							<div class="row">
								<div class="col-12 col-lg-6">

									<div class="row">
										<div class="col-4">
											<label>Country</label>
										</div>
										<div class="col-6">
											<h4><%=rs.getString("agent_country")%></h4>
										</div>

									</div>

									<div class="row">
										<div class="col-4">
											<label>State/Division</label>
										</div>
										<div class="col-6">
											<h4><%=rs.getString("agent_division")%></h4>
										</div>

									</div>

									<div class="row">
										<div class="col-4">
											<label>Township</label>
										</div>
										<div class="col-6">
											<h4><%=rs.getString("agent_township")%></h4>
										</div>

									</div>
								</div>
								<div class="col-12 col-lg-6">



									<div class="row">
										<div class="col-4">
											<label>Ward</label>
										</div>
										<div class="col-6">
											<h4><%=rs.getString("agent_ward")%></h4>
										</div>

									</div>

									<div class="row">
										<div class="col-4">
											<label>Zip</label>
										</div>
										<div class="col-6">
											<h4><%=rs.getString("agent_postal")%></h4>
										</div>

									</div>

								</div>
							</div>

						</div>
					</div>
					<!--  End   third   row -->


					<!--  start   fourth   row -->
					<div class="card">
						<div class="card-header">
							<div class="card-title"></div>

						</div>
						<div class="card-body">

							<div class="row">
								<div class="col-12 col-lg-6">

									<div class="row">
										<div class="col-4">
											<label>Address1</label>
										</div>
										<div class="col-6">
											<h4><%=rs.getString("agent_addr1")%></h4>
										</div>

									</div>

									<div class="row">
										<div class="col-4">
											<label>Address2</label>
										</div>
										<div class="col-6">
											<h4><%=rs.getString("agent_addr2")%></h4>
										</div>

									</div>

								</div>
								<div class="col-12 col-lg-6">

									<div class="row">
										<div class="col-4">
											<label>Address3</label>
										</div>
										<div class="col-6">
											<h4><%=rs.getString("agent_addr3")%></h4>
										</div>

									</div>

									<div class="row">
										<div class="col-4">
											<label>Address4</label>
										</div>
										<div class="col-6">
											<h4><%=rs.getString("agent_addr4")%></h4>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--  End  fourth   row -->

					<!--  Start   fifth   row -->
					<div class="card">
						<div class="card-header">
							<div class="card-title"></div>

						</div>
						<div class="card-body">

							<div class="row">
								<div class="col-12 col-lg-6">


									<div class="row">
										<div class="col-4">
											<label>Authorization</label>
										</div>
										<div class="col-6">
											<h4><%=rs.getString("agent_authorizationcode")%></h4>
										</div>

									</div>

									<div class="row">
										<div class="col-4">
											<label>Account Type</label>
										</div>
										<div class="col-6">
											<h4><%=rs.getString("agent_accounttype")%></h4>
										</div>

									</div>


								</div>
								<div class="col-12 col-lg-6">

									<div class="row">
										<div class="col-4">
											<label>Deposit</label>
										</div>
										<div class="col-6">
											<h4><%=rs.getString("deposit")%></h4>
										</div>

									</div>

									<div class="row">
										<div class="col-4">
											<label>Commisionfees</label>
										</div>
										<div class="col-6">
											<h4><%=rs.getString("agent_commissionfees")%></h4>
										</div>

									</div>


								</div>
							</div>
						</div>
					</div>
					<!--  End  fifth  row -->


					<!--  Start  sixth  row -->
					<div class="card">
						<div class="card-header">
							<div class="card-title">Emergency Contact Information</div>

						</div>
						<div class="card-body">
							<div class="row">
								<div class=" col-sm-6 form-group">
									<label>Emergency Contact </label>
									<h4><%=rs.getString("agent_emergency_contact")%></h4>
								</div>
								<div class=" col-sm-6  form-group">
									<label>Emergency Contact Phone</label>
									<h4><%=rs.getString("agent_emergency_phone")%></h4>
								</div>
							</div>
						</div>
					</div>
					<!--  End  sixth  row -->


					<!--  Start  seventh  row -->
					<div class="card">
						<div class="card-header">
							<div class="card-title">Agent Bank Card Information</div>

						</div>
						<div class="card-body">


							<div class="row">
								<div class="col-12 col-lg-6">

									<div class="row">
										<div class="col-4">
											<label>Bank Name</label>
										</div>
										<div class="col-6">
											<h4><%=rs.getString("agent_bankname")%></h4>
										</div>

									</div>

									<div class="row">
										<div class="col-4">
											<label>Username</label>
										</div>
										<div class="col-6">
											<h4><%=rs.getString("agent_bankusername")%></h4>
										</div>

									</div>

									<div class="row">
										<div class="col-4">
											<label>Card Type</label>
										</div>
										<div class="col-6">
											<h4><%=rs.getString("agent_bankcardtype")%></h4>
										</div>

									</div>



								</div>
								<div class="col-12 col-lg-6">

									<div class="row">
										<div class="col-4">
											<label>Account Number</label>
										</div>
										<div class="col-6">
											<h4><%=rs.getString("agent_bankacctno")%></h4>
										</div>

									</div>

									<div class="row">
										<div class="col-4">
											<label>Expire Date</label>
										</div>
										<div class="col-6">
											<h4><%=rs.getString("agent_bankexprdate")%></h4>
										</div>

									</div>

								</div>
							</div>
							<!--  end   seventh  row -->

							<%
								
									}
									con.close();
								} catch (SQLException e) {
									e.printStackTrace();
								}
							%>

							<!----------------------------------------------------------------- End  Card  body----------------------------------------------------------------------------------------------------------------- -->
						</div>
					</div>
				</div>
			</div>

			<!-------------------------------------------------------------------- Card  Registration------------------------------------------------------------------------------------------------------------------------------------------- -->
					
		</div>
	</div>
	
	
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<!--   Core JS Files   -->
		<script src="assets/js/core/jquery.3.2.1.min.js"></script>
		<script src="assets/js/core/popper.min.js"></script>
		<script src="assets/js/core/bootstrap.min.js"></script>
		<!-- jQuery UI -->
		<script
			src="assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
		<script
			src="assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>

		<!-- jQuery Scrollbar -->
		<script
			src="assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
		<!-- Datatables -->
		<script src="assets/js/plugin/datatables/datatables.min.js"></script>
		<!-- Atlantis JS -->
		<script src="assets/js/atlantis.min.js"></script>
	
</body>
</html>