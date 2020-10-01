<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@page import="java.text.SimpleDateFormat,java.util.Date"%>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.*" %>
<%@ page import="java.util.*" %>
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
   
 
		      %>
		      
		      
<head>
<title>Myanmar Delivery</title>

        <script>
				var n1='<%=username%>';
				if(n1=="null"){
					location.replace("Login.jsp");
				}
       </script>  
 
	    <meta charset="UTF-8">
	    <meta name="description" content="">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">  
	     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	     <script src="assets/js/plugin/webfont/webfont.min.js"></script>
	     
		 <link rel="stylesheet" href="assets/css/bootstrap.min.css">
		 <link rel="stylesheet" href="assets/css/atlantis.min.css">
		 <link rel="icon" href="./img/core-img/aaa.png">
		 <link rel="stylesheet" href="style.css">
 <style>
 
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
			    /* Input */
			.pure-material-textfield-outlined > input{
			    box-sizing: border-box;
			    margin: 0;
			    border: solid 1px blue; /* Safari */
			    border-color: #ABABAB  ;
			    border-radius: 4px;
			    padding: 5px 7px 1px;
			    width: 100%;
			    height: 30px;
			    color: rgba(var(--pure-material-onsurface-rgb, 0, 0, 0), 0.87);
			    background-color: transparent;
			    box-shadow: none; /* Firefox */
			    font-family: inherit;
			    font-size: 17px;
			    line-height: inherit;
			    caret-color: blue;
			    transition: border 0.1s, box-shadow 0.5s;
			}
			/* Hover */
			.pure-material-textfield-outlined:hover > input{
			    border-color: blue;
			    border-top-color: blue
			}
			body {font-family: Arial, Helvetica, sans-serif;}	 
  </style>
 
</head>
    <!-- Preloader -->
    <div class="container" >
    <!-- Header Area Start -->
    <header class="header-area">
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
							              <!--  <li><a href="credit_customer_waybill.jsp">Credit Customer Waybill Queries</a></li>
							              <li> <a href="pickUp_from.jsp"  >Pick up from customer</a></li> -->
							            </ul>
						            </li> 
                                    <li ><a href="register.jsp">WayBill</a>
                                    </li><li ><a href="batch_waybill.jsp">Batch WayBill</a>
                                    </li>
                                    <li><a href="credit_customer.jsp">Credit Customer</a></li>
                                    <li><a href="credit_customer.jsp" id="logout">Logout</a></li>
                                 </ul>
                            </div>
                     
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
                        <h3>Customer Receipt Report</h3>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.jsp"><i class="icon_house_alt"></i> Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Customer Receipt Report</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
  
  
    <!-- BackHome Area End -->


       <input type="hidden" value="storePickupCustomer" name="task">

        <div class="container" >
           <div class="card">
		        <div class="m" style="margin:10px;">
                   <div class="row" style="margin-left: 30px;">
		               <div class="col-12 col-lg-4">
		
		
							<div class="form-group"> 
							 	<div class="row">
							    	<div class="col-6">
							    		<label>Company code :</label>
							    	</div>     
							        <div class="col-6">
								        <span><%=comapny_code %></span>
								    </div>
						        </div>
					        </div>
        
        
        
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
    DateTimeFormatter dat = DateTimeFormatter.ofPattern("dd-MMMM-yyyy");
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
	<div class="card-body" >
	<div class="row">
<div class="col-12 col-lg-2"></div>
		<div class="col-12 col-lg-2">
		<input type="radio" name="print"  value="print" id="print"   onchange="Print()"  checked="checked" />
     	<label>Print</label><br>
     		<input type="radio" name="print"  value="re_print" id="re_print"   onclick=" Re_print()"  />
     	<label>Re-print</label>
		</div>
		
	 
			<div class="col-12 col-lg-3">
				<div class="re_printshow" style="visibility: hidden;">
		<div class="form-group" > 	
		  <label>Date</label><br>
		   <label class="pure-material-textfield-outlined">
  	      <input type="date" id="date"   class="pure-material-textfield-outlined">
          </label><br>
  	      <span id="date_error"></span>
  	</div></div>
		</div>
	
		
		<div class="col-12 col-lg-3">
		<div class="printshow" >
	<div class="form-group" > 	

	 <label> Customer</label><br>
	 <label class="pure-material-textfield-outlined">
	
       <input type="search" id="search" name=""   value="" onkeyup="search()" placeholder="Search..." /> <br> 
       <select id="search_drop" multiple="multiple"  onchange="selected()" style="border-color:transparent; overflow:auto;">

		</select>  
       </label>         
	   
	    </div></div>
        </div> <div class="col-12 col-lg-2"></div>

	</div><br>
	
	</div></div>

   <br>
   
	
 <div class="card">
	<div class="card-body text-justify">
	


                        <div class="row" id="print_hdr">
		              <div class="col-12 " style=" text-align: center;"><h3>Customer Receipt Report</h3>
		              <span id="r_print"></span><br>
		              <span id="reprint_date"></span>
						</div>
						</div>
						
						
						<div style="display: none;" id="print_info">
						<table style="width: 100%; ">
						<tr>
						<td>
						
						<table>
						<tr>
						<td>Date</td>
						<td>:</td>
						<td><%=dt %></td>
						</tr>
						
						<tr>
						<td>Receipt Agent</td>
						<td>:</td>
						<td><%=username%></td>
						</tr>
						
						</table>
						</td>
						<td>
						
						 <table style="float: right ;">
						<tr>
						<td>Company code</td>
						<td>:</td>
						<td><%=comapny_code %></td>
						</tr>
						
						<tr>
						<td>Customer name</td>
						<td>:</td>
						<td><label id="cust_Name1"> </label></td>
						</tr>
						
						<tr>
						<td>Customer phone</td>
						<td>:</td>
						<td><label id="cust_phone1"> </label></td>
						</tr>
						
						</table>
						</td>
						</tr>
						
						</table>
						
						</div>
        <br>
         <div class="row">
              <div class="col-12 col-lg-6">
	              
	                <table>
						<tr>
						<td>Date</td>
						<td>:</td>
						<td><%=dt %></td>
						</tr>
						
						<tr>
						<td>Receipt Agent</td>
						<td>:</td>
						<td><%=username%></td>
						</tr>
						
						</table>
	                
	             
	               </div> <div class="col-12 col-lg-6">
	                <table >
						<tr>
						<td>Company code</td>
						<td>:</td>
						<td><%=comapny_code %></td>
						</tr>
						
						<tr>
						<td>Customer name</td>
						<td>:</td>
						<td><label id="cust_Name"> </label></td>
						</tr>
						
						<tr>
						<td>Customer phone</td>
						<td>:</td>
						<td><label id="cust_phone"> </label></td>
						</tr>
						
						</table>
	                 
	           </div>
          </div>
		              <hr>
	               <div style="overflow-x:auto; width:100%;" >
	                 <div id="second_table" ></div>
	              
			       </div>  	
	 
	 
	 </div>
   </div>
   
   
<form >
		 
		<center> <input type="submit" class="button" id="printpagebutton"  value="Print" onclick="printpage()" disabled="disabled"></center>	
</form>
		
		
     
  <br><br>
 
 </div>


 </div>
 
  
    <!-- Welcome  body  Area Start -->
 
  
	 
<!-- ----------------------Modal  box  End--------------------- -->


  <script>
  
        var task="";
	    var printType="print";
	    var do_number="";
	    var searchKey= document.getElementById("search");
	    var date_error = document.getElementById("date_error");
		function  Print() {
		  var er=document.getElementById("second_table");
      	  er.textContent="";
		  $('#search_drop').empty();
		  searchKey.value="";	
		  element = document.querySelector('.printshow'); 
	      element.style.visibility = 'visible'; 
	      element = document.querySelector('.re_printshow'); 
	      element.style.visibility = 'hidden'; 
	      printType="print";
	      r_print.textContent = "" ;
		} 
		function  Re_print() {
			  var er=document.getElementById("second_table");
	      	  er.textContent="";
			  var r_print = document.getElementById("r_print");
		  	  $('#search_drop').empty();
		  	  searchKey.value="";
			  element = document.querySelector('.printshow'); 
		      element.style.visibility = 'visible'; 
		      element = document.querySelector('.re_printshow'); 
		      element.style.visibility = 'visible'; 
		      printType="reprint";
		      r_print.textContent = "Re-print" ;
		      r_print.style.color = "blue";
		      r_print.style.fontSize = "15px";
	  
		}
	$('#date').change(function() {
				    var er=document.getElementById("second_table");
		    	    er.textContent="";
					$('#search_drop').empty();
					searchKey.value="";
					var check=$('#date').val();
					if(check!=null){
					var x = document.getElementById("date").value;
					var CurrentDate = new Date();
					var findDate = new Date(x);
					if(findDate < CurrentDate){
						date_error.textContent = "" ;
					}else{
						date_error.textContent = "* Please enter valid date" ;
			  		date_error.style.color = "red";
			  		document.getElementById("date").value="dd/mm/yyyy";
			          $("#date").focus();
					}
					}else { 
			  		date_error.textContent = "* Please enter valid date" ;
			  		date_error.style.color = "red";
			  		document.getElementById("date").value="dd/mm/yyyy";
			          $("#date").focus();
			  	   }
	});	//End valid date checking
 
  function selected(){
	         var er=document.getElementById("second_table");
  	         er.textContent="";
			 var search_drop= document.getElementById("search_drop");
			 var selected_cust= search_drop.options[search_drop.selectedIndex].value;
		   	 var selected_code=selected_cust.split("  ");
		  	 var code1=selected_code[0];  
		  	 var code2=selected_code[1];
		     task="retrieveCustInfo";	 
		      $.ajax( {
	
		    		url: "roadRp",
		    		type: 'POST',
		    		data: {code1: code1,code2:code2,task:task },
		    		success: function(data) {
				    	    var search_data = data.trim();
					        if(search_data =="no"){
					        }
					       else{  
					    		 var cust_name= document.getElementById("cust_Name");
					    		 var cust_phone= document.getElementById("cust_phone");
					    		 var cust_name1= document.getElementById("cust_Name1");
					    		 var cust_phone1= document.getElementById("cust_phone1");
					    		 var nameArr = search_data.split(',');
					    		 cust_name.textContent=nameArr[0];
					    		 cust_phone.textContent=nameArr[1];
					    		 cust_name1.textContent=nameArr[0];
					    		 cust_phone1.textContent=nameArr[1];
					        }
		  	        }
		      } );      //End getting staff phone 	
	 
	      var selectedDate = $("#date").val();
	      if(printType=="reprint" && selectedDate =="") {
	    		$('#search_drop').empty();
	    		searchKey.value="";
	    	    date_error.textContent = "* Please enter date first" ;
	    	    date_error.style.color = "red";
	    	    $("#date").focus();
	      }else{
		        var search_drop= document.getElementById("search_drop");
		        var selected_cust= search_drop.options[search_drop.selectedIndex].value;
		        searchKey.value=selected_cust;
			   	$('#search_drop').empty();
			   	var selected_code=selected_cust.split("  ");
			  	var code1=selected_code[0];
			  	var code2=selected_code[1];
	        	var reprint_date=document.getElementById("reprint_date");
				var f_date=document.getElementById("date").value;
				reprint_date.textContent=f_date;
				task="retrieveData"; 
	           $.ajax( {
						      url: "roadRp",
						      type: 'POST',
						      data: {code1: code1,code2:code2,task:task,printType:printType,f_date:f_date },
						      success: function(data) {	 
						      var search_data = data.trim();
						      var nameArr = search_data.split('&');
						      
						    
					          if(nameArr[1].trim()=="date_er"){
								        	  var er=document.getElementById("second_table");
								        	  er.textContent="No data in this date";
								        	  er.style.color = "red";
					          }else  if(nameArr[1].trim()=="print_er"){
					        				 var er=document.getElementById("second_table");
							        	     if(document.getElementById('print').checked){
										        	  er.textContent="Already printed";
										        	  er.style.color = "red";
							        	  		}else{
							        	  			  er.textContent="No printed yet";
										        	  er.style.color = "red";
							        	  		}
					          }else if(nameArr[1].trim()=="stat_er"){
								        	  var er=document.getElementById("second_table");
								        	  er.textContent="Waybill wrong status";
								        	  er.style.color = "red";
					          }else if(nameArr[1].trim()=="not_found"){
								        	  var er=document.getElementById("second_table");
								        	  er.textContent="No data found";
								        	  er.style.color = "red";
					          }else if(nameArr[1].trim()=="not_trans"){ 
								        	  var er=document.getElementById("second_table");
								        	  er.textContent="Waybill not transfer yet";
								        	  er.style.color = "red";
					          }
					          else{       
					        	            var data_row=document.getElementById("second_table");
						                 	data_row.innerHTML = nameArr[0]
						                 	data_row.style.color = "";
						                	do_number=do_number+" "+nameArr[1].split('!');
						                	$('#printpagebutton').removeAttr("disabled");
						               
						                 
					          }
						  	}
                } );      //End RETRIEVING TABLE	 	
		
	  
    }
}
					function  search(){
						var searchKey= document.getElementById("search").value;
						searchKey=searchKey.trim();
						var search_drop= document.getElementById("search_drop");
						
						
                            task="search";
                          
					      $.ajax( {	

				 	    		url: "roadRp",
				 	    		type: 'POST',
				 	    		data: {searchKey: searchKey,task:task },
				 	    		success: function(data) {
				 	    		 
				 	    	var search_data = data.trim();
                             if(search_data =="No_data"){
                     //     alert("incorrect "+search_data);
			   		                   	$('#search_drop').empty();
			   		         
			   		               
			   		                	var option=document.createElement("option");
					   		              option.text="No data"; 
					   		         
					   		             search_drop.add(option);
    
                             }
                             else{
                     
                                 var    arr=search_data.split("/");    
       			   		                   	$('#search_drop').empty();
       			   		                 for(var i=0;i<arr.length;i++){
       			   		                	 
       			   		                	var option=document.createElement("option");
       			   		                 	  option.value=arr[i]; 
       					   		              option.text=arr[i];
       					   		           //option.selected=true;
       					   		             search_drop.add(option);
       					   		          
       			   		                   }
                          	  
                             }
				 	    	        	}
				            	} );   //End getting staff phone 	
				            	
						
					}
					 
					
					 function printpage() {
						 
						 task="comfirm";
					 
					 	 var result = confirm("Are you sure to print?");
					 	    if(result){
					 	    	   $.ajax( {

					 	 	    		url: "roadRp",
					 	 	    		type: 'POST',
					 	 	    		data: {task:task,do_number:do_number},
					 	 	    		success: function(data) {

					 	 	    	        	}
					 	            	} );   //End getting staff phone
					 	    	
					 	    	     var print_hdr = document.getElementById("print_hdr").innerHTML; 
					 	    	     var print_info = document.getElementById("print_info").innerHTML; 
					 	    	     var second_table = document.getElementById("second_table").innerHTML; 
								     var printWindow = window.open('', '', 'height=700,width=1000');  
								     printWindow.document.write('<html><head><title>Customer Receipt Report</title>');  
								     printWindow.document.write('</head><body style="font-size:18px; ">');  
								     printWindow.document.write(print_hdr);
								     printWindow.document.write(print_info);  
								     printWindow.document.write("<hr>");  
								     printWindow.document.write(second_table);  	 
								     printWindow.document.write('</body></html>');  
								     printWindow.document.close();  
								     printWindow.print();    
								  
					 	    }
					 }

	</script>
	
	
	 <% 	
   conn.close();
} 

catch(Exception e)
{
	 e.printStackTrace();
	 e.getMessage();

	 }				

		%>
    
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
 
 
 

</body>

</html>