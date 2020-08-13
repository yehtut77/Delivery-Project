<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
 <%@ page import="java.sql.*"%>  
  <%@page import="java.text.SimpleDateFormat,java.util.Date"%>
            <%@ page import="java.time.format.DateTimeFormatter" %>
    <%@ page import="java.time.*" %>
 
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Stylesheet -->
     <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="inputstyle.css">  
     
    
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

#readbar{ background-color: #d3def0;
  border: none;
  color: black;
  padding: 16px 32px;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;}
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
</style>
  
</head>
<script type="text/javascript" src="test.js" ></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 

 	
<body>
<form action="LIVEJSP">
<%
 HttpSession ssss=request.getSession(false);  

	String companyCode=(String)ssss.getAttribute("companyCode");

	String agentCode=(String)ssss.getAttribute("agentCode");
	String staffCode=(String)ssss.getAttribute("staffCode");
	String staffName=(String)ssss.getAttribute("staffName");
	 %>
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
                        <h3>Out For Delivery</h3>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.jsp"><i class="icon_house_alt"></i> Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Out For Delivery</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
  
  
    <!-- BackHome Area End -->


        <div class="container">
        <div class="card">
		<div class="m" style="margin:10px;">
         <div class="row" style="margin-left: 30px;">
		<div class="col-12 col-lg-4">
		
			<div class="form-group"> 
	 	<div class="row">
    	<div class="col-6"><label style="font-size:15px;">DO number :</label></div>     
        <div class="col-6">
	   <span>D##-#########</span>
	    </div>
        </div></div>
			<div class="form-group"> 
	 	<div class="row">
    	<div class="col-6"><label style="font-size:15px;">Agent code :</label></div>     
        <div class="col-6">
	 <span><%= agentCode %></span>
	    </div>
        </div></div>
      
        
        
        <div class="form-group"> 
        <div class="row">
    	<div class="col-6"><label style="font-size:15px;">Staff code :</label></div>     
        <div class="col-6">
	     <span><%= staffCode %></span>
	    </div>
        </div></div>
         
         </div>
          <div class="col-12 col-lg-4"> </div>
          
        <div class="col-12 col-lg-4">
        
        <div class="form-group"> 
        <div class="row">
    	<div class="col-6"><label style="font-size:15px;">Staff name :</label></div>     
        <div class="col-6">
	     <span><%= staffName %></span>
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
   <label style="font-size:15px;">
   Date:&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
   <span style="color:blue;" class="fa fa-calendar">  <%=dt %></span>  
   &nbsp; &nbsp;  
   &nbsp; &nbsp;  
   <span style="color:blue;" class="fa fa-clock-o" style="text-align:right;"> <%=ck %></span>
   
   </label>
   
  
       </div>
		</div></div>
		
		</div>	
		</div>
		
		</div>
	  <br>
    
  
    
   

    <!-- Register Area Start -->
   
  
  
  
  <div class="container">


   <div class="row"  >
   <div class="col-12 col-lg-6">
   <div class="card">

   <table id="basic-datatables" class="table table-striped">
  <thead>
    <tr>
      <th scope="col" style="font-size:15px;">No.</th>
      <th scope="col"style="font-size:15px;" >Tracking Number</th>
     
    </tr>
  </thead>
  <tbody>
   
  </tbody>
</table></div>
   </div>
  <div class="col-12 col-lg-6">
  
  <div class="card">
		<div class="m" style="margin:10px;">
  
<div class="form-group"> 
	  
    	 <label style="font-size:15px;">Tracking Number</label></div>     
      
		
	 <button id="readbar" type="submit" >Read Bar Code &nbsp;<i class="fa fa-camera" style="font-size:24px"></i></button>
	<input type="text" id="tls" name="tlss" hidden>
		<input type="text" id="rec" name="recc" hidden >
	
    </div> 
    <br> 
    </div></div>
    
  
  </div>
  
  </div>  
    <br><br>
    
 

 
   <center><input type="button" class="btn delivery-btn1 btn-3 mt-15 active" id="calcu" value="Ready To Deliver"/></center></form>
  <br><br>
 
 


 </div>



	 

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
    
    </form> 
    <%
  String horn="";
    String p1=request.getParameter("para1");
    String p2=request.getParameter("para2");
    String p3=request.getParameter("para3");
    String p4=request.getParameter("para4");
    
	if(p3==null)p3=" ";
	if(p4==null)p4="0";
	
   
    %>
    	<script >
			$(document).ready(function() {
				var record='<%=p4%>';
			
				var totaltrack="<%=p3%>";
				 var flag=1;
			if(record==null)record=1;
					var horn="<%=p2%>";
					var p1="<%=p1%>";
					 
					 		if(horn=='have'){
			
			    var recordpost=record;
				var count=0;

				  while (recordpost / 10 >= 1) {
					  recordpost /= 10;
				    ++count;
				  }		
				 
				  var res = totaltrack.split("$");
				  for(var i=0;i<=99;i++){
					  if(p1==res[i]){flag=0;}
				  }
				
				  if(flag=='0'){
					  var resss = totaltrack.split("$");
					  var count3=0;
					  var recordp=record;
					  while (recordp / 10 >= 1) {
					  	recordp /= 10;
					    ++count3;}
					  for(var i=0;i<=count3;i++){
						  var markup ="<tr>"+"<td>"+(i+1) +"</td>"+ 
						         "<td>"+resss[i+1]+"</td>"+
						     "</tr>";
						     var mk2=markup.trim();
					
				    				 $("#basic-datatables tbody").append(mk2);}
				  }if(flag=='1'){
				  
record=record+1;
var count2=0;
var recordp=record;
while (recordp / 10 >= 1) {
	recordp /= 10;
  ++count2;
}		
						totaltrack=totaltrack+"$"+p1;

					  var ress = totaltrack.split("$");

					  for(var i=0;i<=count2;i++){
						  var markup ="<tr>"+"<td>"+(i+1) +"</td>"+ 
						         "<td>"+ress[i+1]+"</td>"+
						     "</tr>";
						     var mk2=markup.trim();
					
				    				 $("#basic-datatables tbody").append(mk2);
				    }
		
				  }
		    		           var ff=document.getElementById("tls");
ff.value=totaltrack;
var ff2=document.getElementById("rec");
ff2.value=record;	
			    		
					}else{
					if(horn=='nothave'){ var res = totaltrack.split("$");
					var count=0;
					var recordpost=record;
					  while (record / 10 >= 1) {
						  record /= 10;
					    ++count;
					  }		
					  for(var i=0;i<=count;i++){
					  var markup ="<tr>"+"<td>"+(i+1) +"</td>"+ 
					         "<td>"+res[i+1]+"</td>"+
					     "</tr>";
					     var mk2=markup.trim();
				
			    				 $("#basic-datatables tbody").append(mk2);}
				       var ff=document.getElementById("tls");
				       ff.value=totaltrack;
				       var ff2=document.getElementById("rec");
				       ff2.value=recordpost;}
					
					}
				
				$("#calcu").click(function(e) {
				    var name='<%=staffName%>';
				    if(totaltrack==null){}
				    else{
				    $.ajax({
			    		url: "outfordeliveryCalculation.jsp",
			    		type: 'POST',
			    		data: {
			    			condition:'ok',
			    			name:name,
			    			tt: totaltrack},
			    		success: function(data) {
			    			 
			    			window.location = 'outfordeliverypdfgenerator.jsp';
			    			 
			    		}
			    		});
				      
				    }});
				  
			});
    </script>
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
		    	<!-- jQuery Scrollbar -->
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
			 
			 <script >
		$(document).ready(function() {
			$('#basic-datatables').DataTable({
				 dom: 'Bfrtip'
			});
	
		});
	</script>
</body>



</html>