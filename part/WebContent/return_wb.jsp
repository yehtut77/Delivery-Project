<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

  <%@page import="java.text.SimpleDateFormat,java.util.Date"%>
            <%@ page import="java.time.format.DateTimeFormatter" %>
    <%@ page import="java.time.*" %>
<!DOCTYPE html>
<html lang="en">
 
<%//Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/delivery1","root","root");



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

	<!-- CSS Files -->
	<link rel="stylesheet" href="inputstyle.css">  
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/atlantis.min.css">

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



body {font-family: Arial, Helvetica, sans-serif;}
 
</style>

</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>



    <!-- Preloader -->
    <script src="quagga.min.js"></script>
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
                        <h3>Return Waybill</h3>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.jsp"><i class="icon_house_alt"></i> Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Return Waybill</li>
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
		<input type="text" name="status" value="Return"  name="tracking" readonly="readonly" />
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
     DateTimeFormatter clock = DateTimeFormatter.ofPattern("hh:mm a");
   LocalDateTime localDateTime = LocalDateTime.now();
   String dt = dat.format(localDateTime);
   String ck=clock.format(localDateTime);
   %>
   <label>
   Date:&nbsp; &nbsp;&nbsp; &nbsp;
   <span style="color:blue;" class="fa fa-calendar">  <%=dt %></span>  
   &nbsp; &nbsp; &nbsp; &nbsp;  
   &nbsp; &nbsp; &nbsp; &nbsp;  
   <span style="color:blue;" class="fa fa-clock-o" style="text-align:right;"> <%=ck %></span>
   
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
    <div id="camera" >
</div>
<div class="form-group text-center"> 
          
     
		<input type="text" class="form-control" id="result" aria-describedby="result" readonly ><br>
		<button type="button" class="btn btn-info" id="scan">Start Scanner</button>
		
         </div> 
      
      </div>
      </div>
 	</div>
 	</div>
 	<script>

 		
 	

 	var n1='<%=n%>';

 	if(n1=="null"){
 		window.location.replace("https://www.delivery.teamramen.net/Login.jsp");
 	}

 	window.addEventListener( "pageshow", function ( event ) {
 		  var historyTraversal = event.persisted || 
 		                         ( typeof window.performance != "undefined" && 
 		                              window.performance.navigation.type === 2 );
 		  if ( historyTraversal ) {
 		    // Handle page restore.
 			 $('#btn').prop("disabled", true);
 		  }
 		});

 
 	


 	 $('#scan').click(function() {
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
 	     $('#result').val("");
 	    $('#btn').prop("disabled", true);
 	     
 	  });
 	 });

 	var i=0;
 	
 	 var ccode='<%=ccode%>';
		var agent_code='<%=agent_code%>';
 	
 	function beep() {
 	    var snd = new  Audio("data:audio/wav;base64,//uQRAAAAWMSLwUIYAAsYkXgoQwAEaYLWfkWgAI0wWs/ItAAAGDgYtAgAyN+QWaAAihwMWm4G8QQRDiMcCBcH3Cc+CDv/7xA4Tvh9Rz/y8QADBwMWgQAZG/ILNAARQ4GLTcDeIIIhxGOBAuD7hOfBB3/94gcJ3w+o5/5eIAIAAAVwWgQAVQ2ORaIQwEMAJiDg95G4nQL7mQVWI6GwRcfsZAcsKkJvxgxEjzFUgfHoSQ9Qq7KNwqHwuB13MA4a1q/DmBrHgPcmjiGoh//EwC5nGPEmS4RcfkVKOhJf+WOgoxJclFz3kgn//dBA+ya1GhurNn8zb//9NNutNuhz31f////9vt///z+IdAEAAAK4LQIAKobHItEIYCGAExBwe8jcToF9zIKrEdDYIuP2MgOWFSE34wYiR5iqQPj0JIeoVdlG4VD4XA67mAcNa1fhzA1jwHuTRxDUQ//iYBczjHiTJcIuPyKlHQkv/LHQUYkuSi57yQT//uggfZNajQ3Vmz+Zt//+mm3Wm3Q576v////+32///5/EOgAAADVghQAAAAA//uQZAUAB1WI0PZugAAAAAoQwAAAEk3nRd2qAAAAACiDgAAAAAAABCqEEQRLCgwpBGMlJkIz8jKhGvj4k6jzRnqasNKIeoh5gI7BJaC1A1AoNBjJgbyApVS4IDlZgDU5WUAxEKDNmmALHzZp0Fkz1FMTmGFl1FMEyodIavcCAUHDWrKAIA4aa2oCgILEBupZgHvAhEBcZ6joQBxS76AgccrFlczBvKLC0QI2cBoCFvfTDAo7eoOQInqDPBtvrDEZBNYN5xwNwxQRfw8ZQ5wQVLvO8OYU+mHvFLlDh05Mdg7BT6YrRPpCBznMB2r//xKJjyyOh+cImr2/4doscwD6neZjuZR4AgAABYAAAABy1xcdQtxYBYYZdifkUDgzzXaXn98Z0oi9ILU5mBjFANmRwlVJ3/6jYDAmxaiDG3/6xjQQCCKkRb/6kg/wW+kSJ5//rLobkLSiKmqP/0ikJuDaSaSf/6JiLYLEYnW/+kXg1WRVJL/9EmQ1YZIsv/6Qzwy5qk7/+tEU0nkls3/zIUMPKNX/6yZLf+kFgAfgGyLFAUwY//uQZAUABcd5UiNPVXAAAApAAAAAE0VZQKw9ISAAACgAAAAAVQIygIElVrFkBS+Jhi+EAuu+lKAkYUEIsmEAEoMeDmCETMvfSHTGkF5RWH7kz/ESHWPAq/kcCRhqBtMdokPdM7vil7RG98A2sc7zO6ZvTdM7pmOUAZTnJW+NXxqmd41dqJ6mLTXxrPpnV8avaIf5SvL7pndPvPpndJR9Kuu8fePvuiuhorgWjp7Mf/PRjxcFCPDkW31srioCExivv9lcwKEaHsf/7ow2Fl1T/9RkXgEhYElAoCLFtMArxwivDJJ+bR1HTKJdlEoTELCIqgEwVGSQ+hIm0NbK8WXcTEI0UPoa2NbG4y2K00JEWbZavJXkYaqo9CRHS55FcZTjKEk3NKoCYUnSQ0rWxrZbFKbKIhOKPZe1cJKzZSaQrIyULHDZmV5K4xySsDRKWOruanGtjLJXFEmwaIbDLX0hIPBUQPVFVkQkDoUNfSoDgQGKPekoxeGzA4DUvnn4bxzcZrtJyipKfPNy5w+9lnXwgqsiyHNeSVpemw4bWb9psYeq//uQZBoABQt4yMVxYAIAAAkQoAAAHvYpL5m6AAgAACXDAAAAD59jblTirQe9upFsmZbpMudy7Lz1X1DYsxOOSWpfPqNX2WqktK0DMvuGwlbNj44TleLPQ+Gsfb+GOWOKJoIrWb3cIMeeON6lz2umTqMXV8Mj30yWPpjoSa9ujK8SyeJP5y5mOW1D6hvLepeveEAEDo0mgCRClOEgANv3B9a6fikgUSu/DmAMATrGx7nng5p5iimPNZsfQLYB2sDLIkzRKZOHGAaUyDcpFBSLG9MCQALgAIgQs2YunOszLSAyQYPVC2YdGGeHD2dTdJk1pAHGAWDjnkcLKFymS3RQZTInzySoBwMG0QueC3gMsCEYxUqlrcxK6k1LQQcsmyYeQPdC2YfuGPASCBkcVMQQqpVJshui1tkXQJQV0OXGAZMXSOEEBRirXbVRQW7ugq7IM7rPWSZyDlM3IuNEkxzCOJ0ny2ThNkyRai1b6ev//3dzNGzNb//4uAvHT5sURcZCFcuKLhOFs8mLAAEAt4UWAAIABAAAAAB4qbHo0tIjVkUU//uQZAwABfSFz3ZqQAAAAAngwAAAE1HjMp2qAAAAACZDgAAAD5UkTE1UgZEUExqYynN1qZvqIOREEFmBcJQkwdxiFtw0qEOkGYfRDifBui9MQg4QAHAqWtAWHoCxu1Yf4VfWLPIM2mHDFsbQEVGwyqQoQcwnfHeIkNt9YnkiaS1oizycqJrx4KOQjahZxWbcZgztj2c49nKmkId44S71j0c8eV9yDK6uPRzx5X18eDvjvQ6yKo9ZSS6l//8elePK/Lf//IInrOF/FvDoADYAGBMGb7FtErm5MXMlmPAJQVgWta7Zx2go+8xJ0UiCb8LHHdftWyLJE0QIAIsI+UbXu67dZMjmgDGCGl1H+vpF4NSDckSIkk7Vd+sxEhBQMRU8j/12UIRhzSaUdQ+rQU5kGeFxm+hb1oh6pWWmv3uvmReDl0UnvtapVaIzo1jZbf/pD6ElLqSX+rUmOQNpJFa/r+sa4e/pBlAABoAAAAA3CUgShLdGIxsY7AUABPRrgCABdDuQ5GC7DqPQCgbbJUAoRSUj+NIEig0YfyWUho1VBBBA//uQZB4ABZx5zfMakeAAAAmwAAAAF5F3P0w9GtAAACfAAAAAwLhMDmAYWMgVEG1U0FIGCBgXBXAtfMH10000EEEEEECUBYln03TTTdNBDZopopYvrTTdNa325mImNg3TTPV9q3pmY0xoO6bv3r00y+IDGid/9aaaZTGMuj9mpu9Mpio1dXrr5HERTZSmqU36A3CumzN/9Robv/Xx4v9ijkSRSNLQhAWumap82WRSBUqXStV/YcS+XVLnSS+WLDroqArFkMEsAS+eWmrUzrO0oEmE40RlMZ5+ODIkAyKAGUwZ3mVKmcamcJnMW26MRPgUw6j+LkhyHGVGYjSUUKNpuJUQoOIAyDvEyG8S5yfK6dhZc0Tx1KI/gviKL6qvvFs1+bWtaz58uUNnryq6kt5RzOCkPWlVqVX2a/EEBUdU1KrXLf40GoiiFXK///qpoiDXrOgqDR38JB0bw7SoL+ZB9o1RCkQjQ2CBYZKd/+VJxZRRZlqSkKiws0WFxUyCwsKiMy7hUVFhIaCrNQsKkTIsLivwKKigsj8XYlwt/WKi2N4d//uQRCSAAjURNIHpMZBGYiaQPSYyAAABLAAAAAAAACWAAAAApUF/Mg+0aohSIRobBAsMlO//Kk4soosy1JSFRYWaLC4qZBYWFRGZdwqKiwkNBVmoWFSJkWFxX4FFRQWR+LsS4W/rFRb/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////VEFHAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAU291bmRib3kuZGUAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMjAwNGh0dHA6Ly93d3cuc291bmRib3kuZGUAAAAAAAAAACU=");  
 	    snd.play();
 	}
 	var arr1=[];
 	 
 		
 		  
 		  Quagga.onDetected(function(data){
 			  beep();
 			 $('#result').val(data.codeResult.code);
 			 $('#scan').text("Scan Again");
 			 Quagga.stop();
 			 
 			//  Quagga.offDetected();
 			  var track_num=data.codeResult.code;
 			  var flag=true;
 			 if((data.codeResult.code!=null || data.codeResult.code!="" || data.codeResult.code!="undefined") && track_num.length==15 ){
 			  $.ajax({
 		    		url: "agent_fetch_wb.jsp",
 		    		type: 'POST',
 		    		data: {
 		    			ccode:ccode,
 		    			agent_code:agent_code,
 		    			track_num:track_num,
 		    			type:"return_wb",
 		    			
 		    		    
 		    		},
 		    		success: function(data) {
 		    		//$('#city_name').val(data);
 		    	
 		    		if(data.trim()!="not"){
 		    		var arr=data.trim().split("%");
 		    	
 		    		
 		    		var sender_address=arr[2]+arr[3]+arr[4]+arr[5];
 		    	$("#sender_code").text(arr[0]);
 		    	$("#sender_name").text(arr[1]);
 		    	$("#sender_address").text(sender_address);
 		    	$("#sender_state").text(arr[6]);
 		    	$("#sender_township").text(arr[7]);
 		    	$("#sender_postal").text(arr[8]);
 		    	$("#sender_phone").text(arr[9]);
 		    	$("#delivery_charges").text((parseInt(arr[10])+parseInt(arr[11]))/2);
 		    	$("#total").text((parseInt(arr[10])+parseInt(arr[11]))/2);
 		    	$("#weight").text(arr[12]);
 		    	$("#size").text(arr[13]);
 		    	
 		    	
 		    	
 		    	$("#receiver_name").val(arr[1]);
 		    	
 		    	$("#receiver_addr1").val(arr[2]);
 		    	$("#receiver_addr2").val(arr[3]);
 		    	$("#receiver_addr3").val(arr[4]);
 		    	$("#receiver_addr4").val(arr[5]);
 		    	$("#receiver_state").val(arr[6]);
 		    	$("#receiver_township").val(arr[7]);
 		    	$("#receiver_postal").val(arr[8]);
 		    	$("#receiver_phone").val(arr[9]);
 		    	$("#deli_charges").val((parseInt(arr[10])+parseInt(arr[11]))/2);
 		    	$("#total_amt").val((parseInt(arr[10])+parseInt(arr[11]))/2);
 		    	$("#weight1").val(arr[12]);
 		    	$("#size1").val(arr[13]);
 		    	$("#receiver_ward").val(arr[14]);
 		    	$("#receiver_street").val(arr[15]);
 		    	$("#old_track_num").val(track_num);	
 		    	$('#btn').prop("disabled", false);
 		    		
 		    		
 		    		
 		    		}
 		    		else{
 		    			alert("Please try with valid tracking number");
 		    		}
 		
 		    		}
 		
 		
 		});
 			 
 			 }
 			 else{
 				alert("Please try with valid tracking number");
 			 }
 			
 			  
 			  
 		  });
 		 
 		 
 		  
 		
 

 	  setInterval(function(){
 		  $('canvas').addClass("d-none");  
 	  }, 1000);
 	  
 	  
 	
	if(ccode!="null" && agent_code!="null"){
		  $.ajax({
	    		url: "agent_fetch_wb.jsp",
	    		type: 'POST',
	    		data: {
	    			ccode:ccode,
	    			agent_code:agent_code,
	    			type:"agent",
	    			
	    		    
	    		},
	    		success: function(data) {
	    		//$('#city_name').val(data);
	    		
	    		
	    		var arr=data.trim().split("$");
	    		
	    	$("#agent_code").text(agent_code);
	    	$("#agent_name").text(arr[0]);
	    	$("#agent_address").text(arr[1]);
	    	$("#agent_postal").text(arr[2]);
	    	$("#agent_township").text(arr[3]);
	    	$("#agent_state").text(arr[4]);
	    	$("#agent_phone").text(arr[5]);
	    	
	    	
	    	
	    	$("#agent_name1").val(arr[0]);
	    	$("#agent_postal1").val(arr[2]);	
	    	$("#agent_phone1").val(arr[5]);
	    	$("#agent_state1").val(arr[4]);
	    	$("#agent_township1").val(arr[3]);
	    		
	    		
	    		
	    		}
	
	
	
	
	});
	}
	
	
 	</script>
 	<div class="row">
 	<div class="col-lg-6 col-sm-12">
 	<div class="card">
 
 	<div class="card-body ">
 		<div class="card-title"><h4><b>Sender Information</b></h4></div>
 	<div class="row text-justify">
 	
 	<div class="col-6">
 	
 	  <label for="colFormLabelLg" class="col-form-label col-form-label-lg">Sender Code :</label>
 	
 	</div>
 	<div class="col-6">
 	 
 	  <label for="colFormLabelLg" class="col-form-label col-form-label-lg" id="agent_code"></label>
 	
 	</div>
 	</div>
 	<div class="row text-justify">
 	
 	<div class="col-6">
 	
 	  <label for="colFormLabelLg" class="col-form-label col-form-label-lg">Sender Name :</label>
 	
 	</div>
 	<div class="col-6">
 	 
 	  <label for="colFormLabelLg" class="col-form-label col-form-label-lg" id="agent_name"></label>
 	
 	</div>
 	</div>
 	
 	<div class="row text-justify">
 	
 	<div class="col-6">
 	
 	  <label for="colFormLabelLg" class="col-form-label col-form-label-lg">Sender Address :</label>
 	
 	</div>
 	<div class="col-6">
 	
 	  <label for="colFormLabelLg" class="col-form-label col-form-label-lg" id="agent_address"></label>
 
 	</div>
 	</div>
 	
 	<div class="row text-justify">
 	
 	<div class="col-6">
 	
 	  <label for="colFormLabelLg" class="col-form-label col-form-label-lg">Sender Township :</label>
 	
 	</div>
 	<div class="col-6">
 
 	  <label for="colFormLabelLg" class="col-form-label col-form-label-lg" id="agent_township"></label>
 	
 	</div>
 	</div>
 	
 	<div class="row text-justify">
 	
 	<div class="col-6">
 	
 	  <label for="colFormLabelLg" class="col-form-label col-form-label-lg" >Sender State :</label>
 	
 	</div>
 	<div class="col-6">
 
 	  <label for="colFormLabelLg" class="col-form-label col-form-label-lg"id="agent_state"></label>
 
 	</div>
 	</div>
 	
 	
 	<div class="row text-justify">
 	
 	<div class="col-6">
 	
 	  <label for="colFormLabelLg" class="col-form-label col-form-label-lg">Sender Postal :</label>
 	
 	</div>
 	<div class="col-6">
 	
 	  <label for="colFormLabelLg" class="col-form-label col-form-label-lg" id="agent_postal"></label>
 	
 	</div>
 	</div>
 	
 	<div class="row text-justify">
 	
 	<div class="col-6">
 	
 	  <label for="colFormLabelLg" class="col-form-label col-form-label-lg">Sender Phone :</label>
 	
 	</div>
 	<div class="col-6">
 	 
 	  <label for="colFormLabelLg" class="col-form-label col-form-label-lg" id="agent_phone"></label>
 	
 	</div>
 	</div>
 	
 	
 
 	
 	
 	
 	
 
 	
 	
 	</div>
 	</div>
 	
 	</div>
 	
 		<div class="col-lg-6 col-sm-12">
 <div class="card">
 	<div class="card-body ">
 	<div class="card-title"><h4><b>Receiver Information</b></h4></div>
 	<div class="row text-justify">
 	
 	<div class="col-6">
 	
 	  <label for="colFormLabelLg" class="col-form-label col-form-label-lg">Receiver Code :</label>
 	
 	</div>
 	<div class="col-6">
 	 
 	  <label for="colFormLabelLg" class="col-form-label col-form-label-lg" id="sender_code"></label>
 	
 	</div>
 	</div>
 	<div class="row text-justify">
 	
 	<div class="col-6">
 	
 	  <label for="colFormLabelLg" class="col-form-label col-form-label-lg">Receiver Name :</label>
 	
 	</div>
 	<div class="col-6">
 	 
 	  <label for="colFormLabelLg" class="col-form-label col-form-label-lg" id="sender_name"></label>
 	
 	</div>
 	</div>
 	
 	<div class="row text-justify">
 	
 	<div class="col-6">
 	
 	  <label for="colFormLabelLg" class="col-form-label col-form-label-lg">Receiver Address :</label>
 	
 	</div>
 	<div class="col-6">
 	
 	  <label for="colFormLabelLg" class="col-form-label col-form-label-lg" id="sender_address"></label>
 
 	</div>
 	</div>
 	
 	<div class="row text-justify">
 	
 	<div class="col-6">
 	
 	  <label for="colFormLabelLg" class="col-form-label col-form-label-lg">Receiver Township :</label>
 	
 	</div>
 	<div class="col-6">
 
 	  <label for="colFormLabelLg" class="col-form-label col-form-label-lg" id="sender_township"></label>
 	
 	</div>
 	</div>
 	
 	<div class="row text-justify">
 	
 	<div class="col-6">
 	
 	  <label for="colFormLabelLg" class="col-form-label col-form-label-lg">Receiver State :</label>
 	
 	</div>
 	<div class="col-6">
 
 	  <label for="colFormLabelLg" class="col-form-label col-form-label-lg" id="sender_state"></label>
 
 	</div>
 	</div>
 	
 	
 	<div class="row text-justify">
 	
 	<div class="col-6">
 	
 	  <label for="colFormLabelLg" class="col-form-label col-form-label-lg" >Receiver Postal :</label>
 	
 	</div>
 	<div class="col-6">
 	
 	  <label for="colFormLabelLg" class="col-form-label col-form-label-lg" id="sender_postal"></label>
 	
 	</div>
 	</div>
 	
 	<div class="row text-justify">
 	
 	<div class="col-6">
 	
 	  <label for="colFormLabelLg" class="col-form-label col-form-label-lg">Receiver Phone :</label>
 	
 	</div>
 	<div class="col-6">
 	 
 	  <label for="colFormLabelLg" class="col-form-label col-form-label-lg" id="sender_phone"></label>
 	
 	</div>
 	</div>
 	
 
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	</div>
 	</div>
 	
 	</div>
 	
 	</div>
 	
 	<div class='row'>
 	<div class="col-lg-8 col-sm-12">
 	<div class="card">
 	<div class="card-body">
 	<div class="card-title"><h4><b>Item Information</b></h4></div>
 		<div class="row text-justify">
 	
 	<div class="col-6">
 	
 	  <label for="colFormLabelLg" class="col-form-label col-form-label-lg">Delivery Charges :</label>
 	
 	</div>
 	<div class="col-6">
 	 
 	  <label for="colFormLabelLg" class="col-form-label col-form-label-lg" id="delivery_charges"></label>
 	
 	</div>
 	</div>
 	
 	
 	<div class="row text-justify">
 	
 	<div class="col-6">
 	
 	  <label for="colFormLabelLg" class="col-form-label col-form-label-lg">Total Amt :</label>
 	
 	</div>
 	<div class="col-6">
 	 
 	  <label for="colFormLabelLg" class="col-form-label col-form-label-lg" id="total"></label>
 	
 	</div>
 	</div>
 	
 	
 	<div class="row text-justify">
 	
 	<div class="col-6">
 	
 	  <label for="colFormLabelLg" class="col-form-label col-form-label-lg">Weight :</label>
 	
 	</div>
 	<div class="col-6">
 	 
 	  <label for="colFormLabelLg" class="col-form-label col-form-label-lg" id="weight"></label>
 	
 	</div>
 	</div>
 	
 	
 	<div class="row text-justify">
 	
 	<div class="col-6">
 	
 	  <label for="colFormLabelLg" class="col-form-label col-form-label-lg">Size :</label>
 	
 	</div>
 	<div class="col-6">
 	 
 	  <label for="colFormLabelLg" class="col-form-label col-form-label-lg" id="size"></label>
 	
 	</div>
 	</div>
 	
 	
 	
 	
 	
 	</div>
 	</div>
 	
 	</div>
 	
 	</div>
 	<div class="row">
 	<div class="col-12 text-center">
 	<form action="return_waybill_pdf.jsp" method="post" id="return_form">
 	<input type="hidden" value="" name="agent_name" id="agent_name1">
 	<input type="hidden" value="" name="agent_postal" id="agent_postal1">
 	<input type="hidden" value="" name="agent_phone" id="agent_phone1">
 	<input type="hidden" value="" name="agent_state" id="agent_state1">
 	<input type="hidden" value="" name="agent_township" id="agent_township1">
 	
 	<input type="hidden" value="" name="receiver_name" id="receiver_name">
 	<input type="hidden" value="" name="receiver_addr1" id="receiver_addr1">
 	<input type="hidden" value="" name="receiver_addr2" id="receiver_addr2">
 	<input type="hidden" value="" name="receiver_addr3" id="receiver_addr3">
 	<input type="hidden" value="" name="receiver_addr4" id="receiver_addr4">
 	<input type="hidden" value="" name="receiver_state" id="receiver_state">
 	<input type="hidden" value="" name="receiver_township" id="receiver_township">
 	<input type="hidden" value="" name="receiver_ward" id="receiver_ward">
 	<input type="hidden" value="" name="receiver_street" id="receiver_street">
 	<input type="hidden" value="" name="receiver_postal" id="receiver_postal">
 	<input type="hidden" value="" name="receiver_phone" id="receiver_phone">
 	
 	<input type="hidden" value="" name="deli_charges" id="deli_charges">
 	<input type="hidden" value="" name="total_amt" id="total_amt">
 	<input type="hidden" value="" name="weight" id="weight1">
 	<input type="hidden" value="" name="size" id="size1">
 	<input type="hidden" value="generate" name="type" id="type">
 	<input type="hidden" value="" name="tracking_num" id="tracking_num">
 <input type="hidden" value="" name="old_track_num" id="old_track_num">
 	
 	<button type="submit" class="btn btn-primary" id="btn" disabled>Return</button>
 	</form>
 	</div>
 	</div>
 	
 	
 	
   </div>
   <script>
   $(document).ready(function(){
	   $("#return_form").submit(function(e) {
			 e.preventDefault();
			 $.ajax({
			     type: "POST",
			      url: "agent_fetch_wb.jsp",
			      data: $("#return_form").serialize(),
			    	  
			      
			      
			      success: function(data) {
			        // callback code here
			       // alert(data.trim());
			        $("#tracking_num").val(data.trim());
			        $('#return_form').unbind("submit");
	            	$('#return_form').submit() ; 
			       }
			    });
		 });
   });
   </script>
    
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