<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
           
            <%@page import="java.text.SimpleDateFormat,java.util.Date"%>
            <%@ page import="java.time.format.DateTimeFormatter" %>
            <%@ page import="java.util.Calendar" %>
            <%@ page import="java.time.*" %>
            <%@ page import="java.io.*"%>
    	    
 <% 
    // Connection con=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");

  
	
	   HttpSession ssss=request.getSession(false);  
		String username=(String)session.getAttribute("username"); 
		String staff_name=(String)ssss.getAttribute("staffName");
		String ccode=(String)ssss.getAttribute("companyCode");
		String agent_code=(String)ssss.getAttribute("parent_agent_code");
		String staff_code=(String)ssss.getAttribute("staffCode");
		
	 
	 
 %> 
<html lang="en">

<head>
 <script>
var n1='<%=staff_name%>';

if(n1=="null"){
	window.location.replace("Login.jsp");
}
</script>
 
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Title -->
    <title>MyanmamrDelivery</title>

    <!-- Favicon -->
    <link rel="icon" href="./img/core-img/aaa.png">

    <!-- Stylesheet -->
     <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="inputstyle.css">  
    <script>



</script>
   <style>
 
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
       height: 30px;
       
 
       
}
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

 .regtea   {padding: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
	margin-bottom: 10px;
	width:220%;
    height:40px;           
	box-sizing: border-box;
	font-family: montserrat;
	color: #2C3E50;
	font-size: 13px;
}



.card{
 
box-shadow: -5px 5px 20px rgba(69, 65, 78, 0.21);
 
}
/* 
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

/* Firefox */
/* input[type=number] {
  -moz-appearance:textfield;
} */

 
 
#sub {margin-left: 44%;
      } 
      
      
  </style>
  
</head>

 
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>



 <script src="assets/js/plugin/webfont/webfont.min.js"></script>
	<link rel="stylesheet" href="inputstyle.css">  
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/atlantis.min.css">
	
	 <link rel="icon" href="./img/core-img/aaa.png">
  
	  
 	
<body>
    
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <script src="quagga.min.js"></script>
    
    
    <div id="preloader">
        <div class="loader"></div>
    </div>


    <!-- Header Area Start -->
    <header class="header-area">
        <!-- Top Header Area Start -->
       
        <!-- Top Header Area End -->
        <!-- Main Header Start -->
        <div class="main-header-area">
            <div class="classy-nav-container breakpoint-off">
                <div class="container">
                
                    <nav class="classy-navbar justify-content-between" id="akameNav">

                        
                       <a class="nav-brand" href="index.">Myanmar Delivery</a>

                       
                        <div class="classy-navbar-toggler">
                            <span class="navbarToggler"><span></span><span></span><span></span></span>
                        </div>

                        <!-- Menu -->
                        <div class="classy-menu">
                            <!-- Menu Close Button -->
                            <div class="classycloseIcon">
                                <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                            </div>
                          
                           <div class="classynav">
                                <ul id="nav">
                                    <li><a href="./index.jsp">Home</a></li>
                                    
                                    <li><a href="register.jsp">WayBill</a>
                                    </li><li><a href="batch_waybill">Batch WayBill</a>
                                    </li>
                                      <li class=""><a href="credit_customer.jsp">Credit Customer</a></li>
                                    
                                    <li><a href="kill_session">Logout</a></li>
                                </ul>

                                <!-- Cart Icon -->
                              

                                <!-- Book Icon -->
                               
                            </div>
                            
                        </div>
                    </nav>
                </div>
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
                        <h3>Item Rejected</h3>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.jsp"><i class="icon_house_alt"></i> Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Item Rejected</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
  
  
    <!-- BackHome Area End -->



       <div class="container">
      <div class="row">
       <div class="col-12 col-lg-5">
		<div class="card">
		<div class="m" style="margin:10px;">
		
		<div class="form-group"> 
	 	<div class="row">
    	<div class="col-6"><label>Staff Name :</label></div>     
        <div class="col-6">
	   <span><%=staff_name %></span>
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
  <div class="col-6"><label>
   Date:
   </label></div> 
    <div class="col-6">
   <span style="color:blue;" class="fa fa-calendar">  <%=dt %></span>  
    
   
   <span style="color:blue;" class="fa fa-clock-o" style="text-align:right;"> <%=ck %></span>
    </div>
   </div>
   
   
  
       </div>
       
       
      
		</div></div>
		
		</div>

		<div class="col-12 col-lg-2"></div>
		
		
		<div class="col-12 col-lg-5">
		<div class="card">
		<div class="m" style="margin:10px;">
		
		
		<div class="row">
		<div class="col-12">
		
		
      
        
        
        <div class="form-group"> 
        <div class="row">
    	<div class="col-6"><label>Company code :</label></div>     
        <div class="col-6">
	     <span><%=ccode%></span>
	    </div>
        </div></div>
         
        
        <div class="form-group"> 
        <div class="row">
    	<div class="col-6"><label>Agent code :</label></div>     
        <div class="col-6">
	     <span><%=agent_code%></span>
	    </div>
        </div></div>
	
		</div>	
		</div>
		
		</div></div><br><br></div>
		
	  </div>
	  <br>
   
  
  
  
  
  
<form name="vinform">

<div class="card">
 <div class="row">
       <div class="col-12 col-lg-6">
		
		<div class="m" style="margin:10px; height:350px;" >
		
		<div class="form-group"> 
	 	<div class="row">
    	<div class="col-8">
          <label class="pure-material-textfield-outlined">	
				<input type="text" placeholder=" " name="tracking" id="tracking"  onkeypress="javascript:return isNumber(evt)" required oninvalid="this.setCustomValidity('required')"
					 oninput="setCustomValidity('')" onkeyup="searchInfo()">
				
					<span id="span">Type Tracking Number</span>
				</label>
				<span id="tracking_error"></span> 	

</div> 

</div>
</div>

</div>
</div>


<div class="col-12 col-lg-1"></div>
<div class="col-12 col-lg-4">
	
		<div class="m" style="margin:10px;">
		
		<div class="form-group"> 
	 	<div class="row">
    	
    	
      <div id="camera">
       <video preload="auto" src="" width="345" height="280"></video>
       <canvas class="drawingBuffer d-none" width="300" height="300"></canvas><br clear="all">
       </div>
 
     </div>


</div>

</div>
</div>
</div>


</div>


<br><br> 

</form>
 
 
 <form  action="itemreject_search.jsp" method="post" enctype="multipart/form-data">
 
 
 <div id="otherServer" >	 

<div id="mylocation">
 
</div>

</div>

<br>
<input type="submit" class="btn delivery-btn1 btn-3 mt-15 active" id="sub" value="rejected" >
<br><br>
 </form>
  
 </div> 
 </div>
 
   
 
   
    
    <!-- Welcome  body  Area Start -->
 
  
	 
<!-- ----------------------Modal  box  End--------------------- -->
   <script>
   function ctime() {
       var now   = new Date(); 
    
  
    
    
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
	 


  /*  setInterval(function(){
	        currentTime = ctime();
	      document.getElementById("ck").innerHTML=currentTime;
	      
	    }, 1000);   */

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
}/* else{
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
} */


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
		 
		
		 
			  
			  for(var j=0;j<arr1.length;j++){
				  if(arr1[j]==track_num){
					 
					     alert("already");
					  flag=false;
					
				  }
					  
				
			  }
		 
	 
		 
		  Quagga.offDetected();
		 // alert(data.codeResult.code);
		  if((data.codeResult.code!=null || data.codeResult.code!="" || data.codeResult.code!="undefined") && track_num.length<=15 && flag==true){
			  
			  Quagga.offDetected();
			 //  $('#test_track').val(track_num);
			 var trckno=track_num;
			
			 
	      
	       var itemupdate="itemsearch";
	       
			 $.ajax({
	 	    		url: "itemreject_search.jsp",
		    		type: 'POST',
	 	    		data: {trckno:trckno,itemupdate:itemupdate},
	 	    		success: function(data) {
	 	    		//$('#city_name').val(data);
		    		//alert(data);
	 	    			var trck = data.trim();
		    		
		    	  
	 		            
	 		             if(trck=="track")
	 		            {   
	 		            	   var error=document.getElementById('tracking_error');
	 		            	  var text=document.getElementById('mylocation');
	 		            
	 		            	  text.textContent=" ";
	 		            	  error.textContent = "***Invalid Track Number***";
	 		            	  error.style.color="red";
	 		            		$("#sub").prop("disabled", true)
	 		            	} 
	 		            
	 		            else if (trck!="ok")  
	 		            { 
	 		        
	 		            	  var tack=document.getElementById("tracking");
	 		 	 	        tack.value=trckno;
	 		        var error=document.getElementById('tracking_error');
	 		       	var text=document.getElementById('mylocation');
	 		    

	 		       	 
	 		       error.textContent ="";
	 		       	text.innerHTML=trck;  
	 		       	 $('#sub').removeAttr("disabled");
	 		               
	 		      
	 		             
			            } 
	 		            
	 		           else if(trck=="stat")
	 		            {   
	 		            	   var error=document.getElementById('tracking_error');
	 		            	  var text=document.getElementById('mylocation');
	 		            
	 		            	  text.textContent=" ";
	 		            	  error.textContent = "***Invalid Status***";
	 		            	  error.style.color="red";
	 		            		$("#sub").prop("disabled", true)
	 		            	} 
	 	    		}
		}); 
	       
		  
		 
	  }
		  
		  
	  });
 	}, 4000);
  Quagga.offDetected();

  setInterval(function(){
	  $('canvas').addClass("d-none");  
  }, 1000);
   
	  
	   
  
</script>   

 <script>
 
function searchInfo(){ 
	
	  var itemupdate="itemsearch";
	  var trckno= document.vinform.tracking.value
   $.ajax({
		url: "itemreject_search.jsp",
	type: 'POST',
		data: {trckno:trckno,itemupdate:itemupdate},
		success: function(data) {
		//$('#city_name').val(data);
	//alert(data);
			var trck = data.trim();
	
  
                         if(trck=="track")
	 		            {   
	 		            	   var error=document.getElementById('tracking_error');
	 		            	  var text=document.getElementById('mylocation');
	 		            
	 		            	  text.textContent=" ";
	 		            	  error.textContent = "***Invalid Track Number***";
	 		            	  error.style.color="red";
	 		            		$("#sub").prop("disabled", true)
	 		            	} 
                         
                         else if(trck=="stat")
 	 		            {   
 	 		            	   var error=document.getElementById('tracking_error');
 	 		            	  var text=document.getElementById('mylocation');
 	 		            
 	 		            	  text.textContent=" ";
 	 		            	  error.textContent = "***Invalid Status***";
 	 		            	  error.style.color="red";
 	 		            		$("#sub").prop("disabled", true)
 	 		            	}
	 		            
	 		            else if (trck!="ok")  
	 		            { 
	 		        
	 		            	  var tack=document.getElementById("tracking");
	 		 	 	        tack.value=trckno;
	 		        var error=document.getElementById('tracking_error');
	 		       	var text=document.getElementById('mylocation');
	 		    

	 		       	 
	 		       error.textContent ="";
	 		       	text.innerHTML=trck;  
	 		       	 $('#sub').removeAttr("disabled");
	 		               
	 		      
	 		             
			            } 
	 		            
	 		           
		}
}); 

}



</script> 

 <!-- Footer Area Start -->
    <footer class="footer-area section-padding-80-0" >
        <div class="container">
            <div class="row justify-content-between">

                <!-- Single Footer Widget -->
                <div class="col-12 col-sm-6 col-md-4">
                    <div class="single-footer-widget mb-80">
                     
                      <h4 class="widget-title">Our Company</h4>

                        <p class="mb-30">Name of Founder Company-Partner Pacific Group CoLtd.<br>
                                         Date of Incorporation -2014<br>
                                         Name of Transport Partner Company-MK Express<br></p>
  
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