<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
            <%@ page import="java.sql.*"%>  
            <%@page import="java.text.SimpleDateFormat,java.util.Date"%>
            <%@ page import="java.time.format.DateTimeFormatter" %>
            <%@ page import="java.util.Calendar" %>
            <%@ page import="java.time.*" %>
 <% 
    HttpSession ssss=request.getSession(false); 
	String staff_name=(String)ssss.getAttribute("staffName");
	String ccode=(String)ssss.getAttribute("companyCode");
	String agent_code=(String)ssss.getAttribute("parent_agent_code");
	String staff_code=(String)ssss.getAttribute("staffCode");
	
	 %>
 
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

 */
  </style>
  
</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
                                     <li class="drop-down" ><a href="#">Operation</a>
    						            <ul class="dropdown" style="width: 280px;">
    						              <li> <a href="credit_customer_waybillQuery.jsp">Credit Customer Waybill Queries</a></li>
    						              <li> <a href="credit_customer_query_main.jsp">Credit Customer  Queries</a></li>
    						              
    						            </ul>
						          </li> 
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
    <!-- Header Area End -->
    
     
    
	
		
   
                    
<!-- multistep form -->
<div class="bod" style="background-color: #f2f2f2;"><br><br> 

       <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumb-content">
                        <h3>Credit Customer Query</h3>
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
var request=new XMLHttpRequest(); 

function searchInfo(){  
var name=document.vinform.name.value;  


var url="credit_customer_query_search.jsp?name="+name;  

  
try{  
request.onreadystatechange=function(){  
if(request.readyState==4){  
var val=request.responseText;  
document.getElementById('mylocation').innerHTML=val;  
}  
}//end of function  
request.open("GET",url,true);  
request.send();  
}catch(e){alert("Unable to connect to server");}  
}  

function searchInfo1(){  
	var phone= document.vinform.phone.value 
	
	var url="credit_customer_query_search.jsp?phone="+phone;  
	
	try{  
	request.onreadystatechange=function(){  
	if(request.readyState==4){  
	var val=request.responseText;  
	document.getElementById('mylocation').innerHTML=val;  
	}  
	}//end of function  
	request.open("GET",url,true);  
	request.send();  
	}catch(e){alert("Unable to connect to server");}  
}  
	
function searchInfo2(){  
	var code= document.vinform.code.value  

	
	var url="credit_customer_query_search.jsp?code="+code;  

	  
	try{  
	request.onreadystatechange=function(){  
	if(request.readyState==4){  
	var val=request.responseText;  
	document.getElementById('mylocation').innerHTML=val;  
	}  
	}//end of function  
	request.open("GET",url,true);  
	request.send();  
	}catch(e){alert("Unable to connect to server");}  
	} 



	
</script>  
 <div class="container">
  
<form name="vinform">  
<div class="card">
<div class="card-body">		
 <div class="form-group">   
<h4>Credit Customer Query</h4>	

</div>	

<script>

$(document).ready(function () {
    toggleFields(); // call this first so we start out with the correct visibility depending on the selected form values
    // this will call our toggleFields function every time the selection value of our other field changes
    $("#dbType").change(function () {
        toggleFields();
    });

});
// this toggles the visibility of other server
function toggleFields() {
    if ($("#dbType").val() === "name")			{    $("#otherServer").show();    $("#otherServer_phone").hide();  $("#otherServer_code").hide();}
      
    
    else if ($("#dbType").val() === "phone")      {  $("#otherServer_phone").show(); $("#otherServer").hide();  $("#otherServer_code").hide(); }
    
    
    else if ($("#dbType").val() === "code")      {  $("#otherServer_code").show(); $("#otherServer").hide();  $("#otherServer_phone").hide(); }
    
       
 
    else										{$("#otherServer").hide(); $("#otherServer_phone").hide();
    $("#otherServer_code").hide();}
    
        
}




</script>
<div class="row">

<div class="col-6 col-lg-4">

<div class="form-group">   	 
			<label class="pure-material-textfield-outlined">
					<select class="browser-default custom-select"   id="dbType" name="dbType"  >
								  <option value="select">--Select Option--</option>
	                              <option value="name">Customer Name</option>
	                              <option value="code" >Customer Code</option>
	                              <option value="phone" >Customer Phone</option>
					</select>
					<span><i style="color:red; margin-top:1px; font-size:20px;">*</i></span>
            </label>
					
 		</div>
 		
</div>

<div class="col-6 col-lg-4">

<div class="form-group" id="otherServer">   	 
                
				<label class="pure-material-textfield-outlined">	
				<input type="text" placeholder="" name="name"  id=""  onkeypress="javascript:return isLetter(event)" onkeyup="searchInfo()">
				
					<span id="span">Search for Name</span>
				</label>
				<span id="#"></span> 	
				
</div>
 		
 	 <div class="form-group" id="otherServer_phone">   	 
                
				<label class="pure-material-textfield-outlined">	
				<input type="text" placeholder="" name="phone"  id="phone" onkeypress="javascript:return isNumber(event)"  onkeyup="searchInfo1()">
				
					<span id="span">Search for Phone</span>
				</label>
				<span id="#"></span> 	
		

 		
 		
</div> 

<div class="form-group" id="otherServer_code">   	 
                
				<label class="pure-material-textfield-outlined">	
				<input type="text" placeholder="" name="code"  id="code"   onkeyup="searchInfo2()">
				
					<span id="span">Search for Code</span>
				</label>
				<span id="#"></span> 	
		

 		
 		
</div> 
</div>

</div>

</div>
</div><br><br> 
</form>  
  
 <div class="card">
<div class="card-body">		
 <div class="form-group">   
<h4>Credit Customer Detail</h4>	

</div>	


<div class="row">
<div class="col-12">

<div class="form-group">   	 
				<span id="mylocation"></span>  
 		</div>
 		
</div>


</div>

</div>
</div> 
</div><br><br> 
 
 </div>
 

 
 <script>
 
 function isNumber(evt) {
     var iKeyCode = (evt.which) ? evt.which : evt.keyCode
     if (iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57))
         return false;

     return true;
 }   
 
 
 function isLetter(evt) {
	    var iKeyCode = (evt.which) ? evt.which : evt.keyCode
	     if ((event.keyCode > 64 && event.keyCode < 91) || (event.keyCode > 96 && event.keyCode < 123) || event.keyCode == 8 || event.keyCode==32)
	        return true; 
	    
	    return false;
	}  
 </script>
 

 
 
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

<script>
$("#mylocation").on('click',function() {
$('table tbody tr  td').on('click',function(){
	
	var  track_num=$(this).closest('tr').children()[0].textContent;
	var module="detail";
    // url = 'credit_customer_query_detail.jsp?name=' + encodeURIComponent(track_num);

 document.location.href = url; 
	 




});
	});
</script>

</body>



</html>