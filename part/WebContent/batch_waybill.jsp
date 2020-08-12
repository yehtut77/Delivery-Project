<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    HttpSession ssss=request.getSession(false);  
	String n=(String)session.getAttribute("amname"); 
	String staff_name=(String)ssss.getAttribute("staff_name");
	String ccode=(String)ssss.getAttribute("ccode");
	String agent_code=(String)ssss.getAttribute("staff");
	String staff_code=(String)ssss.getAttribute("agent");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Myanmar Delivery</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://cdn.rawgit.com/unconditional/jquery-table2excel/master/src/jquery.table2excel.js"></script>
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
var n1='<%=n%>';

if(n1=="null"){
	window.location.replace("https://www.delivery.teamramen.net/Login.jsp");
}



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
<body>

    <!-- /Preloader -->

    <!-- Header Area Start -->
    <header class="header-area">
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
                                    
                                    <li class="active"><a href="register.jsp">WayBill</a>
                                    </li><li ><a href="#">Batch WayBill</a>
                                    </li>
                                      <li><a href="credit_customer.jsp">Credit Customer</a></li>
                                    
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

    <script type="text/javascript">
    $(document).ready(function(){
    	$("#file_path").change(function(){
    		var file_path=$("#file_path").val();
    		var text=file_path.substr(-5);
    		
    		if(text==".xlsx"){
    			
    		}
    		else{
    			alert("File type dose not match.");
    			$("#file_path").val("");
    		}
    	});
    	
    	
    });
    	
    
    </script>
<br>
      <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumb-content">
                        <h3> Waybill Creation</h3>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.jsp"><i class="icon_house_alt"></i> Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Register</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        
<div class="row">
<div class="col-6">
<h4>Instructions</h4>
<ul>
<li><p></p></li>


</ul>

</div>
<form action="upload_excel" enctype ="multipart/form-data" method="post" id="file">
<input type="hidden" value="<%=staff_name%>" name="staff_name" id="staff_name">
<input type="hidden" value="<%=agent_code%>" name="agent_code" id="agent_code">
<input type="hidden" value="<%=ccode%>" name="ccode" id="ccode">
<input type="hidden" value="<%=staff_code%>" name="staff_code" id="staff_code">
<div class="col-6">

<lable>Please Choose Your File:</lable><input type="file" name="file_path" id="file_path" required/>

</div>
<br>
<button type="submit" class="btn btn-primary">Upload</button>
</form>
</div>
        </div>



 
</body>
</html>