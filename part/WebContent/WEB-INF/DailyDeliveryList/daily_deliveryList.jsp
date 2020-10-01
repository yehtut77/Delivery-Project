<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@page import="java.text.SimpleDateFormat,java.util.Date"%>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.*" %>
<!DOCTYPE html>
<html lang="en">
 <%
 try{
//Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/delivery", "root", "root");
 Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
 
   HttpSession ssss=request.getSession(false);  
  
    String comapny_code=(String)ssss.getAttribute("companyCode");
	String username=(String)session.getAttribute("staffName"); 
	String agent_code=(String)session.getAttribute("agentCode"); 
	String staff_code=(String)session.getAttribute("staffCode"); 
   
    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MMM-yyyy");
    LocalDateTime now = LocalDateTime.now();
    String date=dtf.format(now);
    
       
 
		      %>
		      
		      
<head>

   <%-- <script>
 
var n1='<%=username%>';
if(n1=="null"){
	location.replace("Login.jsp");
	
}
</script>   
  --%>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Title -->
    <title>Myanmar Delivery</title>
    <!-- Favicon -->
    <!-- Stylesheet -->
 
     <script src="assets/js/plugin/webfont/webfont.min.js"></script>
	<link rel="stylesheet" href="inputstyle.css">  
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/atlantis.min.css"> 
	 <link rel="icon" href="./img/core-img/aaa.png">  
     <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="inputstyle.css">  

<style>
 
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

.card{
 
box-shadow: -5px 5px 20px rgba(69, 65, 78, 0.21);
 
}

 

body {font-family: Arial, Helvetica, sans-serif;}
 
</style>
 
</head>
 


 
    <div class="container">
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
						               
						            </ul>
						          </li> 
                                    
                                    <li ><a href="register.jsp">WayBill</a>
                                    </li><li ><a href="batch_waybill.jsp">Batch WayBill</a>
                                    </li>
                                      <li><a href="credit_customer.jsp">Credit Customer</a></li>
                                      <li><a href="credit_customer.jsp" id="logout">Logout</a></li>
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
    
    </div>

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
                        <h3>Daily Delivery List</h3>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.jsp"><i class="icon_house_alt"></i> Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Daily Delivery List</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
  
  
    <!-- BackHome Area End -->


       <input type="hidden" value="storePickupCustomer" name="task">

        <div class="container">
        <div class="card">
		<div class="m" style="margin:10px;">
         <div class="row" style="margin-left: 30px;">
		<div class="col-12 col-lg-4">
		
		
			<div class="form-group"> 
	 	<div class="row">
    	<div class="col-6"><label>Company code :</label></div>     
        <div class="col-6">
	   <span><%=comapny_code %></span>
	    </div>
        </div></div>
        
        
        
			<div class="form-group"> 
	 	<div class="row">
    	<div class="col-6"><label>Agent code :</label></div>     
        <div class="col-6">
	   <span><%=agent_code %></span>
	    </div>
        </div></div>
      
        
        
        <div class="form-group"> 
        <div class="row">
    	<div class="col-6"><label>Staff code :</label></div>     
        <div class="col-6">
	     <span><%= staff_code%></span>
	    </div>
        </div></div>
         
         </div>
          <div class="col-12 col-lg-3"> </div>
          
        <div class="col-12 col-lg-5">
        
        <div class="form-group"> 
        <div class="row">
    	<div class="col-4"><label>Staff name :</label></div>     
        <div class="col-8">
	     <span><%=username %></span>
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
    	<div class="col-4"><label>Date:</label></div>     
        <div class="col-8">
	        <span style="color:blue;" class="fa fa-calendar">  <%=dt %></span>  &nbsp; &nbsp;&nbsp; &nbsp;
	        <span   class="fa fa-clock-o" style="color:blue; text-align:right;" id="ck"> </span>
	    </div>
        </div>
   
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
  
       </div>
		</div></div>
		
		</div>	
		</div>
		
		</div>
	  <br>
   
  
  <div class="container">
   <br>
    <div class="card">
		<div class="m" style="margin:10px;">
		<div class="row">
		
		<div class="col-12 col-lg-4">
		<input type="radio" name="print"  value="print" id="print"   onclick="Print()" checked="checked"/>
     	<label>Print</label>
     		<input type="radio" name="print"  value="re_print" id="re_print"   onclick=" Re_print()" />
     	<label>Re-print</label>
		</div>
	 
		
		<div class="col-12 col-lg-3">
		
		<div class="re_printshow" style="visibility: hidden;">
		 <span>Date</span>   
  	<input type="date" id="date" onchange=" d_ch()"    class="pure-material-textfield-outlined">
  	<span id="date_error"></span>
		</div> 
		</div> 
		<div class="col-12 col-lg-3"  >
	 
		 <span >Delivery staff</span>
	 <select class="custom-select custom-select-md"  onchange="stafffListChange(this)" name="" id="staffList" required>
	  <option value=""  hidden="hidden"> -Select-</option>
	  
	  	<%
		

		 PreparedStatement pre=conn.prepareStatement("Select staff_name from staff where company_code=? and parent_agent_code=? ");
		 pre.setString(1, comapny_code);
		 pre.setString(2, agent_code); 
 
		 ResultSet rs=pre.executeQuery();


		if(rs.next())
		  {
					
		 %>
	  <option value="<%=rs.getString("staff_name") %>" > <%=rs.getString("staff_name") %></option>
	 
	  	 <%  
		}
		%>
		
	 </select>
   
		 
		
		</div>
		<div class="col-12 col-lg-2" ></div>
		 
		</div>
		 

        </div>
   </div>
    <br> 
 <%
		String company_name="";
 PreparedStatement pre_company=conn.prepareStatement("Select  company_name  from company where company_code=? ");
	pre_company.setString(1, comapny_code);
	 
	 ResultSet rs_company=pre_company.executeQuery();
	if(rs_company.next()){
		company_name=rs_company.getString("company_name");
	}
	//End company name generation
		 %>
 <div class="card">
		<div class="m" style="margin:10px;">
		
<form >
		 
			<div id="print_area" style="border: 1px dotted black; padding: 5px; width: 100%">  
			<hr>
			<div class="row">
		              <div class="col-12 " style=" text-align: center;"><%=company_name %><br>Daily Delivered List <br>
		              <span id="r_print"></span>
						</div>
						</div>
						
	            	 <div class="row">
						<div class="col-12 col-lg-4 "></div>
						<div class="col-12 col-lg-4 "></div>
		               <div class="col-12 col-lg-4 " style="text-align: left;">
		               
		               
		                <div class="row">
						<div class="col-12 col-lg-12" ><label>Agent code :</label> &nbsp;<label><%=agent_code %></label></div>
						 </div>
						 
						  <div class="row">
						<div class="col-12 col-lg-12" ><label>Staff name :</label>&nbsp;&nbsp;&nbsp;<label id="staffName"> </label></div>
						 </div>
						 
						  <div class="row">
						<div class="col-12 col-lg-12" ><label>Staff phone :</label>&nbsp;&nbsp;<label id="staffphone"> </label></div>
						 </div>
						 
 
						</div>
						</div>
						<div id="show_data"></div>
						  
											 <script>
											 var printType="print";
											 var do_number="";
											 var task;
											  var date_error = document.getElementById("date_error");
											  var r_print = document.getElementById("r_print"); 
											  
										 	function  Print() { 
										 		document.getElementById("date").value="dd/mm/yyyy";
											var totalamount=document.getElementById("totalamount");
								            totalamount.textContent=""; 
											var er=document.getElementById("show_data");
										  	er.textContent="";
											document.getElementById("staffList").selectedIndex = "0";  
											var element = document.querySelector('.re_printshow'); 
											element.style.visibility = 'hidden'; 
											printType="print";
											r_print.textContent = "" ; 
												} 

												function  Re_print() {  	
													document.getElementById("date").value="dd/mm/yyyy";
													var er=document.getElementById("show_data");
										  	         er.textContent="";
										  	       var totalamount=document.getElementById("totalamount");
										            totalamount.textContent="";
													document.getElementById("staffList").selectedIndex = "0";  
											     var element1 = document.querySelector('.re_printshow'); 
											      element1.style.visibility = 'visible'; 
											      printType="reprint";
											      r_print.textContent = "Re-print" ;
											      r_print.style.color = "blue";
											      r_print.style.fontSize = "15px"; 
											  
												} 

												//Start valid date checking
												function d_ch() {
													var er=document.getElementById("show_data");
										  	         er.textContent="";
										  	       var totalamount=document.getElementById("totalamount");
										            totalamount.textContent="";
										            document.getElementById("staffList").selectedIndex = "0";   
													var check=$('#date').val();
													if(check!=null){
													var x = document.getElementById("date").value; 
													var CurrentDate = new Date();
													var findDate = new Date(x);
													 
													if(findDate < CurrentDate){
														date_error.textContent = "" ;
													}else{
														date_error.textContent = "*Please enter valid date*" ;
										        		date_error.style.color = "red";
										        		document.getElementById("date").value="dd/mm/yyyy";
											            $("#date").focus();
													}

													}else { 
										        		
										        		
										        		date_error.textContent = "*Please enter valid date*" ;
										        		date_error.style.color = "red";
										        		document.getElementById("date").value="dd/mm/yyyy";
											            $("#date").focus();
										        		
										        	}
												        
												}//End valid date checking
												        	
								 
												
					 						 function stafffListChange() {
					 							var er=document.getElementById("show_data");
									  	         er.textContent="";
									  	       var totalamount=document.getElementById("totalamount");
									            totalamount.textContent="";
					 						    var selectedDate = $("#date").val();
											      if(printType=="reprint" && selectedDate == "") { //to enter date first
											    	
											    	  date_error.textContent = "*Please enter date first" ;
											    	  date_error.style.color = "red";
											    	  $("#date").focus();
											      }else{
											    	  date_error.textContent = "" ; 
											   
														  var f_date=document.getElementById("date").value;
														  task="staffphone";
														 var staff = document.getElementById("staffList");
														 var selected_staff = staff.options[staff.selectedIndex].value; 
															var staffName=document.getElementById("staffName");
															staffName.textContent=selected_staff;
															var staffphone=document.getElementById("staffphone");
											 
													 
													      $.ajax( {	 
												 	    		url: "ZdDlf",
												 	    		type: 'POST',
												 	    		data: {selected_staff: selected_staff,task:task },
												 	    		success: function(data) { 
												 	    			var phone = data.trim();
                                                               if(phone !="no"){
												 	    			  staffphone.textContent=phone;
                                                               }
                                                               else{
                                                            	   alert("he/she has no phone")
                                                               }
												 	    	        	}
												            	} );   //End getting staff phone
														  
									  task="checkingTrackingNumber"; 
									   $.ajax( {
							 	    		url: "ZdDlf",
							 	    		type: 'POST',
							 	    		data: {task:task,printType:printType,f_date:f_date },
							 	    		success: function(data) {
							 	    			var datarows = data.trim();
							 	    			var nameArr = datarows.split('$');  
							 	    			if(nameArr[1].trim()=="No"){
							 	    				var data_row=document.getElementById("show_data");
								                 	data_row.innerHTML ="No data available";
								                 	data_row.style.color = "red";
                                             
							 	         	  } else{
							 	         		var data_row=document.getElementById("show_data");
							 	         		var totalamount=document.getElementById("totalamount");
							                 	data_row.innerHTML = nameArr[0];
							                 	data_row.style.color = "";
							                 	totalamount.textContent=Math.round(nameArr[2].trim());
							                	do_number=do_number+" "+nameArr[1].split('!');
							                	$('#printpagebutton').removeAttr("disabled");
							 	           
							 	         	}
							 	    	        	} 
							            	} );   
									  
											      } 
								 }	//End function of tracking number checking
								
										
								 

								 function printpage() {
									 
									 task="comfirm";
								 
								 	 var result = confirm("Are you sure to print?");
								 	    if(result){
								 	    	
								 	    	   $.ajax( {

								 	 	    		url: "ZdDlf",
								 	 	    		type: 'POST',
								 	 	    		data: {task:task,do_number:do_number},
								 	 	    		success: function(data) { 
								 	 	    	        	}
								 	            	} );   //End getting staff phone
								 	    	
								 	    	     var divContents = document.getElementById("print_area").innerHTML;  
											     var printWindow = window.open('', '', 'height=700,width=1000');  
											     printWindow.document.write('<html><head><title>Print  Content</title>');  
											     printWindow.document.write('</head><body style="font-size:18px; ">');  
											     printWindow.document.write(divContents);  
											     printWindow.document.write('</body></html>');  
											     printWindow.document.close();  
											     printWindow.print();  
											  
								 	    }
								 }
									 </script>					 
					 			  
			 
			     <hr>
			    <label>Total Amount :  <span id="totalamount"> </span></label>
			    <hr>
			</div>
	 
		<center> <input type="submit" class="button" id="printpagebutton"  value="Print" onclick="printpage()" disabled="disabled"></center>	
</form>
		
		
        </div>
   </div>
  <br><br>
 
 </div>


 </div>
 
   <%
    	conn.close();
} 

catch(Exception e)
{
	 e.printStackTrace();
	 e.getMessage();

	 }				
%>
    <!-- Welcome  body  Area Start -->
 
  
	 
<!-- ----------------------Modal  box  End--------------------- -->
 
 
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