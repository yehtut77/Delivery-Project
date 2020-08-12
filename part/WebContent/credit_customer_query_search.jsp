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
    String username=(String)session.getAttribute("username"); 
	String staff_name=(String)ssss.getAttribute("staffName");
	String ccode=(String)ssss.getAttribute("companyCode");
	String agent_code=(String)ssss.getAttribute("parent_agent_code");
	String staff_code=(String)ssss.getAttribute("staffCode");
   
    String name =request.getParameter("name");
    String phone =request.getParameter("phone");
    String code=request.getParameter("code");

try{  
 
	//Connection con=DriverManager.getConnection("jdbc:mysql://localhost/delivery1","root","root");
	Connection con=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
   
   
    %>

<html>
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

<%

  String query="Select * from credit_cust";

Statement stmt = con.createStatement();
	
ResultSet rs=stmt.executeQuery(query);  



%>
                                    <div class="table-responsive">
										<table  id="display-table" class="display table table-striped table-hover" class="table"  width="100%">
																	<!-- <thead> -->
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
											
											
											
														<!-- <tbody> -->
											<tbody>
											
											
											
											
											
											
<%

while(rs.next()){
	String name1=rs.getString("cust_name");
	String phone1=rs.getString("cust_phone");
	String code1=rs.getString("cust_code1");
	String code2=rs.getString("cust_code2");
	
	String custcode=code1+code2;
	
	System.out.print("your add code is="+custcode);
	if(name1.equalsIgnoreCase(name)){
  
		
 %>





							


<tr ><td><%=custcode%></td><td><%=rs.getString("cust_name")%></td><td><%=rs.getString("cust_phone")%></td>  
<td><%=rs.getString("currency")%></td><td><%=rs.getString("cust_state")%></td><td><%=rs.getString("cust_township")%></td>
<td><%=rs.getString("cust_email")%></td>
</tr> 




<% 
//end of else for rs.isBeforeFirst  
}
	
	else if(phone1.equalsIgnoreCase(phone)){
		
		%>

		<tr ><td><%=custcode%></td><td><%=rs.getString("cust_name")%></td><td><%=rs.getString("cust_phone")%></td>  
<td><%=rs.getString("currency")%></td><td><%=rs.getString("cust_state")%></td><td><%=rs.getString("cust_township")%></td>
<td><%=rs.getString("cust_email")%></td>
</tr> 
<% 
		
		
		
	}
	
else if(custcode.equalsIgnoreCase(code)){
		
		%>

		<tr ><td><%=rs.getString("cust_code1") %><%=rs.getString("cust_code2")%></td><td><%=rs.getString("cust_name")%></td><td><%=rs.getString("cust_phone")%></td>  
<td><%=rs.getString("currency")%></td><td><%=rs.getString("cust_state")%></td><td><%=rs.getString("cust_township")%></td>
<td><%=rs.getString("cust_email")%></td>
</tr> 
<% 
		
		
		
	}
else{
	
	%>

	

<% 
	
	
	
}


}


	

//end of else 
con.close();  
}catch(Exception e){out.print(e);}  
 


%>
</table>
</div>

	<script>
function myFunction() {
	  var rowCount = $("#basic-datatables td").closest("tr").length;
  document.getElementById("demo").innerHTML =rowCount;
}
</script>
		<!-- Warehouse  Query   count end   -->

	
		<!-- Warehouse  Query  list  table  start -->
	<script >
		$(document).ready(function() {
			$('#basic-datatables').DataTable({
				 dom: 'Bfrtip'
			});
	
		});
	</script>
<script>


</script>

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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</body>
</html>