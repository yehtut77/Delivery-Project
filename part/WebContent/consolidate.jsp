<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

  <%@page import="java.text.SimpleDateFormat,java.util.Date"%>
            <%@ page import="java.time.format.DateTimeFormatter" %>
    <%@ page import="java.time.*" %>
<!DOCTYPE html>
<html lang="en">
 
<%//Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/delivery1","root","root");
 Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");

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
<script>
var n1='<%=n%>';

if(n1=="null"){
	window.location.replace("https://www.delivery.teamramen.net/Login.jsp");
}</script>
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
                        <h3>Consolidate</h3>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.jsp"><i class="icon_house_alt"></i> Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Command Header</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    <!-- BackHome Area End -->
   
    
    <!-- Welcome  body  Area Start -->
	  <div class="container">
      <div class="row">
      <div class="col-8">
      <div class="card">
	 <div class="card-body">
		
		
		<div class="row">
		<div class="col-12">
		
		<div class="form-group"> 
	 	<div class="row">
    	<div class="col-6"><label>User Name :</label></div>     
        <div class="col-6">
	   <span><%=staff_name %></span>
	    <input type="hidden" value="<%=staff_name%>" id="staff_name">
	    </div>
        </div></div>
      
        
        
        <div class="form-group"> 
        <div class="row">
    	<div class="col-6"><label>Company code :</label></div>     
        <div class="col-6">
	     <span><%=ccode%></span>
	     <input type="hidden" value="<%=ccode%>" id="ccode">
	    </div>
        </div></div>
         
        
        <div class="form-group"> 
        <div class="row">
    	<div class="col-6"><label>Agent code :</label></div>     
        <div class="col-6">
	     <span><%=agent_code%></span>
	     <input type="hidden" value="<%=agent_code%>" id="agent_code">
	    </div>
        </div></div>
	
		</div>	
		</div>
		
		</div></div>
      </div>
     
      <div class="col-4">
      <div class="card">
		 <div class="card-body">
		
	
													
					
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
       
       
      
		</div></div>
      </div>
      </div>
      <br><br>
      <form id="conso_form">
       <div class="card">
     <div class="card-body">
					   <div class="card-title"><h4>Location</h4></div>
					
      <div class="row">
      <div class="col-lg-6 col-sm-12">
      
    
      
      <div class="form-group"> 
			<label class="pure-material-textfield-outlined">
				<select required class="custom-select custom-select-md"  name="select1" id="select1"  >
           			<option value="" selected>--Select--</option>
	       <%
						PreparedStatement pre =conn.prepareStatement("Select state_code,state_name from state");
						ResultSet r1=pre.executeQuery();
						while(r1.next()){
						
						
						%>
						<option value="<%=r1.getString("state_name") %>" about="<%=r1.getString("state_code")%>" ><%=r1.getString("state_name") %></option>
						<%} %>
  				</select>
  				<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>From State</span>
	            </label>						
</div>	
        
        <div class="form-group"> 
		<label class="pure-material-textfield-outlined">
			<select required class="custom-select custom-select-md"  name="select2" id="select2"   >   
   				<option value="" selected> --Select--</option> 
 			</select>		
	 	<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>From Township</span>
	    </label>
</div> 
<input type="hidden" value="" id="s_postcode">






      </div>
      <div class="col-lg-6 col-sm-12">
     
     
      <div class="form-group"> 
			<label class="pure-material-textfield-outlined">
				<select required class="custom-select custom-select-md"  name="select1" id="select11"  >
           			<option value="" selected>--Select--</option>
	       <%
						PreparedStatement pre1 =conn.prepareStatement("Select state_code,state_name from state");
						ResultSet r11=pre1.executeQuery();
						while(r11.next()){
						
						
						%>
						<option value="<%=r11.getString("state_name") %>" about="<%=r11.getString("state_code")%>" ><%=r11.getString("state_name") %></option>
						<%} %>
  				</select>
  				<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>To State</span>
	            </label>						
</div>	
        
        <div class="form-group"> 
		<label class="pure-material-textfield-outlined">
			<select required class="custom-select custom-select-md"  name="select2" id="select22"   >   
   				<option value="" selected> --Select--</option> 
 			</select>		
	 	<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>To Township</span>
	    </label>
</div>  

 <div class="form-group"> 
			<label class="pure-material-textfield-outlined">
				<select class="custom-select custom-select-md"   name="agent" id="agent" disabled required="required" 	>
	 				
	 
	 			</select>		
	  		<span>Agent</span>
	    </label>
	</div>
</div>
</div>
      </div>
   
      </div>	
      
      <br>


      <div class="row">
      <div class="col-lg-8 col-sm-12">
       <div class="card">
      <div class="card-body">
      	   			<div class="table-responsive">
									<table  class="display table table-striped table-hover" cellspacing="0" width="100%">
																	<!-- <thead> -->
											<thead>

												<tr>
												<th>Seq</th>

													<th>Waybill No</th>

													<th>Receiver Township</th>
													<th>Receiver State</th>

												
													
													
													
												
													
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
  
      
      <div class="col-lg-4 col-sm-12">
      <div class="card">
      <div class="card-body">
    <div id="camera" >
</div>
<div class="form-group text-center"> 
          
     
		<input type="text" class="form-control" id="result" aria-describedby="result" readonly >
		
         </div> 
      
      </div>
      </div>
      
      </div>

		</div>
		
		<div class="row">
		<div class="col-12 text-center"><div id="check"><button type="submit" class="btn btn-primary" id="complete">Complete</button></div></div>
		</div>
		
		</div>
		</form>
<!-- ----------------------Modal  box  End--------------------- -->
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
      
     
  });
  

var i=0;
function beep() {
    var snd = new  Audio("data:audio/wav;base64,//uQRAAAAWMSLwUIYAAsYkXgoQwAEaYLWfkWgAI0wWs/ItAAAGDgYtAgAyN+QWaAAihwMWm4G8QQRDiMcCBcH3Cc+CDv/7xA4Tvh9Rz/y8QADBwMWgQAZG/ILNAARQ4GLTcDeIIIhxGOBAuD7hOfBB3/94gcJ3w+o5/5eIAIAAAVwWgQAVQ2ORaIQwEMAJiDg95G4nQL7mQVWI6GwRcfsZAcsKkJvxgxEjzFUgfHoSQ9Qq7KNwqHwuB13MA4a1q/DmBrHgPcmjiGoh//EwC5nGPEmS4RcfkVKOhJf+WOgoxJclFz3kgn//dBA+ya1GhurNn8zb//9NNutNuhz31f////9vt///z+IdAEAAAK4LQIAKobHItEIYCGAExBwe8jcToF9zIKrEdDYIuP2MgOWFSE34wYiR5iqQPj0JIeoVdlG4VD4XA67mAcNa1fhzA1jwHuTRxDUQ//iYBczjHiTJcIuPyKlHQkv/LHQUYkuSi57yQT//uggfZNajQ3Vmz+Zt//+mm3Wm3Q576v////+32///5/EOgAAADVghQAAAAA//uQZAUAB1WI0PZugAAAAAoQwAAAEk3nRd2qAAAAACiDgAAAAAAABCqEEQRLCgwpBGMlJkIz8jKhGvj4k6jzRnqasNKIeoh5gI7BJaC1A1AoNBjJgbyApVS4IDlZgDU5WUAxEKDNmmALHzZp0Fkz1FMTmGFl1FMEyodIavcCAUHDWrKAIA4aa2oCgILEBupZgHvAhEBcZ6joQBxS76AgccrFlczBvKLC0QI2cBoCFvfTDAo7eoOQInqDPBtvrDEZBNYN5xwNwxQRfw8ZQ5wQVLvO8OYU+mHvFLlDh05Mdg7BT6YrRPpCBznMB2r//xKJjyyOh+cImr2/4doscwD6neZjuZR4AgAABYAAAABy1xcdQtxYBYYZdifkUDgzzXaXn98Z0oi9ILU5mBjFANmRwlVJ3/6jYDAmxaiDG3/6xjQQCCKkRb/6kg/wW+kSJ5//rLobkLSiKmqP/0ikJuDaSaSf/6JiLYLEYnW/+kXg1WRVJL/9EmQ1YZIsv/6Qzwy5qk7/+tEU0nkls3/zIUMPKNX/6yZLf+kFgAfgGyLFAUwY//uQZAUABcd5UiNPVXAAAApAAAAAE0VZQKw9ISAAACgAAAAAVQIygIElVrFkBS+Jhi+EAuu+lKAkYUEIsmEAEoMeDmCETMvfSHTGkF5RWH7kz/ESHWPAq/kcCRhqBtMdokPdM7vil7RG98A2sc7zO6ZvTdM7pmOUAZTnJW+NXxqmd41dqJ6mLTXxrPpnV8avaIf5SvL7pndPvPpndJR9Kuu8fePvuiuhorgWjp7Mf/PRjxcFCPDkW31srioCExivv9lcwKEaHsf/7ow2Fl1T/9RkXgEhYElAoCLFtMArxwivDJJ+bR1HTKJdlEoTELCIqgEwVGSQ+hIm0NbK8WXcTEI0UPoa2NbG4y2K00JEWbZavJXkYaqo9CRHS55FcZTjKEk3NKoCYUnSQ0rWxrZbFKbKIhOKPZe1cJKzZSaQrIyULHDZmV5K4xySsDRKWOruanGtjLJXFEmwaIbDLX0hIPBUQPVFVkQkDoUNfSoDgQGKPekoxeGzA4DUvnn4bxzcZrtJyipKfPNy5w+9lnXwgqsiyHNeSVpemw4bWb9psYeq//uQZBoABQt4yMVxYAIAAAkQoAAAHvYpL5m6AAgAACXDAAAAD59jblTirQe9upFsmZbpMudy7Lz1X1DYsxOOSWpfPqNX2WqktK0DMvuGwlbNj44TleLPQ+Gsfb+GOWOKJoIrWb3cIMeeON6lz2umTqMXV8Mj30yWPpjoSa9ujK8SyeJP5y5mOW1D6hvLepeveEAEDo0mgCRClOEgANv3B9a6fikgUSu/DmAMATrGx7nng5p5iimPNZsfQLYB2sDLIkzRKZOHGAaUyDcpFBSLG9MCQALgAIgQs2YunOszLSAyQYPVC2YdGGeHD2dTdJk1pAHGAWDjnkcLKFymS3RQZTInzySoBwMG0QueC3gMsCEYxUqlrcxK6k1LQQcsmyYeQPdC2YfuGPASCBkcVMQQqpVJshui1tkXQJQV0OXGAZMXSOEEBRirXbVRQW7ugq7IM7rPWSZyDlM3IuNEkxzCOJ0ny2ThNkyRai1b6ev//3dzNGzNb//4uAvHT5sURcZCFcuKLhOFs8mLAAEAt4UWAAIABAAAAAB4qbHo0tIjVkUU//uQZAwABfSFz3ZqQAAAAAngwAAAE1HjMp2qAAAAACZDgAAAD5UkTE1UgZEUExqYynN1qZvqIOREEFmBcJQkwdxiFtw0qEOkGYfRDifBui9MQg4QAHAqWtAWHoCxu1Yf4VfWLPIM2mHDFsbQEVGwyqQoQcwnfHeIkNt9YnkiaS1oizycqJrx4KOQjahZxWbcZgztj2c49nKmkId44S71j0c8eV9yDK6uPRzx5X18eDvjvQ6yKo9ZSS6l//8elePK/Lf//IInrOF/FvDoADYAGBMGb7FtErm5MXMlmPAJQVgWta7Zx2go+8xJ0UiCb8LHHdftWyLJE0QIAIsI+UbXu67dZMjmgDGCGl1H+vpF4NSDckSIkk7Vd+sxEhBQMRU8j/12UIRhzSaUdQ+rQU5kGeFxm+hb1oh6pWWmv3uvmReDl0UnvtapVaIzo1jZbf/pD6ElLqSX+rUmOQNpJFa/r+sa4e/pBlAABoAAAAA3CUgShLdGIxsY7AUABPRrgCABdDuQ5GC7DqPQCgbbJUAoRSUj+NIEig0YfyWUho1VBBBA//uQZB4ABZx5zfMakeAAAAmwAAAAF5F3P0w9GtAAACfAAAAAwLhMDmAYWMgVEG1U0FIGCBgXBXAtfMH10000EEEEEECUBYln03TTTdNBDZopopYvrTTdNa325mImNg3TTPV9q3pmY0xoO6bv3r00y+IDGid/9aaaZTGMuj9mpu9Mpio1dXrr5HERTZSmqU36A3CumzN/9Robv/Xx4v9ijkSRSNLQhAWumap82WRSBUqXStV/YcS+XVLnSS+WLDroqArFkMEsAS+eWmrUzrO0oEmE40RlMZ5+ODIkAyKAGUwZ3mVKmcamcJnMW26MRPgUw6j+LkhyHGVGYjSUUKNpuJUQoOIAyDvEyG8S5yfK6dhZc0Tx1KI/gviKL6qvvFs1+bWtaz58uUNnryq6kt5RzOCkPWlVqVX2a/EEBUdU1KrXLf40GoiiFXK///qpoiDXrOgqDR38JB0bw7SoL+ZB9o1RCkQjQ2CBYZKd/+VJxZRRZlqSkKiws0WFxUyCwsKiMy7hUVFhIaCrNQsKkTIsLivwKKigsj8XYlwt/WKi2N4d//uQRCSAAjURNIHpMZBGYiaQPSYyAAABLAAAAAAAACWAAAAApUF/Mg+0aohSIRobBAsMlO//Kk4soosy1JSFRYWaLC4qZBYWFRGZdwqKiwkNBVmoWFSJkWFxX4FFRQWR+LsS4W/rFRb/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////VEFHAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAU291bmRib3kuZGUAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMjAwNGh0dHA6Ly93d3cuc291bmRib3kuZGUAAAAAAAAAACU=");  
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
		  if(arr1.length!=0){
			  
			  for(var j=0;j<arr1.length;j++){
				  if(arr1[j]==track_num){
					  flag=false;
					  alert("This code is already scanned.");
				  }
					  
				
			  }
		  }
		  Quagga.offDetected();
		 // alert(data.codeResult.code);
		  if((data.codeResult.code!=null || data.codeResult.code!="" || data.codeResult.code!="undefined") && track_num.length==15 && flag==true){
			  
			  Quagga.offDetected();
			  $('#result').val(track_num);
		 
		  $.ajax({
	    		url: "fetch_conso.jsp",
	    		type: 'POST',
	    		data: {
	    			ccode:$('#ccode').val(),
	    			track_num:track_num,
	    			type:"conso",
	    			
	    		    
	    		},
	    		success: function(data) {
	    		//$('#city_name').val(data);
	    		
	    		if(data.trim()!="not"){
	    		var arr=data.trim().split("$");
	    		arr1[i]=arr[0];
	    		i+=1;
	    		var markup = "<tr><td>"+i+"</td><td>"+arr[0]+"</td><td>" + arr[1] + "</td><td>" + arr[2] + "</td></tr>";
	    		 $("table tbody").append(markup);
	    	
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
  
  const months = ["Jan", "Feb", "Mar","Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
  let current_datetime = new Date()
  let formatted_date = current_datetime.getDate() + "-" + months[current_datetime.getMonth()] + "-" + current_datetime.getFullYear()
  
  $('#conso_form').submit(function(e) {
	  e.preventDefault();
	  
	  
	  var agent=$("#agent").children("option:selected").val();
	  if(agent!=null || agent!=""){
		var agent_arr=agent.split(":");
		
		 
	 
	  $.ajax({
  		url: "fetch_conso.jsp",
  		type: 'POST',
  		data: {
  			from_state:$("#select1").children("option:selected").val(),
  			from_township:$("#select2").children("option:selected").val(),
  			to_state:$("#select11").children("option:selected").val(),
  			to_township:$("#select22").children("option:selected").val(),
  			to_agent_code:agent_arr[1],
  			ccode:$('#ccode').val(),
  			agent_code:$('#agent_code').val(),
  			user:$('#staff_name').val(),
  			"track_num[]":arr1,
  			type:"generate",
  			
  		    
  		},
  		success: function(data) {
  		//$('#city_name').val(data);
  		alert("Success");
  		var conso_code="*"+data.trim()+"*";
  		var doc=new jsPDF("landscape");
		doc.setFontSize(22);
		doc.text("Code",30,50);
		doc.text("From",30,80);
		doc.text($("#select2").children("option:selected").val(),100,80)
		doc.text($("#select1").children("option:selected").val(),160,80)
		doc.text("To",30,110);
		doc.text($("#select22").children("option:selected").val(),100,110)
		doc.text($("#select11").children("option:selected").val(),160,110)
		doc.setFontSize(35);
		doc.text(conso_code,100,40);
		doc.setFontSize(16);
		doc.text(data.trim(),160,46);
		
		doc.save(conso_code+" header"+".pdf");//First document
		
		var doc1=new jsPDF();
		doc1.setFontSize(12);
		doc1.setFont("times");
		doc1.text("Code",10,50);
		
		doc1.text("Date: "+formatted_date,160,50);
		
		
		doc1.text("Total",10,70);
		doc1.text(arr1.length.toString(),90,70)
		doc1.text("From: "+$("#select2").children("option:selected").val(),160,70)
		doc1.text("No",20,90);
		doc1.text("Tracking",90,90)

		
		doc1.text("To: "+$("#select22").children("option:selected").val(),160,80)
		doc1.setFontSize(35);
		doc1.text(conso_code,40,40);
		doc1.setFontSize(16);
		doc1.text(data.trim(),80,46);
	/* 	doc.addPage("a4");
		doc.text("Do you like that?", 20,20); */
	var j=0;
		var counter=0;
		var first="f";
		var length=arr1.length;
		var c=0;
		for(var i=100;i<=290;i+=7){
			j+=1;
			counter+=1;
			
			doc1.setFontSize(12);
			doc1.text(j.toString(),20,i);
			doc1.text(arr1[c],90,i)
		c++;
			if((first=="f" || first=="o") && (i==289 || i==286)){
				first="o";
				
				i=20;
				
				doc1.addPage("a4");
				
			}
			if(counter==length){
				break;
			}

		}
		
	
		
		doc1.save(conso_code+".pdf");
		
		$("#complete").prop("disabled", true);
		
		  alert("If you want to submit again, please reload the page.");
		
  	
  		
  		
  		
  		}
  		
  		
  		
  		
  		
  		});
	  }
}); 
	  
  $('#check').click(function() {
	  if ($("#complete").is(":disabled")){
		    // do stuff
		    alert("If you want to submit again, please reload the page.");
		}
  });
  
  
</script>
    
 <script type="text/javascript">
 $('#agent').focusout(function() {
	
 });
 
 

  $('#select22').focusout(function() {
	 
		$('#agent').removeAttr("disabled");  
		var postcode=document.getElementById("s_postcode").value; 
		//alert(postcode);
		 $.ajax({
	    		url: "fectch_pickupRequest.jsp",
	    		type: 'POST',
	    		data: {postcode: postcode},
	    		success: function(data) {
	    			
	    			var agent_data = data.trim();
	    			var str = agent_data.split(":");
	    			var select = $('#agent');
					select.find('option').remove();
					var value=0;
					if(agent_data=="0"){
				    	 $('<option>').val(value).text("No Agent available in this area").appendTo(select);  	 
				    				}
					
	    			for(var i=0;i<str.length;i++)
	    				{
	    				
	    				//var s = str[0].split(",");
	    				var c_code=str[i].substring(0, 4);
	    				var a_code=str[i].substring(4,8);
	    				var a_name=str[i].substring(8);
	    				//c_code=c_code+":"+a_code;	 
	    				c_code=c_code+":"+a_code+":"+a_name;
	    				$('<option>').val(c_code).text(a_name).appendTo(select);
	    					
	    					
	    				}
	    	         
	    		}
	}); 
		 
	});  

  $("#select22").change(function()  {
		$('#select3').prop("disabled", false);
		//var state_code=document.getElementById("select1").value;
		//var township_code=document.getElementById("select2").value;
		var township_code=$('#select22').children(":selected").attr("about");
		var state_code=$('#select11').children(":selected").attr("about");
		document.getElementById("s_postcode").value=state_code+township_code+"0000";
		var module="select2";
		
		
		
	});

	$("#select1").change(function()  {
		
		//var state_code=document.getElementById("select1").value;
		var state_code=$('#select1').children(":selected").attr("about");
		//alert(s1_about);
		var module="select1";
		 $.ajax({
		    		url: "fetch_postal.jsp",
		    		type: 'POST',
		    		data: {state_code: state_code,module:module},
		    		success: function(data)
		    		{	    		
		    			var agentList = data.trim();
		    		//alert(agentList);
		    			$('#select2').children('option').remove();
		    			$('#select2').append(data); 
		    		
		    		}
		}); 
		
		
	});
	
	$("#select11").change(function()  {
		
		//var state_code=document.getElementById("select1").value;
		var state_code=$('#select11').children(":selected").attr("about");
		//alert(s1_about);
		var module="select1";
		 $.ajax({
		    		url: "fetch_postal.jsp",
		    		type: 'POST',
		    		data: {state_code: state_code,module:module},
		    		success: function(data)
		    		{	    		
		    			var agentList = data.trim();
		    		//alert(agentList);
		    			$('#select22').children('option').remove();
		    			$('#select22').append(data); 
		    			document.getElementById("s_postcode").value=state_code+"000000"
		    			
		    		}
		}); 
		
		
	});
	

 </script>
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