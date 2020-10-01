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
	<%
	 HttpSession ssss=request.getSession(false);  
    
		String staff_name=(String)ssss.getAttribute("staffName");
		String ccode=(String)ssss.getAttribute("companyCode");
		String agent_code=(String)ssss.getAttribute("parent_agent_code");
		String staff_code=(String)ssss.getAttribute("staffCode");
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
        
       <!-- <script>
 
 
 $(document).ready(function () {
	     $('#dbType').change(function () {
	       
	        var a=document.getElementById("code");
	        $('#code').removeAttr("disabled");
	        $("#basic-datatables > tbody").empty();
	        a.value="";
	 	       
	    });

	});
	


function searchInfo(){ 
	 var code= document.vinform.code.value
	 var type=document.getElementById("dbType").value;
	
	  if ($("#dbType").val() ==="code")			
	    {   
		
		  var code1=code.substring(0,8);
		  var code2=code.substring(8);
		  
		  $.ajax({
				url: "credit_customer_query_search.jsp",
			    type: 'POST',
				data: {code1:code1,code2:code2,type:type},
				success: function(data) {

					var trck = data.trim();
					//  tableBody = $("table tbody"); 
	                 // tableBody.append(trck); 
					//var text=document.getElementById('mylocation');
					//text.innerHTML=trck;  
					  if(trck!="ok"){
					     var nameArr = trck.split(',');
					  data1 =   "<tr><td>" 
	                      +nameArr[0]+"</td><td>"
	                      +nameArr[1]+"</td><td>"
	                      +nameArr[2]+"</td><td>"
	                      +nameArr[3]+"</td><td>"
	                      +nameArr[4]+"</td><td>"
	                      +nameArr[5]+"</td><td>"
	                      +nameArr[6]+"</td></tr>"; 
	                      $("#basic-datatables > tbody").empty();
	                     tableBody = $("table tbody"); 
	                     tableBody.append(data1); 
					  }else{
							 $('#rowsoftb').append("No data available"); 
				 
						 }
				 
				}
			
		  });

	    }
	      
	    
	   
	    
	       
	
	    else										
	    { 
	    	$("#otherServer").show();
	    	$.ajax({
			url: "credit_customer_query_search.jsp",
		    type: 'POST',
			data: {code:code,type:type},
			success: function(data) {
			
				var trck = data.trim();
				//  tableBody = $("table tbody"); 
                 // tableBody.append(trck); 
				//var text=document.getElementById('mylocation');
				//text.innerHTML=trck;  
			 if(trck!="ok"){
				 var nameArr = trck.split(',');
				  data1 =   "<tr><td>" 
                     +nameArr[0]+"</td><td>"
                     +nameArr[1]+"</td><td>"
                     +nameArr[2]+"</td><td>"
                     +nameArr[3]+"</td><td>"
                     +nameArr[4]+"</td><td>"
                     +nameArr[5]+"</td><td>"
                     +nameArr[6]+"</td></tr>"; 
      
                     $("#basic-datatables > tbody").empty();
                    tableBody = $("table tbody"); 
                    tableBody.append(data1); 
				 
				 	
			 }else{
				 $('#rowsoftb').append("No data available"); 
	 
			 }
			 
			}
		
	  });
	    
	}  
	    

} 


</script>  -->
<script>
 
 
 $(document).ready(function () {
 $("#mylocation").on('click',function() {
$('table tbody tr  td').on('click',function(){
	
	var  phone=$(this).closest('tr').children()[2].textContent;
	
	var  curr=$(this).closest('tr').children()[3].textContent;
	 
	 $("#p").val(phone);
	 $("#c").val(curr);
	 $("#f").submit();

});
	});
 
 
	     $('#dbType').change(function () {
	       
	        var a=document.getElementById("code");
	        $('#code').removeAttr("disabled");
	        $("#basic-datatables > tbody").empty();
	        a.value="";
	 	       
	    });

	});
 </script>

<div class="container">
  <form id="f" action="credit_customer.jsp" method="post">
  <input type="hidden" value="" name="curr" id="c">
  <input type="hidden" value="" name="phone" id="p">
  </form>

  
 <div class="card">
<div class="card-body">		
 <div class="form-group">   
<h4>Credit Customer Detail</h4>	

</div>	


<div class="row">
<div class="col-12">

<div class="form-group">   	 
<div style="overflow: auto;">
 <table id="basic-datatables" class="display table table-striped table-hover" cellspacing="0" width="100%">
					<thead>

												<tr>
												
													
												    <th>Customer Code</th>
												    <th>Customer Name</th>
												    <th>Customer Phone</th>
												    <th>Currency</th>
												    <th>State</th>
												    <th>Township</th>
												    <th>Email</th>
										 
												

											 
											</tr>
											</thead>	
											<tbody>
											<%
											
											try{  
												 
												 Connection con=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
												 PreparedStatement pre=con.prepareStatement("Select * from credit_cust where company_code=?");
												 pre.setString(1, ccode);
												 ResultSet rs=pre.executeQuery(); 
											
											
												 while(rs.next()){
													  %>
													 <tr><td><%=rs.getString("cust_code1")%><%=rs.getString("cust_code2")%></td>
													 <td><%=rs.getString("cust_name")%></td>
													 <td><%=rs.getString("cust_phone")%></td>
													 <td><%=rs.getString("currency")%></td>
													 <td> <%=rs.getString("cust_state")%></td>
													 <td><%=rs.getString("cust_township")%></td>
													 <td><%=rs.getString("cust_email")%></td>
													 </tr>
									
													<% 
													//end of else for rs.isBeforeFirst  
													}
										           %>
											
											
											
											
											 
											</tbody>			
											
														<!-- <tbody> -->
											 
 							</table>
 							
 							</div>
 						
 		</div>
 		
</div>


</div>

</div>
</div> 
</div><br><br> 
 
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
									

							<input hidden type="text" value="" id="module">
						<!-- 	Card -->
				
			
			<!-- 	End  Content -->
			
			
		

 
	<script > 
	
 
 
	 function read() {
		 
			var read_message=document.getElementById("read_message");
		 read_message.textContent="unread";
	       read_message.style.color = "red" ;

		  document.getElementById("read_message").innerHTML =  "Unread ";
	 }
 	

	</script>
			
 
	<!-- Datatables -->
	<script src="assets/js/plugin/datatables/datatables.min.js"></script>
	
			
	
	
	<script >
	
		$(document).ready(function() {
			

			
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
	<% pre.close();
    	rs.close();
	//end of else for rs.isBeforeFirst  


//end of else 
con.close();  
}catch(Exception e){out.print(e);}  
 


%>
	
</body>
</html>