<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@page import="java.text.SimpleDateFormat,java.util.Date"%>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.*" %>
<!DOCTYPE html>
<html lang="en">
 <%
   
   HttpSession ssss=request.getSession(false);  
  
    String comapny_code=(String)ssss.getAttribute("companyCode");
    if (comapny_code==null)comapny_code="0001";
	String username=(String)session.getAttribute("staffName");
	String agent_code=(String)session.getAttribute("agentCode");
	 if (agent_code==null)agent_code="9001";
	String staff_code=(String)session.getAttribute("staffCode"); 
	 if (staff_code==null)staff_code="0001";
   
    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MMM-yyyy");
    LocalDateTime now = LocalDateTime.now();
    String date=dtf.format(now);
    
       
 
		      %>
		      
		      
<head>

   <%-- <script>
 
var n1='<%=username%>';
if(n1=="null"){
	location.replace("Login.jsp");
	
}
</script>    --%>
 
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Title -->
    <title>Myanmar Delivery</title>
    <!-- Favicon -->
    <!-- Stylesheet -->
 
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
 
</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>



    <!-- Preloader -->
    <script src="quagga.min.js"></script>
    
  
    <!-- Header Area Start -->
    <header class="header-area">
        <!-- Top Header Area Start -->
       
        <!-- Top Header Area End -->

        <!-- Main Header Start -->
        <div class="main-header-area">
            <div class="classy-nav-container breakpoint-off">
        
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
                                <ul id="nav" >
                                    <li><a href="./index.jsp">Home</a></li>
                                     
                                    
                                     <li class="drop-down"><a href="#">Operation</a>   
						            <ul class="dropdown" style="width: 280px;">
						              <li><a href="credit_customer_waybill.jsp">Credit Customer Waybill Queries</a></li>
						              <li> <a href="pickUp_from.jsp"  >Pick up from customer</a></li>
						            </ul>
						          </li> 
                                    
                                    <li ><a href="register.jsp">WayBill</a>
                                    </li><li ><a href="batch_waybill.jsp">Batch WayBill</a>
                                    </li>
                                      <li><a href="credit_customer.jsp">Credit Customer</a></li>
 
                                      &nbsp;     &nbsp;     &nbsp;     &nbsp;     &nbsp;
 
                                      
						<li class="nav-item dropdown hidden-caret">
							<a class="dropdown-toggle profile-pic" data-toggle="dropdown" href="#" aria-expanded="false">
								<div class="avatar-sm">
									<img src="assets/img/profile.jpg" alt="..." class="avatar-img rounded-circle">
					 	</div>
							</a>
							<ul class="dropdown-menu dropdown-user animated fadeIn">
								<div class="dropdown-user-scroll scrollbar-outer">
									<li>
										<div class="user-box">
											<div class="avatar-lg"><img src="assets/img/profile.jpg" alt="image profile" class="avatar-img rounded"></div>
											<div class="u-text">
												<h4><%=username %></h4>
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
										<a class="dropdown-item" href="#" id="logout">Logout</a>
									</li>
								</div>
							</ul>
						</li>
		 
							 
                                </ul>
                                
                                  

                                <!-- Cart Icon -->
                              

                                <!-- Book Icon -->
                               
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
    
    
    
    <div class="bod" style="background-color: #c9cfcf;"><br><br> 


  <!-- BackHome Area Start -->
 
 
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumb-content">
                        <h3>Pick Up From customer/credit customer</h3>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.jsp"><i class="icon_house_alt"></i> Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Pick Up From</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
  
  
    <!-- BackHome Area End -->


<form action="Pickup_from_store.jsp" >
       <input type="hidden" value="storePickupCustomer" name="task">

        <div class="container">
        <div class="card">
		<div class="m" style="margin:10px;">
         <div class="row" style="margin-left: 30px;">
		<div class="col-12 col-lg-4">
		
		
			<div class="form-group"> 
	 	<div class="row">
    	<div class="col-6"><label>Company code :</label></div>     
        <div class="col-6">
	   <span><%=comapny_code %></span>
	    </div>
        </div></div>
        
        
        
			<div class="form-group"> 
	 	<div class="row">
    	<div class="col-6"><label>Agent code :</label></div>     
        <div class="col-6">
	   <span><%=agent_code %></span>
	    </div>
        </div></div>
      
        
        
        <div class="form-group"> 
        <div class="row">
    	<div class="col-6"><label>Staff code :</label></div>     
        <div class="col-6">
	     <span><%= staff_code%></span>
	    </div>
        </div></div>
         
         </div>
          <div class="col-12 col-lg-3"> </div>
          
        <div class="col-12 col-lg-5">
        
        <div class="form-group"> 
        <div class="row">
    	<div class="col-4"><label>Staff name :</label></div>     
        <div class="col-8">
	     <span><%=username %></span>
	    </div>
        </div></div>
	
	
	  <div class="form-group"> 
     <%
    DateTimeFormatter dat = DateTimeFormatter.ofPattern("dd/MM/yyyy");
     DateTimeFormatter clock = DateTimeFormatter.ofPattern("hh:mm a");
   LocalDateTime localDateTime = LocalDateTime.now();
   String dt = dat.format(localDateTime);
   String ck=clock.format(localDateTime);
   %>
   
    <div class="row">
    	<div class="col-4"><label>Date:</label></div>     
        <div class="col-8">
	        <span style="color:blue;" class="fa fa-calendar">  <%=dt %></span>  &nbsp; &nbsp;&nbsp; &nbsp;
	        <span   class="fa fa-clock-o" style="color:blue; text-align:right;" id="ck"> </span>
	    </div>
        </div>
   
   <script>
   function ctime() {
       var now   = new Date(); 
     //   var now= n.toLocaleString([], { hour12: true});
  
    
    
       var hour    = now.getHours();
       var format = hour >= 12 ? 'PM' : 'AM';  
       if(hour==12){
    	   hour=12;
    	   }
       else
       { hour=hour % 12;}
    
       var minute  = now.getMinutes();
       var second  = now.getSeconds(); 
   
       
    
       if(minute.toString().length == 1) {
            minute = '0'+minute;
       }
       if(second.toString().length == 1) {
            second = '0'+second;
       }   
       
   
       return  hour+':'+minute+':'+second +" "+format;   
        
   }
	 


   setInterval(function(){
	        currentTime = ctime();
	      
	        document.getElementById("ck").innerHTML =" "+currentTime;
	      
	    }, 1000);  

   </script>
  
       </div>
		</div></div>
		
		</div>	
		</div>
		
		</div>
	  <br>
   
  
  <div class="container">
<div class="card">
		<div class="m" style="margin:10px;">

   <div class="row"  >
   <div class="col-12 col-lg-6">
  
   
   
   <div  style="margin-left: 30px;">
      
      <div class="form-group"> 	
        <div class="row">
    	<div class="col-12 col-lg-6" ><label>Credit Customer</label></div>     
        <div class="col-12 col-lg-6">  
       	<input type="radio" name="customer" value="credit" id="credit_customer" onclick=" enable()"  
       		oninvalid="this.setCustomValidity('Please select ')" oninput="setCustomValidity('')" oninvalid="style.border-color=red" />        
	  
	    </div>
        </div></div>
        
        <div class="form-group"> 	
        <div class="row">
    	<div class="col-12 col-lg-6" ><label>Normal Customer</label></div>     
        <div class="col-12 col-lg-6">
     	<input type="radio" name="customer"  value="normal" id="normal_customer"  onclick="disable()"  
     	oninvalid="this.setCustomValidity('Please select ')" oninput="setCustomValidity('')" oninvalid="style.border-color=red" />       

	    </div>
        </div></div>
	
	 
	   <div class="form-group" id="customer"> 	
        <div class="row">
    	<div class="col-12 col-lg-6" ><label>Credit customer code</label></div>     
        <div class="col-12 col-lg-6">
	 <label class="pure-material-textfield-outlined">
       <input type="text" id="credit_customer_code" name="credit_customer"  disabled  value=""
       oninvalid="this.setCustomValidity('Please enter Credi customer code')" oninput="setCustomValidity('')" oninvalid="style.border-color=red"  />             
	    </label>
	    </div>
        </div></div>
        
        <div class="form-group"> 
	  
    	 <label>No.  &nbsp;&nbsp;&nbsp;  Tracking Number</label>   
    	  
<select class="custom-select" id="track" name="track" multiple  required="required"
oninvalid="this.setCustomValidity('Please add tracking number(s)')" oninput="setCustomValidity('')" oninvalid="style.border-color=red" >
  
</select>
    </div>  
      
        </div>
        

   </div>
  <div class="col-12 col-lg-6">
  <div id="credit_scanner"  >
 <div class="form-group" > 	
 	 <label>Scan</label>   
 	 
        <div class="row">
        <div class="col-12 col-lg-9"> 
	    
	       <div id="camera">
        <video autoplay="true" preload="auto" src="" muted="true" playsinline="true"></video>
        <canvas class="drawingBuffer d-none" width="300" height="300">
        </canvas><br clear="all"></div>
        <span id="invalid"></span>
	    </div>
        </div>
  </div>
    </div>
  
  </div>
  
  </div>
  </div>
  
  </div>  <br>
  
   
    <br><br>
 
 
   <center> <input type="submit" class="button" id="sub" value="Confirmed" ></center>
   
  <br><br>
 
 
</form>

 </div>
 
   
    
    <!-- Welcome  body  Area Start -->
 
  
	 
<!-- ----------------------Modal  box  End--------------------- -->
 <script>
 let lineNo = 1; 
 var z=0;
 
  
 var invalid = document.getElementById("invalid");  
 
 //Start chacking credir customer or normal customer 
 
 	function  enable() {
		$("#customer :input").prop("disabled", false);
	    $("#credit_customer_code").change(function() {
	 
		
		});

	} 
	
 function  disable() {
	  $('#credit_customer_code').val("");
		$("#customer :input").prop("disabled", true); 
 
	 
	} 


	  //End chacking credir customer or normal customer

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
		 // alert(data.codeResult.code);
		  if((data.codeResult.code!=null || data.codeResult.code!="" || data.codeResult.code!="undefined") && track_num.length<=15 && flag==true){
			  
			  Quagga.offDetected();
			 //  $('#test_track').val(track_num);
			 var track_number=track_num;
	      
			  var credit_customer_code = document.getElementById("credit_customer_code");   
			  var crd_code=credit_customer_code.value;
			   crd_code=crd_code.trim(); 
		 	  if(crd_code==null || crd_code==" "){
		 		  crd_code="";
		 	  }

			var track = document.getElementById("track");
		    var credit=credit_customer_code.value;
			  
		 //Start checking tracking number
		    
		    		if(document.getElementById('normal_customer').checked) {
		    	 
		    	 
		    		  var task="normalCustomer";
		       $.ajax( {
		       		 
		       		
		   	    		url: "Pickup_from_store.jsp",
		   	    		type: 'POST',
		   	    		data: {track_number: track_number, task: task},
		   	    		success: function(data) {
		   	    	 
		   	    			var track_num = data.trim();
		   	    	
		   	 
		   		            if (track_num=="ok")  
		   		            {      
		   		             var task="pickupSection";
		  		   		       $.ajax( {
		  		   		       		 
		  		   		       		
		  		   		   	    		url: "Pickup_from_store.jsp",
		  		   		   	    		type: 'POST',
		  		   		   	    		data: {track_number: track_number, task: task},
		  		   		   	    		success: function(data) {
		  		   		   	    	 
		  		   		   	    			var track_num = data.trim();
		  		   		   	    	
		  		   		   	 
		  		   		   		            if (track_num=="ok")  
		  		   		   		            {      
					  		   		   		        invalid.textContent=" ";
							   		                var option=document.createElement("option");
							   		                option.selected=true;
							   		                option.value=track_number;
							   		            
							   		                option.text=lineNo+"  "+track_number
							   		               
							   		                track.add(option);
							   		                lineNo++;
				   		              
		  		   		   		                	
		  		   		   		            } else { 
		  		   		   		            	   
		  		   		   		          
		  		   		   		            	  invalid.textContent="This tracking number is already pickup ("+track_num+" state)";
		  		   		   		            	  invalid.style.color="red";
		  		   		   		             
		  		   		   		            	 
		  		   		   		            	} 
		  		   		   	    		}
		  		   		   	} );  //  pickup or not
		   		                	
		   		            } else { 
		   		            	   
		   		          
		   		            	  invalid.textContent="Incorrect Tracking Number*"+track_number;
		   		            	  invalid.style.color="red";
		   		             
		   		            	 
		   		            	} 
		   	    		}
		   	} );  
		       }
		       	else{
		       		
		       	 if(crd_code==""){
					 
		       		 
		       		var task="creditCustomer_code"; 
		       	 
				      
			        $.ajax({
			       			 
			       		
			   	    		url: "Pickup_from_store.jsp",
			   	    		type: 'POST',
			   	    		data: {track_number: track_number,task: task},
			   	    		success: function(data) {
			   	    		// alert("now");
			   	    			var credit_cd = data.trim();
			   	    			 
			   	    	   if (credit_cd=="ok")  
			   		            {  
			   		             $('#credit_customer_code').val(track_num);
	     		   	    		   invalid.textContent=" ";
			   		             
			   		            } else { 
			   		            	$('#credit_customer_code').val("");
			   		            	 invalid.textContent="Incorrect credit customer code *"+credit_cd;
			   		            	 invalid.style.color="red";		   		             
			   		            	} 
			   	    		}
			   	    		
			        } );    
			        
					
				 }else{
	
				//	 track_number=track_num;
		       		//alert("credit");
		       	 var task="creditCustomer"; 
		      
		        $.ajax({
		       			 
		       		
		   	    		url: "Pickup_from_store.jsp",
		   	    		type: 'POST',
		   	    		data: {track_number: track_number,credit: credit,task: task},
		   	    		success: function(data) {
		   	    		// alert("now");
		   	    			var credit_cd = data.trim();
		   	    		 
		   	    	   if (credit_cd=="ok")  
		   		            {   
		   		            
		   					 
		  					  var task="pickupSection";
		  		   		       $.ajax( {
		  		   		       		 
		  		   		       		
		  		   		   	    		url: "Pickup_from_store.jsp",
		  		   		   	    		type: 'POST',
		  		   		   	    		data: {track_number: track_number, task: task},
		  		   		   	    		success: function(data) {
		  		   		   	    	 
		  		   		   	    			var track_num = data.trim();
		  		   		   	    	
		  		   		   	 
		  		   		   		            if (track_num=="ok")  
		  		   		   		            {      
					  		   		   		        invalid.textContent=" ";
							   		                var option=document.createElement("option");
							   		                option.selected=true;
							   		                option.value=track_number;
							   		            
							   		                option.text=lineNo+"  "+track_number
							   		               
							   		                track.add(option);
							   		                lineNo++;
				   		              
		  		   		   		                	
		  		   		   		            } else { 
		  		   		   		            	   
		  		   		   		          
		  		   		   		            	  invalid.textContent="This tracking number is already pickup ("+track_num+" state)";
		  		   		   		            	  
		  		   		   		            	  invalid.style.color="red";
		  		   		   		             
		  		   		   		            	 
		  		   		   		            	} 
		  		   		   	    		}
		  		   		   	} );  //  pickup or not
     		   	    		 
		   		                	
		   		            } else { 
  
		   		            	 invalid.textContent="Incorrect Tracking Number *"+track_number;
		   		            	 invalid.style.color="red";		   		             
		   		            	} 
		   	    		}
		   	    		
		        } );    
				 }
		       	
		       	} 
			 
		 //End checking tracking number  
		 
	  }
		  
		  
	  });
 	}, 4000);
  Quagga.offDetected();

  setInterval(function(){
	  $('canvas').addClass("d-none");  
  }, 1000);
   
	  
	   
  
</script>

 
 
 
	
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