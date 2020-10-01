<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

  <%@page import="java.text.SimpleDateFormat,java.util.Date"%>
            <%@ page import="java.time.format.DateTimeFormatter" %>
    <%@ page import="java.time.*" %>
<!DOCTYPE html>
<html lang="en">
 
<%//Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/delivery1","root","root");
Connection conn = DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");


 HttpSession ssss=request.getSession(false);  
	String n=(String)session.getAttribute("staffName"); 
	String staff_name=(String)ssss.getAttribute("staffName");
	String ccode=(String)ssss.getAttribute("companyCode");
	
	String agent_code=(String)ssss.getAttribute("parent_agent_code");
	String staff_code=(String)ssss.getAttribute("staffCode");
  
    
    String companytype=(String)ssss.getAttribute("companyType");
    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MMM-yyyy");
    LocalDateTime now = LocalDateTime.now();
    String date=dtf.format(now);
    
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
 <script src="jsQR.js"></script>
	<!-- CSS Files -->
	<link rel="stylesheet" href="inputstyle.css">  
	
	<link rel="stylesheet" href="assets/css/atlantis.min.css">

<style>
video {
  width: 100%;
  height: auto;
}
canvas {
  width: 100%;
  height: auto;
}
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script src="script_files/payment_module.js"></script>

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
                        <h3>Payment Transfer</h3>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.jsp"><i class="icon_house_alt"></i> Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Payment Transfer</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    <!-- BackHome Area End -->
   <div class="container">
 	<div class="row">
 	 <div class="col-md-4">
 	 <div class="card">
 	 <div class="card-body">
 	 <div class="form-group">
 <div class="row">
 <div class='col-6'>Username:</div>
 <div class='col-6'><%=staff_name %></div>
 </div>
 </div>
  <div class="form-group">
 <div class="row">
 <div class='col-6'>Company Code:</div>
 <div class='col-6'><%=ccode %></div>
 </div></div>
  <div class="form-group">
 <div class="row">
 <div class='col-6'>Agent Code:</div>
 <div class='col-6'><%=agent_code %></div>
 </div></div>
 	 </div>
 	 </div>
 	 
 	 </div>
    <div class="col-md-4 offset-md-4">
    <div class="card">
    <div class="card-body">
    <div class="row">
    <div class="col-12">
    
     <div class="form-group">
      <label class="pure-material-textfield-outlined">
		<input type="text" name="status" value="##-####-########"  name="tracking" readonly="readonly" />
		<span>Tracking Number</span>
		</label>
		
			</div>		
     </div>
     </div>
     
      <div class="row">
    <div class="col-12">
    
     <div class="form-group"> 
        <label class="pure-material-textfield-outlined">
		<input type="text" name="status" value="Payment Transfer"  name="tracking" readonly="readonly" />
		<span>Status</span>
		</label>
        </div> 	
     </div>
     </div>
     
      <div class="row">
    <div class="col-12">
    
        <div class="form-group"> 
     <%
    DateTimeFormatter dat = DateTimeFormatter.ofPattern("dd/MM/yyyy");
     
   LocalDateTime localDateTime = LocalDateTime.now();
   String dt = dat.format(localDateTime);
  
   %>
   <label>
   Date:&nbsp; &nbsp;&nbsp; &nbsp;
   <span style="color:blue;" class="fa fa-calendar">  <%=dt %></span>  
   &nbsp; &nbsp; &nbsp; &nbsp;  
   &nbsp; &nbsp; &nbsp; &nbsp;  
  
   
   </label>
   
  
       </div>		
     </div>
     </div>
     
     
     
     
     
    </div>
    </div>
    
    </div>
 	</div> 
 	
 	<div class="row">
 	<div class="col-lg-6 col-sm-12">
 	   <div class="card">
      <div class="card-body">
   <div class="card-title"><h3>Choose :</h3></div>
   <div class="form-group">
   <div class="row">
   <div class="col-6">
      <label class="form-check-label" for="exampleRadios1" >
    Staff
  </label> &emsp;    
     <input class="form-check-input buto" type="radio" name="exampleRadios" id="exampleRadios1" value="staff" checked>
  
 
		
          </div>
 <div class="col-6"> 
        <label class="form-check-label"   for="exampleRadios1">
    Agent
  </label>   &emsp; 
     <input class="form-check-input buto" type="radio"  name="exampleRadios" value="agent">
  
 
		
         </div>
          </div>
      </div>
      </div>
      </div>
 	</div>
 	</div>
 
 	<div class="row">
 	<div class="col-12">
 	<div class="card">	<div class="card-body">
 	<div class="card-title"><h4><b>Payment Details</b></h4></div>
 	<div class="table-responsive">
									<table  class="display table table-striped table-hover" cellspacing="0" width="100%">
																	<!-- <thead> -->
											<thead>

												<tr>
												<th>Tracking Number</th>
												<th>Total Charges</th>
												<th>Delivery Charges</th>

													<th>Product Amount</th>

													
													<th>Commission</th>
													<th>Receiver Name</th>
													<th>Receiver Phone</th>
													<th>Receiver Township</th>
													<th>Receiver State</th>
													<th>Delivery Date</th>
													<th>Delivery Staff Name</th>

												
													
													
													
												
													
												</tr>
											</thead>
											
											
											
														<!-- <tbody> -->
											<tbody>
											
											

											</tbody>
										<!-- 	End tbody -->
									</table>
									
</div>
 	
 	
 	
 	</div>
 	</div>
 	</div>
 	</div>
 	<input type="hidden" value="<%=ccode%>" id="ccode">
 	<input type="hidden" value="<%=agent_code%>" id="agent_code">
 	
 	<div class='row'>
 	<div class="col-lg-12 col-sm-12">
 	<form id="payment_form">
 	<div class="card">
 	<div class="card-body">
 	<div class="card-title"><h4><b>Pricing</b></h4></div>
 		<div class="row text-justify" id="total_charges">
 	
 	<div class="col-2">
 	
 	  <label for="colFormLabelLg" class="col-form-label col-form-label-lg">Total Charges :</label>
 	
 	</div>
 	<div class="col-3">
 	 
 	  <label for="colFormLabelLg" class="col-form-label col-form-label-lg" id="total"></label>
 	
 	</div>
 	</div>
 	
 	
 	<div class="row text-justify " id="total_commision">
 	
 	<div class="col-2">
 	
 	  <label for="colFormLabelLg" class="col-form-label col-form-label-lg">Total Commission :</label>
 	
 	</div>
 	<div class="col-3">
 	 
 	  <label for="colFormLabelLg" class="col-form-label col-form-label-lg" id="total_commission"></label>
 	
 	</div>
 	</div>
 	
 	
 	<div class="row text-justify">
 	
 	<div class="col-2">
 	
 	  <label for="colFormLabelLg" class="col-form-label col-form-label-lg">Payable Amount :</label>
 	
 	</div>
 	<div class="col-3">
 	 
 	  <label for="colFormLabelLg" class="col-form-label col-form-label-lg" id="payable_amt"></label>
 	
 	</div>
 	</div>
 	
 	
 	
 	
 	
 	
 	</div>
 	</div>
 	
 	</div>
 	
 	</div>
 	<div class="row">
 	<div class="col-lg-12 col-sm-12">
 	<div class="card">
 	<div class="card-body">
 	<div class="card-title"><h4><b>Receipient</b></h4></div>
 	<div class="form-group"> 
        <label class="pure-material-textfield-outlined">
		<select id="agent_staff" required>
		
		</select>
		<span>Receipient Staff Code</span>
		</label>
        </div> 	
        </div>
        </div>
 	</div>
 	</div>
 	<div class="row">
 	<div class="col-lg-8 col-sm-12 ">
 	<div class="card">
 	<div class="card-body">
 	<div class="card-title"><h4><b>Payment</b></h4></div>
 	<div class="form-group row"> 
 	<div class="col-8">
        <%
        PreparedStatement pre=conn.prepareStatement("Select paytype_code,paytype,QR_pic from paycode");
 			  ResultSet rs=pre.executeQuery();
 			  while(rs.next()){
        %>
     <input class="form-check-input payment" type="radio" value="<%=rs.getString("QR_pic")%>$<%=rs.getString("paytype_code")%>" name="payment" checked>
   <label class="form-check-label" >
   <%=rs.getString("paytype")%>
  </label> <br>
  <%} %> 
 
 
		
         </div>
         <div class="col-4">
        <img src="kbzpay.png" alt="kbzpay" id="payment_img" class="img-thumbnail">
         </div>
         
         </div>
         
 	
 	</div>
 	</div>
 	</div>
 	<div class="col-lg-4 col-sm-12">
 	
 	  <div class="card">
      <div class="card-body">
    <canvas id="canvas" hidden></canvas>
<div class="form-group text-center"> 
          
     
		<input type="text" class="form-control" id="result" aria-describedby="result" readonly ><br>
		
		
         </div> 
      
      </div>
      </div>
 	</div>
 
 	</div>
 	<div class="row">
 	<div class="col-12 text-center">
 
 	<button type="submit" class="btn btn-primary" id="make_payment" disabled>Make Payment</button>
 	
 	</div>
 	</div>
 	
 	
 	
   </div>
</form>
    
    <!-- Welcome  body  Area Start -->
	 
	
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
								Name of IT Partner Company Ã¢ÂÂ &nbsp&nbsp&nbspI-ECHO Software
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
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
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

		<!-- Warehouse  Query  Ajax  end -->
	
	
		<!-- Warehouse  Query  count  script  start -->

		<!-- Warehouse  Query   count end   -->

	
		<!-- Warehouse  Query  list  table  start -->
	

 	<!-- Warehouse  Query  list table end  t -->

</body>

</html>