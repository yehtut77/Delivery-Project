<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
 <%@ page import="java.sql.*"%>  
  <%@page import="java.text.SimpleDateFormat,java.util.Date"%>
            <%@ page import="java.time.format.DateTimeFormatter" %>
    <%@ page import="java.time.*" %>
 <%//Connection con=DriverManager.getConnection("jdbc:mysql://localhost/delivery1","root","root");
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
<html lang="en">

<head>
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
	    window.location.reload();
	  }
	});

</script>
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
    	 	 <link rel="stylesheet" href="assets/css/atlantis.min.css">
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
	    window.location.reload();
	  }
	});

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

.inbox {
  background-color: transparent;
  color: white;
  text-decoration: none;
  padding: 15px 26px;
  position: relative;
  display: inline-block;
  border-radius: 2px;
}
 
.inbox .badge {
  position: absolute;
  top: -10px;
  right: -10px;
  padding: 4px 7px;
  border-radius: 50%;
  background-color: red;
  color: white;
    transition: 0.4s;
}
  .inbox:hover .badge {
  padding-left: -15px;
  padding-right: 5px;
  border-color: green;
}

  </style>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>


<!-- <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB7J1zsErb9_7jxNu5KU5kIENFObAQEbl0&sensor=false">
</script> -->

 <!-- <script type="text/javascript">
 
 function Search(){
	var e = document.getElementById("select");
	var location = e.options[e.selectedIndex].text;

	
	var latlng= e.options[e.selectedIndex].value;
	
	var nameArr = latlng.split(',');
	
	
 
	 var mapOptions = 
     {
       center: new google.maps.LatLng(nameArr[0],nameArr[1]),
       zoom: 14,
       mapTypeId: google.maps.MapTypeId.ROADMAP
     };
     
      var map = new google.maps.Map(document.getElementById("map-canvas"),
         mapOptions);
     
    
     	     var marker1 = new google.maps.Marker({
              position: new google.maps.LatLng(nameArr[0],nameArr[1]),
              map: map
            });

      

      }

  

    </script> -->

<!-- 
<script type="text/javascript">
function revealServer() {
    var network = document.getElementById('network');
    var serverBox = document.getElementById('serverBox');
    if(network.checked == true) {
        serverBox.style.display = "block";
        document.getElementById('server').checked = false;
       
    } else {
        serverBox.style.display = "none";
       
    }
}
  
</script>


<script>
function myFunction() {
    var input, filter, ul, li, a, i, txtValue;
    input = document.getElementById("myInput");
    filter = input.value.toUpperCase();
    ul = document.getElementById("myUL");
    li = ul.getElementsByTagName("li");
    for (i = 0; i < li.length; i++) {
        a = li[i].getElementsByTagName("a")[0];
        txtValue = a.textContent || a.innerText;
        if (txtValue.toUpperCase().indexOf(filter) > -1) {
            li[i].style.display = "";
        } else {
            li[i].style.display = "none";
        }
    }
}
</script> -->




 	
<body>
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

<!-- multistep form -->
<div class="bod" style="background-color: #f2f2f2;"><br><br> 
<form action="way_bill_pdf" enctype ="multipart/form-data" method="post" id="waybill_form">

	<div class="container">
	
	
		<!-- upper form  start-->
		
		
		<div class="row">
		<div class="col-12 col-lg-4">
		<div class="card">
		<div class="m" style="margin:10px;">
		
		
		<div class="row">
		<div class="col-12">
		
		<div class="form-group"> 
	 	<div class="row">
    	<div class="col-6"><label>User Name :</label></div>     
        <div class="col-6">
	   <span><%=staff_name %></span>
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
	    </div>
        </div></div>
	
		</div>	
		</div>
		
		</div></div><br><br></div>
		
		
		<div class="col-12 col-lg-4"></div>
		
		<div class="col-12 col-lg-4">
		<div class="card">
		<div class="m" style="margin:10px;">
		
		<div class="form-group"> 
        <label class="pure-material-textfield-outlined">
		<input type="text" name="status" value="##-####-########"  name="tracking" readonly="readonly" />
		<span>Tracking Number</span>
		</label>
        </div> 
        
        
       <div class="form-group"> 
        <label class="pure-material-textfield-outlined">
		<input type="text" name="status" value="Planning"  name="tracking" readonly="readonly" />
		<span>Status</span>
		</label>
        </div> 
													
					
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
		
		</div></div>
		
	
	
</div>
             	<!-- upper form end-->	
    
    
    
    <!-- BackHome Area Start -->
 
 
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumb-content">
                        <h3> Waybill Creation</h3>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.jsp"><i class="icon_house_alt"></i> Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Register</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
  
  
    <!-- BackHome Area End -->
    
   

    <!-- Register Area Start -->
    <section class="delivery-register section-padding-0-80 clearfix">
  
  
  
  <div class="container">

	<div class="row">
	
	<div class="col-12 col-lg-6" >
	<div class="card">

  <div class="m" style="margin:10px;">
 <h4>Sender Information</h4><br>
 
 <script>

	$(document).ready(function(){
		var mainagent='<%=mainagent%>';
      var monthlyincome='<%=monthlyincome%>';
      
      if(monthlyincome=='yes'){
            $('#mirc').show();
      }else{
                     $('#mirc').hide();
      }
if(mainagent=="yes"){

    $('#pcca').show();
      $('#crdr').show();
}
else{
$('#pcca').hide();
      $('#crdr').hide();
}

		var maxLength = 35;
		$('.limit').keyup(function() {
		  var textlen = maxLength - $(this).val().length;
		  if( $(this).val().length>=35){
			  alert("Each Address box can contain 35 characters");
		  }
		});
		
		
		
		$("#waybill_form").submit(function(e){
			e.preventDefault();
			
			 $('#select3').prop("disabled", false);
			 $('#select4').prop("disabled", false);
			 $('#select33').prop("disabled", false);
			 $('#select44').prop("disabled", false);
			 
			 $('#select2').prop("disabled", false);
			 $('#select22').prop("disabled", false);
			
			 
			 $('#waybill_form').unbind("submit");
         	$('#waybill_form').submit() ;  
		});
		
		$("#s_curr option").filter('[value=' + '05' + ']').prop("selected", true);
		$("#r_curr option").filter('[value=' + '05' + ']').prop("selected", true);
		
		
		var s1_id="hello";
		var s2_id;
		var s3_id;
		var s4_id;
		var post_code;
		var f_state;
		var t_state;
		var f_township;
		var t_township;
		
		$('#s_postcode').on('input', function() {
			 $('#select2').prop("disabled", true);
			 $('#select3').prop("disabled", true);
			 $('#select4').prop("disabled", true);
			 $("#select1").val("---Select---").prop("selected", true);
			 $("#select2").val("---Select---").prop("selected", true);
			 $("#select3").val("---Select---").prop("selected", true);
			 $("#select4").val("---Select---").prop("selected", true);
			 
			var input1=document.getElementById("s_postcode").value;
			 
			var f=input1.substring(0,2);
			var f1=input1.substring(0,4);
			var f2=input1.substring(0,6);
			var f3=input1.substring(0,8);
			
			
			f_state=$("#select1 option").filter('[about=' + f + ']').prop("selected", true).attr("value");
			f_township=$("#select2 option").filter('[id=' + f1 + ']').prop("selected", true).attr("value");
			$("#select3 option").filter('[about=' + f2 + ']').prop("selected", true);
			$("#select4 option").filter('[about=' + f3 + ']').prop("selected", true);
			
			
		});


		$("#select1").change(function() {
			
			$('#select2').removeAttr("disabled");
			f_state=$(this).children(":selected").attr("value");
			s1_id=$(this).children(":selected").attr("about");
			
			if($('#select3').data('options')===undefined){}
			else {
				 $('#select3').prop("disabled", true);
				 $('#select4').prop("disabled", true);
				// $('#select3').attr("value","");
				 $('#select3').html("");
				 $('#select4').html("");
			}
			
			  if ($(this).data('options') === undefined) {
			    /*Taking an array of all options-2 and kind of embedding it on the select1*/
			    $(this).data('options', $('#select2 option').clone());
			  }	 
		  		var options = $(this).data('options').filter('[about=' + s1_id + ']');  
		  		$('#select2').html(options);
		 		$("#select2").val($("#select2 option:first").prop("selected",true));
		 		post_code=s1_id;
			/* var input=document.getElementById("s_postcode");
			//alert(post_code);
			input.value=post_code; */
			$("#s_postcode").val(post_code+"000000");
		  
		  
		  $('#select2').change(function() {	
			  $('#select3').removeAttr("disabled");
			  f_township=$(this).children(":selected").attr("value");
			  if ($(this).data('options') === undefined) {
			    /*Taking an array of all options-2 and kind of embedding it on the select1*/
			    $(this).data('options', $('#select3 option').clone());
			  }
			  
			  s2_id=$(this).children(":selected").attr("id");		  
			  var option = $(this).data('options').filter('[id=' + s2_id + ']');
			  $('#select3').html(option);
			  $("#select3").val($("#select3 option:first").prop("selected",true));
			  post_code=s2_id;
				
				//alert(post_code);
				$("#s_postcode").val(post_code+"0000");
			  
			  $('#select3').change(function() {
				  $('#select4').removeAttr("disabled");
				  if ($(this).data('options') === undefined) {
					    /*Taking an array of all options-2 and kind of embedding it on the select1*/
					    $(this).data('options', $('#select4 option').clone());
					  }
					
					s3_id=$(this).children(":selected").attr("about");
					var option = $(this).data('options').filter('[id=' + s3_id + ']');
					$('#select4').html(option);
					$("#select4").val($("#select4 option:first").prop("selected",true));
				
					post_code=s3_id;
					var input=document.getElementById("s_postcode");
					//alert(post_code);
					$("#s_postcode").val(post_code+"00");
					
					
					$("#select4").change(function() {				
						
									
					  var id3= $(this).children(":selected").attr("about");	 
					  post_code=id3;
					  var input1=document.getElementById("s_postcode");
						//alert(post_code);
						input1.value=post_code;
				  
			  });

					 
					 
			  
			  });//end of #select3
			  
			 
		  
		  });
		  
		  
		});
		
		   
	});


</script>
<input type="hidden" value="<%=staff_name%>" name="staff_name">
<input type="hidden" value="<%=agent_code%>" name="agent_code">
<input type="hidden" value="<%=ccode%>" name="company_code">
<input type="hidden" value="<%=staff_code%>" name="staff_code">
 <div class="row">
 <div class="col-12 col-lg-6">
 
         <div class="form-group"> 
       
        <label class="pure-material-textfield-outlined">
		<input type="text" name="sender_code" id="s_code" placeholder=" " readonly required />
		<span>Sender Code</span>
		</label>
		  </div>
		 <div class="form-group"> 
         
       <label class="pure-material-textfield-outlined">
		<input type="text"  type="text" id="s_phone" onkeypress="javascript:return noLetter(event)" oninvalid="this.setCustomValidity('Please Enter Sender Phone')"
        oninput="setCustomValidity('')"  name="sender_phone" placeholder=" "required />
		<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Sender Phone</span>
		</label>
		
       </div> 
 		
		  <div class="form-group"> 
       
        <label class="pure-material-textfield-outlined">
		<input type="text" name="sender_name" onkeypress="javascript:return isLetter(event)" id="s_name" required  oninvalid="this.setCustomValidity('Please Enter Sender Name')"
        oninput="setCustomValidity('')" placeholder=" " required />
		<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Sender Name</span>
		</label>
		 </div>
      
      <div class="form-group"> 
       
      <label class="pure-material-textfield-outlined">
		<input type="text" name="sender_address1" placeholder=" "  class="limit" maxlength="35" required id="s_addr1" oninvalid="this.setCustomValidity('Please Enter Sender Address')"
        oninput="setCustomValidity('')"/>
		<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Sender Address 1</span>
		</label>
       </div>
      
       
         <div class="form-group"> 
         
         <label class="pure-material-textfield-outlined">
		<input type="text" class="limit" name="sender_address2" maxlength="35" id="s_addr2" placeholder=" "/>
		<span>Sender Address 2(optional)</span>
		</label>
         </div>   
      
         <div class="form-group"> 
        
         <label class="pure-material-textfield-outlined">
		<input type="text" class="limit" name="sender_address3" maxlength="35" id="s_addr3" placeholder=" "  />
		<span>Sender Address 3(optional)</span>
		</label>
          </div>
         
         <div class="form-group"> 
          
         <label class="pure-material-textfield-outlined">
		<input type="text" class="limit" name="sender_address4" maxlength="35" id="s_addr4" placeholder=" "  />
		<span>Sender Address 4(optional)</span>
		</label>
         </div> 
         
        
     
 
         
       </div>
 
 
 <div class="col-12 col-lg-6">   
          <div class="form-group"> 
            
	 <label class="pure-material-textfield-outlined">
	 <select class="custom-select custom-select-md"  name="sender_currency" id="s_curr" required >
	 <option value="" selected>---Select---</option>
	 
	 <%Statement s=con.createStatement();
	 ResultSet r=s.executeQuery("Select* from curr_desc");
	 while(r.next()){
	
	%>
	  
	  <option value="<%=r.getString("curr_code")%>"><%=r.getString("description")%></option>
	  <%} %>	
	 </select>
       <span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Currency</span>
		</label>
        </div> 
      
      <div class="form-group"> 
	 <label class="pure-material-textfield-outlined">
	 <select class="custom-select custom-select-md"  name="sender_country" id="s_country" required>
	  <option value=""  selected> ---Select --</option>
	  <% PreparedStatement c_pre=con.prepareStatement("Select description,country_code from country");
	  ResultSet c_result=c_pre.executeQuery();
	  while(c_result.next()){
	  %>
	  <option value="<%=c_result.getString("country_code")%>"><%=c_result.getString("description")%></option>
	  <% } %>
	 </select>
       <span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Sender Country</span>
		</label>
        </div> 
   
       <div class="form-group"> 
       <label class="pure-material-textfield-outlined">
     	<select  class="custom-select custom-select-md"  name="select1" id="select1" required >
           			<option value="0" selected> ---Select --</option>
	       <%
						PreparedStatement pre =con.prepareStatement("Select* from state");
						ResultSet r1=pre.executeQuery();
						while(r1.next()){
						
						
						%>
						<option value="<%=r1.getString("state_name") %>" about="<%=r1.getString("state_code")%>" ><%=r1.getString("state_name") %></option>
						<%} %>
  				</select>
      <span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Sender State/Division</span>
     </label>
     </div> 
     
     
 	<div class="form-group"> 
	 <label class="pure-material-textfield-outlined">
	<select class="custom-select custom-select-md"  name="select2" id="select2" required disabled >
   
   				<option value="0" selected> ---Select --</option>
  
 <% 
					PreparedStatement ps;
					ps=con.prepareStatement("select * from  township "); 		
					ResultSet rs=ps.executeQuery();  
		
		
					while(rs.next()){  
			
					String id=rs.getString("state_code")+rs.getString("township_code");
			
		%>
				<option value="<%=rs.getString("township_name") %>" id="<%=id%>" about="<%=rs.getString("state_code")%>" state="<%=id%>" ><%=rs.getString("township_name") %></option>
	
		<%}%>
                                             
 		</select>		
	 <span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Sender Township</span>
	</label>
 	</div> 
   
    
 	<div class="form-group"> 
 	 <label class="pure-material-textfield-outlined">
	<select class="custom-select custom-select-md"   name="select3" id="select3" disabled>
	 				<option  selected> ---Select --</option>
	 
	 <%
						PreparedStatement ps1=con.prepareStatement("select * from  ward "); 		
						ResultSet rs1=ps1.executeQuery();  
				
		
						while(rs1.next()){  
					
						String id1="";
						String id2;
						id1=rs1.getString("state_code")+rs1.getString("township_code");
						id2=rs1.getString("state_code")+rs1.getString("township_code")+rs1.getString("ward_code");
			
			
		%>
				<option value="<%=rs1.getString("ward_name") %>" id="<%=id1%>" about="<%=id2%>" ward="<%=id2%>" ><%=rs1.getString("ward_name") %></option>
		
		<%}%>
	 
	 		</select>
  <span>Sender Ward</span>
	</label>
	</div> 


 	<div class="form-group"> 
 	 <label class="pure-material-textfield-outlined">
 	<select class="custom-select custom-select-md"  name="select4" id="select4" disabled>
					<option  value="0" selected>---Select---</option>
 
  <%			
		  			PreparedStatement ps2=con.prepareStatement("select * from  street "); 		
					ResultSet rs2=ps2.executeQuery();  
		
		
					while(rs2.next()){  
			
						String id1=rs2.getString("state_code")+rs2.getString("township_code")+rs2.getString("ward_code")+rs2.getString("street_code");
						
						String id2=rs2.getString("state_code")+rs2.getString("township_code")+rs2.getString("ward_code");
			
		%>
						<option value="<%=rs2.getString("street_name") %>" id="<%=id2%>" about="<%=id1%>" street="<%=id1%>"><%=rs2.getString("street_name") %></option>
		
		<%}%>
	 		 </select>
	 <span>Sender Street(Optional)</span>
	</label>
	</div> 

		<div class="form-group"> 
		<label class="pure-material-textfield-outlined">
		<input type="text" id="s_postcode"  onkeypress="javascript:return isNumber(event)" name="sender_postal"    placeholder=" "required />
		<span>Sender Postal </span>
		</label>
		</div> 
 
  
</div>
</div>

  
</div>
   
 </div>
 </div>
   <!--  End Sender information column -->
 
    <script>
$(document).ready(function(){
		
		var s1_id="hello";
		var s2_id;
		var s3_id;
		var s4_id;
		var post_code;
		var f_state;
		var t_state;
		var f_township;
		var t_township;
		
		$('#r_postcode').on('input', function() {
			 $('#select22').prop("disabled", true);
			 $('#select33').prop("disabled", true);
			 $('#select44').prop("disabled", true);
			 $("#select11").val("---Select---").prop("selected", true);
			 $("#select22").val("---Select---").prop("selected", true);
			 $("#select33").val("---Select---").prop("selected", true);
			 $("#select44").val("---Select---").prop("selected", true);
			 
			var input1=document.getElementById("r_postcode").value;
			 
			var f=input1.substring(0,2);
			var f1=input1.substring(0,4);
			var f2=input1.substring(0,6);
			var f3=input1.substring(0,8);
			
			
			f_state=$("#select11 option").filter('[about=' + f + ']').prop("selected", true).attr("value");
			f_township=$("#select22 option").filter('[id=' + f1 + ']').prop("selected", true).attr("value");
			$("#select33 option").filter('[about=' + f2 + ']').prop("selected", true);
			$("#select44 option").filter('[about=' + f3 + ']').prop("selected", true);
			
			
		});


		$("#select11").change(function() {
			
			$('#select22').removeAttr("disabled");
			f_state=$(this).children(":selected").attr("value");
			s1_id=$(this).children(":selected").attr("about");
			
			if($('#select33').data('options')===undefined){}
			else {
				 $('#select33').prop("disabled", true);
				 $('#select44').prop("disabled", true);
				// $('#select3').attr("value","");
				 $('#select33').html("");
				 $('#select44').html("");
			}
			
			  if ($(this).data('options') === undefined) {
			    /*Taking an array of all options-2 and kind of embedding it on the select1*/
			    $(this).data('options', $('#select22 option').clone());
			  }	 
		  		var options = $(this).data('options').filter('[about=' + s1_id + ']');  
		  		$('#select22').html(options);
		 		$("#select22").val($("#select22 option:first").prop("selected",true));
		 		post_code=s1_id;
			/* var input=document.getElementById("s_postcode");
			//alert(post_code);
			input.value=post_code; */
			$("#r_postcode").val(post_code+"000000");
		  
		  
		  $('#select22').change(function() {	
			  $('#select33').removeAttr("disabled");
			  f_township=$(this).children(":selected").attr("value");
			  if ($(this).data('options') === undefined) {
			    /*Taking an array of all options-2 and kind of embedding it on the select1*/
			    $(this).data('options', $('#select33 option').clone());
			  }
			  
			  s2_id=$(this).children(":selected").attr("id");		  
			  var option = $(this).data('options').filter('[id=' + s2_id + ']');
			  $('#select33').html(option);
			  $("#select33").val($("#select33 option:first").prop("selected",true));
			  post_code=s2_id;
				
				//alert(post_code);
				$("#r_postcode").val(post_code+"0000");
			  
			  $('#select33').change(function() {
				  $('#select44').removeAttr("disabled");
				  if ($(this).data('options') === undefined) {
					    /*Taking an array of all options-2 and kind of embedding it on the select1*/
					    $(this).data('options', $('#select44 option').clone());
					  }
					
					s3_id=$(this).children(":selected").attr("about");
					var option = $(this).data('options').filter('[id=' + s3_id + ']');
					$('#select44').html(option);
					$("#select44").val($("#select44 option:first").prop("selected",true));
				
					post_code=s3_id;
					var input=document.getElementById("r_postcode");
					//alert(post_code);
					$("#r_postcode").val(post_code+"00");
					
					
					$("#select44").change(function() {				
						
									
					  var id3= $(this).children(":selected").attr("about");	 
					  post_code=id3;
					  var input1=document.getElementById("r_postcode");
						//alert(post_code);
						input1.value=post_code;
				  
			  });

					 
					 
			  
			  });//end of #select3
			  
			 
		  
		  });
		  
		  
		});
		const today = new Date();
		const tomorrow = new Date(today);
		tomorrow.setDate(tomorrow.getDate() + 1);
		
		function formatDate(date) {
		    var d = new Date(date),
		        month = '' + (d.getMonth() + 1),
		        day = '' + d.getDate(),
		        year = d.getFullYear();

		    if (month.length < 2) month = '0' + month;
		    if (day.length < 2) day = '0' + day;

		    return [year, month, day].join('-');
		}
		$('#planneddate').val(formatDate(tomorrow));
		
		$('#r_phone').focusout(function() {
			 var check1=$("#r_curr").children("option:selected").val();
			 
			var r_phone=$("#r_phone").val();
			if(r_phone!="" || r_phone!=null ||r_phone!=" "){
				$.ajax({
		    		url: "rc",
		    		type: 'POST',
		    		
		    		data: {
		    			r_phone:r_phone,
		    			
		    			curr:check1,
		    			type:"r_phone",
		    			
		    		    
		    		},
		    		success: function(data) {
		    		//$('#city_name').val(data);
		    		
		    		
		    		if(data.trim()=="not"){
		    			$('#rcvr_code').val("");
		    			$('#r_name').prop("readonly", false);
			    		$('#r_addr1').prop("readonly", false);
			    		$('#r_addr2').prop("readonly", false);
			    		$('#r_addr3').prop("readonly", false);
			    		$('#r_addr4').prop("readonly", false);
			    		$('#r_addr4').prop("readonly", false);
			    		$('#r_postcode').prop("readonly", false);
			    		$('#r_country').prop("disabled", false);
		    			$('#r_name').val("");
			    		$('#r_addr1').val("");
			    		$('#r_addr2').val("");
			    		$('#r_addr3').val("");
			    		$('#r_addr4').val("");
			    		$('#r_postcode').val("");
			    		
			    	
			    		 $("#select11").val("---Select---").prop("selected", true);
						 $("#select22").val("---Select---").prop("selected", true);
						 $("#select33").val("---Select---").prop("selected", true);
						 $("#select44").val("---Select---").prop("selected", true);
		    		}
		    		else{
		    	
		    		
		    		var arr=data.trim().split("$");
		    	
		    		
		    		
		    		$('#rcvr_code').val(arr[7]);
		    		
		    		
		    		$('#r_name').val(arr[0]);
		    		$('#r_addr1').val(arr[1]);
		    		$('#r_addr2').val(arr[2]);
		    		$('#r_addr3').val(arr[3]);
		    		$('#r_addr4').val(arr[4]);
		    		$('#r_postcode').val(arr[5]);
		    		$("#r_country option").filter('[value=' +arr[6]+ ']').prop("selected", true);
		    		
		    		var s=arr[5];
		    		var f=s.substring(0,2);
					var f1=s.substring(0,4);
					var f2=s.substring(0,6);
					var f3=s.substring(0,8);
					
					$("#select11 option").filter('[about=' + f + ']').prop("selected", true);
					$("#select22 option").filter('[id=' + f1 + ']').prop("selected", true);
					$("#select33 option").filter('[about=' + f2 + ']').prop("selected", true);
					$("#select44 option").filter('[about=' + f3 + ']').prop("selected", true);
		    		}
		    		
		    		
		    		
		    		
		    		}
		}); 
				
			}
		});
			$("#s_country option").filter('[value=01]').prop("selected", true);
			$("#r_country option").filter('[value=01]').prop("selected", true);
		
		$("#rcvr_type option").filter('[value=02]').prop("selected", true);
		
		$('#s_phone').focusout(function() {
			 var check1=$("#s_curr").children("option:selected").val();
			 
			var s_phone=$("#s_phone").val();
			if(s_phone!="" || s_phone!=null || s_phone!=" "){
		
				$.ajax({
		    		url: "rc",
		    		type: 'POST',
		    		
		    		data: {
		    			s_phone:s_phone,
		    			
		    			curr:check1,
		    			type:"phone",
		    			ccode:$('#ccode').val(),
		    			
		    			
		    		    
		    		},
		    		success: function(data) {
		    		//$('#city_name').val(data);
		    	
		    		
		    		if(data.trim()=="not"){
		    			$('#s_code').val("N0-######");
		    			$('#s_name').prop("readonly", false);
			    		$('#s_addr1').prop("readonly", false);
			    		$('#s_addr2').prop("readonly", false);
			    		$('#s_addr3').prop("readonly", false);
			    		$('#s_addr4').prop("readonly", false);
			    		$('#s_addr4').prop("readonly", false);
			    		$('#s_postcode').prop("readonly", false);
			    		$('#s_country').prop("disabled", false);
		    			$('#s_name').val("");
			    		$('#s_addr1').val("");
			    		$('#s_addr2').val("");
			    		$('#s_addr3').val("");
			    		$('#s_addr4').val("");
			    		$('#s_postcode').val("");
			    		
			    
			    		 $("#select1").val("---Select---").prop("selected", true);
						 $("#select2").val("---Select---").prop("selected", true);
						 $("#select3").val("---Select---").prop("selected", true);
						 $("#select4").val("---Select---").prop("selected", true);
		    		}
		    		else{
		    	
		    		
		    		var arr=data.trim().split("$");
		    		var a=arr[7].substr(1,1)
		    		
		    		if(a=="C"){
		    		$('#s_name').prop("readonly", true);
		    		$('#s_addr1').prop("readonly", true);
		    		$('#s_addr2').prop("readonly", true);
		    		$('#s_addr3').prop("readonly", true);
		    		$('#s_addr4').prop("readonly", true);
		    		$('#s_addr4').prop("readonly", true);
		    		$('#s_postcode').prop("readonly", true);
		    		$('#s_country').prop("disabled", true);
		    		
		    		}
		    		if(a=="N"){
			    		$('#s_name').prop("readonly", false);
			    		$('#s_addr1').prop("readonly", false);
			    		$('#s_addr2').prop("readonly", false);
			    		$('#s_addr3').prop("readonly", false);
			    		$('#s_addr4').prop("readonly", false);
			    		$('#s_addr4').prop("readonly", false);
			    		$('#s_postcode').prop("readonly", false);
			    		$('#s_country').prop("disabled", false);
			    		
			    		}
		    		
		    		
		    		
		    		$('#s_name').val(arr[0]);
		    		$('#s_addr1').val(arr[1]);
		    		$('#s_addr2').val(arr[2]);
		    		$('#s_addr3').val(arr[3]);
		    		$('#s_addr4').val(arr[4]);
		    		$('#s_postcode').val(arr[5]);
		    		$("#s_country option").filter('[value=' +arr[6]+ ']').prop("selected", true);
		    		$('#s_code').val(arr[7]);
		    		var s=arr[5];
		    		var f=s.substring(0,2);
					var f1=s.substring(0,4);
					var f2=s.substring(0,6);
					var f3=s.substring(0,8);
					$("#select1 option").filter('[about=' + f + ']').prop("selected", true);
					$("#select2 option").filter('[id=' + f1 + ']').prop("selected", true);
					$("#select3 option").filter('[about=' + f2 + ']').prop("selected", true);
					$("#select4 option").filter('[about=' + f3 + ']').prop("selected", true);
		    		}
		    		
		    		
		    		
		    		
		    		}
		}); 
				
			}
		});
		var total;
			 $('#weight').focusout(function() {
			
			 var check1=$("#s_curr").children("option:selected").val();
		 	var check2=$("#r_curr").children("option:selected").val();
		 	var s_postcode=$("#s_postcode").val();
		 	var r_postcode=$("#r_postcode").val();
		 	var size=$("#size").val();
		 	var weight=$("#weight").val();
		 	
		 if(size==null){
		     $("#weight").focus();
		 }
		 	if(check1!="" && check2!="" && s_postcode!="" && r_postcode!="" && size!="" && weight!=""){
		 		
		 		$.ajax({
		    		url: "rc",
		    		type: 'POST',
		    		data: {
		    			s_postcode:s_postcode,
		    			r_postcode:r_postcode,
		    			s_curr:check1,
		    			r_curr:check2,
		    			weight:$('#weight').val(),
		    			size:$('#size').val(),
		    			type:"charges",
		    			ccode:$('#ccode').val(),
		    			
		    		    
		    		},
		    		success: function(data) {
		    		//$('#city_name').val(data);
		    		var arr=data.trim().split("-");
		    		if(arr.length==2){
		    		$('#charges_error').text("");
		    			$('#trans_charges').val(arr[0]);
		    			$('#deli_charges').val(arr[1]);
		    			$('#exch').val("0");
		    			total=parseInt(arr[0])+parseInt(arr[1]);
		    			
		    			$('#total').val(total);
		    	
		    			
		    			
		    		}
		    		else if(arr.length==3){
		    		$('#charges_error').text("");
		    		    $('#trans_charges').val(arr[2]);
		    			$('#deli_charges').val(arr[1]);
		    			$('#exch').val(arr[0]);
		    			total=parseInt(arr[0])+parseInt(arr[1])+parseInt(arr[2]);
		    			
		    			$('#total').val(total);
		    		}
		    		else{
		    		    
		    			$('#charges_error').text("*Charges for this location doesn't exist.");
		    			$("#charges_error").css("color", "red");
		    		}
		    	
		    		
		    		
		    		
		    		
		    		}
		}); 
		 		
		 	} 
		 	
			 
			     
			
		 });
		
		
		 $('#size').focusout(function() {
			
			 var check1=$("#s_curr").children("option:selected").val();
		 	var check2=$("#r_curr").children("option:selected").val();
		 	var s_postcode=$("#s_postcode").val();
		 	var r_postcode=$("#r_postcode").val();
		 		var size=$("#size").val();
		 	var weight=$("#weight").val();
		 	 if(weight==null){
		     $("#weight").focus();
		 }
		 	if(check1!="" && check2!="" && s_postcode!="" && r_postcode!="" && size!="" && weight!=""){
		 		
		 		$.ajax({
		    		url: "rc",
		    		type: 'POST',
		    		data: {
		    			s_postcode:s_postcode,
		    			r_postcode:r_postcode,
		    			s_curr:check1,
		    			r_curr:check2,
		    			weight:$('#weight').val(),
		    			size:$('#size').val(),
		    			type:"charges",
		    			ccode:$('#ccode').val(),
		    			
		    		    
		    		},
		    		success: function(data) {
		    		//$('#city_name').val(data);
		    		var arr=data.trim().split("-");
		    		if(arr.length==2){
		    		$('#charges_error').text("");
		    			$('#trans_charges').val(arr[0]);
		    			$('#deli_charges').val(arr[1]);
		    			$('#exch').val("0");
		    			total=parseInt(arr[0])+parseInt(arr[1]);
		    			
		    			$('#total').val(total);
		    	
		    			
		    			
		    		}
		    		else if(arr.length==3){
		    		$('#charges_error').text("");
		    		    $('#trans_charges').val(arr[2]);
		    			$('#deli_charges').val(arr[1]);
		    			$('#exch').val(arr[0]);
		    			total=parseInt(arr[0])+parseInt(arr[1])+parseInt(arr[2]);
		    			
		    			$('#total').val(total);
		    		}
		    		else{
		    		    
		    			$('#charges_error').text("*Charges for this location doesn't exist.");
		    			$("#charges_error").css("color", "red");
		    		}
		    	
		    		
		    		
		    		
		    		
		    		}
		}); 
		 		
		 	} 
		 	
			 
			     
			
		 });
		 $('#product_amount').keyup(function(){
			 var num=parseInt($('#product_amount').val());
			 $('#total').val(num+total);
		 });
		 
		 $("#w_type").change(function(){
			    var type = $(this).children("option:selected").text();
			    type=type.trim().toLowerCase().replace(/\s/g,'');
			  
			   if(type=="COD" || type=="cashondelivery"){
				   $('#product_amount').prop("disabled", false);
			   }
			   else{
				   $('#product_amount').prop("disabled", true);
			   }
			});
		   
	});



</script>





<!-- Start Receiver Information column -->

<div class="col-12 col-lg-6">

  <div class="card">
  <div class="m" style="margin:10px;">

 

   <h4>Receiver Information</h4><br>

   <div class="row">
   <div class="col-12 col-lg-6">
<input type="hidden" value="" name="rcvr_code" id="rcvr_code">
 <div class="form-group"> 
         <label class="pure-material-textfield-outlined">
		<input type="text" id="r_phone" placeholder=" "  onkeypress="javascript:return noLetter(event)" oninvalid="this.setCustomValidity('Please Enter Receiver Phone')"
        oninput="setCustomValidity('')" name="receiver_phone" required />
		<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Receiver Phone</span>
		</label>
      </div> 
 
   <div class="form-group"> 
      <label class="pure-material-textfield-outlined">
		<input type="text" name="receiver_name" onkeypress="javascript:return isLetter(event)" required  oninvalid="this.setCustomValidity('Please Enter Receiver Name')"
        oninput="setCustomValidity('')" id="r_name" placeholder=" "/>
		<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Receiver Name</span>
		</label>
     </div> 
    
       
     
     <div class="form-group"> 
       <label class="pure-material-textfield-outlined">
		<input type="text" id="r_addr1" class="limit" maxlength="35" name="r_addr1"  placeholder=" " required/>
		<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Receiver Address 1</span>
		</label>
       </div> 
       

    <div class="form-group"> 
        <label class="pure-material-textfield-outlined">
		<input type="text" id="r_addr2" class="limit" maxlength="35" name="r_addr2"  placeholder=" "  />
		<span>Receiver Address 2</span>
		</label>
        </div> 
       
         <div class="form-group"> 
        <label class="pure-material-textfield-outlined">
		<input type="text" id="r_addr3" class="limit" maxlength="35" name="r_addr3"  placeholder=" " />
		<span>Receiver Address 3</span>
		</label>
        </div> 
        
         <div class="form-group"> 
        <label class="pure-material-textfield-outlined">
		<input type="text" id="r_addr4" class="limit" maxlength="35" name="r_addr4"  placeholder=" " />
		<span>Receiver Address 4</span>
		</label>
        </div> 
        
      
        
      
      </div>
  
  
    <div class="col-12 col-lg-6">
    
   
      <div class="form-group"> 
	 <label class="pure-material-textfield-outlined">
	 <select class="custom-select custom-select-md"  name="receiver_currency" id="r_curr"  required>
	 <option value="" selected>---Select---</option>
	<%Statement s1=con.createStatement();
	 ResultSet ro=s1.executeQuery("Select description,curr_code from curr_desc");
	 while(ro.next()){
	 %>
	  
	  <option value="<%=ro.getString("curr_code")%>"><%=ro.getString("description")%></option>
	  <%} %> 
	 </select>
       <span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Currency</span>
		</label>
        </div> 
      
      <div class="form-group"> 
	 <label class="pure-material-textfield-outlined">
	 <select class="custom-select custom-select-md"  name="receiver_country" id="r_country" required>
	  <option value="" selected>---Select---</option>
	  <%
	  ResultSet r_country=c_pre.executeQuery();
	  while(r_country.next()){
		  
	  
	  %>
	  <option value="<%=r_country.getString("country_code")%>"><%=r_country.getString("description")%></option>
	  <%} %>
	 </select>
       <span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Receiver Country</span>
		</label>
        </div> 
     
   
       <div class="form-group"> 
        <label class="pure-material-textfield-outlined">
       <select class="custom-select custom-select-md" name="select11" id="select11" required >       
     		 <option  selected> ---Select --</option>
	       
	    	<%
						PreparedStatement pre11 =con.prepareStatement("Select* from state");
						ResultSet r11=pre11.executeQuery();
						while(r11.next()){
						
						
						%>
						<option value="<%=r11.getString("state_name") %>" about="<%=r11.getString("state_code")%>" ><%=r11.getString("state_name") %></option>
						<%} %>
								
     </select>
        <span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Receiver State/Division</span>
		</label>
       </div> 

	 <div class="form-group"> 
	 <label class="pure-material-textfield-outlined">
	 <select class="custom-select custom-select-md"  name="select22" id="select22" required disabled>
  <option  selected> ---Select --</option>
 
 <%
 
 		ResultSet receiver_rs=ps.executeQuery();  
		
		
		while(receiver_rs.next()){  
			
			String id=receiver_rs.getString("state_code")+receiver_rs.getString("township_code");
			
		%>
			<option value="<%=receiver_rs.getString("township_name") %>" id="<%=id%>" about="<%=receiver_rs.getString("state_code")%>" ><%=receiver_rs.getString("township_name") %></option>
	
		<%}%>
 
 </select>
	  <span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Receiver Township</span>
			</label>
	 </div> 
	     
	
	<div class="form-group"> 
	 <label class="pure-material-textfield-outlined">
	 <select class="custom-select custom-select-md"  name="select33" id="select33" disabled>
  <option value="" selected> ---Select --</option>
  
   
	 <%
		 		
		ResultSet rs_receiver1=ps1.executeQuery();  
		
		
		while(rs_receiver1.next()){  
			
			String id1="";
			String id2;
			id1=rs_receiver1.getString("state_code")+rs_receiver1.getString("township_code");
			id2=rs_receiver1.getString("state_code")+rs_receiver1.getString("township_code")+rs_receiver1.getString("ward_code");
			
			
		%>
			<option value="<%=rs_receiver1.getString("ward_name") %>" id="<%=id1%>" about="<%=id2%>"><%=rs_receiver1.getString("ward_name") %></option>
		
		<%}%>
                                    
  </select>
	   <span>Receiver Ward</span>
			</label>
	  </div>
	
	      

	<div class="form-group"> 
	  <label class="pure-material-textfield-outlined">
	<select class="custom-select custom-select-md"  name="select44" id="select44" disabled>
 <option value="" selected> ---Select --</option>
 
  <%
			
  		
	ResultSet rs_receiver2=ps2.executeQuery();  
		
		
		while(rs_receiver2.next()){  
			
			
			String id1=rs_receiver2.getString("state_code")+rs_receiver2.getString("township_code")+rs_receiver2.getString("ward_code")+rs_receiver2.getString("street_code");
			String id2=rs_receiver2.getString("state_code")+rs_receiver2.getString("township_code")+rs_receiver2.getString("ward_code");
			
		%>
			<option value="<%=rs_receiver2.getString("street_name") %>" id="<%=id2%>" about="<%=id1%>"><%=rs_receiver2.getString("street_name") %></option>
		
		<%}%>
	 
                                      
 </select>
	 <span>Receiver Street(Optional)</span>
     </label>
	 </div>
 
	   <div class="form-group"> 
	   <label class="pure-material-textfield-outlined">
		<input type="text" id="r_postcode" name="receiver_postal" onkeypress="javascript:return isNumber(event)"  required />
		<span>Receiver Postal</span>
		</label>
	    </div> 
	 
	 
	
</div></div> 
</div><%-- End Receiver Information  --%>

</div> </div></div>

<%-- End Sender and Receiver Information  --%>

 


<br><br>



<div class="row">
<div class="col-12 col-lg-12">
<div class="card">
<div class="m" style="margin:10px;">

<h5>General Information:</h5><br>
  
   <div class="row">
   <div class="col-12 col-lg-6">
   
    <div class="form-group"> 
	  <label class="pure-material-textfield-outlined">
	 <select class="custom-select custom-select-md"  name="waybill_type" id="w_type" required>
	 <option value="" selected> ---Select---</option>
	 <% PreparedStatement way_pre=con.prepareStatement("Select payment_description,payment_code from paymentmode where valid_code='true' AND company_code="+ccode);
	 ResultSet way_result=way_pre.executeQuery();
	 while(way_result.next()){
	 
	 %>
	 <option value="<%=way_result.getString("payment_code")%>"><%=way_result.getString("payment_description")%></option>   
	 <%} %>       
	 </select>
	 <span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Waybill type</span>
     </label>
	 </div> 
	 
	 <div class="form-group"> 
	  <label class="pure-material-textfield-outlined">
	 <select class="custom-select custom-select-md"  name="receiving_type" id="rcvr_type" required >
	 <option  selected> ---Select Receive type --</option>
	<% 
	PreparedStatement ps13=con.prepareStatement("select rcvd_description,rcvd_code from  rcvdmode where valid_code=?");
	ps13.setString(1,"t");
	ResultSet rs13=ps13.executeQuery();  
		
		
		while(rs13.next()){  
			
		
			
		%>
	<option value="<%=rs13.getString("rcvd_code") %>"><%=rs13.getString("rcvd_description") %></option>
		
		<%}%>       
	 </select>
	 <span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Receiving type</span>
     </label>
	 </div> 
	 
	 <div class="form-group"> 
        <label class="pure-material-textfield-outlined">
		<input type="date" value=""  name="planned_deli_date" id="planneddate" placeholder=" " required/>
		<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Planned Delivery Date</span>
		<span id="planneddate_error"></span>
		</label>
        </div> 
	 
   
   </div>
  <div class="col-12 col-lg-6">
  
   <div class="form-group"> 
	  <label class="pure-material-textfield-outlined">
	  <select name="drop_point" >
	 <option value="" selected> ---Select Drop-point --</option>
	 <% 
	PreparedStatement ps14=con.prepareStatement("select agent_code,agent_name from  agent where type='d' And company_code="+ccode); 		
	ResultSet rs14=ps14.executeQuery();  
		
		
		while(rs14.next()){ %>
	<option value="<%=rs14.getString("agent_code") %>"><%=rs14.getString("agent_name") %></option>
		
		<%}%>     
	 </select>
	 <span>Drop point</span>
     </label>
	 </div> 
  
   <div class="form-group">
												<label for="comment">Item Description</label>
												<textarea class="form-control" name="item_description" id="comment" rows="5"  required>
												</textarea>
											</div>
        
        <div class="form-group"> 
        <label class="pure-material-textfield-outlined">
		<input type="file"  name="file_path"  placeholder=" " />
		<span>Picture Attachment</span>
		</label>
        </div> 
        
  </div>
  </div>  
   </div></div><br><br>
</div>
</div>


<div class="row">
<div class="col-12 col-lg-12">
<div class="card">
<div class="m" style="margin:10px;">

<h4>Size and Weight Information</h4><br>
	
	<div class="row">
	<div class="col-12 col-lg-6">
	
	<div class="form-group"> 
        <label class="pure-material-textfield-outlined">
		<input type="text"  name="weight" id="weight" onkeypress="javascript:return noLetter(event)" placeholder=" " required/>
		<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Weight</span>
		</label>
        </div> 
        
	</div>
	<div class="col-12 col-lg-6">
	
	<div class="form-group"> 
        <label class="pure-material-textfield-outlined">
		<input type="text"  name="size"  onkeypress="javascript:return noLetter(event)" placeholder=" " id="size" required/>
		<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Size</span>
		</label>
        </div> 
        
	</div>
	</div>
   
   </div></div><br><br>
</div>
</div>

<div class="row">
<div class="col-12 col-lg-12">
<div class="card">
<div class="m" style="margin:10px;">

<h5>Pricing Information:</h5><br>
  
   <div class="row">
   <div class="col-12 col-lg-6">
   
    <div class="form-group"> 
        <label class="pure-material-textfield-outlined">
		<input type="text"  name="deli_charges"  onkeypress="javascript:return noLetter(event)" placeholder="" id="deli_charges" readonly required/>
		<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Delivery Charges</span>
		</label>
        </div> 
	 
	<div class="form-group"> 
        <label class="pure-material-textfield-outlined">
		<input type="text"  name="product_amt"  onkeypress="javascript:return noLetter(event)" placeholder="" id="product_amount" disabled required/>
		<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Product Amount</span>
		</label>
		<small id="charges_error"></small>
        </div> 
	  
	 
   
   </div>
  <div class="col-12 col-lg-6">
  
<div class="form-group"> 
        <label class="pure-material-textfield-outlined">
		<input type="text"  name="transport_charges" onkeypress="javascript:return noLetter(event)" placeholder="" id="trans_charges"readonly required />
		<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Transport Charges</span>
		</label>
        </div> 
  
   <div class="form-group"> 
        <label class="pure-material-textfield-outlined">
		<input type="text"  name="exchange_rate" id="exch" placeholder=" " readonly required/>
		<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Currency</span>
		</label>
        </div> 
        
       <div class="form-group"> 
        <label class="pure-material-textfield-outlined">
		<input type="text" id="total"  name="total"  placeholder="" readonly required/>
		<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Total</span>
		</label>
        </div> 
        
  </div>
  </div>  
   </div></div><br><br>
</div>
</div>


</div><%--End Container --%>



<script>


function isLetter(evt) {
    var iKeyCode = (evt.which) ? evt.which : evt.keyCode
     if ((event.keyCode > 64 && event.keyCode < 91) || (event.keyCode > 96 && event.keyCode < 123) || event.keyCode == 8 || event.keyCode==32)
        return true; 
    
    return false;
}  

function isNumber(evt) {
    var iKeyCode = (evt.which) ? evt.which : evt.keyCode
    if (iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57))
        return false;

    return true;
}  

function noLetter(evt) {
    var iKeyCode = (evt.which) ? evt.which : evt.keyCode

    	if( 65 > iKeyCode || 90 < iKeyCode ){
    		if( 97 > iKeyCode || 122 < iKeyCode){ 
    			return true;
    			}
    		return false;
    	}
    	

    return false;
}  

$('#planneddate').change(function() {
	var check=$('#planneddate').val();
	if(check!=null){
	

	var x = document.getElementById("planneddate").value;
	var plan=new Date(x);
 //	alert("plan "+plan);
	var planneddate_error = document.getElementById("planneddate_error");
	 
			var plan_month=plan.getMonth() ;
			var  plan_year=plan.getYear() ;
			var plan_day=plan.getDate();
			
	   /*      alert("plan_year "+plan_year);
			alert("plan_month "+plan_month);
			alert("plan_day "+plan_day); 
			 */
			var today = new Date()
			var today_month=today.getMonth() ; 
        	var today_year=today.getYear() ;
        	var today_date=today.getDate();	
        	
        /* 	  alert("today_year "+today_year);
        	alert("today_month "+today_month);
        	alert("today_date "+today_date);
        	 */
         
        	
        	if( plan_year== today_year || plan_year> today_year)
	        	{
        		if( plan_month== today_month || plan_month> today_month)
	        	{
        			if( plan_day== today_date || plan_day> today_date)
    	        	{
        				planneddate_error.textContent =" " ;
    		}
        			else { 
                		
                		
                		planneddate_error.textContent = "*Please enter valid date*" ;
                		planneddate_error.style.color = "red";
                		document.getElementById("planneddate").value="dd/mm/yyyy";
			            $("#planneddate").focus();
                		
                	}
		  }
        		else { 
            		
            		
            		planneddate_error.textContent = "*Please enter valid date*" ;
            		planneddate_error.style.color = "red";
            		document.getElementById("planneddate").value="dd/mm/yyyy";
		            $("#planneddate").focus();
            		
            	}
		}
        	else { 
        		
        		
        		planneddate_error.textContent = "*Please enter valid date*" ;
        		planneddate_error.style.color = "red";
        		document.getElementById("planneddate").value="dd/mm/yyyy";
	            $("#planneddate").focus();
        		
        	}
	}
        
});	
        	
        	
	
/* 	if(flag==1){
	  
		planneddate_error.textContent = "*Please enter valid date*" ;
		planneddate_error.style.color = "red";
	//	document.getElementById("planneddate").value="dd/mm/yyyy";
	//	$("#planneddate").focus(); 
		 flag=0;	
}
	if(flag==0) {
		
		 flag=0;
		} */
	

</script>

	 
	
	<!-- Size and Weight Information End -->

<br><br>
   <center><button type="submit" class="btn btn-primary" id="sub">Complete</button></center>
</div>
</form>

<% con.close();
%> 

</div>
    </section>
    <!-- Register Area End -->

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

</body>



</html>