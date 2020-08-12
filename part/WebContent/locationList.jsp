<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

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

<%  String uname = (String)session.getAttribute("staffName");

		HttpSession ssss=request.getSession(false);  
		String ccode=(String)ssss.getAttribute("companyCode"); 
		
		HttpSession newsession=request.getSession();
		String staff_name=(String)ssss.getAttribute("staffName");		
		
		String companyname=(String)ssss.getAttribute("companyType"); 
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
									<%=uname %>
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
											<span class="link-collapse">Chat Box</span>
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
										<a href="companyList.jsp"><!-- companyList.jsp -->
											<span class="sub-item">Company List</span>
										</a>
									</li>
                                                                                                                                                <li>
										   <%	if(companyname.equalsIgnoreCase("main"))
{%>                                                                                              <li>
										<a href="companyAdd.jsp"><!-- companyAdd.jsp -->
											<span class="sub-item">Add new Company</span>
										</a>
									</li><%} else{ %>
									                                                        <li hidden>
										<a href="companyAdd.jsp" hidden><!-- companyAdd.jsp -->
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
										<a href="agentList.jsp"><!-- agentList.jsp -->
											<span class="sub-item">Agent Lists</span>
										</a>
									</li>
									  <%	if(companyname.equalsIgnoreCase("main"))
{%>                                               
									<li>
										<a href="addAgent.jsp"><!-- addAgent.jsp -->
											<span class="sub-item">Add Agent</span>
										</a>
									</li>
									<%} else { %>
									                  
									<li hidden>
										<a hidden href="addAgent.jsp"><!-- addAgent.jsp -->
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
									  <%if(companyname.equalsIgnoreCase("main"))
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
										<a href="state_division.jsp">
											<span class="sub-item">State & Division</span>
										</a>
									</li>
								</ul>
							</div>
						</li>  
						<li class="nav-item active">
							<a data-toggle="collapse" href="#location">
								<i class=" 	fas fa-user-tie"></i>
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
									  <%if(companyname.equalsIgnoreCase("main"))
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
						
						
						
					</ul>
				</div>
			</div>
		</div>
		<!-- End Sidebar -->

		
		
		<!-- 	Start  Main-dashboard -->
		<div class="main-panel">
		
	<!-- 	Start  Content -->
			<div class="content">
								<div class="panel-header bg-primary-gradient">
									<div class="page-inner py-5">
										<div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
											<div>
												<h2 class="text-white pb-2 fw-bold">Address Lists</h2>
											
											</div>
											<div class="ml-md-auto py-2 py-md-0">
											          <a href="staffAdd.jsp"  class="btn btn-secondary btn-round">Add New  Place</a>
											</div>
										</div>
									</div>
							</div>
							
							
							
							<div class="page-inner mt--5">
					<div class="row mt--2">
						<div class="col-md-12">
							<div class="card full-height">
								<div class="card-body">
									<div class="card-title"> Address List</div>
									<br>
							<div class="table-responsive">
									<table id="basic-datatables" class="display table table-striped table-hover" cellspacing="0" width="100%">
																	<!-- <thead> -->
											<thead>

												<tr>
													<th>State/Division</th>
													
													<th>Township</th>

													<th>Ward</th>
													
													<th>Street</th>
													
													<th>Option</th>

													
												</tr>
											</thead>
											
											
											
														<!-- <tbody> -->
											<tbody>
												
	<%@ page import="java.sql.*"%>
	<%@ page import="java.io.*"%>
	
	<%@ page import="java.util.Base64"%>
	<% 
		try{
			//Connection con=DriverManager.getConnection("jdbc:mysql://localhost/delivery1","root","root");
			Connection con=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
			
		
		
		Statement stmt1 = con.createStatement();
		ResultSet rs_state = stmt1.executeQuery("Select * from state ");
		
		      while (rs_state.next()) {
		    	  
		    	  String state_code = rs_state.getString("state_code").trim(); 
		    	  
		    	  
		    	  
		    	  PreparedStatement pre_township=con.prepareStatement("Select* from township where state_code=?");
		    	  pre_township.setString(1, state_code); 						
				  ResultSet rs_township=pre_township.executeQuery();
		    	  
		    	 if(rs_township.next()){
		    		 
		    		 
		    	  while(rs_township.next()){
		    		  
		    		  String township_code = rs_township.getString("township_code").trim();
		    		  PreparedStatement pre_ward=con.prepareStatement("Select* from ward where state_code=? and township_code=?");
		    		  pre_ward.setString(1, state_code); 
		    		  pre_ward.setString(2, township_code); 
					  ResultSet rs_ward=pre_ward.executeQuery();  
					  
					  //System.out.println(state_code+"||"+township_code);
		    		  
				if(rs_ward.next()){
					
					 rs_ward=pre_ward.executeQuery(); 
					 while(rs_ward.next()){
						 
						 String ward_code = rs_ward.getString("ward_code").trim();
			    		  PreparedStatement pre_street=con.prepareStatement("Select* from street where state_code=? and township_code=? and ward_code=?");
			    		  pre_street.setString(1, state_code); 
			    		  pre_street.setString(2, township_code); 
			    		  pre_street.setString(3, ward_code); 
						  ResultSet rs_street=pre_street.executeQuery();  
						  
				if(rs_street.next()){
					
					rs_street=pre_street.executeQuery(); 
					
					while(rs_street.next()){
					
	%>			
					<tr>	
					
							<form action="edit_location.jsp">		
							<input type="hidden" value="<%=rs_state.getString("state_code")%>" name="state_code">
							<input type="hidden" value="<%=rs_township.getString("township_code")%>" name="township_code">
							<input type="hidden" value="<%=rs_ward.getString("ward_code")%>" name="ward_code">
							<input type="hidden" value="<%=rs_street.getString("street_code")%>" name="street_code">
							<input type="hidden" value="<%=rs_street.getString("idstreet_code")%>" name="street_id">
							<td><%=rs_state.getString("state_name")%></td>
												
							<td><%=rs_township.getString("township_name") %></td>

							<td><%=rs_ward.getString("ward_name") %></td>
													
							<td><%=rs_street.getString("street_name") %></td>
							<td><button type="submit" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Edit">
																<i class="fa fa-edit"></i>
															</button></td>
						</form>
					</tr>
											
	<%		}//Fourth While	
				}//If in ward
				else{
					
				
					%>
					<tr>
							<form action="edit_location.jsp">		
							<input type="hidden" value="<%=rs_state.getString("state_code")%>" name="state_code">
							<input type="hidden" value="<%=rs_township.getString("township_code")%>" name="township_code">
							
												
							<td><%=rs_state.getString("state_name")%></td>
												
							<td><%=rs_township.getString("township_name") %></td>

							<td><%=rs_ward.getString("ward_name") %></td>
													
							<td></td>
							<td><button type="submit" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Edit">
																<i class="fa fa-edit"></i>
															</button></td>
							
							</form>
					</tr>
												
	<%	
					
					
				}
				}// Third While
				
				}//If in Township
				else{
				
					 
		    		 %>
						<tr>
						<form action="edit_location.jsp">		
							<input type="hidden" value="<%=rs_state.getString("state_code")%>" name="state_code">
							<input type="hidden" value="<%=rs_township.getString("township_code")%>" name="township_code">
						
							
								<td><%=rs_state.getString("state_name")%></td>
													
								<td><%=rs_township.getString("township_name") %></td>

								<td></td>
														
								<td></td>
								<td><button type="submit" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Edit">
																<i class="fa fa-edit"></i>
															</button></td>
								

	</form>
						</tr>
													
		<%
					
				}// Else in Township
			}//Second While
		  }//If in State
		    	 
		    	 else{
		    		 
		    		 %>
						<tr><form action="edit_location.jsp">		
							<input type="hidden" value="<%=rs_state.getString("state_code")%>" name="state_code">
							
													
								<td><%=rs_state.getString("state_name")%></td>
													
								<td></td>

								<td></td>
														
								<td></td>
								<td><button type="submit" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Edit">
																<i class="fa fa-edit"></i>
															</button></td>
								

	</form>
						</tr>
													
		<%
		    		 
		    		 
		    	 }//Else in State
		    	 
		      }//Firs While
		               con.close();
		                                        
					} catch (SQLException e) {
								e.printStackTrace();
						}
	%>										
			</tbody>
										<!-- 	End tbody -->
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