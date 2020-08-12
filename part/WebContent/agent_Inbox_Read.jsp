<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.Base64"%>

<%
	 HttpSession ssss=request.getSession(false);					
	String total=request.getParameter("name");
	String username=(String)ssss.getAttribute("staffName");
	String alldata="";

try{ 
	 
	 
 
	//Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/delivery", "root", "root");
	// Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_deliv?useTimezone=true&serverTimezone=UTC","teamrame_zaw","zawmyo");
	Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
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
	<style>
#att{background-color:#f5f3f0;
}
#att:hover{
background-color:#e0dcd5;
}
</style>
		
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
															

								
									<%=username %>
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
							
							<script type="text/javascript">
window.onload = function () {
    var url = document.location.href,
        params = url.split('?')[1].split('&'),
        data = {}, tmp;
    for (var i = 0, l = params.length; i < l; i++) {
         tmp = params[i].split('=');
         data[tmp[0]] = tmp[1];
    }
    document.getElementById('here').innerHTML = data.name;
     
     
}

</script>

							
		<form action="attachmentAgentinbox.jsp" method="post">					
<%						
	PreparedStatement  pr_updatee=null;
	
	  Statement stmt_agent_inbox = conn.createStatement();	    
	   pr_updatee=conn.prepareStatement("Update agent_inbox set read_unread=?  where idagent_inbox_id=?");                            
	    	  	pr_updatee.setString(1,"r");
	    	  	pr_updatee.setString(2, total); 	
	    	  	pr_updatee.executeUpdate(); 
	    	  	
	    ResultSet rs_agent_inbox = stmt_agent_inbox.executeQuery("Select * from agent_inbox where idagent_inbox_id="+total);
	  
	    if (rs_agent_inbox.next()) {
	    		 String module_name="";
	    PreparedStatement pre_module = conn.prepareStatement("Select module_name from module where module_code=?");
	    	pre_module.setString(1,rs_agent_inbox.getString("module_code"));
	    	ResultSet rs_module = pre_module.executeQuery();
	    	    if (rs_module.next()) {
	    	  	   module_name=rs_module.getString("module_name");
	    	    }
		    
		     String body=rs_agent_inbox.getString("body");
		    	  if(module_name.equals("Pick Up Request")){
		    	 String bodyrep=body.replace("|","-");
		    	  String[] arr_body=bodyrep.split("-");
		    	  String coma1="",coma2="",coma3="",coma4="";
		    	 
		    	  if(arr_body[1].equals(" ") || arr_body[1]==null)
{coma1=" ";}else{coma1=",";}
		    	  if(arr_body[2].equals(" ") || arr_body[2]==null)
{coma2=" ";}else{coma2=",";}
		    	  if(arr_body[3].equals(" ") || arr_body[3]==null)
{coma3=" ";}else{coma3=",";}

					 alldata=username+" has requested to pick up at "+arr_body[11]+"$"+ "Address : "+arr_body[0]+coma1+arr_body[1]+coma2+arr_body[2]+coma3+arr_body[3]+"$"+" Township : "+arr_body[5]+"$"+" State : "+arr_body[4]+"$"+" Postal : "+arr_body[8]+"$"+" Contact Person : "+arr_body[9]+"$"+" Contact Phone : "+arr_body[10]+"$";
		    	  }

		    	  if(module_name.equals("Out For Delivery")){
			    	  String body2=rs_agent_inbox.getString("body");
			    	   alldata=body2;

			    	  }
		    	  if(module_name.equals("Item Receipt")){
			    	  String body2=rs_agent_inbox.getString("body");
			    	   alldata=body2;

			    	  }
				      
			    	 
			    	
		    	 
		    	%>
								
						<div class="page-inner mt--5">
						<div class="row mt--2">
							<div class="col-md-12">
								<div class="card full-height">
									<div class="card-body">
										<div class="card-title"> Notifications From  <%=module_name %></div> 
										<div class="card-header">
										     <div class="row">
	                        <div class="col-6">
										Out For Delivery</div>   
										
										<div class="col-4">
										<span style="color:blue;" class="fa fa-calendar">  <%=rs_agent_inbox.getString("trans_date") %></span>  
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                           
	                                </div>	<div class="col-2">
	                                	<a href="agent_Inbox.jsp"  >
						                          <span style="color:blue; text-align:right;" class="fas fa-chevron-circle-left"  >Inbox</span>
				                      	</a>
	                           
	                                     </div></div></div>   
										<br>
									 
					 
								    
								    	<P style="font-weight: bold;"> Dear <%=username%>   </P>
 <br>	<P >    </P>
								
								         <br> 
								         <%
								         String strin=alldata.replace("$","<br>");
								         %><p><%= strin %></p>
								         <%if(rs_agent_inbox.getString("module_code").equals("OFD")){ %>
								       <p>Attach file here</p>
							<div style="width:200px;height:140px;"  id="att"><center><br><br><br><br><br> <button type="submit" class="btn btn-default btn-sm" >
          <span class="glyphicon glyphicon-folder-open"></span> View</button></div><%} %>
								        <br> 
								        <P>Thank you. <br>
								         System Administrator</P>             
								         <input type="text" value="<%=total%>" name="total" hidden>
								         <%

								     

		    	  }
	  	conn.close();}
							     catch(Exception e)
							     							{
							     							System.out.print(e);
							     							e.printStackTrace();
							     							}
							         %>                 
							  <hr style=" color: blue;">
							 
                      		<!-- Footer Area Start 	+houseRentall+otherBonus+medical-->
    <footer class="footer-area section-padding-80-0" style=" background-color:#f0fdff;" >
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-12 col-md-12 col-xl-12">
                    <div class="single-footer-widget mb-80">
                      <!-- Contact Address -->
                        <div class="contact-address" style="text-align:center; color: black;"  > 
                        
                        <div class="row">
                        <div class="col-6">
                               Derlivery System <br>
                          Name of founder company -    Partner Pacific Group Co., Ltd.<br>
                          Date of Incorporation -   2014
                          Name of Transport Partner Company -    MK Express<br>
                        </div>
                            <div class="col-2"></div>
                              <div class="col-4">
                                    
                          Tel: (+95) 455000055<br>

myanmardelivery@gmail.com<br>

Address: Yangon,Myanmar
                            </div>
                        </div>
                   
                  
                        </div>
                    </div>
                </div>
               

            </div>
        </div>
    </footer>	  
</div></div></div></div></div>
							
		 
				
			</div>
	 
			
			
		
	</div>
</form>
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
	
	
	 
</body>
</html>