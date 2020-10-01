<!DOCTYPE html>
<html lang="en">
 <%@ page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat,java.util.Date"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.time.*"%>

<%
	HttpSession ssss=request.getSession(false);  
    String staff=(String)ssss.getAttribute("staffCode");  
    String agent=(String)ssss.getAttribute("agentCode");
    String username=(String)ssss.getAttribute("staffName");
    String passcode=(String)ssss.getAttribute("passcode");    
    String ccode=(String)ssss.getAttribute("companyCode");
    String companytype=(String)ssss.getAttribute("companyType");
    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MMM-yyyy");
    LocalDateTime now = LocalDateTime.now();
    DateTimeFormatter dat = DateTimeFormatter.ofPattern("dd/MM/yyyy");
    DateTimeFormatter clock = DateTimeFormatter.ofPattern("hh:mm a");
  LocalDateTime localDateTime = LocalDateTime.now();
  String dt = dat.format(localDateTime);
  String ck=clock.format(localDateTime);
  String  s=" - ";
    String date=dtf.format(now);

	 Connection con=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");    
    //------------------------------------------------------------------Conncection  --------------------------------------------------------------------------------------------
 	String n=(String)session.getAttribute("username");    
			    PreparedStatement pre_staff=con.prepareStatement("Select parent_agent_code from staff where staff_username=?");
			    pre_staff.setString(1, n); 	
				 ResultSet rs_staff=pre_staff.executeQuery();	 
				 String agent_noti_code="";
			 
											 if(rs_staff.next()){
												 agent_noti_code=rs_staff.getString("parent_agent_code"); 	
																			}    
																				int count = 0;
																
%>
 <script>

var n1='<%=username%>';

if(n1=="null"){
	window.location.replace("https://www.delivery.teamramen.net/Login.jsp");
}

window.addEventListener( "pageshow", function ( event ) {
	  var historyTraversal = event.persisted || 
	                         ( typeof window.performance != "undefined" && 
	                              window.performance.navigation.type === 2 );
	  if ( historyTraversal ) {
	    // Handle page restore.
	    window.location.reload();
	  }
	});

</script>		      		      
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Title -->
    <title>Myanmar Delivery</title>
  
    <!-- -------------------------------Start    Stylesheet ----------------------------------->
     <script src="assets/js/plugin/webfont/webfont.min.js"></script>
	<link rel="stylesheet" href="inputstyle.css">  
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/atlantis.min.css">	
	 <link rel="icon" href="./img/core-img/aaa.png">
      <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="inputstyle.css">     
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
video {
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

.card{
 
box-shadow: -5px 5px 20px rgba(69, 65, 78, 0.21);
 
}

body {font-family: Arial, Helvetica, sans-serif;}
 
</style>

 <!-- -------------------------------End   Stylesheet ----------------------------------->
 
</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <!-- Preloader -->
    <script src="quagga.min.js"></script>
    
     
    <!-- Header Area Start -->
    <header class="header-area">
 
        <!-- Main Header Start -->
        <div class="main-header-area">
					            <div class="classy-nav-container breakpoint-off">
					        
					                    <!-- Classy Menu -->
					                    <nav class="classy-navbar justify-content-between" id="akameNav">
					
					                        <!-- Logo -->
					                       <a class="nav-brand" href="#">Myanmar Delivery</a>
					
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
										                                <ul id="nav" >
										                                
										                                  <li class="drop-down"><a href="#">Reports</a>     
                                        <ul class="dropdown" style="width: 280px;" >
 
       									      <li ><a href="agentDaily_receivedReport.jsp">Agent Daily Received Report</a>
                                    </li>
                                     <li ><a href="agentDaily_deliveryReport.jsp">Agent Daily Delivery Report</a>
                                    </li>
                                     <li> <a href="daily_deliveryList.jsp">Daily Delivery List</a></li>
                                     <li> <a href="jRp">Customer Receipt Report</a></li>
                                       <li> <a href="CRADR"  style="font-size:11px;">Company Received And Delivered Report</a></li>
    									</ul>
    									
                                    </li>
                                    
                                    <li class="drop-down"><a href="#">Operation</a>     
                                        <ul class="dropdown" >
       									   <li> <a href="warehouse_query.jsp">WareHouse Items</a></li>
       									   <li> <a href="item_transfer.jsp">Item Transfer</a></li>
       									    <li> <a href="WBQ">Waybill Query</a></li>
       									       <li><a href="OFD">Out For Delivery</a></li>
       									    <li> <a href="DOP">DO Printout</a></li>
       									     
       									     <li> <a href="consolidate.jsp">Consolidate</a></li>
       									    <li><a href="CCQ">Credit Customer Query</a></li>	
       									    <li><a href="return_wb.jsp">Return Waybill</a></li>
       									    <li> <a href="pickUp_from.jsp">Pick up from customer</a></li>
       									   
       									   
       									     <li> <a href="RC">Receiver Confirmation</a></li>
       									      <li ><a href="ITR">Item Rejected </a>
                                    </li>
                                     <li><a href="PCS">Parcel with staff</a></li>
                                     <li ><a href="payment">Payment Transfer </a>
                                    </li>
                                     <li id="pcca"> <a style="font-size:11px;" href="PCC">Payment To Credit customer</a></li>
    									</ul>
    									
                                    </li>
                                    
                                    <li class="active"><a href="register.jsp">WayBill</a>
                                    </li>
                                    <li ><a href="batch_waybill.jsp">Batch WayBill</a>
                                    </li>
                                     <li><a href="credit_customer.jsp">Credit Customer</a></li>
										                                
										                           	  <%
                                         if(count !=0){      
                                         %>
                                        <li>
                                        	<div class="form-button-action">
                                        <form action="AGND"  method="post"   >
                                       
                                      	<button type="submit" title="" class="btn btn-link btn-primary btn-lg"  >
                                              <a  class="inbox" >
					                          <span style="color:blue; text-align:right;  font-size:28px;" id="noti" class="fa fa-envelope"  ></span>
					                          <span class="badge"><%=count %></span>
						                      	</a></button>
						                      	</form>
						                      	</div>
												</li>
												<%} 
												
												else{%>
												<li>
                                        	<div class="form-button-action">
                                        <form action="AGND"  method="post"   >
                                       
                                      	<button type="submit" title="" class="btn btn-link btn-primary btn-lg"  >
                                              <a  class="inbox" >
					                          <span style="color:blue; text-align:right;  font-size:28px;" id="noti" class="fa fa-envelope"  ></span>
					                         
						                      	</a></button>
						                      	</form>
						                      	</div>
												</li>
												
												<%} 	 %>
                                    
                                    <li>
                                      <li>
                                    
                                    
                                    <a href="kill_session">Logout</a>
                                   </li>
																				
	 &nbsp;     &nbsp;     &nbsp;     &nbsp;     &nbsp;
																				
										                       </ul>
										                                
								                            </div>
										                            <!-- Nav End -->
					                        </div>
					                    </nav>
					            </div>
        </div>
    </header>
    <!-- Header Area End -->
    
    

 <script>
	$(document).ready(function(){
		
		$('#logout').focus(function() {
		  location.replace("index.jsp");
		});
	});	
    </script>     
    
    
    
  <div class="bod" style="background-color: #c9cfcf;">
		<br><br>
		<!-- BackHome Area Start -->

						<div class="container">
							<div class="row">
								<div class="col-12">
				
									<div class="breadcrumb-content">
										<h3>Item Transfer</h3>
										<nav aria-label="breadcrumb">
											<ol class="breadcrumb">
												<li class="breadcrumb-item"><a href="#"><i
														class="icon_house_alt"></i><a href="register.jsp">&nbsp;&nbsp;WayBill</a></li>
												<li class="breadcrumb-item active" aria-current="page">Item  Transfer</li>
											</ol>
										</nav>
									</div>
								</div>
							</div>
						</div>


			<!-- BackHome Area End -->

		<div class="container">
			<div class="card">
				<div class="m" style="margin: 10px;">
					<div class="row" style="margin-left: 30px;">
						<div class="col-12 col-lg-4">

							<form method="post" action="item_transfer_storeData.jsp"
								id="form_id">

								<div class="form-group">
									<div class="row">
										<div class="col-6">
											<label>Company code :</label>
										</div>
										<div class="col-6">
											<input type="text" class="form-control" value="<%=ccode %>"
												name="c_code" id="ccode" readonly> <input
												type="hidden" class="form-control" value="<%=staff %>"
												name="scode" id="scode" readonly>
										</div>
									</div>
								</div>

								<div class="form-group">
									<div class="row">
										<div class="col-6">
											<label>Agent code :</label>
										</div>
										<div class="col-6">
											<input type="text" class="form-control" value="<%=agent %>"
												name="acode" id="acode" readonly>
										</div>
									</div>
								</div>
						</div>
						<div class="col-12 col-lg-4"></div>


						<div class="col-12 col-lg-4">
							<div class="form-group">
								<div class="row">
									<div class="col-6">
										<label>Staff name :</label>
									</div>
									<div class="col-6">
										<input type="text" class="form-control" value="<%=username %>"
											name="sname" readonly>
									</div>
								</div>
							</div>


							<div class="form-group">
								<div class="row">
									<div class="col-6">
										<label> Date:<b></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</label>
									</div>

									<div class="col-6">
										<input type="text" class="form-control" value="<%=dt%>"
											name="date" readonly>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	

		<div class="container">
			<div class="card">
				<div class="m" style="margin: 10px;">
					<div class="row" style="margin-left: 30px;">

		<div class="col-12 col-lg-4">

							<div class="form-group">
								<div class="row">
									<div class="col-6">
										<label>Transfer Number:</label>
									</div>
									<div class="col-6">
										<input type="text" class="form-control" value="T#######"
											readonly>
									</div>
								</div>
							</div>

							<div class="form-group">
												<div class="row">
													<div class="col-4">
														<label>Reason :</label>
													</div>
													<div class="col-8">
				
														<select class="custom-select" aria-describedby="basic-addon3"
															name="reason"  required>
														
															<option value="">Open select menu</option>
															<option value="R001">To Be Delivered</option>
															<option value="R002">WareHouse Transfer</option>
															<option value="R003">For Pick Up</option>
															<option value="R004">For Reshedule</option>
														</select>
													</div>
												</div>
							</div>

						</div>
			
						<div class="col-12 col-lg-4"></div>

			<div class="col-12 col-lg-4">

							<div class="form-group">
								<div class="row">
									<div class="col-8">
										<h4>Reception :</h4>
									</div>							
								</div>
							</div>

							<div class="form-group">
								<div class="row">
									<div class="col-6">
										<label> Agent Code:</label>
									</div>
									<div class="col-6">
										<input type="text" class="form-control" name="a_code"
											id="a_code" required>
									</div>
								</div>
							</div>

							<div class="form-group">
								<div class="row">
									<div class="col-6">
										<label>Staff Code :</label>
									</div>
									<div class="col-6">
										<input type="text" class="form-control" name="s_code"
											id="s_code"  required >
									</div>
								</div>
							</div>

						</div>

				
					</div>
				</div>
			</div>
	</div>





								<div class="container">
									<div class="card">
										<div class="m" style="margin: 10px;">
							
											<div class="row">
												<div class="col-12 col-lg-6">
													<div style="margin-left: 30px;">
							
														<div class="form-group">
															<label>Scan</label>
							
															<div class="row">
																<div class="col-12 col-lg-9">
							
																	<div id="camera">
																		<video autoplay="true" preload="auto" src="" muted="true"
																			playsinline="true"></video>
																		<canvas class="drawingBuffer d-none" width="100" height="150">
														        </canvas>
																		<br clear="all">
																	</div>
																	<span id="invalid"></span>
																</div>
															</div>
														</div>
													</div>
							
							
												</div>
												<div class="col-12 col-lg-6">
													<div id="credit_scanner">
														<div class="form-group">
							
															<label>Tracking Number</label> <input type="hidden" name="t_num"
																id="t_num"> <select class="custom-select" id="track" name="track" multiple  required="required"
oninvalid="this.setCustomValidity('Please add tracking number(s)')" oninput="setCustomValidity('')" oninvalid="style.border-color=red" >
															</select>
														</div>
													</div>
							
												</div>
							
											</div>
										</div>
							
									</div>
									<br>
							
									<center>
										<div class="col-3">
											<input type="submit" onclick="myfunction()"	 class="btn delivery-btn1 btn-2 mt-20 active"
												style="padding: 0 5px" value="Transfer">
										</div>
										<br>
										<br>
									</center>
							
									</form>
							
								</div>

	<!-- Welcome  body  Area Start -->

<!-- ----------------------Modal  box  End--------------------- -->

	<script>
    function myfunction() {
// confirm("Are  you  sure  you want  to  sumit  this  items? ");
alert("items  are   Successfully   Transfer !!!");
    	document.getElementById("form_id").action = "item_transfer_storeData.jsp"; // Setting form action to "item_transfer.jsp" page
    	document.getElementById("form_id").submit(); // Submitting form      	
    	}
    
    </script>

 <script>

let constraintObj = { 
        audio: false, 
        video: { 
            facingMode: "environment", 
            width: { min: 500, ideal: 600, max: 1920 },
            height: { min: 300, ideal: 420, max: 1080 } 
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
    .then(devices =>{
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

Quagga.init({
    inputStream : {
      name : "Live",
      type : "LiveStream",
      target: document.querySelector('#camera') 
      // Or '#yourElement' (optional)

    },
    decoder : {
      readers : ["code_128_reader"],
     
     
    }
  }, function(err) {
      if (err) {
          console.log(err);
          return
      }
      console.log("Initialization finished. Ready to start");
      Quagga.start();
      
     
  });
  

var i=0;
function beep() {
    var snd = new  Audio("data:audio/wav;base64,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qJrx4KOQjahZxWbcZgztj2c49nKmkId44S71j0c8eV9yDK6uPRzx5X18eDvjvQ6yKo9ZSS6l//8elePK/Lf//IInrOF/FvDoADYAGBMGb7FtErm5MXMlmPAJQVgWta7Zx2go+8xJ0UiCb8LHHdftWyLJE0QIAIsI+UbXu67dZMjmgDGCGl1H+vpF4NSDckSIkk7Vd+sxEhBQMRU8j/12UIRhzSaUdQ+rQU5kGeFxm+hb1oh6pWWmv3uvmReDl0UnvtapVaIzo1jZbf/pD6ElLqSX+rUmOQNpJFa/r+sa4e/pBlAABoAAAAA3CUgShLdGIxsY7AUABPRrgCABdDuQ5GC7DqPQCgbbJUAoRSUj+NIEig0YfyWUho1VBBBA//uQZB4ABZx5zfMakeAAAAmwAAAAF5F3P0w9GtAAACfAAAAAwLhMDmAYWMgVEG1U0FIGCBgXBXAtfMH10000EEEEEECUBYln03TTTdNBDZopopYvrTTdNa325mImNg3TTPV9q3pmY0xoO6bv3r00y+IDGid/9aaaZTGMuj9mpu9Mpio1dXrr5HERTZSmqU36A3CumzN/9Robv/Xx4v9ijkSRSNLQhAWumap82WRSBUqXStV/YcS+XVLnSS+WLDroqArFkMEsAS+eWmrUzrO0oEmE40RlMZ5+ODIkAyKAGUwZ3mVKmcamcJnMW26MRPgUw6j+LkhyHGVGYjSUUKNpuJUQoOIAyDvEyG8S5yfK6dhZc0Tx1KI/gviKL6qvvFs1+bWtaz58uUNnryq6kt5RzOCkPWlVqVX2a/EEBUdU1KrXLf40GoiiFXK///qpoiDXrOgqDR38JB0bw7SoL+ZB9o1RCkQjQ2CBYZKd/+VJxZRRZlqSkKiws0WFxUyCwsKiMy7hUVFhIaCrNQsKkTIsLivwKKigsj8XYlwt/WKi2N4d//uQRCSAAjURNIHpMZBGYiaQPSYyAAABLAAAAAAAACWAAAAApUF/Mg+0aohSIRobBAsMlO//Kk4soosy1JSFRYWaLC4qZBYWFRGZdwqKiwkNBVmoWFSJkWFxX4FFRQWR+LsS4W/rFRb/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////VEFHAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAU291bmRib3kuZGUAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMjAwNGh0dHA6Ly93d3cuc291bmRib3kuZGUAAAAAAAAAACU=");  
    snd.play();
}


let lineNo = 1; 
var z=0;

 
var invalid = document.getElementById("invalid");  
var arr1=[];

  setInterval(function(){
	  Quagga.offDetected();
	  
	  Quagga.onDetected(function(data){
		  beep();
		  Quagga.offDetected();
		  var track_num=data.codeResult.code;
	 
		   var flag=true;
		  if(lineNo>1){
		 
	      z++;
	   
		
		  if(arr1.length!=0){
			  
			  for(var j=0;j<arr1.length;j++){
				  if(arr1[j]==track_num){
					 
					       invalid.textContent="This code is already scanned *"+track_num;
		            	   invalid.style.color="red";
		             
					  flag=false;
					
				  }
					  
				
			  }
		  }
		  }   arr1[z]=track_num;
		 
		  Quagga.offDetected();
	//	 alert(data.codeResult.code);
		  if((data.codeResult.code!=null || data.codeResult.code!="" || data.codeResult.code!="undefined") && track_num.length<=15 && flag==true){
			  
			  Quagga.offDetected();
			 //  $('#test_track').val(track_num);
			 var track_number=track_num;
	      
			 if( track_num.length==8){
           	  var str=track_num ;
 	    	// alert(str+"sssss");
 	    	  var agent_code;
 	    	  var staff_code;
 	    	  
 	    	  if (str.length > 0) {
 	    		  agent_code = str.substr(0, 4);
 	    		  staff_code= str.substr(4);
 	    	  }
 	    	  
 	    	  $("#a_code").val(agent_code);
 	    	  $("#s_code").val(staff_code);
 	    	  
           	}
			var track = document.getElementById("track");
		   
			  
		 //Start checking tracking number
		    
		 
 var array = ["honey"];
		   var  c_code=document.getElementById("ccode").value;
   var   a_code=document.getElementById("acode").value;     		
   var  t_v=document.getElementById("t_num").value;
   var   arr=t_v;
   
//   alert(t_v+"aaa");
//	alert(track_num);	      
		     $.ajax({
    		 		url: "item_transfer_Ajax.jsp",
    		 		type: 'POST',
    		 		data: {
    		 			a_code : a_code,
    		 			  c_code: c_code,
    		 			track_num: track_num
    		 			},
    		 		success: function(data) {
    		 			//alert(data);
    		 			var  de="yes";
    		 			if (String(data).trim() === "yes"){
    		 		//	alert("a");
     		   	    		   invalid.textContent=" ";
		   		                var option=document.createElement("option");
		   		                option.selected=true;
		   		                option.value=track_number;
		   		             arr=arr+","+track_num;
		   		                option.text=track_number;
		   		         //    arr= arr.substr(5);
		   		           $("#t_num").val(arr);
		   		                track.add(option);
		   		                lineNo++;
		   		              		   		                	
		   		            } else { 
		   		             if( track_num.length!=8){
		   		            	 invalid.textContent="Incorrect Tracking Number *"+track_number;
		   		            	 invalid.style.color="red";		 
		   		            	 
		   		             }
		   		            			             
		   		            	} 
		   	    		}
		   	    		
		        } );    
				 		   		       			 
		 //End checking tracking number  
		 
	  }
						  		  
	  });
 	}, 4000);
  Quagga.offDetected();

  setInterval(function(){
	  $('canvas').addClass("d-none");  
  }, 1000);
   

</script>
<!-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
	
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
 
 

</body>

</html>