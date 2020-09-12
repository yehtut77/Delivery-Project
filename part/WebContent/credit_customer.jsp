<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
 <%@ page import="java.sql.*"%>  
  <%@page import="java.text.SimpleDateFormat,java.util.Date"%>
            <%@ page import="java.time.format.DateTimeFormatter" %>
            <%@ page import="java.util.Calendar" %>
    <%@ page import="java.time.*" %>
 <%//Connection con=DriverManager.getConnection("jdbc:mysql://localhost/delivery1","root","root");
 Connection con=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");

 HttpSession ssss=request.getSession(false);  
	String n=(String)session.getAttribute("staffName"); 
	String staff_name=(String)ssss.getAttribute("staffName");
	String ccode=(String)ssss.getAttribute("companyCode");
	String agent_code=(String)ssss.getAttribute("parent_agent_code");
String currency=request.getParameter("curr");
String phone=request.getParameter("phone");


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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB7J1zsErb9_7jxNu5KU5kIENFObAQEbl0&sensor=false">
</script> -->

 <!-- <script type="text/javascript">
 
 function Search(){
	var e = document.getElementById("select");
	var location = e.options[e.selectedIndex].text;

	
	var latlng= e.options[e.selectedIndex].value;
	
	var nameArr = latlng.split(',');
	
	
 
	 var mapOptions = 
     {
       center: new google.maps.LatLng(nameArr[0],nameArr[1]),
       zoom: 14,
       mapTypeId: google.maps.MapTypeId.ROADMAP
     };
     
      var map = new google.maps.Map(document.getElementById("map-canvas"),
         mapOptions);
     
    
     	     var marker1 = new google.maps.Marker({
              position: new google.maps.LatLng(nameArr[0],nameArr[1]),
              map: map
            });

      

      }

  

    </script> -->

<!-- 
<script type="text/javascript">
function revealServer() {
    var network = document.getElementById('network');
    var serverBox = document.getElementById('serverBox');
    if(network.checked == true) {
        serverBox.style.display = "block";
        document.getElementById('server').checked = false;
       
    } else {
        serverBox.style.display = "none";
       
    }
}
  
</script>


<script>
function myFunction() {
    var input, filter, ul, li, a, i, txtValue;
    input = document.getElementById("myInput");
    filter = input.value.toUpperCase();
    ul = document.getElementById("myUL");
    li = ul.getElementsByTagName("li");
    for (i = 0; i < li.length; i++) {
        a = li[i].getElementsByTagName("a")[0];
        txtValue = a.textContent || a.innerText;
        if (txtValue.toUpperCase().indexOf(filter) > -1) {
            li[i].style.display = "";
        } else {
            li[i].style.display = "none";
        }
    }
}
</script> -->




 	
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
<%

   
    
    
    String companytype=(String)ssss.getAttribute("companyType");
    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MMM-yyyy");
    LocalDateTime now = LocalDateTime.now();

    String date=dtf.format(now);
    
       
	%>
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
                                      <li class="active"><a href="credit_customer.jsp">Credit Customer</a></li>
                                    
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
    
    
     <script>
     
     	


	

	$(document).ready(function(){
		 var maxLength = 35;
			$('.limit').keyup(function() {
			  var textlen = maxLength - $(this).val().length;
			  if( $(this).val().length>=35){
				  alert("Each Address box can contain 35 characters");
			  }
			});

	var curr='<%=currency%>';
var p='<%=phone%>';
if(curr!="null" && p!="null")
{	$("#s_curr option").filter('[value=' + curr + ']').prop("selected", true);
	$('#phone').val(p);
    $("#customSwitch1").prop("checked",true);
    	$.ajax({
		    		url: "edit_creditcust.jsp",
		    		type: 'POST',
		    		
		    		data: {
		    			phone:p,
		    			
		    			curr:curr,
		    			type:"edit",
		    			
		    		    
		    		},
		    		success: function(data) {
		    		//$('#city_name').val(data);
		    		
		    		
		    		if(data.trim()=="not"){
		    			
		    		
		    			$('#name').val("");
			    		$('#addr1').val("");
			    		$('#addr2').val("");
			    		$('#addr3').val("");
			    		$('#addr4').val("");
			    		$('#s_postcode').val("");
			    		$('#email').val("");
			    		$('#bname').val("");
			    		$('#busername').val("");
			    		$('#accno').val("");
			    		$("#bcard option").filter('[value=0]').prop("selected", true);
			    		$("#emonth option").filter('[value=0]').prop("selected", true);
			    		$("#eyear option").filter('[value=0]').prop("selected", true);
			    		
			    		$("#country").val("---Select---").prop("selected", true);
			    		$("#select1 option").filter('[value=0]').prop("selected", true);
						$("#select2 option").filter('[value=0]').prop("selected", true);
						$("#select3 option").filter('[value=0]').prop("selected", true);
						$("#select4 option").filter('[value=0]').prop("selected", true);
							$('#username').val("");
		    	
		    			$('#psw').val("");
		    			$('#confirm').val("");
		    		}
		    		else{
		    	
		    		
		    		var arr=data.trim().split("$");
		    	
		    		
		    		
		    		
		    		
		    		
		    		$('#name').val(arr[0]);
		    		$('#addr1').val(arr[1]);
		    		$('#addr2').val(arr[2]);
		    		$('#addr3').val(arr[3]);
		    		$('#addr4').val(arr[4]);
		    		$('#s_postcode').val(arr[5]);
		    		$("#country option").filter('[value=' +arr[6]+ ']').prop("selected", true);
		    		$('#email').val(arr[7]);
		    		$("#bcard option").filter('[value=' +arr[8]+ ']').prop("selected", true);
		    		$('#busername').val(arr[9]);
		    		$('#accno').val(arr[10]);
		    		$("#emonth option").filter('[value=' +arr[11]+ ']').prop("selected", true);
		    		$("#eyear option").filter('[value=' +arr[12]+ ']').prop("selected", true);
		    		$('#bname').val(arr[13]);
		    		$('#username').val(arr[14]);
		    	
		    			$('#psw').val(arr[15]);
		    			$('#confirm').val(arr[15]);
		    		
		    		var s=arr[5];
		    		var f=s.substring(0,2);
					var f1=s.substring(0,4);
					var f2=s.substring(0,6);
					var f3=s.substring(0,8);
					$("#select1 option").filter('[about=' + f + ']').prop("selected", true);
					$("#select2 option").filter('[id=' + f1 + ']').prop("selected", true);
					$("#select3 option").filter('[about=' + f2 + ']').prop("selected", true);
					$("#select4 option").filter('[about=' + f3 + ']').prop("selected", true);
		    		} 
		    		
		    		
		    		
		    		
		    		}
		}); 
}

		$("#s_curr option").filter('[value=' + 'MMK' + ']').prop("selected", true);
		var s1_id="hello";
		var s2_id;
		var s3_id;
		var s4_id;
		var post_code;
		var f_state;
		var t_state;
		var f_township;
		var t_township;
		
		$('#s_postcode').on('input', function() {
			 $('#select2').prop("disabled", true);
			 $('#select3').prop("disabled", true);
			 $('#select4').prop("disabled", true);
			 $("#select1").val("---Select---").prop("selected", true);
			 $("#select2").val("---Select---").prop("selected", true);
			 $("#select3").val("---Select---").prop("selected", true);
			 $("#select4").val("---Select---").prop("selected", true);
			 
			var input1=document.getElementById("s_postcode").value;
			 
			var f=input1.substring(0,2);
			var f1=input1.substring(0,4);
			var f2=input1.substring(0,6);
			var f3=input1.substring(0,8);
			
			
			f_state=$("#select1 option").filter('[about=' + f + ']').prop("selected", true).attr("value");
			f_township=$("#select2 option").filter('[id=' + f1 + ']').prop("selected", true).attr("value");
			$("#select3 option").filter('[about=' + f2 + ']').prop("selected", true);
			$("#select4 option").filter('[about=' + f3 + ']').prop("selected", true);
			
			
		});


		$("#select1").change(function() {
			
			$('#select2').removeAttr("disabled");
			f_state=$(this).children(":selected").attr("value");
			s1_id=$(this).children(":selected").attr("about");
			
			if($('#select3').data('options')===undefined){}
			else {
				 $('#select3').prop("disabled", true);
				 $('#select4').prop("disabled", true);
				// $('#select3').attr("value","");
				 $('#select3').html("");
				 $('#select4').html("");
			}
			
			  if ($(this).data('options') === undefined) {
			    /*Taking an array of all options-2 and kind of embedding it on the select1*/
			    $(this).data('options', $('#select2 option').clone());
			  }	 
		  		var options = $(this).data('options').filter('[about=' + s1_id + ']');  
		  		$('#select2').html(options);
		 		$("#select2").val($("#select2 option:first").prop("selected",true));
		 		post_code=s1_id;
			/* var input=document.getElementById("s_postcode");
			//alert(post_code);
			input.value=post_code; */
			$("#s_postcode").val(post_code+"000000");
		  
		  
		  $('#select2').change(function() {	
			  $('#select3').removeAttr("disabled");
			  f_township=$(this).children(":selected").attr("value");
			  if ($(this).data('options') === undefined) {
			    /*Taking an array of all options-2 and kind of embedding it on the select1*/
			    $(this).data('options', $('#select3 option').clone());
			  }
			  
			  s2_id=$(this).children(":selected").attr("id");		  
			  var option = $(this).data('options').filter('[id=' + s2_id + ']');
			  $('#select3').html(option);
			  $("#select3").val($("#select3 option:first").prop("selected",true));
			  post_code=s2_id;
				
				//alert(post_code);
				$("#s_postcode").val(post_code+"0000");
			  
			  $('#select3').change(function() {
				  $('#select4').removeAttr("disabled");
				  if ($(this).data('options') === undefined) {
					    /*Taking an array of all options-2 and kind of embedding it on the select1*/
					    $(this).data('options', $('#select4 option').clone());
					  }
					
					s3_id=$(this).children(":selected").attr("about");
					var option = $(this).data('options').filter('[id=' + s3_id + ']');
					$('#select4').html(option);
					$("#select4").val($("#select4 option:first").prop("selected",true));
				
					post_code=s3_id;
					var input=document.getElementById("s_postcode");
					//alert(post_code);
					$("#s_postcode").val(post_code+"00");
					
					
					$("#select4").change(function() {				
						
									
					  var id3= $(this).children(":selected").attr("about");	 
					  post_code=id3;
					  var input1=document.getElementById("s_postcode");
						//alert(post_code);
						input1.value=post_code;
				  
			  });

					 
					 
			  
			  });//end of #select3
			  
			 
		  
		  });
		  
		  
		});
			$('.creditCardText').keyup(function() {
        	  var foo = $(this).val().split("-").join(""); // remove hyphens
        	  if (foo.length > 0) {
        	    foo = foo.match(new RegExp('.{1,4}', 'g')).join("-");
        	  }
        	  $(this).val(foo);
        	});
		 var flag=false;
		 $("#customSwitch1").click(function(){
	            if($(this).prop("checked") == true){
	                 flag=true;
	                 $("#psw").prop("required",false);
	                 $("#confirm").prop("required",false);
	            }
	            else if($(this).prop("checked") == false){
	                 flag=false;
	                  $("#psw").prop("required",true);
	                 $("#confirm").prop("required",true);
	             	$('#name').val("");
		    		$('#addr1').val("");
		    		$('#addr2').val("");
		    		$('#addr3').val("");
		    		$('#addr4').val("");
		    		$('#s_postcode').val("");
		    		$('#email').val("");
		    		$('#bname').val("");
		    		$('#busername').val("");
		    			$('#phone').val("");
		    		$('#accno').val("");
		    		$("#bcard").val('---Card Type---').prop("selected", true);
		    		$("#emonth").val('---Card Type---').prop("selected", true);
		    		$("#eyear").val('---Card Type---').prop("selected", true);
		    		
		    		$("#country").filter('[value=01]').prop("selected", true);
		    	$("#select1").val("---Select---").prop("selected", true);
						 $("#select2").val("---Select---").prop("selected", true);
						 $("#select3").val("---Select---").prop("selected", true);
						 $("#select4").val("---Select---").prop("selected", true);
					$('#username').val("");
		    	
		    			$('#psw').val("");
		    			$('#confirm').val("");
	            }
	        });
		
		  
		 $("#credit_form").submit(function() {

$("#select2").prop("disabled",false);
$("#select3").prop("disabled",false);
$("#select4").prop("disabled",false);
if(flag==false){
			    $.ajax({
			     type: "POST",
			      url: "credit_customer_add.jsp",
			      data: $("#credit_form").serialize(),
			      success: function() {
			        // callback code here
			        alert("Added Successfully.");
			       }
			    });
}
else if(flag==true){
	  $.ajax({
		     type: "POST",
		      url: "edit_creditcust.jsp",
		      data: $("#credit_form").serialize(),
		    	  
		      
		      
		      success: function(data) {
		        // callback code here
		        alert(data);
		       }
		    });
}

			  });
		
		$("#country").filter('[value=01]').prop("selected", true);
		 
		 $('#phone').focusout(function() {
			 
			 var check1=$("#s_curr").children("option:selected").val();
			 
			var s_phone=$("#phone").val();
			if((s_phone!="" || s_phone!=null || s_phone!=" ") && flag==true){
				$.ajax({
		    		url: "edit_creditcust.jsp",
		    		type: 'POST',
		    		
		    		data: {
		    			phone:s_phone,
		    			
		    			curr:check1,
		    			type:"edit",
		    			
		    		    
		    		},
		    		success: function(data) {
		    		//$('#city_name').val(data);
		    		
		    		
		    		if(data.trim()=="not"){
		    			
		    		
		    			$('#name').val("");
			    		$('#addr1').val("");
			    		$('#addr2').val("");
			    		$('#addr3').val("");
			    		$('#addr4').val("");
			    		$('#s_postcode').val("");
			    		$('#email').val("");
			    		$('#bname').val("");
			    		$('#busername').val("");
			    		$('#accno').val("");
			    		$("#bcard option").filter('[value=0]').prop("selected", true);
			    		$("#emonth option").filter('[value=0]').prop("selected", true);
			    		$("#eyear option").filter('[value=0]').prop("selected", true);
			    		
			    		$("#country").val("---Select---").prop("selected", true);
			    		$("#select1 option").filter('[value=0]').prop("selected", true);
						$("#select2 option").filter('[value=0]').prop("selected", true);
						$("#select3 option").filter('[value=0]').prop("selected", true);
						$("#select4 option").filter('[value=0]').prop("selected", true);
							$('#username').val("");
		    	
		    			$('#psw').val("");
		    			$('#confirm').val("");
		    		}
		    		else{
		    	
		    		
		    		var arr=data.trim().split("$");
		    	
		    		
		    		
		    		
		    		
		    		
		    		$('#name').val(arr[0]);
		    		$('#addr1').val(arr[1]);
		    		$('#addr2').val(arr[2]);
		    		$('#addr3').val(arr[3]);
		    		$('#addr4').val(arr[4]);
		    		$('#s_postcode').val(arr[5]);
		    		$("#country option").filter('[value=' +arr[6]+ ']').prop("selected", true);
		    		$('#email').val(arr[7]);
		    		$("#bcard option").filter('[value=' +arr[8]+ ']').prop("selected", true);
		    		$('#busername').val(arr[9]);
		    		$('#accno').val(arr[10]);
		    		$("#emonth option").filter('[value=' +arr[11]+ ']').prop("selected", true);
		    		$("#eyear option").filter('[value=' +arr[12]+ ']').prop("selected", true);
		    		$('#bname').val(arr[13]);
		    		$('#username').val(arr[14]);
		    	
		    			$('#psw').val(arr[15]);
		    			$('#confirm').val(arr[15]);
		    		
		    		var s=arr[5];
		    		var f=s.substring(0,2);
					var f1=s.substring(0,4);
					var f2=s.substring(0,6);
					var f3=s.substring(0,8);
					$("#select1 option").filter('[about=' + f + ']').prop("selected", true);
					$("#select2 option").filter('[id=' + f1 + ']').prop("selected", true);
					$("#select3 option").filter('[about=' + f2 + ']').prop("selected", true);
					$("#select4 option").filter('[about=' + f3 + ']').prop("selected", true);
		    		} 
		    		
		    		
		    		
		    		
		    		}
		}); 
				
			}
			
			else if((s_phone!="" || s_phone!=null || s_phone!=" ") && flag==false){
			    	var check1=$("#s_curr").children("option:selected").val();
			   	$.ajax({
		    		url: "edit_creditcust.jsp",
		    		type: 'POST',
		    		
		    		data: {
		    			phone:$("#phone").val(),
		    			ccode:$("#ccode").val(),
		    			curr:check1,
		    			type:"check_phone",
		    			
		    		    
		    		},
		    		success: function(data) {
		    		//$('#city_name').val(data);
		    		
		    		
		    		if(data.trim()=="ok"){
		    			
		    			$('#phone').val("");
		    		
		    		
		    			$('#phone_error').text("*Phone Number Already Exist");
		    			$('#phone_error').css("color", "red");
		    	
		    		}
		    		else{
		    		    	$('#phone_error').text("");
		    		}
		    		
		    		
		    		
		    		
		    		
		    		}
		});  
			    
			    
			}
			
			
			
		});
	
		 
		 $('#username').focusout(function() {
			 
			 
			 $.ajax({
		    		url: "user_check.jsp",
		    		type: 'POST',
		    		
		    		data: {
		    			username: $('#username').val(),
		    			ccode:$('#ccode').val(),
		    			type: "user_check",
		    			
		    		    
		    		},
		    		success: function(data) {
		    		//$('#city_name').val(data);
		    	
		    		if(data.trim()=="ok" && flag==false){
		    			$('#username').val("");
		    		
		    		
		    			$('#urname_error').text("*Username Already Exist");
		    			$("#urname_error").css("color", "red");
		    			}
		    			else{
		    			    $('#urname_error').text(" ");
		    			}
		    		}
		}); 
			 
			 
		 });
		 
		  $('#confirm').focusout(function() {
		  var psw= $('#psw').val();
		  var confirm= $('#confirm').val();
		  if(psw!=confirm){
		     $("#staff_cps_error").text("*Password doesn't match each other");
		      $("#staff_cps_error").css("color", "red");
		      $('#psw').val("");
		      $('#confirm').val("");
		      $('#psw').focus();
		  }
		  else{
		       $("#staff_cps_error").text(" ");
		  }
		  
		  
		  });
		  
		  		$('#emonth').change(function() {
        	
        	var e_year=$('#eyear').children(":selected").attr("value");
        	//alert(e_year);
        	if(e_year>0)
        		{
		        	var e_month=$('#emonth').children(":selected").attr("value"); 
		        	
		        	var x = new Date()
					var today_month=x.getMonth()+1; 
		        	var today_year=x.getYear()+1900;
		        	//var x1=x.getMonth() + 1+ "/" + x.getDate() + "/" + x.getYear()+1900; 
		        	
		        	var diff_month=e_month-today_month;
		        	var diff_year=e_year-today_year;
		        	
		        	var months = diff_year*12 + diff_month;
		        	if(months<3){
		        	 
		        		$('#month_error').text(" *Atleast you must have three months !!");
		        		$('#month_error').css("color", "red");
		        		document.getElementById("emonth").value="--Select Month--";
		        		$('#emonth').focus();
		        	}
		        	else{
		        	    	$('#month_error').text(" ");
		        	}
        		}	
			  
		  });
		  
		
	});
	 function isNumber(evt) {
        var iKeyCode = (evt.which) ? evt.which : evt.keyCode
        if (iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57))
            return false;

        return true;
    }   
	
</script>
    
	
		
   
                    
<!-- multistep form -->

<div class="bod" style="background-color: #f2f2f2;"><br><br> 
<form id="credit_form">

	<div class="container">
	
	
		<!-- upper form  start-->
		
		
		<div class="row">
		<div class="col-12 col-lg-4">
		<div class="card">
		<div class="m" style="margin:10px;">
		
		
		<div class="row">
		<div class="col-12">
		
		<div class="form-group"> 
	 	<div class="row">
    	<div class="col-6"><label>User Name :</label></div>     
        <div class="col-6">
	   <span><%=staff_name %></span>
	    </div>
        </div></div>
      
        
        
        <div class="form-group"> 
        <div class="row">
    	<div class="col-6"><label>Company code :</label></div>     
        <div class="col-6">
	     <span><%=ccode%></span>
	     <input type="hidden" value="<%=ccode%>" id="ccode">
	    </div>
        </div></div>
         
        
        <div class="form-group"> 
        <div class="row">
    	<div class="col-6"><label>Agent code :</label></div>     
        <div class="col-6">
	     <span><%=agent_code%></span>
	    </div>
        </div></div>
	
		</div>	
		</div>
		
		</div></div><br><br></div>
		
		
		<div class="col-12 col-lg-4"></div>
		
		<div class="col-12 col-lg-4">
		<div class="card">
		<div class="m" style="margin:10px;">
		
		
													
					
       <div class="form-group"> 
     <%
    DateTimeFormatter dat = DateTimeFormatter.ofPattern("dd/MM/yyyy");
     DateTimeFormatter clock = DateTimeFormatter.ofPattern("hh:mm a");
   LocalDateTime localDateTime = LocalDateTime.now();
   String dt = dat.format(localDateTime);
   String ck=clock.format(localDateTime);
   %>
   <label>
   Date:&nbsp; &nbsp;&nbsp; &nbsp;
   <span style="color:blue;" class="fa fa-calendar">  <%=dt %></span>  
   &nbsp; &nbsp; &nbsp; &nbsp;  
   &nbsp; &nbsp; &nbsp; &nbsp;  
   <span style="color:blue;" class="fa fa-clock-o" style="text-align:right;"> <%=ck %></span>
   
   </label>
   
  
       </div>
       
       
      
		</div></div>
		
		</div></div>
		
	
	
</div>
             	<!-- upper form end-->	
    
    
    
    <!-- BackHome Area Start -->
 
 
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumb-content">
                        <h3>Add Credit Customer</h3>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.jsp"><i class="icon_house_alt"></i> Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Credit Customer</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
  
  
    <!-- BackHome Area End -->
    
   

    <!-- Register Area Start -->
    <section class="delivery-register section-padding-0-80 clearfix">
  <div class="container">
  
  <div class="card">
<div class="card-body">		
 <div class="form-group">   
<h3>Option</h3>	
</div>			
<div class="row">
<div class="col-12">

			<div class="custom-control custom-switch">
  <input type="checkbox" class="custom-control-input" id="customSwitch1">
  <label class="custom-control-label" for="customSwitch1">Check this button to edit existing credit customers(by using their phone number)</label>
</div>
</div>
				
			</div>	
		</div>
	</div>	
	<br>
  
  <div class="card">
<div class="card-body">		
 <div class="form-group">   
<h2>Personal Information  Details</h2>	
</div>			
<div class="row">
<div class="col-12 col-lg-6">	
	
             <!-- here  -->
             <input type="hidden" value="update" name="type">
             <input type="hidden" value="<%=staff_name %>" name="staff_name">
             <input type="hidden" value="<%=ccode %>" name="ccode">
             <div class="form-group">   
				<label class="pure-material-textfield-outlined">	
					<input type="text" value="" data-date="" class="form-control"   name="name" id="name" required >					
							<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Name</span>
	            </label>
	            <span id="staff_dob_error"></span> 	
			</div>	
			
			<div class="form-group"> 
			 <label class="pure-material-textfield-outlined">
					<input type="text" value="" data-date="" class="form-control" onkeypress="javascript:return isNumber(event)"  name="phone" id="phone" required >	
						<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Phone Number</span>
	            </label>
	             <span id="phone_error"></span>
		</div>
		
		<div class="form-group"> 
			  		<label class="pure-material-textfield-outlined">	
						<input type="text" value="" data-date="" class="form-control"   name="email" id="email"  >
						 <span>Email(optional)</span>
	            	</label>	
		</div>

		   <div class="form-group"> 
            
	 <label class="pure-material-textfield-outlined">
	 <select class="custom-select custom-select-md"  name="currency"  id="s_curr" required >
	 <option value="" selected>---Select---</option>
	 
	 <%Statement s=con.createStatement();
	 ResultSet r=s.executeQuery("Select* from curr_desc");
	 while(r.next()){
	 %>
	  
	  <option value="<%=r.getString("description")%>"><%=r.getString("description")%></option>
	  <%} %>	
	 </select>
       <span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Currency</span>
		</label>
        </div>
 </div>
			
<div class="col-12 col-lg-6">		
	
	<div class="form-group"> 													
               <label class="pure-material-textfield-outlined">
						<input type="text" placeholder="" name="address1" class="limit" maxlength="35" id="addr1" required >
						<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Address1</span>
	            </label>			
	            </div>	
	
	<div class="form-group"> 													
               <label class="pure-material-textfield-outlined">
						<input type="text" placeholder="" class="limit" maxlength="35" name="address2" id="addr2" >
						<span>Address2(optional)</span>
	            </label>			
	            </div>	
	            
	            <div class="form-group"> 													
               <label class="pure-material-textfield-outlined">
						<input type="text" placeholder="" class="limit" maxlength="35" name="address3" id="addr3">
						<span>Address3(optional)</span>
	            </label>			
	            </div>	
	            
	            <div class="form-group"> 													
               <label class="pure-material-textfield-outlined">
						<input type="text" placeholder="" class="limit" maxlength="35" name="address4" id="addr4">
						<span>Address4(optional)</span>
	            </label>			
	            </div>	
	
				</div>
				
			</div>	
		</div>
	</div>	
	<br>
	<div class="card">
<div class="card-body">		
 <div class="form-group">   
<h2>Account</h2>	

</div>	
<div class="row">
<div class="col-4">

		 <div class="form-group">   								
					<label class="pure-material-textfield-outlined">
								<!-- <input type="text" placeholder=""  name="username"  required> -->
								 <input type="text"  name="username" value="" id="username" required />
										<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>UserName</span>
		             </label>	
		             <span id="urname_error" ></span>
			 </div>
			 
</div>
		<div class="col-4">	
		<div class="form-group">   	 
				<label class="pure-material-textfield-outlined">	
				<input type="password" placeholder="" name="password"  id="psw" required>
					<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Password</span>
				</label>
				<span id="staff_ps_error"></span> 	
 		</div>
 		</div>
			<div class="col-4">											
	<div class="form-group">   
			<label class="pure-material-textfield-outlined">	
					<!-- <input type="password" placeholder="" name="cpassword"   required> -->
					 <input type="password" placeholder="" name="staff_cpassword" id="confirm" required />
					<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>ConfrimedPassword</span>
			</label>	
			<span id="staff_cps_error"></span> 												
    </div>
	</div>



</div>

</div>
</div>
	<br>
	<div class="card">
<div class="card-body">		
 <div class="form-group">   
<h2>Address  Details</h2>	
</div>			
<div class="row">
<div class="col-12 col-lg-6">
    <div class="form-group"> 
			<label class="pure-material-textfield-outlined">
					<select class="custom-select custom-select-md"  name="country" id="country" required>
	  
	  <% PreparedStatement c_pre=con.prepareStatement("Select description,country_code from country");
	  ResultSet c_result=c_pre.executeQuery();
	  while(c_result.next()){
	  %>
	  <option value="<%=c_result.getString("country_code")%>"><%=c_result.getString("description")%></option>
	  <% } %>
	 </select>
										<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Country</span>
	            </label>						
										</div>
										
					
		<div class="form-group"> 
			<label class="pure-material-textfield-outlined">
				<select  class="custom-select custom-select-md"  name="select1" id="select1" required >
           			<option value="" selected> ---Select --</option>
	       <%
						PreparedStatement pre =con.prepareStatement("Select* from state");
						ResultSet r1=pre.executeQuery();
						while(r1.next()){
						
						
						%>
						<option value="<%=r1.getString("state_name") %>" about="<%=r1.getString("state_code")%>" ><%=r1.getString("state_name") %></option>
						<%} %>
  				</select>
  				<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>State/Division</span>
	            </label>						
			</div>
					
					
										
	<div class="form-group"> 
		<label class="pure-material-textfield-outlined">
			<select class="custom-select custom-select-md"  name="select2" id="select2" required disabled >
   
   				<option value="" selected> ---Select --</option>
  
 <% 
					PreparedStatement ps;
					ps=con.prepareStatement("select * from  township "); 		
					ResultSet rs=ps.executeQuery();  
		
		
					while(rs.next()){  
			
					String id=rs.getString("state_code")+rs.getString("township_code");
			
		%>
				<option value="<%=rs.getString("township_name") %>" id="<%=id%>" about="<%=rs.getString("state_code")%>" state="<%=id%>" ><%=rs.getString("township_name") %></option>
	
		<%}%>
                                             
 		</select>		
	 	<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Township</span>
	    </label>
	   </div>
	</div>
													
	
	<div class="col-12 col-lg-6">	
		<div class="form-group"> 
			<label class="pure-material-textfield-outlined">
				<select class="custom-select custom-select-md"   name="select3" id="select3" disabled>
	 				<option value="" selected> ---Select --</option>
	 
	 <%
						PreparedStatement ps1=con.prepareStatement("select * from  ward "); 		
						ResultSet rs1=ps1.executeQuery();  
				
		
						while(rs1.next()){  
					
						String id1="";
						String id2;
						id1=rs1.getString("state_code")+rs1.getString("township_code");
						id2=rs1.getString("state_code")+rs1.getString("township_code")+rs1.getString("ward_code");
			
			
		%>
				<option value="<%=rs1.getString("ward_name") %>" id="<%=id1%>" about="<%=id2%>" ward="<%=id2%>" ><%=rs1.getString("ward_name") %></option>
		
		<%}%>
	 
	 		</select>		
	  		<span>Ward</span>
	    </label>
	</div>
		
	<div class="form-group"> 
			<label class="pure-material-textfield-outlined">
				<select class="custom-select custom-select-md"  name="select4" id="select4" disabled>
					<option  value="" selected>---Select---</option>
 
  <%			
		  			PreparedStatement ps2=con.prepareStatement("select * from  street "); 		
					ResultSet rs2=ps2.executeQuery();  
		
		
					while(rs2.next()){  
			
						String id1=rs2.getString("state_code")+rs2.getString("township_code")+rs2.getString("ward_code")+rs2.getString("street_code");
						
						String id2=rs2.getString("state_code")+rs2.getString("township_code")+rs2.getString("ward_code");
			
		%>
						<option value="<%=rs2.getString("street_name") %>" id="<%=id2%>" about="<%=id1%>" street="<%=id1%>"><%=rs2.getString("street_name") %></option>
		
		<%}%>
	 		 </select>
 			<span>Street(Optional)</span>
	     </label>
	</div>
	
														
	<div class="form-group"> 
		<label class="pure-material-textfield-outlined">
            <input type="text" id="s_postcode"    name="postcode" pattern="[0-9]{8}"   placeholder=" "required />             
			<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>ZipCode</span>
	    </label>
	</div>	
			
</div>										
															
	<%
	con.close();
	%> 
</div>
</div>
</div>
	<br>
	<div class="card">
<div class="card-body">		
	<div class="form-group"><h2>Customer Bank Card Information</h2></div>
	<div class="row">
	<div class="col-12 col-lg-6">	
	<div class="form-group">
		<label class="pure-material-textfield-outlined">
				<!-- <input type="text" placeholder="" name="bname"   required> -->
				<input type="text"  value="" placeholder="" name="bname"  id="bname"  onkeypress="javascript:return isLetter(event)" required />
				<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>BankName</span>
				</label>
		</div>		
	
<div class="form-group">
	<label class="pure-material-textfield-outlined">
			<!-- <input type="text" placeholder=""  name="busername"   required> -->
			<input type="text"  value="" placeholder="" id="busername"  name="busername" required />
			<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>UserName</span>
	</label>
</div>		
													
<div class="form-group">
	<label class="pure-material-textfield-outlined">
	  <!--  <input type="number" placeholder="" name="ano"   required> -->
	    <input type="text"  name="accno"  class="creditCardText" id="accno" value="" onkeypress="javascript:return isNumber(event)" required />
	   	<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Account Number</span>
	</label>
</div>	
			
</div>											
	<div class="col-12 col-lg-6">												
			<div class="form-group">
					<label class="pure-material-textfield-outlined">
							<select class="browser-default custom-select" id="bcard" name="bcard"  required >
								<option value="" selected>---Card Type--- </option>
								<option value="Visa" >Visa </option>
								<option value="MasterCard" >MasterCard </option>
															
							</select>
							<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Card Type</span>
					</label>
			</div>									
														
			<div class="form-group">
				<label>Expire Date (mm/yyyy)</label>
				<label class="pure-material-textfield-outlined">				
						<!-- <input type="date" placeholder="Enter  Here.." class="form-control"   > -->
						<select class="browser-default custom-select"  name=emonth id="emonth"  required  >
								<option value="" selected>--select month--</option>
								<option value="1" >January </option>
								<option value="2">February </option>
								<option value="3">March</option>
								<option value="4">April </option>
								<option value="5">May </option>
								<option value="6">June </option>
								<option value="7">July </option>
								<option value="8">August </option>
								<option value="9">September </option>
								<option value="10">October </option>
								<option value="11">November </option>
								<option value="12">December </option>															
						</select>
						<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Month</span>
				</label>
				 <span id="month_error" ></span>
				<label class="pure-material-textfield-outlined">				
						<!-- <input type="date" placeholder="Enter  Here.." class="form-control"   name="edate"   required> -->
						
						<select class="browser-default custom-select"  name="eyear" id="eyear"  required  >
						
						
						<%
																	
						int year = Calendar.getInstance().get(Calendar.YEAR);
					%>
						<option value="" selected>--select year--</option>
						<%
						for(int i=0;i<21;i++)
						{
							
							%>
															
								<option value="<%=year%>"><%=year%> </option>
						<% year++;} %>															
						</select>
						<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Year</span>
		</label>
	</div>		
																						
								
</div>	
			
			
			<!-- The Modal -->
	
									
														
					
		<!-- </div>
		</div>
		</div>
					
			<div class="card" id="my_id" style="display: none">
				<div class="card-body">		
				<div class="form-group">
					<label class="pure-material-textfield-outlined" >
						<textarea row="5" style="color:red"  id='error_message' readonly></textarea><span style="color:red">Error Message</span>
							 
					</label>
				</div>		
				</div>
			</div>	 -->										
<!----------------------------------------------------------------- End  Card  body----------------------------------------------------------------------------------------------------------------- -->
	
									
								
			</div>
			</div>
			</div>
		
  </div>
  <%--End Container --%>





	 
	
	<!-- Size and Weight Information End -->

<br><br>
   <center><input type="submit" class="btn delivery-btn1 btn-3 mt-15 active" id="sub" value="Submit"></center>
</div>
</form>
    </section>
    <!-- Register Area End -->

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

</body>



