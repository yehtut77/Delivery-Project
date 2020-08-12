<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html lang="en">
 
<%  	

		  String username = (String)session.getAttribute("username");		
		  String companyCode=(String)session.getAttribute("companyCode"); 
		  String companyType=(String)session.getAttribute("companyType"); 		 
		  String role=(String)session.getAttribute("role");
		  String staffName=(String)session.getAttribute("staffName"); 
		  String staffCode=(String)session.getAttribute("staffCode"); 
		  String parent_agent_code=(String)session.getAttribute("parent_agent_code"); 
		  String agentCode=(String)session.getAttribute("agentCode"); 
		  
	  
		  
		
			
try{
//	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/delivery","root","root");
 Connection con=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
//Connection con=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_deliv?useTimezone=true&serverTimezone=UTC","teamrame_zaw","zawmyo");	
%>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Title -->
    <title>Myanmar Delivery</title>
    <!-- Favicon -->
    <!-- Stylesheet -->
    <link rel="stylesheet" href="style.css">
    	<script src="assets/js/plugin/webfont/webfont.min.js"></script>
	<script>
		WebFont.load({
			google: {"families":["Lato:300,400,700,900"]},
			custom: {"families":["Flaticon", "Font Awesome 5 Solid", "Font Awesome 5 Regular", "Font Awesome 5 Brands", "simple-line-icons"], urls: ['../../assets/css/fonts.min.css']},
			active: function() {
				sessionStorage.fonts = true;
			}
		});
	</script>

	<!-- CSS Files -->
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/atlantis.min.css">

<style>
.regtea   {padding: 15px;
	border: 1px solid #ccc;
	border-radius: 3px;
	margin-bottom: 10px;
	width:81%;
               
	box-sizing: border-box;
	font-family: montserrat;
	color: #2C3E50;
	font-size: 17px;
}
input   {padding: 6px;
	border: 1px solid #ccc;
	border-radius: 3px;
	margin-bottom: 10px;
	width:60%;
              
	box-sizing: border-box;
	font-family: montserrat;
	color: #2C3E50;
	font-size: 17px;
}

.button {
  border-radius: 30px;
  background-color:#162c6f;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 17px;
  padding: 7px;
  width: 140px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
}

.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button:hover span {
  padding-right: 25px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;
}



body {font-family: Arial, Helvetica, sans-serif;}
 
</style>
</head>


<body onload="myFunction()">

    <!-- Preloader -->
    <div id="preloader">
        <div class="loader"></div>
    </div>
  
    <header class="header-area">
   
        <div class="main-header-area">
            <div class="classy-nav-container breakpoint-off">
                <div class="container">
                    <!-- Classy Menu -->
                    <nav class="classy-navbar justify-content-between" id="akameNav">

                        <!-- Logo -->
                        <a class="nav-brand" href="index.jsp">Myanmar Delivery</a>

                        <!-- Navbar Toggler -->
                        <div class="classy-navbar-toggler">
                            <span class="navbarToggler"><span></span><span></span><span></span></span>
                        </div>

                        <!-- Menu -->
                        <div class="classy-menu">
                            <!-- Menu Close Button -->
                            <div class="classycloseIcon">
                                <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                            </div>
                            
                            <!-- Nav Start -->
                            <div class="classynav">
                                  <ul id="nav">
                                    <li><a href="index.jsp">Home</a></li>
                                    
                                    <li ><a href="register.jsp">WayBill</a>
                                      <li>
                                        <a href="#">Operation</a>
			                                     <div class="dropdown">
													<a href="credit_customer_query_main.jsp">Credit Customer</a>
                    									<a href="item_transfer.jsp">Item Transfer</a>
                    									  <a href="itemreject_main.jsp">Item Rejected</a>
                    									  <a href="warehouse_query.jsp">WareHouse_Query</a>
                    									 <a href="parcel_staff_main.jsp">Parcel with Staff</a>
												</div>
                                    </li>
                                    </li><li ><a href="#">Batch WayBill</a>
                                    </li>
                                      <li><a href="credit_customer.jsp">Credit Customer</a></li>
                                    
                                    <li><a href="kill_session">Logout</a></li>
                                </ul>
                          </div>
                            <!-- Nav End -->
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- Header Area End -->
    
    


 <!-- BackHome Area Start -->
 
 <br><br>
        <div class="container">
            <div class="row">
                <div class="col-12">
                
                    <div class="breadcrumb-content">
                        <h3><span class="h1">WareHouse  Query</span></h3>
                        
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><i class="icon_house_alt"></i> Home</li>
                                <li class="breadcrumb-item active" aria-current="page">WareHouse List</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div> 
    <!-- BackHome Area End -->
   
    
    <!-- Welcome  body  Area Start -->
	<div class="container">
		<!-- Sidebar -->
		<div class="content">
			<div class="page-inner">

				<div class="row">
					<div class="col-lg-12">
						<div class="card">
						
							<div class="card-header">
								<h4 class="card-title">Count - <span id="demo"></span></h4><!--   Count table  row   -->
							</div>
							
							<div class="card-body">
								<div class="table-responsive">
									<table id="basic-datatables"
										class="display table table-striped table-hover">
										<thead>
											<tr>

												<th>Waybill No</th>
												<th>Total</th>
												<th>Sender Code</th>
												<th>Receiever Name</th>
												<th>Receiever Township/Region</th>
												<th>Reciever Phone</th>

											</tr>
										</thead>
										
										<!-- <tbody> -->
										<tbody>
											
<%
		Statement stmt = con.createStatement();
		String  status="W";
		PreparedStatement pre=con.prepareStatement("Select* from registration where agent_code=? and company_code=? and stat=?");
		pre.setString(1, agentCode);
		pre.setString(2, companyCode);
		pre.setString(3, status);
		ResultSet rs=pre.executeQuery();
		      while (rs.next()) {
		    	  
		%>
											<tr>

												<td><%=rs.getString("track_num")%></td>

												<td><%=rs.getString("total_amt")%></td>

												<td><%=rs.getString("sender_code")%></td>

												<td><%=rs.getString("rcvr_name")%></td>

												<td><%=rs.getString("rcvr_township")%>/<%=rs.getString("rcvr_township")%></td>

												<td><%=rs.getString("rcvr_phone")%></td>

											</tr>
											<%
												}
													con.close();
												} catch (SQLException e) {
													e.printStackTrace();
												}
											%>

										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!---------------------------Modal  box  start----------------------------->
			<div class="modal fade bd-example-modal-lg" tabindex="-1"
				role="dialog" aria-labelledby="myLargeModalLabel" id="myModal"
				aria-hidden="true">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">

						<div class="modal-header">
							<!-- -------Modal Header -->

							<h3 class="modal-title" id="lineModalLabel">WareHouse-Query</h3>
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">x</span><span class="sr-only">Close</span>
							</button>
						</div>

						<div class="modal-body">
							<!-- Modal  body    start-->

							<div class="row row-demo-ligth">
								<div class="col-md-10 ml-auto mr-auto">
									<div class="card">
										<div class="card-body" align="center">

											<label class="pure-material-textfield-outlined"> <span>Tracking
													Number</span> <input type="text" class="input-sm" id="track_num"
												disabled />
											</label>

										</div>
									</div>
								</div>
							</div>
							
								<div class="row row-demo-ligth">
								<div class="col-md-10 ml-auto mr-auto">
									<div class="card">
										<div class="card-body" align="center">

											<label class="pure-material-textfield-outlined"> <span>Sender Code</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<input type="text" class="input-sm" id="s_code" disabled />

													</label>

										</div>
									</div>
								</div>
							</div>

							<div class="z-depth-1">
								<div class="card my-2 z-depth-0">
									<div class="card-body">
										<h5 class="card-title">Receiver Information</h5>
										<br>
										<div class="row">
											<div class="col-12 col-lg-6">
												<div class="form-group">

													<label class="pure-material-textfield-outlined"> <span>Name</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<input type="text" class="input-sm" id="r_name" disabled />

													</label>
												</div>

												<div class="form-group">
													<label class="pure-material-textfield-outlined"> <span>Phone</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<input type="text" class="input-sm" id="r_phone" disabled />

													</label>
												</div>


												<div class="form-group">
													<label class="pure-material-textfield-outlined"> <span>Drop
															point</span>&nbsp;&nbsp;&nbsp; <input type="text"
														class="input-sm" id="d_point" disabled />

													</label>
												</div>

											
											</div>

											<div class="col-12 col-lg-6">

												<div class="form-group">
													<label class="pure-material-textfield-outlined"> <span>State</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<input type="text" class="input-sm" id="r_state" disabled />

													</label>
												</div>

												<div class="form-group">
													<label class="pure-material-textfield-outlined"> <span>Township</span>
														<input type="text" class="input-sm" id="r_township"
														disabled />

													</label>
												</div>

												<div class="form-group">
													<label class="pure-material-textfield-outlined"> <span>Postal</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<input type="text" class="input-sm" id="r_postal" disabled />

													</label>
												</div>

											
											</div>
										</div>
											<div class="row">
											<div class="col-12 col-lg-12">
												<div class="form-group">

													<label class="pure-material-textfield-outlined"> <span>Address</span>
														<textarea id="r_address" class="form-control"
															style="color: #000" rows="2" cols="100" readonly>
                                          </textarea>
													</label>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<br>

							<div class="z-depth-1">
								<div class="card my-2 z-depth-0">
									<div class="card-body">
										<h5 class="card-title">General Information</h5>
										<br>


										<div class="row">

											<div class="col-12 col-lg-6">
												<div class="form-group">
													<label class="pure-material-textfield-outlined"> <span>Item_Description</span>
														<input type="text" class="input-sm" id="item_desc"
														disabled />

													</label>
												</div>

												<div class="form-group">
													<label class="pure-material-textfield-outlined"> <span>Pick
															Up Date</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
														type="text" class="input-sm" id="p_date" disabled />

													</label>
												</div>
											</div>

											<div class="col-12 col-lg-6">

												<div class="form-group">
													<label class="pure-material-textfield-outlined"> <span>Status</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<input type="text" class="input-sm" id="status" disabled />

													</label>
												</div>

												<div class="form-group">
													<label class="pure-material-textfield-outlined"> <span>Pick
															Up Person</span> <input type="text" class="input-sm"
														id="p_person" disabled />

													</label>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="z-depth-1">
								<div class="card my-2 z-depth-0">
									<div class="card-body">
										<br>
										<div class="row">

											<div class="col-12 col-lg-6">
												<div class="form-group">
													<label class="pure-material-textfield-outlined"> <span>Delivery_Charges</span>&nbsp;
														<input type="text" class="input-sm" id="deli_charges"
														disabled />

													</label>
												</div>

												<div class="form-group">
													<label class="pure-material-textfield-outlined"> <span>Transport_Charges</span>
														<input type="text" class="input-sm" id="t_charges"
														disabled />

													</label>
												</div>
											</div>

											<div class="col-12 col-lg-6">


												<div class="form-group">
													<label class="pure-material-textfield-outlined"> <span>Product
															Amount</span> <input type="text" class="input-sm" id="p_amt"
														disabled />

													</label>
												</div>

												<div class="form-group">
													<label class="pure-material-textfield-outlined"> <span>Currency</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<input type="text" class="input-sm" id="currency" disabled />

													</label>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="row row-demo-ligth">
								<div class="col-md-10 ml-auto mr-auto">
									<div class="card">
										<div class="card-body" align="center">

											<label class="pure-material-textfield-outlined"> <span>Total
													Amount</span>&nbsp; <input type="text" class="input-sm" id="total"
												disabled />

											</label>
										</div>
									</div>
								</div>
							</div>
							<!-- Modal body end -->

				<div class="modal-footer">
								<div class="btn-group btn-group-justified" role="group"
									aria-label="group button">
									<div class="btn-group" role="group">
										<button type="button" class="btn btn-default"
											data-dismiss="modal" role="button">Close</button>
					</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- ----------------------Modal  box  End--------------------- -->

     <!-- Footer Area Start -->
	<footer class="footer-area section-padding-80-0">
		<div class="container">
			<div class="row justify-content-between">

				<!-- Single Footer Widget -->
				<div class="col-12 col-sm-6 col-md-4">
					<div class="single-footer-widget mb-80">
						<!-- Footer Logo -->
						<h4 class="widget-title">Our Company</h4>

						<p class="mb-30">
							Name of founder company - &nbsp&nbsp&nbspPartner Pacific Group
							Co., Ltd.<br> Date of Incorporation -&nbsp&nbsp&nbsp2014<br>
							Name of Transport Partner Company - &nbsp&nbsp&nbspMK Express</i> <br>
						</p>

						<!--Text -->
						<div class="text">
							<p>

								Date of Establishment of Transport service -&nbsp&nbsp&nbsp2017<br>
								Name of IT Partner Company – &nbsp&nbsp&nbspI-ECHO Software
								Solutions Co., Ltd <br> Address - &nbsp&nbsp&nbspYangon,
								Myanmar<br> <br>
								<br>
							</p>
						</div>
					</div>
				</div>

				<!-- Single Footer Widget -->
	<div class="col-12 col-sm-6 col-md-4 col-xl-3">
					<div class="single-footer-widget mb-80">
						<!-- Widget Title -->
						<h4 class="widget-title">Opening times</h4>

						<!-- Open Times -->
						<div class="open-time">
							<p>Monday: Friday: 10.00 - 23.00</p>
							<p>Saturday: 10.00 - 19.00</p>
						</div>

						<!-- Social Info -->
						<div class="social-info">
							<a href="#" class="facebook"><i class="fa fa-facebook"></i></a> <a
								href="#" class="twitter"><i class="fa fa-twitter"></i></a> <a
								href="#" class="google-plus"><i class="fa fa-google-plus"></i></a>
							<a href="#" class="instagram"><i class="fa fa-instagram"></i></a>
						</div>
					</div>
				</div>

				<!-- Single Footer Widget -->
				<div class="col-12 col-md-4 col-xl-3">
					<div class="single-footer-widget mb-80">

						<!-- Widget Title -->
						<h4 class="widget-title">Contact Us</h4>

						<!-- Contact Address -->
						<div class="contact-address">
							<p>Tel: (+95) 455000055</p>
							<p>MyanmarDelivery@gmail.com</p>
							<p>Address: Yangon,Myanmar</p>
						</div>
					</div>
				</div>

			</div>
		</div>
	</footer>
	<!-- Footer Area End -->

	
     <!-- All JS Files -->
    <!-- jQuery -->
    <script src="js/jquery.min.js"></script>
    <!-- Popper -->
    <script src="js/popper.min.js"></script>
    <!-- Bootstrap -->
    <script src="js/bootstrap.min.js"></script>
    <!-- All Plugins -->
    <script src="js/delivery.bundle.js"></script>
    <!-- Active -->
    <script src="js/default-assets/active.js"></script>
    
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
 

  <!-- Warehouse  Query  Ajax  start -->
	 <script>
$('table tbody tr  td').on('click',function(){
	
    $("#myModal").modal("show");
     //  $("#track_num").val($(this).closest('tr').children()[0].textContent);
  
  var  track_num=$(this).closest('tr').children()[0].textContent;
 
	 $.ajax({
	 
 		url: "warehouse_query_Ajax.jsp",
 		type: 'POST',
 		data: {
 			track_num: track_num
 			},
 		success: function(data) {
 	//	alert(data);
         	var a = data.split("$");
         	
 			$('#track_num').val(a[0]);
 			$('#s_code').val(a[1]);
 			
 			$('#r_name').val(a[2]);
 			$('#r_phone').val(a[3]);
 			$('#r_state').val(a[4]);
 			$('#r_township').val(a[5]);
 			$('#r_postal').val(a[6]);
 			$('#r_address').val(a[7]);
 			$('#d_point').val(a[8]);
 			$('#item_desc').val(a[9]);
 			$('#status').val(a[10]);
 			$('#deli_charges').val(a[11]);
 			$('#total').val(a[12]);
 			$('#p_date').val(a[13]);
 			$('#p_person').val(a[14]);
 			$('#t_charges').val(a[15]);
 			$('#p_amt').val(a[16]);
 			$('#currency').val(a[17]);
	        
 		}
}); 
});
</script>
		<!-- Warehouse  Query  Ajax  end -->
	
	
		<!-- Warehouse  Query  count  script  start -->
	<script>
function myFunction() {
	  var rowCount = $("#basic-datatables td").closest("tr").length;
  document.getElementById("demo").innerHTML =rowCount;
}
</script>
		<!-- Warehouse  Query   count end   -->

	
		<!-- Warehouse  Query  list  table  start -->
	<script >
		$(document).ready(function() {
			$('#basic-datatables').DataTable({
				 dom: 'Bfrtip'
			});
	
		});
	</script>
 	<!-- Warehouse  Query  list table end  t -->

</body>

</html>