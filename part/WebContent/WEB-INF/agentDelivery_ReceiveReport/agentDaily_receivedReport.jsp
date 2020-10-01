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
		<!-- Datatables -->
		
		 	
	<script src="assets/js/plugin/datatables/datatables.min.js"></script>
	 <link rel="icon" href="./img/core-img/aaa.png">
  
 
     <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="inputstyle.css"> 
     
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

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

 
 /* start switche */
.switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;
}

.switch input { 
  opacity: 0;
  width: 0;
  height: 0;
}

.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked + .slider {
  background-color: #2196F3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
}
/* end switche */
body {font-family: Arial, Helvetica, sans-serif;}
 
</style>
 
</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>



    <!-- Preloader -->
    <script src="quagga.min.js"></script>
    
      
  <div class="container" >
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
						              <li><a href="credit_customer_waybill.jsp">Credit Customer Waybill Queries</a></li>
						              <li> <a href="pickUp_from.jsp"  >Pick up from customer</a></li>
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
                        <h3>Agent Daily Received Report</h3>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.jsp"><i class="icon_house_alt"></i> Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Agent Daily Received Report</li>
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
	        document.getElementById("ck1").innerHTML =" "+currentTime;
	      
	    }, 1000);  

   </script>
  
       </div>
		</div></div>
		
		</div>	
		</div>
		
		</div>
		
		
		  <div 	 style="display:none;" id="print_header">
		  
		  <table style="width: 100%">
		  <tr>
		  <td>
		  Company code 
		  </td>
		  <td>
		   :
		  </td>
		    <td>
		    <%=comapny_code %>
		  </td>
		  
		  <td>
		  Staff name 
		  </td>
		   <td>
		   :
		  </td>
		    <td>
		    <%=username %>
		  </td>
		  </tr>
		  
		  <tr>
		  
		    
		  <td>
		  Agent code 
		  </td>
		   <td>
		   :
		  </td>
		    <td>
		    <%=agent_code %>
		  </td>
		    <td>
		  Date 
		  </td>
		   <td>
		   :
		  </td>
		    <td>
		     <span style="color:blue;" class="fa fa-calendar">  <%=dt %></span>  &nbsp; &nbsp;&nbsp; &nbsp;
	        <span   class="fa fa-clock-o" style="color:blue; text-align:right;" id="ck1"> </span>
		  </td>
		  </tr>
		  
		  <tr>
		  <td>
		  Staff code 
		  </td>
		   <td>
		   :
		  </td>
		  <td>
		  <%=staff_code %>
		  </td>
		  <td>
		  </td>
		   <td>
	 
		  </td>
		  <td>
		  </td>
		  </tr>
		  </table>
		            
						 
		  </div>
	  <br>
   
  
  <div class="container">
   <br>
    <div class="card">
		<div class="m" style="margin:10px;">
		<div class="row">
		
		<div class="col-12 col-lg-4">
		 <input type="radio" name="show"   id="detail"  value="detail"  checked="checked" onchange="show('detail_area')"/>
     	<label>Details</label><br>
         <input type="radio" name="show"   id="summ"     value="summ"     onchange="show('summary')"  />
     	<label>Summary</label>  
	 
	<!-- 	
		<label class="switch"> 
        <input type="checkbox" id ="details" checked="checked" name="show">
       <span class="slider round"></span>
   </label>	<label class="switch">Details</label><br>
   	<label class="switch"> 
        <input type="checkbox" id ="summary" name="show">
       <span class="slider round"></span>
   </label>
      	<label class="switch">Summary</label>
		
		<script>
		$(document).ready(function(){
    $("#details").change(function(){
        $("#summary").prop("checked", false);
    
    });
    $("#summary").change(function(){
        $("#details").prop("checked", false);
 
    });
});
		</script> -->
		
		</div>
		
		<div class="col-12 col-lg-3">
	 
		</div>
	
	
		<div class="col-12 col-lg-3"  >
		 
		
		</div>
		<div class="col-12 col-lg-2" ></div>
		
		
		
		
		</div>
		 

        </div>
   </div>
    <br> 
 
 
  
	
 <div class="card">
	<div class="m" style="margin:10px;">
		
		   <div id="main_place"></div>
		
		   
		   <div id="detail_area" style="display: none;" >  
		 
			 
	               <label><h4>Details</h4></label>
	               <div style="overflow-x:auto;">  
						 <table id="" class="display table table-striped table-hover" cellspacing="0" width="100%" style="text-align: center;">
						
						<thead >
												<tr>
												   
												    <th>Tracking Number</th>
												    <th> Product Amt</th>
												    <th>Delivery Charges</th>
												    <th>Total Amt</th>
												    <th>Sender Code</th>
												   <th>Receiver name</th>
												    <th>Receiver Township</th>
												    <th>Receiver State</th>
												      
											 	</tr></thead> 	

						 <tbody >
						 
		 		 <%
							 
									 PreparedStatement pre_registration=null;
								 
									  
									 double total_amt=0.0;
									 double total=0.0;
									 String trans_date;
									 int pay_code;
									 
									 int cod=0;
									 int prepaid=0;
									 int ctr=0;
									 
									 int sh_totalamt=0;
									 int sh_product=0;
									 int sh_delich=0;
									 int sh_total=0;
									 
								 
									  List<String> s_code = new ArrayList<String>(); 
								 
								 
										 pre_registration=conn.prepareStatement("Select  * from registration where company_code=? and agent_code=? and stat=?");
										 pre_registration.setString(1, comapny_code);
										 pre_registration.setString(2, agent_code); 
										 pre_registration.setString(3, "W"); 
									 
									     ResultSet rs_registration=pre_registration.executeQuery(); 
								 
									while(rs_registration.next())
									  {     
								 	 
										  trans_date=rs_registration.getString("trans_date");
								            
								            String tdate=trans_date.substring(0, 10);
								    	 
								    	     if(dt.equalsIgnoreCase(tdate)){
								    	    	 
								    	    s_code.add(rs_registration.getString("sender_code"));
								   
							 
								    	     pay_code=Integer.parseInt(rs_registration.getString("payment_code"));
								    	     if(pay_code==13){prepaid++; }
								    	     else if(pay_code==15){ctr++;}
								    	     else if(pay_code==21){cod++;}
								    	     
								    	   	total_amt=Double.parseDouble( rs_registration.getString("deli_charges"))+Double.parseDouble( rs_registration.getString("trans_charges"));
										
								    	 	total +=total_amt;
								    	 	
								    	 	sh_totalamt=(int)total_amt;
								    	 	sh_product=(int)Double.parseDouble( rs_registration.getString("product_amt"));
								    	 	sh_delich=(int)Double.parseDouble( rs_registration.getString("deli_charges"));
								    	 	
								    	  
									     	%>	 
									     	
									     	<tr>
									      
									     	<td><%=rs_registration.getString("track_num") %></td>
									     	<td><%=sh_product%></td>
									     	<td><%=sh_delich%></td>
									     	<td><%=sh_totalamt%></td>
									     	<td><%=rs_registration.getString("sender_code") %></td>
									     	<td><%=rs_registration.getString("rcvr_name") %></td>
									     	<td><%=rs_registration.getString("rcvr_township") %></td>
									     	<td><%=rs_registration.getString("rcvr_state") %></td>
									      
									     	 

									     	</tr>
									     			        
									       <%	
									  
									     
									           }
								    	     }
									sh_total = (int) total;
				 	    	     %>	  
											 				 
					 			 
											 </tbody>   
			     </table></div>
			     <hr>
			 <span style="padding: 20px"> Total  :  <%=sh_total %></span> 
			        <hr>
			 
			     
			    	<table style="width: 30%; padding-left: 20px;">
			    	<tr>
			    	<td>COD</td><td>:</td><td><%=cod %></td>
			    	</tr>
			    	
			    	<tr>
			    	<td>Prepaid</td><td>:</td><td><%=prepaid %></td>
			    	</tr>
			    	
			    	<tr>
			    	<td>CTR</td><td>:</td><td><%=ctr %></td>
			    	</tr>
			    	</table>
			    	
		 
			</div>
			
			
			
			    <div id="summary" style="display:none;">
			    <label><h4>Summary</h4></label>
			    <div style="overflow-x:auto;">  
	    <table  class="display table table-striped table-hover" cellspacing="0" width="100%" style="text-align: center;">
						
						<thead >
												<tr>
												   
												    <th>Sender Code</th>
												    <th>Sender Name</th>
												    <th>Total Qty</th>
												    
												      
											 	</tr></thead> 	

						 <tbody >
						 
					 <%
Map<String, Integer> duplicates = new HashMap<String, Integer>(); 

for (String str : s_code) { 
   if (duplicates.containsKey(str)) { 
      duplicates.put(str, duplicates.get(str) + 1); 
   } else { 
      duplicates.put(str, 1); 
   } 
}  

PreparedStatement pre_cus=conn.prepareStatement("Select  *  from credit_cust where company_code=? and cust_code1=? and cust_code2=?  ");

 
for (Map.Entry<String, Integer> entry : duplicates.entrySet()) { 
 

					 %>
				 
				    	    	 <tr>
						 
						 <td> <%= entry.getKey()%></td>
						 
						  <%
		    String cust1=entry.getKey().substring(0, 8);
			String cust2=entry.getKey().substring(8);
		    pre_cus.setString(1, comapny_code);
		    pre_cus.setString(2, cust1);
		    pre_cus.setString(3, cust2);
		     
	 
	 ResultSet rs_cus=pre_cus.executeQuery();
	if(rs_cus.next()){
	
	

		 %>
		 
						 <td><%=rs_cus.getString("cust_name") %></td>
						 <td><%=entry.getValue() %></td>
						 </tr>
				    	 
					<%
		 
					} 
}
%>	 
						 </tbody>
						 </table>
						 </div>
						 </div>	
                 
           
	 </div>
   </div>
   
   
<form >
		 
			
	 
		<center> <input type="submit" class="button" id="printpagebutton"  value="Print" onclick="printpage()" ></center>	
</form>
		
		
     
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


  <script>
						 
									 
								 
  
									  
							 

								 function printpage() {
									 
									 task="comfirm";
								 
								 	 var result = confirm("Are you sure to print?");
								 	    if(result){
								 	    	
								 	    	   
								 	    	     var print_header = document.getElementById("print_header").innerHTML;  
								 	    	     var detail_area = document.getElementById("detail_area").innerHTML;  
								 	    	     var summary = document.getElementById("summary").innerHTML;  
								 	    	     
											     var printWindow = window.open('', '', 'height=700,width=1000');  
											     printWindow.document.write('<html><head><title>Print  Content</title><h3>Agent Daily Received Report</h3>');  
											     printWindow.document.write('</head><body style="font-size:18px; ">');  
											     printWindow.document.write(print_header);  
											     printWindow.document.write(summary); 
											     printWindow.document.write('<hr>');  
											     printWindow.document.write(detail_area); 
											     printWindow.document.write('</body></html>');  
											     printWindow.document.close();  
											     printWindow.print();  
											  
								 	    }
								 }
									 </script>	 
 
	<script type="text/javascript">
 
 

    function show(view) {
      document.getElementById('main_place').innerHTML = document.getElementById(view).innerHTML;
    }
  	
    	 
    	 $(document).ready(function() {
    		 
    		 var checkRadio = document.querySelector('input[name="show"]:checked'); 
    		 
         if(checkRadio != null) {
            
        if (checkRadio.value=="detail"){ 
         
             show('detail_area');	
             }
            else{ show('summary');  }
         } 
        
    
   

	$('#basic-datatables').DataTable({
	});

	$('#multi-filter-select').DataTable( {
		"pageLength": 5,
		initComplete: function () {
			this.api().columns().every( function () {
				var column = this;
				var select = $('<select class="form-control"><option value=""></option></select>')
				.appendTo( $(column.footer()).empty() )
				.on( 'change', function () {
					var val = $.fn.dataTable.util.escapeRegex(
						$(this).val()
						);

					column
					.search( val ? '^'+val+'$' : '', true, false )
					.draw();
				} );

				column.data().unique().sort().each( function ( d, j ) {
					select.append( '<option value="'+d+'">'+d+'</option>' )
				} );
			} );
		}
	});

 
	
	// Add Row
	$('#add-row').DataTable({
		"pageLength": 5,
	});

	var action = '<td> <div class="form-button-action"> <button type="button" data-toggle="tooltip" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Edit Task"> <i class="fa fa-edit"></i> </button> <button type="button" data-toggle="tooltip" title="" class="btn btn-link btn-danger" data-original-title="Remove"> <i class="fa fa-times"></i> </button> </div> </td>';

	$('#addRowButton').click(function() {
		$('#add-row').dataTable().fnAddData([
			$("#addName").val(),
			$("#addPosition").val(),
			$("#addOffice").val(),
			action
			]);
		$('#addRowModal').modal('hide');

	});
});
	</script>
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