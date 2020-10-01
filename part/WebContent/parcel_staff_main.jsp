<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
            <%@ page import="java.sql.*"%>  
            <%@page import="java.text.SimpleDateFormat,java.util.Date"%>
            <%@ page import="java.time.format.DateTimeFormatter" %>
            <%@ page import="java.util.Calendar" %>
            <%@ page import="java.time.*" %>

    <!DOCTYPE html>
<html lang="en">
<head>

	<title>Delivery System</title>
	<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
	<!-- Fonts and icons -->
	<script src="assets/js/plugin/webfont/webfont.min.js"></script>
	<script>
		WebFont.load({
			google: {"families":["Lato:300,400,700,900"]},
			custom: {"families":["Flaticon", "Font Awesome 5 Solid", "Font Awesome 5 Regular", "Font Awesome 5 Brands", "simple-line-icons"], urls: ['assets/css/fonts.min.css']},
			active: function() {
				sessionStorage.fonts = true;
			}
		});
	</script>

	<!-- CSS Files -->
	    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="inputstyle.css">  
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/atlantis.min.css">
	<!-- CSS Just for demo purpose, don't include it in your project -->
	<link rel="stylesheet" href="assets/css/demo.css">
	
		    <style>
    	    
    	    table.dataTable thead .sorting:after,
table.dataTable thead .sorting:before,
table.dataTable thead .sorting_asc:after,
table.dataTable thead .sorting_asc:before,
table.dataTable thead .sorting_asc_disabled:after,
table.dataTable thead .sorting_asc_disabled:before,
table.dataTable thead .sorting_desc:after,
table.dataTable thead .sorting_desc:before,
table.dataTable thead .sorting_desc_disabled:after,
table.dataTable thead .sorting_desc_disabled:before {
  bottom: .5em;
}
    	    
    	    </style>
    	 <script>
    	 
    	// Basic example
    	 $(document).ready(function () {
    	 $('#dtBasicExample').DataTable({
    	 "searching": false // false to disable search (or any other option)
    	 });
    	 $('.dataTables_length').addClass('bs-select');
    	 });
    	 
    	 </script>
	<%
	HttpSession ssss=request.getSession(false);  
    
	String staff_name=(String)ssss.getAttribute("staffName");
	String ccode=(String)ssss.getAttribute("companyCode");
	String agent_code=(String)ssss.getAttribute("parent_agent_code");
	String staff_code=(String)ssss.getAttribute("staffCode");
	    try{  
		 
		//Connection con=DriverManager.getConnection("jdbc:mysql://localhost/delivery1","root","root");
			 Connection con=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
       %>
						  	
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

 */
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="test.js" ></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>

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
</head>
	
 

<body>
 <!-- Preloader -->
    
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
                                    
                                    <li><a href="register.jsp">WayBill</a>
                                    </li><li><a href="batch_waybill">Batch WayBill</a>
                                    </li>
                                      <li class=""><a href="credit_customer.jsp">Credit Customer</a></li>
                                    
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
    <div class="bod" style="background-color: #f2f2f2;"><br><br> 

       <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumb-content">
                        <h3>Parcel With Staff</h3>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.jsp"><i class="icon_house_alt"></i> Home</a></li>
                                
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        
       <script>
 



function searchInfo(){ 
	 var name= document.vinform.name.value
	 var code=document.vinform.code.value
	 var type=document.vinform.dbType.value
	
	
		 $.ajax({
				url: "parcel_staff_detail.jsp",
			    type: 'POST',
				data: {code:code,name:name,type:type},
				success: function(data) {

					var trck = data.trim();
					 
					  if(trck!="no"){
						  
						      var taxt=document.getElementById("mytext");
		                      taxt.innerHTML=trck;
						      var error=document.getElementById("error");
						      var error1=document.getElementById("error1");
		                      error.textContent="";
		                      error1.textContent="";
						  
					  }
					  
					  else{
						  var taxt=document.getElementById("mytext");
						  var error=document.getElementById("error");
						  var error1=document.getElementById("error1");
						   error.textContent="**Please Chose right Staff**";
						   error.style.color = "red" ;
						   
						   error1.textContent="**Please Chose right Staff**";
						   error1.style.color = "red" ;
						   taxt.innerHTML="";
					  }
						  
					 	  
				}
			
		  });
		 
		 

	    }

      
	    
	   
	  


</script> 

<script>

$(document).ready(function () {
    toggleFields(); // call this first so we start out with the correct visibility depending on the selected form values
    // this will call our toggleFields function every time the selection value of our other field changes
    $("#dbType").change(function () {
    
    	$("#name1").prop('selectedIndex', 0);
    	$("#code1").prop('selectedIndex', 0);
    	 
    	 $("#basic-datatables > tbody").empty();
    	toggleFields();
    });

});
// this toggles the visibility of other server
function toggleFields() {
	
    if ($("#dbType").val() === "name")			
    {    $("#otherServer").show();    
         $("#otherServer_code").hide();}
      
    
    
    
    
    else if ($("#dbType").val() === "code")     
    {  $("#otherServer_code").show();
       $("#otherServer").hide();  }
    
       
 
    else										
    {$("#otherServer").hide(); ;
    $("#otherServer_code").hide();}
    
        
}




</script> 


<div class="container">
        <div class="row">
       <div class="col-12 col-lg-5">
		<div class="card">
		<div class="m" style="margin:10px;">
		
		<div class="form-group"> 
	 	<div class="row">
    	<div class="col-6"><label>Staff Code:</label></div>     
        <div class="col-6">
	   <span><%=staff_code %></span>
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
<div class="card-body">		
 <div class="form-group">   
<h4>Parcel With Staff Query</h4>	

</div>	


<div class="row">

<div class="col-6 col-lg-4">

<div class="form-group">   	 
				<label class="pure-material-textfield-outlined">	
				 <select class="custom-select custom-select-md" id="dbType" name="dbType"  required >
				 <option value="select">--Select Option--</option>
	             <option value="name">Staff Name</option>
	             <option value="code">Staff Code</option>
	             </select>
				 </label>
				 <span id="#"></span> 	
</div>
</div>

<div class="col-6 col-lg-4">
<div class="form-group" id="otherServer">   	 
                
				<label class="pure-material-textfield-outlined">	
				<select  class="custom-select custom-select-md" name="name" id="name1" required onchange="searchInfo()">
           			<option value="" selected> ---Select --</option>
	        <%
						PreparedStatement pre =con.prepareStatement("Select staff_code,staff_name from staff where parent_agent_code=?");
						pre.setString(1,agent_code);
	                    ResultSet r1=pre.executeQuery();
						while(r1.next()){
							
							
%>
						<option value="<%=r1.getString("staff_code")%>"><%=r1.getString("staff_name") %><%=r1.getString("staff_code")%></option>
						<%}
						%> 
  				</select>
					<span id="#"></span>
				</label> 
				<span id="error"></span> 
 		</div>
 	

<div class="form-group" id="otherServer_code">   	 
                
				<label class="pure-material-textfield-outlined">	
				<select  class="custom-select custom-select-md"  name="code" id="code1" required onchange="searchInfo()">
           			<option value="" selected> ---Select --</option>
	        <%
						PreparedStatement pre1 =con.prepareStatement("Select staff_code,staff_name from staff where parent_agent_code=?");
						pre1.setString(1,agent_code);
	                    ResultSet r2=pre1.executeQuery();
						while(r2.next()){
							
							
						%>
						<option value="<%=r2.getString("staff_code")%>"><%=r2.getString("staff_code")%> <%=r2.getString("staff_name")%></option>
						<%} 
						%> 
  				</select>
					<span id="#"></span>
				</label>
				<span id="error1"></span> 	
		
</div> 


</div>

</div>

</div>
</div><br><br> 

</form> 

  
 <div class="card">
<div class="card-body">		
 <div class="form-group">   
<h4>Parcel with Detail</h4>	

</div>	


<div class="row">
<div class="col-12">

<div class="form-group">   	 

 		<span id="mytext"></span>					 
</div>
 		
</div>


</div>

</div>
</div> 
</div><br><br> 
 
 </div>
 
 <% pre.close();
	r1.close();
    pre1.close();
	r2.close();
con.close();  
}//try end
catch(Exception e){out.print(e);}  
 


%>

	
			
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



	
</body>
</html>