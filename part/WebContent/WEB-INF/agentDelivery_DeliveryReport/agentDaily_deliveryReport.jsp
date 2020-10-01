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
                        <h3>Agent Daily Delivery Report</h3>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.jsp"><i class="icon_house_alt"></i> Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Agent Daily Delivery Report</li>
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
												    <th>Trans_Date</th>
												    <th>Tracking Number</th>
												    <th> Product Amt</th>
												    <th>Delivery Charges</th>
												    <th>Total Amt</th>
												    
												   <th>Receiver name</th>
												    <th>Receiver Township</th>
												    <th>Receiver State</th>
												    
												     <th>Delivery Staff</th>
												  
												    <th><span style="writing-mode: vertical-lr; -ms-writing-mode: tb-rl; transform: rotate(180deg)">Delivered</span></th>
												    <th><span style="writing-mode: vertical-lr; -ms-writing-mode: tb-rl; transform: rotate(180deg)">Cancelled</span></th>
												    <th><span style="writing-mode: vertical-lr; -ms-writing-mode: tb-rl; transform: rotate(180deg)">Re_Deliver</span></th>
												      
											 	</tr></thead> 	<hr>

						 <tbody >
						 
		 		 <%
							 
									 PreparedStatement pre_registration=null;
		 							 

									 double total_amt=0.0;
									 double total=0.0;
									 
									 String trans_date;
									 String stat;
									 String deli_staff="";
									 
									 int delivered=0;
									 int cancelled=0;
									 int redelivery=0;
									 int total_dcr=0;
									 
									 int sh_totalamt=0;
									 int sh_product=0;
									 int sh_delich=0;
									 int sh_total=0;
									 
									 
									 List<String> s_code = new ArrayList<String>(); 
	 
				 
								 
										 pre_registration=conn.prepareStatement("Select  payment_code,rcvr_state,rcvr_township, rcvr_name,track_num,trans_date,stat,staff_code,deli_charges,trans_charges,product_amt from registration where company_code=? and agent_code=? ORDER BY CASE WHEN stat = 'D' THEN 1 WHEN stat = 'C' THEN 2 WHEN stat = 'R' THEN 3 END ASC,payment_code  ");
										 pre_registration.setString(1, comapny_code);
										 pre_registration.setString(2, agent_code); 
										  
									 
									     ResultSet rs_registration=pre_registration.executeQuery(); 
								 
									while(rs_registration.next())
									  {
								  
										  trans_date=rs_registration.getString("trans_date");
									 
								          String tdate=trans_date.substring(0, 10);
								    	 
								    	     if(dt.equalsIgnoreCase(tdate)){
								    	    	 
					 						 
												    	 PreparedStatement pre_staff=conn.prepareStatement("Select staff_name from staff where company_code=? and parent_agent_code =? and staff_code=?");
												    	 pre_staff.setString(1, comapny_code);
												    	 pre_staff.setString(2, agent_code);
												    	 pre_staff.setString(3, rs_registration.getString("staff_code"));
													     ResultSet rs_staff=pre_staff.executeQuery(); 
													     if(rs_staff.next()){
													    	 deli_staff= rs_staff.getString("staff_name");
													     }
				 	 
								    	  
								    	      s_code.add(rs_registration.getString("staff_code"));
								    	       stat=rs_registration.getString("stat");
								    	    
								    	    	  	total_amt +=Double.parseDouble( rs_registration.getString("deli_charges"))+Double.parseDouble( rs_registration.getString("trans_charges"));
													
										    	 	total +=total_amt;
										    	 	
										    	 	sh_totalamt=(int)total_amt;
										    	 	sh_product=(int)Double.parseDouble( rs_registration.getString("product_amt"));
										    	 	sh_delich=(int)Double.parseDouble( rs_registration.getString("deli_charges"));
										    	 	
										    	 	 if(stat.equalsIgnoreCase("D")){
										    	 		 
										    	 		 
										    	 		 delivered++; 
										    	 	 	
										    	 		 %>
										    	 		 
										    	 		 	<tr>
									        <td><%=tdate%></td>
									     	<td><%=rs_registration.getString("track_num")%></td>
									     	<td><%=sh_product%></td>
									     	<td><%=sh_delich%></td>
									     	<td><%=sh_totalamt%></td>
									      
									     	<td><%=rs_registration.getString("rcvr_name") %></td>
									     	<td><%=rs_registration.getString("rcvr_township") %></td>
									     	<td><%=rs_registration.getString("rcvr_state") %></td>
									     	<td><%=deli_staff %></td>
									     	 
									     	 <td>&#x25CF;</td>
									     	<td></td>
									     	<td></td>

									     	</tr>
									     	
										    	 		 <%
										    	 	 
										    	 	 }
										    	 	 
										    	 	 
										    	 	 
										    	     else if(stat.equalsIgnoreCase("C")){
										    	    	 cancelled++;
										    	    	 
										    	    	 %>
										    	 		 
										    	 		 	<tr>
									        <td><%=tdate%></td>
									     	<td><%=rs_registration.getString("track_num")%></td>
									     	<td><%=sh_product%></td>
									     	<td><%=sh_delich%></td>
									     	<td><%=sh_totalamt%></td>
									      
									     	<td><%=rs_registration.getString("rcvr_name") %></td>
									     	<td><%=rs_registration.getString("rcvr_township") %></td>
									     	<td><%=rs_registration.getString("rcvr_state") %></td>
									     	<td><%=deli_staff %></td>
									      
									     	<td></td>
									     	 <td>&#x25CF;</td>
									     	<td></td>

									     	</tr>
									     	
										    	 		 <%
										    	     }
										    	     else if(stat.equalsIgnoreCase("R")){
										    	    	 redelivery++;
										    	    	 
										    	    	 %>
										    	 		 
										    	 		 	<tr>
									        <td><%=tdate%></td>
									     	<td><%=rs_registration.getString("track_num")%></td>
									     	<td><%=sh_product%></td>
									     	<td><%=sh_delich%></td>
									     	<td><%=sh_totalamt%></td>
									      
									     	<td><%=rs_registration.getString("rcvr_name") %></td>
									     	<td><%=rs_registration.getString("rcvr_township") %></td>
									     	<td><%=rs_registration.getString("rcvr_state") %></td>
									     	<td><%=deli_staff %></td>
									      
									     	<td></td>
									     	<td></td>
									     	 <td>&#x25CF;</td>
									     	

									     	</tr>
									     	
										    	 		 <%
										    	     }

									           }
								     
								    	     }
									sh_total = (int) total;
									total_dcr=delivered+cancelled+redelivery;
								 
				 	    	     %>	  
											 				 
					 			 
											 </tbody>   
			     </table><hr>
			 <span style="padding: 20px"> Total  :  <%=sh_total %></span> 
			        <hr>
			 
			     
			    	<table style="width: 30%; padding-left: 20px;">
			    	<tr>
			    	<td>Delivered</td><td>:</td><td><%=delivered %></td>
			    	</tr>
			    	
			    	<tr>
			    	<td>Cancelled</td><td>:</td><td><%=cancelled %></td>
			    	</tr>
			    	
			    	<tr>
			    	<td>Re-Delivery</td><td>:</td><td><%=redelivery %></td>
			    	</tr>
			    	
			    	<tr>
			    	<td>Total</td><td>:</td><td><%=total_dcr %></td>
			    	</tr>
			    	</table>
			  </div>  	
		 
			</div>
			
			
			
			    <div id="summary" style="display:none;">
			    <label><h4>Summary</h4></label>
			    <div style="overflow-x:auto;">  
	   <table  class="display table table-striped table-hover" cellspacing="0" width="100%" style="text-align: center;">
						
						<thead >
												<tr>
												   
												    <th>Delivery Staff</th>
												    <th>Total Delivered</th>
												    <th>Total Cancelled</th>
												    <th>Total Re-Delivery</th>
												    <th>Total</th>
												    
												    
												      
											 	</tr></thead> 	

						 <tbody >
					 
						
						 
						 <%
					 
						 String ss;
						 String date;
						 String tdate;
						 String status;
						 String deli_staffsumm="";
						 
						 
						 int tD=0;
						 int tC=0;
						 int tR=0;
						 
						 int D=0;
						 int C=0;
						 int R=0;
						 int T=0;
						 LinkedHashSet<String> hashSet = new LinkedHashSet<>(s_code);
						 ss=hashSet.toString();
						 System.out.println("hash set   "+ss);
					     ss=ss.replace("[", "");
					     ss=ss.replace("]", "");
					 
					     String [] arr=ss.split(",");
					     for(int i=0;i<arr.length;i++){
					    	 
					    	 D=0;C=0;R=0;T=0;
					     
					    	 
					    	 

						PreparedStatement	 pre_summ=conn.prepareStatement("Select  trans_date,stat  from registration where company_code=? and agent_code=? and staff_code=?");
						pre_summ.setString(1, comapny_code);
						pre_summ.setString(2, agent_code); 
						pre_summ.setString(3, arr[i].trim()); 
							  
						 
						     ResultSet rs_summ=pre_summ.executeQuery(); 
					 
						while(rs_summ.next())
						  {
					  
							date=rs_summ.getString("trans_date");
						 
					         tdate=date.substring(0, 10);
					    	 
					    	     if(dt.equalsIgnoreCase(tdate)){
					    	    	 
					    	    	 
					    	    	 
					    	    	 status=rs_summ.getString("stat");
					    	    	 if(status.equalsIgnoreCase("D")){D++;tD++;}
					    	    	 else if(status.equalsIgnoreCase("C")){C++;tC++;}
					    	    	 else if(status.equalsIgnoreCase("R")){R++;tR++;}
					    	    	 
					    	    	 
					    	     }
					    	 }
						T=D+C+R;
						
						 PreparedStatement pre_staff=conn.prepareStatement("Select  staff_name from staff where company_code=? and parent_agent_code =? and staff_code=?");
				    	 pre_staff.setString(1, comapny_code);
				    	 pre_staff.setString(2, agent_code);
				    	 pre_staff.setString(3, arr[i].trim());
					     ResultSet rs_staff=pre_staff.executeQuery(); 
					     if(rs_staff.next()){
					    	 deli_staffsumm= rs_staff.getString("staff_name");
					     }
						
						 %>
		    	    	 
		    	    	  <tr>
			 <td><%=deli_staffsumm%></td>
			 <td><%=D%></td>
			 <td><%=C%></td>
			 <td><%=R%></td>
			 <td><%=T%></td>
			 </tr>
			 
		    	    	 <% 
					    	 
					     }
					        
						 %>
		 <hr>
						  <tr style="border: 1px solid blue">
						 <th>Total</th>
						 <th><%=tD %></th>
						 <th><%=tC %></th>
						 <th><%=tR %></th>
						 <th></th>
						 </tr>
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
											     printWindow.document.write('<html><head><title>Print  Content</title><h3>Agent Daily Delivery Report</h3>');  
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