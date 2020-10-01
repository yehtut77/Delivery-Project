<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.Base64"%>
												
											

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
	<%
    HttpSession ssss=request.getSession(false);  
 
	String staffName=(String)ssss.getAttribute("staffName");
    String companyCode=(String)ssss.getAttribute("companyCode");

	String staffCode=(String)ssss.getAttribute("staffCode");
	String agentCode=(String)ssss.getAttribute("agentCode"); 
	if(agentCode==null)agentCode="";  
	String sendercode="";	
%>
</head>

 

<body>
	<div class="wrapper">
		<div class="main-header">
			<!-- Logo Header -->
			<div class="logo-header" data-background-color="blue">
				
				<a href="index.jsp" class="logo">
			 
					<h2 class="text-white pb-2 fw-bold">Delivery System</h2>
				</a>
				<button class="navbar-toggler sidenav-toggler ml-auto" type="button" data-toggle="collapse" data-target="collapse" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon">
						<i class="icon-menu"></i>
					</span>
				</button>
			 
			</div>
			<nav class="navbar navbar-header navbar-expand-lg" data-background-color="blue2">
				<div class="container-fluid">
		 
				</div>
			</nav>
		 
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
															

								
									<%=staffName %>
									<span class="user-level">Agent</span>
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
									
									<li>
										<a href="kill_session">
											<span class="link-collapse">Logout</span>
										</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
					 
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
												<h2 class="text-white pb-2 fw-bold">Agent Inbox</h2>
											
											</div>
										 
										</div>
									</div>
							</div>
							
						
							
					<div class="page-inner mt--5">
					<div class="row mt--2">
						<div class="col-md-12">
							<div class="card full-height">
								<div class="card-body">
									<div class="card-title"> Notifications</div>
									<br>
							<div class="table-responsive">
							
								<table><thead><tr><th>
							Agent code:  &nbsp; &nbsp; &nbsp;<span style="color: #80C143;;"><%=agentCode %></span>
							</th>
							<th width="200px;"></th>
								<th>
								<a href="register.jsp" style="text-decoration: none;">
								<span class="	far fa-caret-square-left">Back</span>
								
								</a>

								</th>
							  </tr></thead></table>
						 
							<br><br>
									<table id="basic-datatables" class="display table table-striped table-hover" cellspacing="0" width="100%">
																 
											<thead>

												<tr>
												
													
												  <th></th>
												    <th>ID</th>
												    <th>Subject </th>
												    <th> Date</th>
										 
												

											 
											 		</tr>
											</thead>				
											
														<!-- <tbody> -->
											  <tbody>
												
			 

			
<%														
											 
try{		

			//Connection con=DriverManager.getConnection("jdbc:mysql://localhost/delivery","root","root");
			// Connection con=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_deliv?useTimezone=true&serverTimezone=UTC","teamrame_zaw","zawmyo");
				Connection con=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
		Statement stmt = con.createStatement();	 
		 PreparedStatement pre_agent = con
					.prepareStatement("Select trsf_num,module_code,read_unread,idagent_inbox_id,sender_name,trans_date from agent_inbox where company_code=? and agent_code=? and read_unread=?");
		 pre_agent.setString(1, companyCode);
		 pre_agent.setString(2, agentCode);
		 		 pre_agent.setString(3,"ur");

			ResultSet rs_agent = pre_agent.executeQuery();
			String id="",destype="",des="";
			while (rs_agent.next()) {		  
	
		 String module_name="";
			PreparedStatement pre_module = con
					.prepareStatement("Select module_name from module where module_code=?");
			pre_module.setString(1, rs_agent.getString("module_code"));
	ResultSet rs_module_name = pre_module.executeQuery();
	    if (rs_module_name.next()) {
	  	   module_name=rs_module_name.getString("module_name");
	    }
rs_module_name.close();
pre_module.close();
	String rurr=rs_agent.getString("read_unread");
		String trsf_num=rs_agent.getString("trsf_num");
				%>
				
					<tr>
														 
														
					<td>
				<%
			
				if(trsf_num==null)
				{  %>					
					<div  class="fa fa-bell"></div>	 					 
				<%}else{   %>
			<span		 style="color: green;">	<%=rs_agent.getString("trsf_num") %>		</span>	
		<%} %>
	
				 </td>
														
				<td><%=rs_agent.getString("idagent_inbox_id") %></td>
				<td>
				<%if(rurr.equalsIgnoreCase("ur"))
				{ %>
					<div style="font-size:17px;color:blue; font-weight: bold;"> 
					<%=module_name %>, <%=rs_agent.getString("sender_name")%>
					<span style="color: red;">New</span>				
					</div>
															
				<%}else{ %>
				<div  style="font-size:17px; font-weight:normal; color:blue;"> 
				<%=module_name %>, <%=rs_agent.getString("sender_name")%>
				<span style="color: green;">Read</span>
				</div>
				<%}%>
															 
				</td>
				<td><%=rs_agent.getString("trans_date")%></td>
				</tr>
	<% 
				}
				rs_agent.close();
				pre_agent.close();
						      con.close();

				} catch (SQLException e) {
														e.printStackTrace();
													}
	%>
			
<%														
											 
try{		
				Connection con=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");

			//Connection con=DriverManager.getConnection("jdbc:mysql://localhost/delivery","root","root");
			// Connection con=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_deliv?useTimezone=true&serverTimezone=UTC","teamrame_zaw","zawmyo");
		 PreparedStatement pre_agent2 = con
					.prepareStatement("Select trsf_num,module_code,read_unread,idagent_inbox_id,sender_name,trans_date from agent_inbox where company_code=? and agent_code=? and read_unread=?");
		 pre_agent2.setString(1, companyCode);
		 pre_agent2.setString(2, agentCode);
		 		 pre_agent2.setString(3,"r");

			ResultSet rs_agent2 = pre_agent2.executeQuery();
			String id="",destype="",des="";
			while (rs_agent2.next()) {		  
	
		 String module_name="";
			PreparedStatement pre_module = con
					.prepareStatement("Select module_name from module where module_code=?");
			pre_module.setString(1, rs_agent2.getString("module_code"));
	ResultSet rs_module_name = pre_module.executeQuery();
	    if (rs_module_name.next()) {
	  	   module_name=rs_module_name.getString("module_name");
	    }
rs_module_name.close();
pre_module.close();
	String rurr=rs_agent2.getString("read_unread");
		String trsf_num=rs_agent2.getString("trsf_num");
				%>
				
					<tr>
														 
														
					<td>
				<%
			
				if(trsf_num==null)
				{  %>					
					<div  class="fa fa-bell"></div>	 					 
				<%}else{   %>
			<span		 style="color: green;">	<%=rs_agent2.getString("trsf_num") %>		</span>	
		<%} %>
	
				 </td>
														
				<td><%=rs_agent2.getString("idagent_inbox_id") %></td>
				<td>
				<%if(rurr.equalsIgnoreCase("ur"))
				{ %>
					<div style="font-size:17px;color:blue; font-weight: bold;"> 
					<%=module_name %>, <%=rs_agent2.getString("sender_name")%>
					<span style="color: red;">New</span>				
					</div>
															
				<%}else{ %>
				<div  style="font-size:17px; font-weight:normal; color:blue;"> 
				<%=module_name %>, <%=rs_agent2.getString("sender_name")%>
				<span style="color: green;">Read</span>
				</div>
				<%}%>
															 
				</td>
				<td><%=rs_agent2.getString("trans_date")%></td>
				</tr>
	<% 
				}
				rs_agent2.close();
				pre_agent2.close();
		      con.close();
				} catch (SQLException e) {
														e.printStackTrace();
													}
	%>											
		</tbody>  
 							</table>
									
</div>

</div></div></div></div></div>
			<input hidden type="text" value="" id="module">
						<!-- 	Card -->
				
			</div>
			<!-- 	End  Content -->
			
			
		
	</div>
 
	<script > 
	
 
 
	 function read() {
		 
			var read_message=document.getElementById("read_message");
		 read_message.textContent="unread";
	       read_message.style.color = "red" ;

		  document.getElementById("read_message").innerHTML =  "Unread ";
	 }
 	

	</script>
			
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
			
			$('table tbody tr  td').on('click',function(){
			
	 	var  id=$(this).closest('tr').children()[1].textContent;
				var  trsf_num=$(this).closest('tr').children()[0].textContent;
		   var sub=$(this).closest('tr').children()[2].textContent;	
		   
				   var res = sub.split(" ");						  
				   var  str=res[1];
				   var decision = str.replace(/\s+/g, "");
				//   alert("a"+decision);
				   if (decision === "Item"){ url = 'rcpt?trsf_num='+trsf_num;}
				else		{ url = 'AGIR?name=' + encodeURIComponent(id);}

			 document.location.href = url; 
			 
				

				});


			
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