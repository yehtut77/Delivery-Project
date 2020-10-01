<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
 <%@ page import="java.sql.*"%>  
  <%@page import="java.text.SimpleDateFormat,java.util.Date"%>
            <%@ page import="java.time.format.DateTimeFormatter" %>
    <%@ page import="java.time.*" %>
 
	<% HttpSession ssss=request.getSession(false);					
	String username=(String)ssss.getAttribute("staffName");
	String staffCode=(String)ssss.getAttribute("staffCode");
	String agentCode=(String)ssss.getAttribute("agentCode");
	String companyCode=(String)ssss.getAttribute("companyCode");
    DateTimeFormatter dat = DateTimeFormatter.ofPattern("dd/MM/yyyy");
    DateTimeFormatter clock = DateTimeFormatter.ofPattern("hh:mm a");
  LocalDateTime localDateTime = LocalDateTime.now();
  String dt = dat.format(localDateTime);
  String ck=clock.format(localDateTime);
Connection connection=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
	PreparedStatement pre = connection.prepareStatement("Select cust_name,cust_code1,cust_code2 from credit_cust where company_code=?");
			pre.setString(1, companyCode);
			ResultSet rs = pre.executeQuery();
			String listofcus="";
			while (rs.next()) {
			String name=rs.getString("cust_name").trim();
			String c1=rs.getString("cust_code1").trim();
			String c2=rs.getString("cust_code2").trim();
String allinone=name+"|"+c1+c2;
  listofcus=listofcus+"$"+allinone;

	}
  connection.close();
  pre.close();
  rs.close();
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
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <style>
  video{
     width:50%;
     height:30%;
 }
 #myModal1{
  top: 30%;
  text-align: center;
   left: 30%;
   overflow-x:hidden;
   overflow-y: hidden;
    height:60%;
width:30%;
}
#myModal2{
  top: 30%;
  text-align: center;
   left: 40%;
   overflow-x:hidden;
   overflow-y: hidden;
    height:60%;
width:30%;
}
  #interactive{
     width:80%;
     height:30%;
 }
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
       height: 30px;}


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

 

#oftab{
overflow:auto;
}
	 
#refamt{
overflow:auto;
}
#oftabc{
overflow:auto;
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
 <script>

 </script>

 	
<body>

<div id="myModal2" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
           <h3 style="color:red;text-align:center;">No Waybill Available!</h3> 
                          <center><input type="button" class="btn btn-primary" style="width:100px;" value="OK" onclick="closemod()">           </center>

  </div>

</div>
<div id="myModal1" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
           <h3 style="color:red;text-align:center;">Lacks Of Information !</h3> 
                          <center><input type="button" class="btn btn-primary" style="width:100px;" value="OK" onclick="closemod()">           </center>

  </div>

</div>


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
                        <h3>Payment To Credit Customer</h3>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.jsp"><i class="icon_house_alt"></i> Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Payment To Credit Customer</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
  
  
    <!-- BackHome Area End -->

   <div class="container">

	<div class="row">
	
	<div class="col-6" >
	<div class="card">

  <div class="m" style="margin:10px;">

 <div class="row">
<div class="col-6">
  <div class="form-group"> 
	  
    	 <label style="font-size:15px;"><b>Customer</b></label>   

    </div> 


       </div>
       <div class="col-6">
 <select id="crecuslist" class="browser-default custom-select">
 
</select>
</div>
</div>

 
 
</div>

  
</div>
   
 </div>

 <div class="col-6" >
	<div class="card">

  <div class="m" style="margin:10px;">
 
 <div class="row"><div class="col-6">
  <div class="form-group"> 
	    <label style="font-size:15px;">
 <b>  Date</b>&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
  
   </label>
    	
		    </div> 
<div class="form-group"> 
	  
    <label style="font-size:15px;"><b>Company Code</b> </label>  
      
		    </div> 
   <div class="form-group"> 
	  
    	 <label style="font-size:15px;"><b>Agent Code</b></label>   
      	
    </div> 

   <div class="form-group"> 
	  
    	 <label style="font-size:15px;"><b>Staff Name</b></label>   

    </div> 
   

       </div>
       <div class="col-6">
        <div class="form-group"> 
	   <label style="font-size:12px;"> <span style="color:blue;" class="fa fa-calendar"> <%=dt %></span>  
 
   &nbsp;   
   <span style="color:blue;" class="fa fa-clock-o" style="text-align:right;"> <%=ck %></span>
   </label>   
		    </div> 
<div class="form-group"> 
	  
    	 <label style="font-size:15px;">: <%=companyCode %></label>   
      
		    </div> 
   <div class="form-group"> 
	  
    	 <label style="font-size:15px;">: <%=agentCode %></label>   
      	
    </div> 
    
   <div class="form-group"> 
	  
    	 <label style="font-size:15px;">: <%=username %></label>   

    </div> 
   

       </div>
</div>
         
 
  
</div>
   
 </div>
 </div>
 </div>  <br><br>
  <div class="row" >
	
 <div class="col-12" >
	<div class="card">

  <div class="m" style="margin:10px;">
 <div class="row">
 <div class="col-6">

        <div class="form-group"> 
          <label style="font-size:15px; font-weight: bold;">From Date</label>   
        <label class="pure-material-textfield-outlined">
		<input type="date" value=""  name="fdate" id="fdate" placeholder=" " required/>
		</label>
        </div>  
      
 
 
 
 

  
</div>
    <div class="col-6">

        <div class="form-group"> 
          <label style="font-size:15px; font-weight: bold;">To Date</label>   
        <label class="pure-material-textfield-outlined">
		<input type="date" value=""  name="tdate" id="tdate" placeholder=" " required/>
		</label>
        </div>  
      
 
 
 
 

  
</div>
 	<br><br><br>  
       

         
       </div>

 
 
 
 
</div>

  
</div>
  
 </div>
 </div>
 <br><br>
  <div class="row" >
	
 <div class="col-12" >
	<div class="card">

  <div class="m" style="margin:10px;">
 <div class="row">
 <div class="col-12">
 <center>
<h5>Quantity</h5>
 </center>  
  
</div>
   
 	<br>
       

         
       </div>

 <div class="row">
  <div class="col-4">

        <div class="form-group"> 
          <label style="font-size:15px; font-weight: bold;">Total Delivered</label>   
        <label class="pure-material-textfield-outlined">
		<input type="text" value=""  name="" id="tde" placeholder=" " class="form-control" disabled/>
		</label>
        </div>  

</div>
    <div class="col-4">

        <div class="form-group"> 
          <label style="font-size:15px; font-weight: bold;">Total Cancelled</label>   
        <label class="pure-material-textfield-outlined">
		<input type="text" value=""  name="" id="tca" placeholder=" "  class="form-control" disabled/>
		</label>
        </div>  

</div>
  <div class="col-4">

        <div class="form-group"> 
          <label style="font-size:15px; font-weight: bold;">Total Returned</label>   
        <label class="pure-material-textfield-outlined">
		<input type="text" value=""  name="" id="tre" placeholder=" " class="form-control" disabled/>
		</label>
        </div>  

</div>
 </div>
 
 
 
</div>

  
</div>
  
 </div>
 </div>
 <br><br>
  <div class="row"  id="oftab">
   <div class="col-12">
   <div class="card" id="oftabc">

   <table id="basic-datatables" class="table">
  <thead>
    <tr>
      <th scope="col">Tracking Num</th>
      <th scope="col" >Delivery Charges</th>
      <th scope="col" > Status </th>
      <th scope="col" >Product Amount </th>
      <th scope="col" >Total Amount </th>
       <th scope="col">Receiver Name</th>
      <th scope="col" >Receiver Phone</th>
      <th scope="col" >Receiver Township </th>
      <th scope="col" >Receiver State</th>
      <th scope="col" >Delivery Date</th>
     
    </tr>
  </thead>
  <tbody>
   
</tbody>
</table>  </div>
   </div></div>
   <br><br>
   <div class="card" id="refamtc">
   <div id="refamt" class="row">
   <br><br>
   <div class="col-3">
    </div>
    <div class="col-3">
    </div>
   <div class="col-3">
    <div class="form-group"> 
	  <br>
    	 <label style="font-size:15px;"><b>Refund Amount</b></label>   

    </div>  </div>
   <div class="col-3">
     <div class="form-group"> 
	  <br>
      			<input type="text" value="" style="width:80px;" name="" id="ramo" placeholder=" " class="form-control" disabled/>

    </div> 
   </div>
  </div>
   </div>
   <br><br>
  	<div class="row" id="paymentradio">
	
 <div class="col-12" >
	<div class="card">

  <div class="m" style="margin:10px;">
 <div class="row">
 <div class="col-12">

   
 <div class="row">
 <div class="col-6">
<br><h5>Payment</h5><br>
 <div class="row"><div class="col-6">
<div class="form-group"> 
	  
      <input type="radio" value="<img src='cbpay.png' width='400px' height='400px'>" id="cb" name="paymentradio"  >
   </div>   
</div>
	<div class="col-6">
<div class="form-group">  <label style="font-size:15px;">CBPay</label>   
   </div>   
		</div></div>
		
		<div class="row"><div class="col-6">
<div class="form-group" id="pad"> 
	  
    	 <input type="radio" value="<img src='kbzpay.png' width='400px' height='400px'>" id="kb" name="paymentradio"  > 
   
      
		
    </div> 		</div><div class="col-6">
<div class="form-group" id="pad"> 
	   <label style="font-size:15px;">KBZPay:</label> 
   
      
		
    </div> </div></div>
     <div class="row"><div class="col-6">
    
    
<div class="form-group" id="dcd"> 
	  
    	 <input type="radio" value="<input type='button' class='btn delivery-btn1 btn-3 mt-15 active' value='Scan QR Code' onclick='scanQR()'/>" id="vis" name="paymentradio"  />
      
		 
    </div> </div><div class="col-6">
<div class="form-group" id="dcd"> 
	  <label style="font-size:15px;">MPU/JCB/VISA/MASTER:</label>   
      
		 
    </div> </div></div>
     <div class="row"><div class="col-6">

<div class="form-group" id="tad" > 
	  
    	 <input type="radio" id="cash" value="" name="paymentradio"  > 
      
	    </div>	</div><div class="col-6">
<div class="form-group">  <label style="font-size:15px;">Cash</label>   
   </div>   
		</div></div>
 </div>



   
  <div class="col-6">
       	<br><br><br>  
   <div id="showoption" class="thumbnail" style="width:150px;height:150px"></div>
</div>	 
       </div>
 
      
 
 
 
 

  
</div>

 	<br><br><br>  
       

         
       </div>

 
 
 
 
</div>

  
</div>
  
 </div>
 </div>
  
        <center><input type="button" onclick="ff()" class="btn delivery-btn1 btn-3 mt-15 active" value="Make Payment"/> </center>   

 <br><br></div></div>
  

 





	 

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
       

 <script >
			$(document).ready(function() {
			$('#myModal1').hide();
			$('#myModal2').hide();
			
				var listofcus='<%=listofcus%>';
			
				  var resss = listofcus.split("$");
				  for(var i=0;i<=99;i++){
				
				  if(resss[i+1]=="undefined"){}else{ 
				  
				 optionText =resss[i+1].trim(); 
			 optionValue = resss[i+1].trim(); 
   $('#crecuslist').append(new Option(optionText, optionValue));
							
				  }}
				  });
				  
			
    </script>
<script>
var start1="N";
var start2="N";
  $("#fdate").focusout(function() {
  $("#basic-datatables tbody tr").remove(); 
  start1="Y";
      if(start1=="Y" && start2=="Y"){
      var alldate=$('#fdate').val();
      var year=alldate.substring(0,4);
      var month=alldate.substring(5,7);
      var day=alldate.substring(8,10);
        var alldate2=$('#tdate').val();
      var year2=alldate2.substring(0,4);
      var month2=alldate2.substring(5,7);
      var day2=alldate2.substring(8,10);
    var d1 = new Date(year, month,day);
    var d2 = new Date(year2, month2, day2);
    if(d1<d2){
           new ajaxcall();}else{alert("Invalid Date Format");}
      }
  });
    $("#tdate").focusout(function() {
    $("#basic-datatables tbody tr").remove(); 
    start2="Y";
         if(start1=="Y" && start2=="Y"){
      var alldate=$('#fdate').val();
      var year=alldate.substring(0,4);
      var month=alldate.substring(5,7);
      var day=alldate.substring(8,10);
        var alldate2=$('#tdate').val();
      var year2=alldate2.substring(0,4);
      var month2=alldate2.substring(5,7);
      var day2=alldate2.substring(8,10);
    var d1 = new Date(year, month,day);
    var d2 = new Date(year2, month2, day2);
    if(d1<d2){
         new ajaxcall();}else{alert("Invalid Date Format");}
         }
    });

</script>
	  <input type="text" id="listofid" hidden>	 

	  <script>function ajaxcall(){
	  var date1=$('#fdate').val();
	  var date2=$('#tdate').val();
var e = document.getElementById("crecuslist");
var ccus = e.options[e.selectedIndex].value;
	        $.ajax({
			    		url: "PCCC",
			    		type: 'POST',
			    		data: {
			    		    cond:"one",
			    		    d1:date1,
			    			d2:date2,
			    			ccus:ccus
			    		},
			    		success: function(data) {
			    		var data2=data.trim();
			    		if(data2=='NV'){$('#myModal2').show();}else{
			    	 var res = data2.split("$");
			    	$('#tde').val(res[1]);
			    	$('#tca').val(res[2]);
			    	$('#tre').val(res[3]);
			    	$('#ramo').val(res[4]);
	                $('#listofid').val(res[5]);
	                $('#noofid').val(res[0]);
    $("#basic-datatables tbody tr").remove(); 

  for(var i=7;i<=res[0]+8;i++){
  
    var ress = res[i].split("%");
   var markup ="<tr>"+"<td>"+ress[0] +"</td>"+
                                "<td>"+ress[1] +"</td>"+
                                "<td>"+ress[2] +"</td>"+
                                "<td>"+ress[3]+"</td>"+ 
                                "<td>"+ress[4]+"</td>"+ 
						         "<td>"+ress[5]+"</td>"+ 
						         "<td>"+ress[6]+"</td>"+ 
						         "<td>"+ress[7]+"</td>"+ 
						         "<td>"+ress[8]+"</td>"+ 
						       "<td>"+ress[9]+"</td>"+
						     "</tr>";
						     var mk2=markup.trim();
	 $("#basic-datatables tbody").append(mk2);
    
  }
			    	}	}
				    				 });
	  }
	  function ff(){
	       var lid=$('#listofid').val();
	       	       var ramo=$('#ramo').val();
  var paycode="0";
			var r1=document.getElementById("cb");
			var r2=document.getElementById("kb");
			var r3=document.getElementById("vis");
			var r4=document.getElementById("cash");
			if(r1.checked){paycode="1";}
			if(r2.checked){paycode="2";}
			if(r3.checked){paycode="3";}
			if(r4.checked){paycode="4";}
			if(paycode=='0' || lid.length<=2){$('#myModal1').show();}else{
	        $.ajax({
			    		url: "PCCC",
			    		type: 'POST',
			    		data: {
			    		    cond:"two",
			    		    lid:lid,
			    		    damt:ramo,
			    		    pcode:paycode
			    		
			    		},
			    		success: function(data) {
			    		var data2=data.trim();
			    		alert("If you are using on android , then rotates your device ! Then click OK");
			    		var para1=lid;
			    		var para2=data2;
			    		var para3=paycode;
openWindowWithPost("PCCP",'statusbar=no','title',para1,para2,para3);
alert("Successful");
window.location.href="Reg";
}
				    				 });}
	  }
	  
	  
	  function openWindowWithPost(url, windowoption, name, para1,para2,para3)
{
         var form = document.createElement("form");
         form.setAttribute("method", "post");
         form.setAttribute("action", url);
         form.setAttribute("target", name);
         var input = document.createElement('input');
         input.type = 'hidden';
         input.name = "para1";
         input.value = para1;
           var input2 = document.createElement('input');
         input2.type = 'hidden';
         input2.name = "para2";
         input2.value = para2;
           var input3 = document.createElement('input');
         input3.type = 'hidden';
         input3.name = "para3";
         input3.value = para3;
         form.appendChild(input);
        form.appendChild(input2);
         form.appendChild(input3);

         /*for (var i in params) {
             if (params.hasOwnProperty(i)) {
                 var input = document.createElement('input');
                 input.type = 'hidden';
                 input.name = i;
                 input.value = params[i];
                 form.appendChild(input);
             }
         }*/
         document.body.appendChild(form);
         form.submit();
         document.body.removeChild(form);
 }</script>
	   <script src="live_w_locator_rc.js" type="text/javascript"></script>
	   
    <script src="//webrtc.github.io/adapter/adapter-latest.js" type="text/javascript"></script>
    <!-- All JS Files -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
		    	<!-- jQuery Scrollbar --><script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 

 	
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
			 <script src="quagga.min.js" type="text/javascript"></script>
			<script type="text/javascript">
$("input:radio[type=radio]").click(function() {
$('#showoption').show();
var value = $(this).val();
$('#showoption').html(value);
    });
</script>
<a href="RCQR" target="_blank" id="sqr" hidden>.</a>
<script>
function scanQR(){
var hiddena=document.getElementById("sqr");
hiddena.click();
}

function closemod(){
    $('#myModal2').hide();
        $('#myModal1').hide();

}

</script>
</body>



</html>