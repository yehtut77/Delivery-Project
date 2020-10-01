<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
 <%@ page import="java.sql.*"%>  
  <%@page import="java.text.SimpleDateFormat,java.util.Date"%>
            <%@ page import="java.time.format.DateTimeFormatter" %>
    <%@ page import="java.time.*" %>
 
	<% HttpSession ssss=request.getSession(false);					
	String username=(String)ssss.getAttribute("staffName");
	String staffCode=(String)ssss.getAttribute("staffCode");
	String agentCode=(String)ssss.getAttribute("agentCode");
	String companyCode=(String)ssss.getAttribute("companyCode");
    DateTimeFormatter dat = DateTimeFormatter.ofPattern("dd/MM/yyyy");
    DateTimeFormatter clock = DateTimeFormatter.ofPattern("hh:mm a");
  LocalDateTime localDateTime = LocalDateTime.now();
  String dt = dat.format(localDateTime);
  String ck=clock.format(localDateTime);

  

  %>
	   
	
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Title -->
    <title>Myanamr Delivery</title>

    <!-- Favicon -->
    <link rel="icon" href="./img/core-img/aaa.png">

    <!-- Stylesheet -->
     <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="inputstyle.css">  
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <style>
  video{
     width:50%;
     height:30%;
 }
  #interactive{
     width:80%;
     height:30%;
 }
html { height: 100% }

      body { height: 100%; margin: 0; padding: 0; font-size:14px;
   
       }

      #map-canvas { 
      width:80px;
      height: auto;
     
       }
       #select{
       width:20%;
       border-radius: 14px;
       height: 30px;}


.photo{

width:100px;
height:100px;
margin-left: 100px;

}
.aa{
width:200px;
height:100px;
}

#myInput {
  background-image: url('/css/searchicon.png');
  background-position: 10px 12px;
  background-repeat: no-repeat;
  width: 100%;
  font-size: 16px;
  padding: 12px 20px 12px 40px;
  border: 1px solid #ddd;
  margin-bottom: 12px;
}

#myUL {
  list-style-type: none;
  padding: 0;
  margin: 0;
}

#myUL li a {
  border: 1px solid #ddd;
  
  margin-top: -1px; /* Prevent double borders */
  background-color: #f6f6f6;
  padding: 10px;
  text-decoration: none;
  font-size: 15px;
  color: black;
  display: block
}

#myUL li a:hover:not(.header) {
  background-color: green;
}

 


	 
   
.card{
 
box-shadow: -5px 5px 20px rgba(69, 65, 78, 0.21);
 
}
       /* Input */
.pure-material-textfield-outlined > input{
    box-sizing: border-box;
    margin: 0;
    border: solid 1px; /* Safari */
    border-color: #ABABAB  ;
 
    border-radius: 4px;
    padding: 5px 7px 1px;
    width: 80%;
    height: 30px;
    color: rgba(var(--pure-material-onsurface-rgb, 0, 0, 0), 0.87);
    background-color: transparent;
    box-shadow: none; /* Firefox */
    font-family: inherit;
    font-size: 17px;
    line-height: inherit;
    caret-color: rgb(var(--pure-material-primary-rgb, 128, 193, 67));
    
    transition: border 0.1s, box-shadow 0.5s;
}

/* Hover */
.pure-material-textfield-outlined:hover > input{
    border-color:blue;
   
}
  #sig-canvas {
  border: 2px dotted #CCCCCC;
  border-radius: 15px;
  cursor: crosshair;
}
#myModal{
  top: 30%;
  text-align: center;
   left: 11%;
   overflow-x:hidden;
   overflow-y: hidden;
    height:60%;
width:80%;
}
#myModal2{
  top: 30%;
  text-align: center;
   left: 30%;
   overflow-x:hidden;
   overflow-y: hidden;
    height:60%;
width:30%;
}



/* The Close Button */
.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}

</style>
  
</head>
<script type="text/javascript" src="test.js" ></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <script>

 </script>

 	
<body>



<!-- The Modal -->
<div class="row"><div class="col-3">
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <center> <input type="button" class="btn btn-primary" value="capture image" id="capbut" onclick="snapimg()" style="width:200px;">   </center>     
    <p id="scanbarcode">Read Your BarCode..</p>
      <center><div id="interactive" class="viewport"></div></center>
             
              
  </div>
</div></div>
</div>

<div id="myModal2" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
           <h3 style="color:red;text-align:center;">Invalid Tracking Number !</h3> 
                          <center><input type="button" class="btn btn-primary" style="width:100px;" value="OK" onclick="closemod()">           </center>

  </div>

</div>


    <!-- Preloader -->
    <div id="preloader">
        <div class="loader"></div>
    </div>
    <!-- /Preloader -->

    <!-- Header Area Start -->
    <header class="header-area">
        <!-- Top Header Area Start -->
       
        <!-- Top Header Area End -->

        <!-- Main Header Start -->
        <div class="main-header-area">
            <div class="classy-nav-container breakpoint-off">
                <div class="container">
                    <!-- Classy Menu -->
                    <nav class="classy-navbar justify-content-between" id="akameNav">

                        <!-- Logo -->
                       <a class="nav-brand" href="index.">Myanmar Delivery</a>

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
                                    <li><a href="./index.jsp">Home</a></li>
                                    
                             
                                         
									<li><a href="#">Operation</a>     
                                    <div class="dropdown">
   
									  <a href="pickUp_from.jsp"  >Pick up from customer</a>
									  <a href="outfordelivery.jsp">Out For Delivery</a>
									  <a href="doprintout.jsp">DO Print Out</a>
									</div>
                                    </li>
                                    
                                      <li><a href="#">Consolidate Items</a></li>
                                    <li><a href="./career.jsp">Career</a></li>
                                    <li><a href="./about.jsp">About Us</a></li>
                                    
                                    <li><a href="./contact.jsp">Contact Us</a></li>
                                    <li><a href="kill_session">Logout</a></li>
                                </ul>

                                <!-- Cart Icon -->
                              

                                <!-- Book Icon -->
                               
                            </div>
                            <!-- Nav End -->
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- Header Area End -->
    
     
    
	
		
   

<div class="bod" style="background-color: #c9cfcf;"><br><br> 


  <!-- BackHome Area Start -->
 
 
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumb-content">
                        <h3>Receiver Confirmation</h3>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.jsp"><i class="icon_house_alt"></i> Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Receiver Confirmation</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
  
  
    <!-- BackHome Area End -->

   <div class="container">

	<div class="row">
	
	<div class="col-6" >
	<div class="card">

  <div class="m" style="margin:10px;">

 <div class="row"><div class="col-6">
<div class="form-group"> 
	  
    <label style="font-size:15px;"><b>Company Code</b> </label>  
      
		    </div> 
   <div class="form-group"> 
	  
    	 <label style="font-size:15px;"><b>Agent Code</b></label>   
      	
    </div> 
   <div class="form-group"> 
	  
    	 <label style="font-size:15px;"><b>Staff Code</b></label>   

    </div> 
   <div class="form-group"> 
	  
    	 <label style="font-size:15px;"><b>Staff Name</b></label>   

    </div> 
   

       </div>
       <div class="col-6">
<div class="form-group"> 
	  
    	 <label style="font-size:15px;">: <%=companyCode %></label>   
      
		    </div> 
   <div class="form-group"> 
	  
    	 <label style="font-size:15px;">: <%=agentCode %></label>   
      	
    </div> 
   <div class="form-group"> 
	  
    	 <label style="font-size:15px;">: <%=staffCode %></label>   

    </div> 
   <div class="form-group"> 
	  
    	 <label style="font-size:15px;">: <%=username %></label>   

    </div> 
   

       </div>
</div>
         
 
 
 
</div>

  
</div>
   
 </div>

 <div class="col-6" >
	<div class="card">

  <div class="m" style="margin:10px;">
 
 <div class="row">
<div class="col-6">
 
<div class="form-group"> 
	    <label style="font-size:15px;">
 <b>  Date</b>&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
  
   </label>
    	
		    </div> 
	  <div class="form-group"> 
	  
       <label style="font-size:15px;"><b>Tracking Number</b></label>   
		    </div> 

       </div>
       <div class="col-6">
   <div class="row"><div class="col-12">     <div class="form-group"> 
	   <label style="font-size:12px;"> <span style="color:blue;" class="fa fa-calendar"> <%=dt %></span>  
 
   &nbsp;   
   <span style="color:blue;" class="fa fa-clock-o" style="text-align:right;"> <%=ck %></span>
   </label>   
		    </div> 
       <div class="form-group"> 
			 <button id="myBtn" style="font-size:12px;" class="btn btn-primary" >Read Bar Code &nbsp;<i class="fa fa-camera" style="font-size:20px"></i></button>
	 <input type="text"  id="typee" readonly class="form-control" style="height:27px;">
    </div> 
       </div>
       </div>
 
 
 
 
</div>

  
</div>
   
 </div>
 </div>
 </div> </div> <br><br>
 

	

 	<div class="row">
	
	<div class="col-6" >
	<div class="card">
 <h5><br>&nbsp;&nbsp;Receiver Information</h5><br><br>

  <div class="m" style="margin:10px;">
 <div class="row">
 <div class="col-6">
 
<div class="form-group"> 
	  
    	 <label style="font-size:15px;">Receiver Name:</label>   
      
		
    </div> 
<div class="form-group"> 
	  
    	 <label style="font-size:15px;">Receiver Phone:</label>   
      
    </div> 
<div class="form-group"> 
	  
    	 <label style="font-size:15px;">Receiver Address:</label>   

    </div> 
<div class="form-group"> 
	  
    	 <label style="font-size:15px;">Receiver Township:</label>   
      
		
    </div> 
<div class="form-group"> 
	  
    	 <label style="font-size:15px;">Receiver State:</label>   
      
    </div> 

   

       

         </div>
         
         <div class="col-6">
         <div class="form-group"> 
	  
      
		
	<input type="text"  id="rn" name=" "  placeholder=" " readonly class="form-control" style="height:31px;font-size:15px;">
    </div> 
<div class="form-group"> 
	  
      
	 <input type="text"    name=" "  placeholder=" " id="rp" class="form-control" readonly style="height:31px;font-size:15px;">
    </div> 
<div class="form-group"> 
	  
      
		 
	 <input type="text"  name=" "  placeholder=" " id="ra" class="form-control"  readonly style="height:31px;font-size:15px;">
    </div> 
<div class="form-group"> 
	  
    	
      
		
	 <input type="text"    name=" " id="rt" placeholder=" " class="form-control" readonly style="height:31px;font-size:15px;">
    </div> 
<div class="form-group"> 
	  
    	
      
	 <input type="text"    name=" " id="rs" placeholder=" " class="form-control" readonly style="height:31px;font-size:15px;">
    </div> 

   

       
       </div>
       </div>
         
 
 
 
</div>

  
</div>
   
 </div>

 <div class="col-6" >
	<div class="card">

  <div class="m" style="margin:10px;">
 <div class="row">
 <div class="col-6">
 <br><br>
<div class="form-group"> 
	  
    	 <label style="font-size:15px;">Waybill Type:</label>   
         </div> 
<div class="form-group" id="pad"> 
	  
    	 <label style="font-size:15px;">Product Amount:</label>     </div> 
<div class="form-group" id="dcd"> 
	  
    	 <label style="font-size:15px;">Delivery Charges:</label>  </div> 
<div class="form-group" id="tad" > 
	  
    	 <label style="font-size:15px;">Total Amount:</label> </div> 

   

       

         
       </div>
        <div class="col-6">
 <br><br>
<div class="form-group"> 
	  
    	<input type="text"  id="wt" name=" "  placeholder=" " readonly class="form-control" style="height:31px;font-size:15px;">
    </div> 
<div class="form-group" id="padd"> 
	 <input type="text"    name=" "  placeholder=" " id="pa" class="form-control" readonly style="height:31px;font-size:15px;">
    </div> 
<div class="form-group" id="dcdd">  <input type="text"  name=" "  placeholder=" " id="dc" class="form-control"  readonly style="height:31px;font-size:15px;">
    </div> 
<div class="form-group" id="tadd" > <input type="text"    name=" " id="ta" placeholder=" " class="form-control" readonly style="height:31px;font-size:15px;">
    </div> 

   

       

         
       </div>
 
 
 
 
</div>

  
</div>
   
 </div>
 </div>
 </div> 
 <br><br>
 
  	<div class="row" id="paymentradio">
	
 <div class="col-12" >
	<div class="card">

  <div class="m" style="margin:10px;">
 <div class="row">
 <div class="col-12">

   
 <div class="row">
 <div class="col-6">
<br><h5>Payment</h5><br>
 <div class="row"><div class="col-6">
<div class="form-group"> 
	  
      <input type="radio" value="<img src='cbpay.png' width='400px' height='400px'>" id="cb" name="paymentradio"  >
   </div>   
</div>
	<div class="col-6">
<div class="form-group">  <label style="font-size:15px;">CBPay</label>   
   </div>   
		</div></div>
		
		<div class="row"><div class="col-6">
<div class="form-group" id="pad"> 
	  
    	 <input type="radio" value="<img src='kbzpay.png' width='400px' height='400px'>" id="kb" name="paymentradio"  > 
   
      
		
    </div> 		</div><div class="col-6">
<div class="form-group" id="pad"> 
	   <label style="font-size:15px;">KBZPay:</label> 
   
      
		
    </div> </div></div>
     <div class="row"><div class="col-6">
    
    
<div class="form-group" id="dcd"> 
	  
    	 <input type="radio" value="<input type='button' class='btn delivery-btn1 btn-3 mt-15 active' value='Scan QR Code' onclick='scanQR()'/>" id="vis" name="paymentradio"  />
      
		 
    </div> </div><div class="col-6">
<div class="form-group" id="dcd"> 
	  <label style="font-size:15px;">MPU/JCB/VISA/MASTER:</label>   
      
		 
    </div> </div></div>
     <div class="row"><div class="col-6">

<div class="form-group" id="tad" > 
	  
    	 <input type="radio" id="cash" value="" name="paymentradio"  > 
      
	    </div>	</div><div class="col-6">
<div class="form-group">  <label style="font-size:15px;">Cash</label>   
   </div>   
		</div></div>
 </div>



   
  <div class="col-6">
       	<br><br><br>  
   <div id="showoption" class="thumbnail" style="width:150px;height:150px"></div>
</div>	 
       </div>
 
        
      
 
 
 
 

  
</div>
   
 	<br><br><br>  
       

         
       </div>

 
 
 
 
</div>

  
</div>
  
 </div>
 </div>
  <br>
  
  	<div class="row" id="">
	
 <div class="col-12" >
	<div class="card">

  <div class="m" style="margin:10px;">
 <div class="row">
 <div class="col-12">

   
 <div class="row">
 <div class="col-6">
<br><h5>Attachment Receipt</h5><br>
   <input type="text" name="ImageData" id="ImageData" hidden />
   <canvas id="canvas" width="213" height="160"  name="ImageFile1" style="display: none;"></canvas>

        <img id="canvasImg" name="ImageFile"><img>
            <button onclick="opencam()" class="btn btn-primary" id="snap">Capture Photo</button>
        
        <input class="btn btn-default" type="button" onclick="resetimg()" value="Reset"/>
        
        </div> 
 
	
       </div></div></div></div>

  </div>

 </div> <br><br>
 

		<br><br><br>

 </div>
 <br> 	<div class="row">
	
 <div class="col-12" >
	<div class="card">

  <div class="m" style="margin:10px;">
 <div class="row">
 <div class="col-12">

   
 <div class="row">
 <div class="col-6">
<br><h5>Recipient Sign</h5><br>
<canvas id="sig-canvas" width="270" height="160">
		 			Get a better browser, bro.
		 		</canvas>
		 		<img id="sig-image" src=""/>
				<textarea hidden id="sig-dataUrl" class="form-control" rows="5" name="signal">.</textarea>
				<div class="row"><div class="col-6">
			<button class="btn btn-primary" id="sig-submitBtn">Submit Signature</button>
				<button class="btn btn-default" id="sig-clearBtn">Clear Signature</button></div></div>

	
</div></div>
 </div></div></div>

  

 
 
 </div> <br>
 <div class="row" id="">
	
 <div class="col-12" >
	<div class="card">

  <div class="m" style="margin:10px;">
 <div class="row">
 <div class="col-12">

   
 <div class="row">
 <div class="col-6">
<br><h5>Reason (Only If Reject).</h5><br>
   <div class="form-group">
 
  <textarea class="form-control" rows="5" id="reasontext"></textarea>
</div> 
        
        </div> 
 
	
       </div></div></div></div>

  </div>

 </div> <br><br>
 

		<br><br><br>

 </div><br><br>
     <center><input type="button" onclick="conf()" class="btn delivery-btn1 btn-3 mt-15 active" value="Confirm"/>&nbsp;&nbsp;&nbsp;<input type="button" class="btn delivery-btn1 btn-3 mt-15 " value="Reject" onclick="rej()"/>&nbsp;&nbsp;&nbsp;<input type="button" class="btn delivery-btn1 btn-3 mt-15 " onclick="redeli()" value="Re_Delivery"/></center>
 

		<br><br><br>

 </div></div></div></div>
  

 





	 

    <!-- Border -->
    <div class="container">
        <div class="border-top"></div>
    </div>

  <!-- Footer Area Start -->
    <footer class="footer-area section-padding-80-0" >
        <div class="container">
            <div class="row justify-content-between">

                <!-- Single Footer Widget -->
                <div class="col-12 col-sm-6 col-md-4">
                    <div class="single-footer-widget mb-80">
                        <!-- Footer Logo -->
                      <h4 class="widget-title">Our Company</h4>

                        <p class="mb-30">Name of founder company - &nbsp&nbsp&nbspPartner Pacific Group Co., Ltd.<br>
Date of Incorporation -&nbsp&nbsp&nbsp2014<br>
Name of Transport Partner Company - &nbsp&nbsp&nbspMK Express</i> <br></p>

                        <!-- Copywrite Text -->
                        
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
                            <a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
                            <a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
                            <a href="#" class="google-plus"><i class="fa fa-google-plus"></i></a>
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
                            <p>myanmardelivery@gmail.com</p>
                            <p>Address: Yangon,Myanmar</p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </footer> 	
 
    <!-- Footer Area End -->
            <script type="text/javascript">
        
        (function() {
        	  window.requestAnimFrame = (function(callback) {
        	    return window.requestAnimationFrame ||
        	      window.webkitRequestAnimationFrame ||
        	      window.mozRequestAnimationFrame ||
        	      window.oRequestAnimationFrame ||
        	      window.msRequestAnimaitonFrame ||
        	      function(callback) {
        	        window.setTimeout(callback, 1000 / 60);
        	      };
        	  })();

        	  var canvas = document.getElementById("sig-canvas");
        	  var ctx = canvas.getContext("2d");
        	  ctx.strokeStyle = "#222222";
        	  ctx.lineWidth = 4;

        	  var drawing = false;
        	  var mousePos = {
        	    x: 0,
        	    y: 0
        	  };
        	  var lastPos = mousePos;

        	  canvas.addEventListener("mousedown", function(e) {
        	    drawing = true;
        	    lastPos = getMousePos(canvas, e);
        	  }, false);

        	  canvas.addEventListener("mouseup", function(e) {
        	    drawing = false;
        	  }, false);

        	  canvas.addEventListener("mousemove", function(e) {
        	    mousePos = getMousePos(canvas, e);
        	  }, false);

        	  // Add touch event support for mobile
        	  canvas.addEventListener("touchstart", function(e) {

        	  }, false);

        	  canvas.addEventListener("touchmove", function(e) {
        	    var touch = e.touches[0];
        	    var me = new MouseEvent("mousemove", {
        	      clientX: touch.clientX,
        	      clientY: touch.clientY
        	    });
        	    canvas.dispatchEvent(me);
        	  }, false);

        	  canvas.addEventListener("touchstart", function(e) {
        	    mousePos = getTouchPos(canvas, e);
        	    var touch = e.touches[0];
        	    var me = new MouseEvent("mousedown", {
        	      clientX: touch.clientX,
        	      clientY: touch.clientY
        	    });
        	    canvas.dispatchEvent(me);
        	  }, false);

        	  canvas.addEventListener("touchend", function(e) {
        	    var me = new MouseEvent("mouseup", {});
        	    canvas.dispatchEvent(me);
        	  }, false);

        	  function getMousePos(canvasDom, mouseEvent) {
        	    var rect = canvasDom.getBoundingClientRect();
        	    return {
        	      x: mouseEvent.clientX - rect.left,
        	      y: mouseEvent.clientY - rect.top
        	    }
        	  }

        	  function getTouchPos(canvasDom, touchEvent) {
        	    var rect = canvasDom.getBoundingClientRect();
        	    return {
        	      x: touchEvent.touches[0].clientX - rect.left,
        	      y: touchEvent.touches[0].clientY - rect.top
        	    }
        	  }

        	  function renderCanvas() {
        	    if (drawing) {
        	      ctx.moveTo(lastPos.x, lastPos.y);
        	      ctx.lineTo(mousePos.x, mousePos.y);
        	      ctx.stroke();
        	      lastPos = mousePos;
        	    }
        	  }

        	  // Prevent scrolling when touching the canvas
        	  document.body.addEventListener("touchstart", function(e) {
        	    if (e.target == canvas) {
        	      e.preventDefault();
        	    }
        	  }, false);
        	  document.body.addEventListener("touchend", function(e) {
        	    if (e.target == canvas) {
        	      e.preventDefault();
        	    }
        	  }, false);
        	  document.body.addEventListener("touchmove", function(e) {
        	    if (e.target == canvas) {
        	      e.preventDefault();
        	    }
        	  }, false);

        	  (function drawLoop() {
        	    requestAnimFrame(drawLoop);
        	    renderCanvas();
        	  })();

        	  function clearCanvas() {
        	    canvas.width = canvas.width;
        	  }

        	  // Set up the UI
        	  var sigText = document.getElementById("sig-dataUrl");
        	  var sigImage = document.getElementById("sig-image");
        	  var clearBtn = document.getElementById("sig-clearBtn");
        	  var submitBtn = document.getElementById("sig-submitBtn");
        	  clearBtn.addEventListener("click", function(e) {
        	    clearCanvas();
        	    sigText.innerHTML = " ";
  sigImage.setAttribute("src", "");
        	    $("#sig-canvas").show();
        	    $("#sig-submitBtn").show();
        	  
        	  }, false);
        	  submitBtn.addEventListener("click", function(e) {
        	    var dataUrl = canvas.toDataURL();
        	    sigText.innerHTML = dataUrl;
        	    sigImage.setAttribute("src", dataUrl);
        	    $("#sig-canvas").hide();
        	    $("#sig-submitBtn").hide();
        	  }, false);

        	})();
        
        </script>
        <script type="text/javascript"> 
function resetsig(){
        	  var canvas = document.getElementById("sig-canvas");
canvas.width = canvas.width;
	 var sigText = document.getElementById("sig-dataUrl");
        	  var sigImage = document.getElementById("sig-image");
        	  var clearBtn = document.getElementById("sig-clearBtn");
        	  var submitBtn = document.getElementById("sig-submitBtn");
        	    sigText.innerHTML = " ";
  sigImage.setAttribute("src", "");
        	    $("#sig-canvas").show();
        	    $("#sig-submitBtn").show();
}

function snapimg(){
	 var canvas = document.getElementById("canvas");
	   var context = canvas.getContext("2d");
	   var video=document.querySelector("video"); 
	   context.drawImage(video, 0, 0, 200,150);
   document.getElementById('canvasImg').src = canvas.toDataURL("image/png");
   document.getElementById('ImageData').value = canvas.toDataURL("image/png");
$('#canvasImg').show();
$('#snap').hide();
$('#myModal').hide();

}
function resetimg(){
	$('#canvasImg').hide();
$('#snap').show();
$('#ImageData').val(" ");
}

</script>
 <button onclick="startT()" id="stst" hidden></button>
        
     <script>


</script>
	<script>
	function startT(){
		        $('#rn').val(" ");
				$('#rp').val(" ");
				$('#ra').val(" ");
				$('#rt').val(" ");
				$('#rs').val(" ");
				$('#wt').val(" ");
				$('#ta').val(" ");
				$('#dc').val(" ");
				$('#pa').val(" ");
			    	var typee2=document.getElementById("typee").value;
					var typee=typee2.trim();
				$.ajax({
					url: "RCC",
					type: 'POST',
					data: {
						typenext: typee,
						condition:"conf1"},
					success: function(data) {
				
					var data2=data.trim();
					if(data2=="InvalidTN"){$('#myModal2').show();				
}
					else{
				
						var a=data.split("$");
						var rname=a[0].trim();
						
				$('#rn').val(rname);
				$('#rp').val(a[1]);
				$('#ra').val(a[2]);
				$('#rt').val(a[3]);
				$('#rs').val(a[4]);
				var paydes=a[5];
				if(paydes=="Cash On Delivery"){
					$("#pad").show();
					$("#dcd").show();
					$("#tad").show();
					$("#padd").show();
					$("#dcdd").show();
					$("#tadd").show();
					$("#paymentradio").show();

				}
				if(paydes=="Charge to Receiver"){
					$("#pad").hide();
					$("#dcd").show();
					$("#tad").show();
					$("#padd").hide();
					$("#dcdd").show();
					$("#tadd").show();
					$("#paymentradio").show();

			}
				if(paydes=="Prepaid"){
					$("#pad").hide();
					$("#dcd").hide();
					$("#tad").hide();
					$("#padd").hide();
					$("#dcdd").hide();
					$("#tadd").hide();
					$("#paymentradio").hide();
					}
				$('#wt').val(paydes);
				$('#ta').val(a[6]);
				$('#dc').val(a[7]);
				$('#pa').val(a[8]);

					}}
					});
			   
			    

	}
	  function conf(){
		  var paycode="0";
			var r1=document.getElementById("cb");
			var r2=document.getElementById("kb");
			var r3=document.getElementById("vis");
			var r4=document.getElementById("cash");
				var rename=document.getElementById("rn").value;
			if(r1.checked){paycode="1";}
			if(r2.checked){paycode="2";}
			if(r3.checked){paycode="3";}
			if(r4.checked){paycode="4";}
		  var typee2=document.getElementById("typee").value;
			var typee=typee2.trim();
			var imgv=document.getElementById("ImageData").value;
			var tam=document.getElementById("ta").value;
				  var forprep=document.getElementById("wt").value;
			  		
if(forprep=="Prepaid"){paycode="  ";}
			var sigv=document.getElementById("sig-dataUrl").innerHTML;
	if(paycode=="0" || rename.length<=3 ){alert("Lack Of Information!");}else{
	if(paycode=="4"){
	if( imgv.length<=4 || sigv.length<=4 ){
	    	    	$.ajax({
	    		url: "RCC",
	    		type: 'POST',
	    		data: {
	    			img:"op",
	    			sig:"op",
	    			tam:tam,
	    			pcode:paycode,
	    			typenext: typee,
	    			condition:"conf2"},
	    		success: function(data) {
	    			alert("Confirmed Successfully");
	    			  $('#rn').val(" ");
				$('#rp').val(" ");
				$('#ra').val(" ");
				$('#rt').val(" ");
				$('#rs').val(" ");
				$('#wt').val(" ");
				$('#ta').val(" ");
				$('#dc').val(" ");
				$('#pa').val(" ");
				$('#typee').val(" ");
resetimg();
resetsig();
$('#cb').attr('checked', false);
$('#kb').attr('checked', false);
$('#vis').attr('checked', false);
$('#cash').attr('checked', false);
	$('#reasontext').val(" ");
$('#showoption').hide();
}
	    			});
	    	 	}else{	$.ajax({
	    		url: "RCC",
	    		type: 'POST',
	    		data: {
	    			img:imgv,
	    			sig:sigv,
	    			tam:tam,
	    			pcode:paycode,
	    			typenext: typee,
	    			condition:"conf2"},
	    		success: function(data) {
	    			alert("Confirmed Successfully");
	    			  $('#rn').val(" ");
				$('#rp').val(" ");
				$('#ra').val(" ");
				$('#rt').val(" ");
				$('#rs').val(" ");
				$('#wt').val(" ");
				$('#ta').val(" ");
				$('#dc').val(" ");
				$('#pa').val(" ");
				$('#typee').val(" ");
resetimg();
resetsig();
$('#cb').attr('checked', false);
$('#kb').attr('checked', false);
$('#vis').attr('checked', false);
$('#cash').attr('checked', false);
	$('#reasontext').val(" ");
$('#showoption').hide();
}
	    			});}}else
	    	 	{
	    	 	    if( imgv.length<=4 || sigv.length<=4 ){alert("Lack Of Information !");}else{
	    	    	$.ajax({
	    		url: "RCC",
	    		type: 'POST',
	    		data: {
	    			img:imgv,
	    			sig:sigv,
	    			tam:tam,
	    			pcode:paycode,
	    			typenext: typee,
	    			condition:"conf2"},
	    		success: function(data) {
	    			alert("Confirmed Successfully");
	    			  $('#rn').val(" ");
				$('#rp').val(" ");
				$('#ra').val(" ");
				$('#rt').val(" ");
				$('#rs').val(" ");
				$('#wt').val(" ");
				$('#ta').val(" ");
				$('#dc').val(" ");
				$('#pa').val(" ");
				$('#typee').val(" ");
resetimg();
resetsig();
$('#cb').attr('checked', false);
$('#kb').attr('checked', false);
$('#vis').attr('checked', false);
$('#cash').attr('checked', false);
	$('#reasontext').val(" ");
$('#showoption').hide();
}
	    			});
	    	 }	}
	    	 	}
	    		
	    	}
	  function opencam(){
		  var modal = document.getElementById("myModal");
			  modal.style.display = "block";
			  $('#capimgatt').show();
			  $('#capbut').show();
			  $('#scanbarcode').hide();
			  
	  }
	  
	  function rej(){
	  var rename=document.getElementById("rn").value;
var tam=document.getElementById("ta").value;
		  var typee2=document.getElementById("typee").value;
			var typee=typee2.trim();
			  var rea=document.getElementById("reasontext").value;
			  		
			 	if( rename.length<=3 || rea.length<=3 ){ alert("Lack Of Information!");}else{
		$.ajax({
			url: "RCC",
			type: 'POST',
			data: {
				typenext: typee,
				tam:tam,
				reason: rea,
				condition:"conf3"},
			success: function(data) {
alert("Rejected Successfully");
  $('#rn').val(" ");
				$('#rp').val(" ");
				$('#ra').val(" ");
				$('#rt').val(" ");
				$('#rs').val(" ");
				$('#wt').val(" ");
				$('#ta').val(" ");
				$('#dc').val(" ");
				$('#pa').val(" ");
				$('#typee').val(" ");
					$('#reasontext').val(" ");
				
resetimg();
resetsig();
$('#cb').attr('checked', false);
$('#kb').attr('checked', false);
$('#vis').attr('checked', false);
$('#cash').attr('checked', false);
$('#showoption').hide();


			}
			});
	   
	    

}}
	  
	  function redeli(){
			var rename=document.getElementById("rn").value;
var tam=document.getElementById("ta").value;
		  var typee2=document.getElementById("typee").value;
			var typee=typee2.trim();
						  var rea=document.getElementById("reasontext").value;

		if( rename.length<=3 || rea.length<=3){alert("Lack Of Information!");}else{
		$.ajax({
			url: "RCC",
			type: 'POST',
			data: {
				typenext: typee,
				tam:tam,
				reason: rea,
				condition:"conf4"},
			success: function(data) {
alert("Re-Delivery Successfully");
  $('#rn').val(" ");
				$('#rp').val(" ");
				$('#ra').val(" ");
				$('#rt').val(" ");
				$('#rs').val(" ");
				$('#wt').val(" ");
				$('#ta').val(" ");
				$('#dc').val(" ");
				$('#pa').val(" ");
				$('#typee').val(" ");
resetimg();
resetsig();
$('#cb').attr('checked', false);
$('#kb').attr('checked', false);
$('#vis').attr('checked', false);
$('#cash').attr('checked', false);

	$('#reasontext').val(" ");
$('#showoption').hide();
			}
			});
	     
	 } }
	 </script>
	  <script>


	  var modal = document.getElementById("myModal");

	// Get the button that opens the modal
	var btn = document.getElementById("myBtn");

	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];

	// When the user clicks on the button, open the modal
	btn.onclick = function() {
		  $('#capimgatt').hide();
		  $('#capbut').hide();
		  $('#scanbarcode').show();
	  modal.style.display = "block";
	    let constraintObj = { 
	            audio: false, 
	            video: { 
	                facingMode: "user", 
	                 width: { min: 640, ideal: 1280, max: 1920 },
            height: { min: 480, ideal: 720, max: 1080 } 
	            } 
	        }; 
	    if (navigator.mediaDevices === undefined) {
	        navigator.mediaDevices = {};
	        navigator.mediaDevices.getUserMedia = function(constraintObj) {
	            let getUserMedia = navigator.webkitGetUserMedia || navigator.mozGetUserMedia;
	            if (!getUserMedia) {
	                return Promise.reject(new Error('getUserMedia is not implemented in this browser'));
	            }
	            return new Promise(function(resolve, reject) {
	                getUserMedia.call(navigator, constraintObj, resolve, reject);
	            });
	        }
	    }else{
	        navigator.mediaDevices.enumerateDevices()
	        .then(devices => {
	            devices.forEach(device=>{
	                console.log(device.kind.toUpperCase(), device.label);
	                //, device.deviceId
	            })
	        })
	        .catch(err=>{
	            console.log(err.name, err.message);
	        })
	    }
	    navigator.mediaDevices.getUserMedia(constraintObj)
	    .then(function(mediaStreamObj) {
	        //connect the media stream to the first video element
	        let video = document.querySelector('video');
	        if ("srcObject" in video) {
	            video.srcObject = mediaStreamObj;
	        } else {
	            //old version
	            video.src = window.URL.createObjectURL(mediaStreamObj);
	        }
	        
	        video.onloadedmetadata = function(ev) {
	            //show in the video element what is being captured by the webcam
	            video.play();
	        };
	       
	    });
	}

	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
	  modal.style.display = "none";
	}

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	  if (event.target == modal) {
	    modal.style.display = "none";
	  }
	} 
	  </script>
	  
	   <script src="live_w_locator_rc.js" type="text/javascript"></script>
	   
    <script src="//webrtc.github.io/adapter/adapter-latest.js" type="text/javascript"></script>
    <!-- All JS Files -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
		 	<!-- Warehouse  Query  list table end  t -->
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
		    	<!-- jQuery Scrollbar --><script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 

 	
	<script src="assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
	<!-- Datatables -->
	<script src="assets/js/plugin/datatables/datatables.min.js"></script>
 
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
			 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
			 <script src="quagga.min.js" type="text/javascript"></script>
			<script type="text/javascript">
$("input:radio[type=radio]").click(function() {
$('#showoption').show();
var value = $(this).val();
$('#showoption').html(value);
    });
</script>
<a href="RCQR" target="_blank" id="sqr" hidden>.</a>
<script>
function scanQR(){
var hiddena=document.getElementById("sqr");
hiddena.click();
}
function closemod(){
    $('#myModal2').hide();
}

</script>
</body>



</html>