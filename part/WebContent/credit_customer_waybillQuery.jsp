<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.sql.*"%>  
<%@page import="java.text.SimpleDateFormat,java.util.Date"%>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

    
<%
 // Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/delivery", "root", "root");
  // Connection con=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_deliv?useTimezone=true&serverTimezone=UTC","teamrame_zaw","zawmyo");
 
 			Connection con=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");

    HttpSession ssss=request.getSession(false);  
 
    String comapny_code=(String)ssss.getAttribute("companyCode");
	String username=(String)session.getAttribute("staffName");
	String agent_code=(String)session.getAttribute("agentCode"); 
	String staff_code=(String)session.getAttribute("staffCode"); 
    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MMM-yyyy");
    LocalDateTime now = LocalDateTime.now();

    String date=dtf.format(now);
    

  
%>
		       
		       		      

    
 
<html lang="en">

<head>
<script>
var n1='<%=username%>';

if(n1=="null"){
	location.replace("customer_Login.jsp");
	
}
</script>  

    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	 
    <!-- Title -->
    <title>Myanamr Delivery</title>

  <link rel="icon" href="./img/core-img/aaa.png">

   
    
    	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	 	<link rel="stylesheet" href="assets/css/atlantis.min.css">
	 		<link rel="stylesheet" href="assets/css/noti.css">
 
	
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
    						              <li> <a href="credit_customer_waybillQuery.jsp">Credit Customer Waybill Queries</a></li>
    						              <li> <a href="credit_customer_query_main.jsp">Credit Customer  Queries</a></li>
    						              
    						            </ul>
						          </li> 
                                    
                                    <li class="active"><a href="register.jsp">WayBill</a>
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
										<a class="dropdown-item" href="kill_session">Logout</a>
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
    
     
    
	
		
   
 
<div class="bod" style="background-color: #c9cfcf;"><br><br> 


  <!-- BackHome Area Start -->
 
 
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumb-content">
                        <h3>Credit customer waybill queries</h3>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.jsp"><i class="icon_house_alt"></i> Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Credit customer waybill queries</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
  
  
    <!-- BackHome Area End -->


<form action="#" >

     <%
    DateTimeFormatter dat = DateTimeFormatter.ofPattern("dd/MM/yyyy");
     DateTimeFormatter clock = DateTimeFormatter.ofPattern("hh:mm a");
   LocalDateTime localDateTime = LocalDateTime.now();
   String dt = dat.format(localDateTime);
   String ck=clock.format(localDateTime);
   %>
  
   
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
  <div class="container">
								 
						 
							
		 
					<div class="row mt--2">
						<div class="col-md-12">
							<div class="card full-height">
								<div class="card-body">
									<div class="card-title"> Credit customer waybill queries</div>
									<br>
							<div class="table-responsive">
							
								<table><thead><tr><th>
Customer code:  &nbsp; &nbsp; &nbsp;<span ><%=staff_code %></span>
							</th>
							<th width="200px;"></th>
							 
								<th>Date:</th><th width="50px;"></th>
								<th><span style="color:blue;" class="fa fa-calendar">  <%=dt %></span></th><th width="50px;"></th>
								<th><span   class="fa fa-clock-o" style="color:blue; text-align:right;" id="ck"> </span></th>
							  </tr></thead></table>
						 
							<br><br>
									<table id="basic-datatables" class="display table table-striped table-hover" cellspacing="0" width="100%">
																 
											<thead>

												<tr>
												
													
												  <th >Tracking Number</th>
												 <th>Delivery Charges</th>
												 <th>Product Amt</th>
												 <th>Total Charges</th>
												 <th>Receiver Name</th>
												 <th>Receiver Phone</th>
												 <th>Receiver Township</th>
												 <th>Receiver State</th>
												 <th>Status</th>
										 
												

											 
											 		</tr>
											</thead>				
											
														<!-- <tbody> -->
											<tbody>
												
			 

		 
<% 
											
														
											 
		try{
			
		
					
		  
		 
		 PreparedStatement pre=con.prepareStatement("Select * from registration where company_code=? and sender_code=? and agent_code=?");
		 pre.setString(1, comapny_code);
		 pre.setString(2, staff_code); 
		 pre.setString(3, agent_code); 

		 ResultSet rs=pre.executeQuery();
	 
				 
				
	while (rs.next()) {
			    	  String stat=rs.getString("stat");
			
			
			double p_amount=Math.ceil(Double.valueOf(rs.getString("product_amt")));
		    Integer p=(int) p_amount;
		    double total_amount=Math.ceil(Double.valueOf(rs.getString("total_amt")));
		    Integer total=(int) total_amount;
		     double deli_amount=Math.ceil(Double.valueOf(rs.getString("deli_charges")));
		    Integer deli_charge=(int) deli_amount;
			
			     
			    	  if(stat.equalsIgnoreCase("V")){}
			    	  else{
			    
			%> 
					<tr>
						<td><%=rs.getString("track_num") %></td>
						<td><%=deli_charge %></td>
						<td><%= p%></td>
						<td><%=total %></td>
						<td><%=rs.getString("rcvr_name") %></td>
						<td><%=rs.getString("rcvr_phone") %></td>
						<td><%=rs.getString("rcvr_township") %></td>
						<td><%=rs.getString("rcvr_state") %></td>
						
<%
		PreparedStatement pre_stat=con.prepareStatement("Select description from stat where stat_code=?");
		 pre_stat.setString(1,stat );
		
		 ResultSet rs_stat=pre_stat.executeQuery();
		 if(rs_stat.next()){
%>				
						
						<td><%=rs_stat.getString("description") %></td>
													 
		 <%}else{%>
		                <td>No Status </td>
		  <%}%>
					</tr>
						 					<%
													
														}
			      }
			 
			
 
		      con.close();
													} catch (SQLException e) {
														e.printStackTrace();
													}
												%> 
											
											</tbody>
											
											
											
											
										<!-- 	End tbody -->
									</table>
									
</div>

</div></div></div></div> 
							
						<!-- 	Card -->
				
			</div>
  
   
    
 

 
  <!--  <center> <input type="submit" class="btn delivery-btn1 btn-3 mt-15 active" id="sub" value="Confirmed"></center>-->
  <br><br>
 
 
</form>

 </div>


 

 
 
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
    			return ture;
    			}
    		return false;
    	}
    	

    return false;
}  


        	
        	
	 
	

</script>
		
 
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