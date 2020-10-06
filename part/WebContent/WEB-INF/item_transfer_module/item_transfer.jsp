<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

  <%@page import="java.text.SimpleDateFormat,java.util.Date"%>
            <%@ page import="java.time.format.DateTimeFormatter" %>
    <%@ page import="java.time.*" %>
<!DOCTYPE html>
<html lang="en">
 
<%//Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/delivery1","root","root");
Connection con=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");



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
    int count=0;
    
    PreparedStatement pre_noti=con.prepareStatement("Select count(*) from agent_noti where agent_code=? and company_code=?");
	    pre_noti.setString(1,agent_code);
	    pre_noti.setString(2,ccode);	    
		ResultSet noti_rs = pre_noti.executeQuery();
		noti_rs.next();
      count = noti_rs.getInt(1);
		     
      String mainagent="no";
	PreparedStatement pre_for_PCC = con.prepareStatement("Select main_agent from agent where agent_code=? and company_code=?");
	 pre_for_PCC.setString(1,agent_code);
	    pre_for_PCC.setString(2,ccode);	 
			ResultSet rs_for_PCC = pre_for_PCC.executeQuery();
			if (rs_for_PCC.next()) {
			String testmainagent=rs_for_PCC.getString("main_agent").trim();
			if(testmainagent.equals("on")){
			   mainagent="yes"; 
			}
			    
			}
			String monthlyincome="no";
				String staff_dept_des="";
					String staff_role_des="";
				PreparedStatement pre_month = con.prepareStatement("Select staff_dept,staff_position_code from staff where agent_code=? and company_code=? and staff_code=?");
           	 pre_month.setString(1,agent_code);
	               pre_month.setString(2,ccode);	
	    	    pre_month.setString(3,staff_code);	 
                 

			ResultSet rs_month = pre_month.executeQuery();
			if (rs_month.next()) {
			String staff_dept=rs_month.getString("staff_dept");
			String staff_position_code=rs_month.getString("staff_position_code");
         
           
           	PreparedStatement pre_dept = con.prepareStatement("Select description from staff_dept where dept_code=?");
           	 pre_dept.setString(1,staff_dept);
	       
			ResultSet rs_dept = pre_dept.executeQuery();
			if (rs_dept.next()) {
			 staff_dept_des=rs_dept.getString("description");
			}
				PreparedStatement pre_role = con.prepareStatement("Select description from staff_position where pos_code=?");
           	 pre_role.setString(1,staff_position_code);
	       
			ResultSet rs_role = pre_role.executeQuery();
			if (rs_role.next()) {
			 staff_role_des=rs_role.getString("description");
			}
			}
			         

			if(staff_dept_des.equals("Accounts") || staff_role_des.equals("Supervisor") ||  staff_role_des.equals("Manager")) {
			    monthlyincome="yes";
			}
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
<script>

var n1='<%=n%>';

if(n1=="null"){
	window.location.replace("https://www.delivery.teamramen.net/Login.jsp");
}



</script>
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
                                    
                                     <li><a href="./index.jsp">Home</a></li>
                                     
                                      <li class="drop-down"><a href="#">Reports</a>     
                                        <ul class="dropdown" style="width: 280px;" >
 
       									      <li ><a href="AdCp">Agent Daily Received Report</a>
                                    </li>
                                     <li ><a href="AdRp">Agent Daily Delivery Report</a>
                                    </li>
                                     <li> <a href="ZdDl">Daily Delivery List</a></li>
                                     <li> <a href="jRp">Customer Receipt Report</a></li>
                                       <li id="crdr"> <a href="CRADR"  style="font-size:11px;">Company Received And Delivered Report</a></li>
                                          <li id="mirc"> <a href="MIR" >Monthly Income Report</a></li>

    									</ul>
    									
                                    </li>
                                    
                                    <li class="drop-down"><a href="#">Operation</a>     
                                        <ul class="dropdown" >
       									   <li> <a href="warehouse_query.jsp">WareHouse Items</a></li>
       									   <li> <a href="item">Item Transfer</a></li>
       									    <li> <a href="WBQ">Waybill Query</a></li>
       									       <li><a href="OFD">Out For Delivery</a></li>
       									    <li> <a href="DOP">DO Printout</a></li>
       									     
       									     <li> <a href="consolidate.jsp">Consolidate</a></li>
       									    <li><a href="CCQ">Credit Customer Query</a></li>	
       									    <li><a href="return_wb.jsp">Return Waybill</a></li>
       									    <li> <a href="PIfc">Pick up from customer</a></li>
       									   
       									   
       									     <li> <a href="RC">Receiver Confirmation</a></li>
       									      <li ><a href="ITR">Item Rejected </a>
                                    </li>
                                     <li><a href="PCS">Parcel with staff</a></li>
                                     <li ><a href="payment">Payment Transfer </a>
                                    </li>
                                     <li id="pcca"> <a style="font-size:11px;" href="PCC">Payment To Credit customer</a></li>
    									</ul>
    									
                                    </li>
                                    
                                    <li><a href="wb">WayBill</a>
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
                                    
                                    
                                    <a href="kill_session">Logout</a>
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
        </div>
    </header>
    <!-- Header Area End -->
    
    


 <!-- BackHome Area Start -->
 
 <br><br>
          <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumb-content">
                        <h3>Item Transfer</h3>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.jsp"><i class="icon_house_alt"></i> Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Item Transfer</li>
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
 <div class='col-6'>Company Code:</div>
 <div class='col-6'><%=ccode %></div>
 <input type="hidden" value="<%=ccode %>" id="ccode">
 
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
 <div class="row">
 <div class='col-6'>Username:</div>
 <div class='col-6'><%=staff_name %></div>
 </div>
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
   
   
   </label>
   
  
       </div>		
     </div>
     </div>
     
     
     
     
     
    </div>
    </div>
    
    </div>
 	</div> 
 	

  <script>
  
  $(document).ready(function(){
	  var ccode='<%=ccode%>'
	  var agent_code='<%=agent_code%>'
		  var user='<%=staff_name%>'
		  var staff_code='<%=staff_code%>'
		 $.ajax({
	    		url: "item_fetch",
	    		type: 'POST',
	    		data: {
	    			ccode:ccode,
	    			
	    		
	    			type:"reason",
	    			
	    		    
	    		},
	    		success: function(data) {
	    		//$('#city_name').val(data);
	    		var arr=data.trim().split("$");
	    		 $('#reason').append(arr[0]);
	    		
	    		 $("#reason option").filter('[value=' + 'R001' + ']').addClass("d-none");
	    		
	    		 $('#scan_agent_code').append(arr[1]);
	    		
	    		}
	
	
	
	
	});
	  
	 
	  
	  
	  $('#scan_agent_code').change(function() {
		var code=$('#scan_agent_code').children("option:selected").val();
		
		if(code!=" " && code!="" && code.length==4)
			{
			 $.ajax({
		    		url: "item_fetch",
		    		type: 'POST',
		    		data: {
		    			ccode:ccode,
		    			agent_code:code,
						type:"select",
		    			
		    		    
		    		},
		    		success: function(data) {
		    		//$('#city_name').val(data);
		    		$('#scan_staff_code').empty();
		    		 $('#scan_staff_code').append(data.trim());
		    		
		    
		    		
		    		
		    		
		    		}
			
		  
	  });
	  
			}
	  });
	  var arr1=[];
  $('#scan').click(function() {
	 var a= $("#reason").children("option:selected").val();
	 if(a!=""){
		 
	
	 
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
      $('#scan').prop("disabled", true);
  });

var i=0;
var code_arr=[];
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
		   if(code_arr.length!=0){
			  for(var j=0;j<code_arr.length;j++){
				  if(code_arr[j]==track_num){
					  flag=false;
					  alert("This code is already scanned.");
				  }
					  
				
			  }
		  }
		  Quagga.offDetected();
		 // alert(data.codeResult.code);
		 var ccode='<%=ccode%>'
			 var check_arr=[];
		  if((data.codeResult.code!=null || data.codeResult.code!="" || data.codeResult.code!="undefined") && track_num.length==8 && flag==true){
			  
			  Quagga.offDetected();
			  $('#result').val(track_num);
		 
				 $.ajax({
	 		    		url: "item_fetch",
	 		    		type: 'POST',
	 		    		data: {
	 		    			ccode:ccode,
	 		    			
	 		    			barcode:track_num,
	 		    			type:"agent_staff",
	 		    			
	 		    		    
	 		    		},
	 		    		success: function(data) {
	 		    		//$('#city_name').val(data);
	 		    		
	 		    		
	 		    		var arr=data.trim().split("$");
	 		    		if(arr[0]=="ok"){
	 		    			var staff_code=arr[1].substr(0,4);
	 		    			var agent_code=arr[1].substr(4,8);
	 		    			$("#scan_agent_code").val(agent_code);
	 		    			var s="<option value="+staff_code+" selected>"+staff_code+"</option>"
	 		    			$("#scan_staff_code").append(s);
	 		    			code_arr.push(track_num);
	 		    		}
	 		    
	 		    		
	 		    		
	 		    		
	 		    		}
	 		
	 		
	 		
	 		
	 		});  
	  }
		
		  else if((data.codeResult.code!=null || data.codeResult.code!="" || data.codeResult.code!="undefined") && track_num.length==15 && flag==true){
			  Quagga.offDetected();
			  $('#result').val(track_num);
		 
				 $.ajax({
	 		    		url: "item_fetch",
	 		    		type: 'POST',
	 		    		data: {
	 		    			ccode:ccode,
	 		    			reason:$("#reason").children("option:selected").val(),
	 		    			barcode:track_num,
	 		    			type:"track",
	 		    			
	 		    		    
	 		    		},
	 		    		success: function(data) {
	 		    		//$('#city_name').val(data);
	 		    		//alert(data.trim());
	 		    		
	 		    		var arr=data.trim().split("$");
	 		    		if(arr[0]=="ok"){
	 		    			i+=1;
	 		    			var flag=true;
	 		    			for(var j=0;j<check_arr.length;j++){
	 		    				if(check_arr[j]==track_num){
	 		    					flag=false;
	 		    				}
	 		    				
	 		    			}
	 		    			if(flag==true){
	 			    		var markup = "<tr><td><input type='checkbox' name='track'></td><td class='seq'>"+i+"</td><td class=tracking_num>"+arr[1]+"</td></tr>";
	 			    		 $("table tbody").append(markup);
	 			    		arr1.push(track_num);
	 		    			}
	 			    		var ii=1;
	 			    		
	 			    		check_arr.length=0;
	 			    		$('table tbody tr').each(function() {
	 			    	  		
	 			    	  		$(this).closest('tr').find('.seq').text(ii);    
	 			    			   ii++;
	 			    			   check_arr.push($(this).closest('tr').find('.tracking_num').text());
	 			    			 });
	 		    			
	 			    		
	 		    		}
	 		    		else{
	 		    			var reason=$("#reason").children("option:selected").text();
	 		    			alert("This is not "+reason+" item");
	 		    			
	 		    		}
	 		    
	 		    		
	 		    		
	 		    		
	 		    		}
	 		
	 		
	 		
	 		
	 		}); 
		  }
		  
		  
	  });
	 
	 
	  
	}, 4000);
	 }
	 else{
		 $("#scan_agent_code").focus();
	 }
  });
  $("#delete").click(function(){
      $("table tbody").find('input[name="track"]').each(function(){
          if($(this).is(":checked")){
              $(this).parents("tr").remove();
              var text=$(this).closest('tr').find('.tracking_num').text();
              arr1 = jQuery.grep(arr1, function(value) {
            	  return value != text;
            	});
          
          }
        
      });
      var i=1;
  	$('table tbody tr').each(function() {
  		
  		$(this).closest('tr').find('.seq').text(i);    
		   i++;
		   
		 }); 
  });
  $('#transfer_form').submit(function(e) {
	  var table_arr=[];
	  e.preventDefault();
	  $('table tbody tr').each(function() {
		   /*  tracking_num.push($(this).find(".tracking_num").text());    
		    total_amt.push($(this).find(".total_amt").text());
		    deli_charges.push($(this).find(".deli_charges").text());
		    product_amt.push($(this).find(".product_amt").text());
		    rcvr_name.push($(this).find(".rcvr_name").text()); 
		    rcvr_phone.push($(this).find(".rcvr_phone").text());  
		    rcvr_state.push($(this).find(".rcvr_state").text()); 
		    deli_date.push($(this).find(".deli_date").text());
		    deli_staff.push($(this).find(".deli_staff").text()); */  
		  table_arr.push($(this).find(".tracking_num").text()); 
		  
	
		 }); 
	  
	  
	  
	  if(table_arr.length!=0){
		 $.ajax({
	    		url: "item_fetch",
	    		type: 'POST',
	    		data: {
	    			ccode:ccode,
	    			agent_code:agent_code,
	    			trans_agent_code: $('#scan_agent_code').children("option:selected").val(),
	    			trans_staff_code: $('#scan_staff_code').children("option:selected").val(),
	    			trans_staff_name:$('#scan_staff_code').children("option:selected").text(),
	    			reason:$("#reason").children("option:selected").val(),
	    			user:user,
	    			staff_code:staff_code,
	    			"track_num[]":table_arr,
					type:"submit",
	    			
	    		    
	    		},
	    		success: function(data) {
	    		//$('#city_name').val(data);
	    		
	    		 alert("Success");
	    		
	    		 location.reload(true);
	    		
	    		
	    		
	    		}
		
	  
  });
	  }
	  else{
		  alert("Please Fill the Form Before You Submit");
	  } 
	  
  });
var i=0;
function beep() {
    var snd = new  Audio("data:audio/wav;base64,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qJrx4KOQjahZxWbcZgztj2c49nKmkId44S71j0c8eV9yDK6uPRzx5X18eDvjvQ6yKo9ZSS6l//8elePK/Lf//IInrOF/FvDoADYAGBMGb7FtErm5MXMlmPAJQVgWta7Zx2go+8xJ0UiCb8LHHdftWyLJE0QIAIsI+UbXu67dZMjmgDGCGl1H+vpF4NSDckSIkk7Vd+sxEhBQMRU8j/12UIRhzSaUdQ+rQU5kGeFxm+hb1oh6pWWmv3uvmReDl0UnvtapVaIzo1jZbf/pD6ElLqSX+rUmOQNpJFa/r+sa4e/pBlAABoAAAAA3CUgShLdGIxsY7AUABPRrgCABdDuQ5GC7DqPQCgbbJUAoRSUj+NIEig0YfyWUho1VBBBA//uQZB4ABZx5zfMakeAAAAmwAAAAF5F3P0w9GtAAACfAAAAAwLhMDmAYWMgVEG1U0FIGCBgXBXAtfMH10000EEEEEECUBYln03TTTdNBDZopopYvrTTdNa325mImNg3TTPV9q3pmY0xoO6bv3r00y+IDGid/9aaaZTGMuj9mpu9Mpio1dXrr5HERTZSmqU36A3CumzN/9Robv/Xx4v9ijkSRSNLQhAWumap82WRSBUqXStV/YcS+XVLnSS+WLDroqArFkMEsAS+eWmrUzrO0oEmE40RlMZ5+ODIkAyKAGUwZ3mVKmcamcJnMW26MRPgUw6j+LkhyHGVGYjSUUKNpuJUQoOIAyDvEyG8S5yfK6dhZc0Tx1KI/gviKL6qvvFs1+bWtaz58uUNnryq6kt5RzOCkPWlVqVX2a/EEBUdU1KrXLf40GoiiFXK///qpoiDXrOgqDR38JB0bw7SoL+ZB9o1RCkQjQ2CBYZKd/+VJxZRRZlqSkKiws0WFxUyCwsKiMy7hUVFhIaCrNQsKkTIsLivwKKigsj8XYlwt/WKi2N4d//uQRCSAAjURNIHpMZBGYiaQPSYyAAABLAAAAAAAACWAAAAApUF/Mg+0aohSIRobBAsMlO//Kk4soosy1JSFRYWaLC4qZBYWFRGZdwqKiwkNBVmoWFSJkWFxX4FFRQWR+LsS4W/rFRb/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////VEFHAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAU291bmRib3kuZGUAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMjAwNGh0dHA6Ly93d3cuc291bmRib3kuZGUAAAAAAAAAACU=");  
    snd.play();
}

  Quagga.offDetected();

  setInterval(function(){
	  $('canvas').addClass("d-none");  
  }, 1000);
  
 


  });

  
  
</script>
 	<form id="transfer_form">
 	
 		<div class="row">
 	<div class="col-lg-12 col-sm-12">
 	<div class="card">
 	<div class="card-body">
 	<div class="card-title"><h4><b>Receipient</b></h4></div>
 	<div class="row">
 	<div class="col-lg-6 col-sm-12">
 <div class="form-group"> 
		<label class="pure-material-textfield-outlined">
		<!-- <input type="text" id="scan_agent_code"  onkeypress="javascript:return isNumber(event)"  maxlength="4"  placeholder=" "required /> -->
			<select id="scan_agent_code" required>
		
		</select>
		<span>Agent Code</span>
		</label>
		</div> 
		 <div class="form-group"> 
		<label class="pure-material-textfield-outlined">
		<select id="scan_staff_code" required>
		
		</select>
		<span>Staff Code</span>
		</label>
		</div> 
		<script>
		 function isNumber(evt) {
		      var iKeyCode = (evt.which) ? evt.which : evt.keyCode
		      if (iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57))
		          return false;

		      return true;
		  }  
		</script>
 
     
       
 	</div>
 		<div class="col-lg-6 col-sm-12">
<div class="form-group"> 
        <label class="pure-material-textfield-outlined">
		<select id="reason" required>
		
		</select>
		<span>Reason</span>
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
 	<div class="row">
 	<div class="col-12">
 	<div class="card">	<div class="card-body">
 	<div class="card-title"><h4><b>Tracking Number</b></h4></div>
 	<div class="row">
 	<div class="col-lg-4 col-sm-12">
 	<div class="form-group">
 	<input type="button" value="Delete Row" id="delete">
 	</div>
 	</div>
 	</div>
 	<div class="table-responsive">
									<table  class="display table table-striped table-hover" cellspacing="0" width="100%">
																	<!-- <thead> -->
											<thead>

												<tr>
												<th>Select</th>
												<th>Seq</th>
												<th>Tracking Number</th>
												

												
													
													
													
												
													
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
 	
 	
 	<div class="row">
 	<div class="col-12 text-center">
 	
 	
 	<button type="submit" class="btn btn-primary" id="btn">Transfer</button>
 	
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