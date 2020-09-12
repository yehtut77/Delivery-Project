<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

  <%@page import="java.text.SimpleDateFormat,java.util.Date"%>
            <%@ page import="java.time.format.DateTimeFormatter" %>
    <%@ page import="java.time.*" %>
<!DOCTYPE html>
<html lang="en">
 
<%//Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/delivery1","root","root");
//Connection conn = DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");


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
 	 <script>
 	
	 
 	 
 $(document).ready(function(){
	 

	 
	  $('#total_charges').addClass("d-none"); 
		 $('#total_commision').addClass("d-none");
		 
	 $(".buto").click(function(){
         var radioValue = $("input[name='exampleRadios']:checked").val();
         var ccode='<%=ccode%>';
 		var agent_code='<%=agent_code%>';
	 if(radioValue=="staff"){
		
		  $.ajax({
	    		url: "paymentFetch",
	    		type: 'POST',
	    		data: {
	    			ccode:ccode,
	    			agent_code:agent_code,
	    			type:"staff",
	    			
	    		    
	    		},
	    		success: function(data) {
	    		//$('#city_name').val(data);
	    		var arr=data.trim().split('$');
	    		  $("table").find("tr:gt(0)").remove();
	    			$('tbody').append(arr[0]);
	    			 $("#payable_amt").text(arr[1]);
	    	
	    			 $('td:nth-child(5),th:nth-child(5)').hide();
	    		
	    		
	    	
	    		}
	
	
	
	
	});
		 
		 
		 
		  $('#total_charges').addClass("d-none"); 
		 $('#total_commision').addClass("d-none");
		 
	
	 }
	 if(radioValue=="agent"){
		  $.ajax({
	    		url: "paymentFetch",
	    		type: 'POST',
	    		data: {
	    			ccode:ccode,
	    			agent_code:agent_code,
	    			type:"agent",
	    			
	    		    
	    		},
	    		success: function(data) {
	    		//$('#city_name').val(data);
	    		var arr=data.trim().split('$');
	    		  $("table").find("tr:gt(0)").remove();
	    			$('tbody').append(arr[0]);
	    			 $("#payable_amt").text(arr[1]);
	    	
	    			
	    		console.log(data);
	    		
	    	
	    		}
	
	
	
	
	});
		 
		 
		  $('td:nth-child(5),th:nth-child(5)').show();
		 $('#total_charges').removeClass("d-none");
		 $('#total_commision').removeClass("d-none");
		
	 }
	 });
	 var video = document.createElement("video");
     var canvasElement = document.getElementById("canvas");
     var canvas = canvasElement.getContext("2d");
     var loadingMessage = document.getElementById("loadingMessage");
     var outputContainer = document.getElementById("output");
     var outputMessage = document.getElementById("outputMessage");
     var outputData = document.getElementById("outputData");
     const mediaStream=null;
     const tracks=null;
     var s;
	 $(".payment").click(function(){
		 
		 
		 
         var radioValue = $("input[name='payment']:checked").val();
         if(radioValue=="kpay"){
        	 $("#payment_img").removeClass("d-none");
        	if(s!=null){
        		 s.getTracks()[0].stop();
        		 canvasElement.hidden = true;
        	}
        	 $("#payment_img").attr("src", "kbzpay.png");
         }
         else if(radioValue=="cb"){
        	 $("#payment_img").removeClass("d-none");
        	 if(s!=null){
        		 s.getTracks()[0].stop();
        		 canvasElement.hidden = true;
        	}
        	
        	 $("#payment_img").attr("src", "cbpay.png");
         }
         else if(radioValue=="cash"){
        	 $("#payment_img").addClass("d-none");
         }
         else if(radioValue=="mpu"){
        	 $("#payment_img").addClass("d-none");

             function drawLine(begin, end, color) {
               canvas.beginPath();
               canvas.moveTo(begin.x, begin.y);
               canvas.lineTo(end.x, end.y);
               canvas.lineWidth = 4;
               canvas.strokeStyle = color;
               canvas.stroke();
             }

             // Use facingMode: environment to attemt to get the front camera on phones
             navigator.mediaDevices.getUserMedia({ video: { facingMode: "environment" } }).then(function(stream) {
            	s=stream;
               video.srcObject = stream;
               video.setAttribute("playsinline", true); // required to tell iOS safari we don't want fullscreen
               video.play();
               requestAnimationFrame(tick);
              
             
             });
         	function beep() {
         	    var snd = new  Audio("data:audio/wav;base64,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qJrx4KOQjahZxWbcZgztj2c49nKmkId44S71j0c8eV9yDK6uPRzx5X18eDvjvQ6yKo9ZSS6l//8elePK/Lf//IInrOF/FvDoADYAGBMGb7FtErm5MXMlmPAJQVgWta7Zx2go+8xJ0UiCb8LHHdftWyLJE0QIAIsI+UbXu67dZMjmgDGCGl1H+vpF4NSDckSIkk7Vd+sxEhBQMRU8j/12UIRhzSaUdQ+rQU5kGeFxm+hb1oh6pWWmv3uvmReDl0UnvtapVaIzo1jZbf/pD6ElLqSX+rUmOQNpJFa/r+sa4e/pBlAABoAAAAA3CUgShLdGIxsY7AUABPRrgCABdDuQ5GC7DqPQCgbbJUAoRSUj+NIEig0YfyWUho1VBBBA//uQZB4ABZx5zfMakeAAAAmwAAAAF5F3P0w9GtAAACfAAAAAwLhMDmAYWMgVEG1U0FIGCBgXBXAtfMH10000EEEEEECUBYln03TTTdNBDZopopYvrTTdNa325mImNg3TTPV9q3pmY0xoO6bv3r00y+IDGid/9aaaZTGMuj9mpu9Mpio1dXrr5HERTZSmqU36A3CumzN/9Robv/Xx4v9ijkSRSNLQhAWumap82WRSBUqXStV/YcS+XVLnSS+WLDroqArFkMEsAS+eWmrUzrO0oEmE40RlMZ5+ODIkAyKAGUwZ3mVKmcamcJnMW26MRPgUw6j+LkhyHGVGYjSUUKNpuJUQoOIAyDvEyG8S5yfK6dhZc0Tx1KI/gviKL6qvvFs1+bWtaz58uUNnryq6kt5RzOCkPWlVqVX2a/EEBUdU1KrXLf40GoiiFXK///qpoiDXrOgqDR38JB0bw7SoL+ZB9o1RCkQjQ2CBYZKd/+VJxZRRZlqSkKiws0WFxUyCwsKiMy7hUVFhIaCrNQsKkTIsLivwKKigsj8XYlwt/WKi2N4d//uQRCSAAjURNIHpMZBGYiaQPSYyAAABLAAAAAAAACWAAAAApUF/Mg+0aohSIRobBAsMlO//Kk4soosy1JSFRYWaLC4qZBYWFRGZdwqKiwkNBVmoWFSJkWFxX4FFRQWR+LsS4W/rFRb/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////VEFHAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAU291bmRib3kuZGUAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMjAwNGh0dHA6Ly93d3cuc291bmRib3kuZGUAAAAAAAAAACU=");  
         	    snd.play();
         	}
             function tick() {
               
               if (video.readyState === video.HAVE_ENOUGH_DATA) {
                 
                 canvasElement.hidden = false;
                 

                 canvasElement.height = video.videoHeight;
                 canvasElement.width = video.videoWidth;
                 canvas.drawImage(video, 0, 0, canvasElement.width, canvasElement.height);
                 var imageData = canvas.getImageData(0, 0, canvasElement.width, canvasElement.height);
                 var code = jsQR(imageData.data, imageData.width, imageData.height, {
                   inversionAttempts: "dontInvert",
                 });
                 if (code){
                	
                   drawLine(code.location.topLeftCorner, code.location.topRightCorner, "#FF3B58");
                   drawLine(code.location.topRightCorner, code.location.bottomRightCorner, "#FF3B58");
                   drawLine(code.location.bottomRightCorner, code.location.bottomLeftCorner, "#FF3B58");
                   drawLine(code.location.bottomLeftCorner, code.location.topLeftCorner, "#FF3B58");
                 
                   console.log(code.data);
                   s.getTracks()[0].stop();
                   beep();
                   $("#result").val(code.data);
                   canvasElement.hidden = true;
                  
                 } 
               }
               requestAnimationFrame(tick);
             }
         
         
         
         
         
         }
        
     });
	 
	
	 
 });
 </script>
 	<div class='row'>
 	<div class="col-lg-12 col-sm-12">
 	<div class="card">
 	<div class="card-body">
 	<div class="card-title"><h4><b>Pricing</b></h4></div>
 		<div class="row text-justify" id="total_charges">
 	
 	<div class="col-2">
 	
 	  <label for="colFormLabelLg" class="col-form-label col-form-label-lg">Total Charges :</label>
 	
 	</div>
 	<div class="col-3">
 	 
 	  <label for="colFormLabelLg" class="col-form-label col-form-label-lg" id="delivery_charges"></label>
 	
 	</div>
 	</div>
 	
 	
 	<div class="row text-justify " id="total_commision">
 	
 	<div class="col-2">
 	
 	  <label for="colFormLabelLg" class="col-form-label col-form-label-lg">Total Commision :</label>
 	
 	</div>
 	<div class="col-3">
 	 
 	  <label for="colFormLabelLg" class="col-form-label col-form-label-lg" id="total"></label>
 	
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
		<select>
		<option>Ye Htut Khaung</option>
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
        
     <input class="form-check-input payment" type="radio" value="kpay" name="payment" checked>
   <label class="form-check-label" >
    KBZ Pay
  </label> <br> 
  <input class="form-check-input payment" type="radio"   name="payment" value="cb" >
   <label class="form-check-label" >
    CB Pay
  </label>  <br>
  <input class="form-check-input payment" type="radio"   name="payment" value="mpu" >
   <label class="form-check-label" >
    MPU/JCB/VISA/MASTER
  </label> <br> 
  <input class="form-check-input payment" type="radio"   name="payment" value="cash">
   <label class="form-check-label">
    Cash
  </label> 
 
		
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
 	<script>
 	
 	</script>
 	</div>
 	<div class="row">
 	<div class="col-12 text-center">
 
 	<button type="submit" class="btn btn-primary" id="btn" disabled>Make Payment</button>
 	
 	</div>
 	</div>
 	
 	
 	
   </div>

    
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
								Name of IT Partner Company â &nbsp&nbsp&nbspI-ECHO Software
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