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
.markcen{
    text-align:center;
    width: 100px;
}

#myUL li a:hover:not(.header) {
  background-color: green;
}

 .ui-datepicker-calendar {
    display: none;
    }

#oftab{
overflow:auto;
}

#oftabc{
overflow:auto;
}
	 
#what{
overflow:auto;
}
	 
#ca2{
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
var vvv=0;
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
                        <h3>Monthly Income Report</h3>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.jsp"><i class="icon_house_alt"></i> Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Monthly Income Report</li>
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
<div class="col-12">
  <div class="form-group"> 
          <label style="font-size:15px; font-weight: bold;">Date</label>   
        <label class="pure-material-textfield-outlined">
		<input type="date" value=""  name="fdate" id="fdate" placeholder=" " required  onchange="alertfun()"/>
		</label>
        </div>  
      

       </div>
    
</div>

  <div class="row">
<div class="col-12">
  <div class="form-group"> 
          <label style="font-size:15px; font-weight: bold;" id="monthd"> </label>   
                 <label style="font-size:15px; font-weight: bold;" id="yeard"> </label>   

        </div>  

       </div>
    
</div>
 
</div>

  
</div>
   
 </div>

 <div class="col-6">
   <div class="card" id="oftabc">

   <table id="basic-datatables-fir" class="table">
  <thead>
    <tr>
      <th scope="col" id="fbf2">Forecast Budget for </th>
     <td id="fbf"></td>
    </tr>
     <tr>
      <td scope="col" ><b>Credit Income</b></th>
     <td id="ttr"></td>
    </tr>
  </thead>
  <tbody>
   
</tbody>
</table>  </div>
   </div>
 </div> 
 
   
   <br><br>
  	<div class="row" id="">
	
 <div class="col-12" >
	<div class="card" id="">

  <div class="m" id="" style="margin:10px;">
  <div class="row"><div class="col-12"><h5>Details	
</h5></div></div>
 <div class="row">
 <div class="col-12">

   <table id="basic-datatables-sec" class="table">
  <thead>
    <tr>
       <th scope="col" >Agent Code</th>
      <th scope="col" > Agent Name </th>
      <th scope="col" > Credit Income </th>

      
    </tr>
  </thead>
  <tbody>
   
</tbody>
</table> 
  
</div>

 	<br><br>
 	
   <br>  
       

         
       </div>

 
 
 
 
</div>

  
</div>
  
 </div>
 </div>
  <br><br>
  <div class="card" id="refamtc">
   <div id="refamt" class="row">
   <br><br>
    <div class="col-4">
    </div>
   <div class="col-4">
    <div class="form-group"> 
	  <br>
    	 <label id="lb1" style="font-size:15px;"><b> Total </b></label>   

    </div>  </div>
   <div class="col-4">
     <div class="form-group"> 
	  <br>
      			<input type="text" value="" style="width:80px;" name="" id="trtr" placeholder=" " class="form-control" disabled/>

    </div> 
   </div>
  </div>
     
   </div>
   <br><br>
        <center><input type="button" onclick="ff()" class="btn delivery-btn1 btn-3 mt-15 active" value=" Submit "/> </center>   

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
       
 
 
<script>

  $("#fdate").focusout(function() {
      $("#basic-datatables-sec tbody tr").remove(); 
    document.getElementById("ttr").innerHTML="";
  document.getElementById("fbf").innerHTML="";
  $("#trtr").val(" ");
   var fulldate=$("#fdate").val();
var sm=fulldate.substring(5,7);
var sy=fulldate.substring(0,4);
if(sm==1){sm="January";}
if(sm==2){sm="February";}
if(sm==3){sm="March";}
if(sm==4){sm="April";}
if(sm==5){sm="May";}
if(sm==6){sm="June";}
if(sm==7){sm="July";}
if(sm==8){sm="August";}
if(sm==9){sm="September";}
if(sm==10){sm="October";}
if(sm==11){sm="November";}
if(sm==12){sm="December";}
var smm=fulldate.substring(5,7);

document.getElementById("monthd").innerHTML=sm;
document.getElementById("yeard").innerHTML=sy;
var smsy=sm+" "+sy;
$('#para1').val(smsy);
var firstth="Forecast Budget for "+smsy;
document.getElementById("fbf2").innerHTML=firstth;
   var fulldate=$("#fdate").val("F");
$.ajax({
						    		url: "MIRC",
						    		type: 'POST',
						    		data: {
						    		    month:smm,
						    		    year:sy
						    		},
						    		success: function(data) {
						    		    var data2=data.trim();
                                         var ress = data2.split("*");
                                         document.getElementById("ttr").innerHTML=ress[0];
                                         document.getElementById("fbf").innerHTML=ress[3];
                                        $("#trtr").val(ress[0]);
                                        $("#para2").val(ress[3]);
                                        $("#para3").val(ress[2]);
                                      $("#para4").val(ress[1]);
                                         var res=ress[2].split("^");
                                        for(var i=1;i<=ress[1];i++){
                                         var each=res[i].split("$");
                                          var markup2 ="<tr>"+"<td>"+each[0]+"</td>"+
				                                "<td>"+each[1]+"</td>"+
				                                "<td>"+each[2]+"</td>"+
										     "</tr>";
					     var mk3=markup2.trim();
				$("#basic-datatables-sec tbody").append(mk3);
                                        }
                                        new sorttab();
                                        var totalf=$('#trtr').val();
                                        var ctotalf=$('#para2').val();
                                        var count=totalf.length;
                                        var flag=0;
                                        for(var i=0;i<count;i++){
                                         if(totalf.charAt(i)=="."){flag=1;}
                                        }
                                        if(flag==0){totalf=totalf+".00";}
                                        var count2=ctotalf.length;
                                        var flagc=0;
                                        for(var ii=0;ii<count2;ii++){
                                         if(ctotalf.charAt(ii)=="."){flagc=1;}
                                        }
                                        if(flagc==0){ctotalf=ctotalf+".00";}
                                    new CommaFormatted(totalf,ctotalf);

            						    		}
  });
   });
   
   
   function openWindowWithPost(url, windowoption, name, para1,para2,para3,para4,para5)
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
	         var input4 = document.createElement('input');
	         input4.type = 'hidden';
	         input4.name = "para4";
	         input4.value = para4;
	         var input5 = document.createElement('input');
	         input5.type = 'hidden';
	         input5.name = "para5";
	         input5.value = para5;
	         form.appendChild(input);
	        form.appendChild(input2);
	         form.appendChild(input3);
	         form.appendChild(input4);
	         form.appendChild(input5);
	         document.body.appendChild(form);
	         form.submit();
	         document.body.removeChild(form);
	 }
	  function ff(){
		  alert("If you are using on android , then rotates your device ! Then click OK");
var p1=$("#trtr").val();
var p2=$("#para1").val();
var p3=$("#para2").val();
var p4=$("#para3").val();
var p5=$("#para4").val();
  		var para1=p1;
  		var para2=p2;
  		var para3=p3;
  		var para4=p4;
  		var para5=p5;
openWindowWithPost("MIRPDF",'statusbar=no','title',para1,para2,para3,para4,para5);
	  }
</script>
<input type="text" id="para1" hidden >
<input type="text" id="para2" hidden>
<input type="text" id="para3" hidden>
<input type="text" id="para4" hidden>

<script>
function sorttab(){
var table, rows, switching, i, x, y, shouldSwitch;
  table = document.getElementById("basic-datatables-sec");
  switching = true;
  /*Make a loop that will continue until
  no switching has been done:*/
  while (switching) {
    //start by saying: no switching is done:
    switching = false;
    rows = table.rows;
    /*Loop through all table rows (except the
    first, which contains table headers):*/
    for (i = 1; i < (rows.length - 1); i++) {
      //start by saying there should be no switching:
      shouldSwitch = false;
      /*Get the two elements you want to compare,
      one from current row and one from the next:*/
      x = rows[i].getElementsByTagName("TD")[0];
      y = rows[i + 1].getElementsByTagName("TD")[0];
      //check if the two rows should switch place:
      if (Number(x.innerHTML) > Number(y.innerHTML)) {
        //if so, mark as a switch and break the loop:
        shouldSwitch = true;
        break;
      }
    }
    if (shouldSwitch) {
      /*If a switch has been marked, make the switch
      and mark that a switch has been done:*/
      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      switching = true;
    }
  }}
  
  function CommaFormatted(amount,amountz) {
	var delimiter = ","; // replace comma if desired
	var a = amount.split('.',2)
	var d = a[1];
	var i = parseInt(a[0]);
	if(isNaN(i)) { return ''; }
	var minus = '';
	if(i < 0) { minus = '-'; }
	i = Math.abs(i);
	var n = new String(i);
	var a = [];
	while(n.length > 3) {
		var nn = n.substr(n.length-3);
		a.unshift(nn);
		n = n.substr(0,n.length-3);
	}
	if(n.length > 0) { a.unshift(n); }
	n = a.join(delimiter);
	if(d.length < 1) { amount = n; }
	else { amount = n + '.' + d; }
	amount = minus + amount;
		var delimiterz = ","; // replace comma if desired
	var az = amountz.split('.',2)
	var dz = az[1];
	var iz = parseInt(az[0]);
	if(isNaN(iz)) { return ''; }
	var minusz = '';
	if(iz < 0) { minusz = '-'; }
	iz = Math.abs(iz);
	var nz = new String(iz);
	var az = [];
	while(nz.length > 3) {
		var nnz = nz.substr(nz.length-3);
		az.unshift(nnz);
		nz = nz.substr(0,nz.length-3);
	}
	if(nz.length > 0) { az.unshift(nz); }
	nz = az.join(delimiterz);
	if(dz.length < 1) { amountz = nz; }
	else { amountz = nz + '.' + dz; }
	amountz = minusz + amountz;
 $('#trtr').val(amount);
  $('#para2').val(amountz);
 document.getElementById("ttr").innerHTML=amount;
 document.getElementById("fbf").innerHTML=amountz;
}

function CommaFormattedTwo() {

}
</script>
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
		

<script>


function closemod(){
    $('#myModal2').hide();
        $('#myModal1').hide();

}

</script>
</body>



</html>