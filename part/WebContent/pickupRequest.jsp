<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
 <%@ page import="java.sql.*"%>  
  <%@page import="java.text.SimpleDateFormat,java.util.Date"%>
            <%@ page import="java.time.format.DateTimeFormatter" %>
    <%@ page import="java.time.*" %>
 
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
 


.card{
 
box-shadow: -5px 5px 20px rgba(69, 65, 78, 0.21);
 
}
 
  </style>
  
</head>
<script type="text/javascript" src="test.js" ></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 



 	
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
                                    <li><a href="#" id="logout">Logout</a></li>
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
    window.onbeforeunload = function() { return "Your data will be lost."; };
	$(document).ready(function(){
		
		$('#logout').focus(function() {
		  location.replace("index.jsp");
		});
	});	
    </script>
	
		
   
                    
<!-- multistep form -->
<div class="bod" style="background-color: #c9cfcf;"><br><br> 
<form action="pickupRequest_Add.jsp" id="form" method="post">
  
    <!-- BackHome Area Start -->
 
 
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumb-content">
                        <h3> Pick up Request</h3>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.jsp"><i class="icon_house_alt"></i> Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Customer Registration</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
  
  
    <!-- BackHome Area End -->
    
   

    <!-- Register Area Start -->
    <section class="delivery-register section-padding-0-80 clearfix">
  
  
  <%
  //Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/delivery", "root", "root"); 
 // Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_deliv?useTimezone=true&serverTimezone=UTC","teamrame_zaw","zawmyo");
  Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
  %>
  <div class="container">

	 
 
<br><br>



<div class="row">
<div class="col-12 col-lg-12">
<div class="card">
<div class="m" style="margin:10px;">

<h5>General Information:</h5><br>
  
   <div class="row">
   <div class="col-12 col-lg-6">
   
    <div class="form-group"> 
        <label class="pure-material-textfield-outlined">
		<input type="text"  name="sender_name"  onkeypress="javascript:return isLetter(event)"  required="required"
		oninvalid="this.setCustomValidity('Please Enter Name')" oninput="setCustomValidity('')" oninvalid="style.border-color=red"/>
			<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Name</span>
		</label>
        </div> 
        
	 
	 <div class="form-group"> 
        <label class="pure-material-textfield-outlined">
		<input type="text"  name="phono"  onkeypress="javascript:return isNumber(event)" 		
		oninvalid="this.setCustomValidity('Please Enter Pickup contact phone')" oninput="setCustomValidity('')" oninvalid="style.border-color=red" required/>
		<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Pick up Contact Phone</span>
		</label>
        </div> 
        
	 
	 <div class="form-group"> 
        <label class="pure-material-textfield-outlined">
		<input type="text"  name="contact_person"  onkeypress="javascript:return isLetter(event)" 
		oninvalid="this.setCustomValidity('Please Enter pickup contact person')" oninput="setCustomValidity('')" oninvalid="style.border-color=red" required />
		<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Pick up Contact Person</span>
		</label>
        </div> 
        
        <div class="form-group"> 
        <label class="pure-material-textfield-outlined">
		<input type="date"  name="pickup_date" id="planneddate"  required 
		oninvalid="this.setCustomValidity('Please Enter Pickup date')" oninput="setCustomValidity('')" oninvalid="style.border-color=red"/>
		<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Pick up Date</span>
		<span id="planneddate_error"></span>
		</label>
        </div> 
        
	 
   
   </div>
  <div class="col-12 col-lg-6">
  
  <div class="form-group"> 
        <label class="pure-material-textfield-outlined">
		<input type="text"  name="address1"  id="address1" required/>
		<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Address1</span>
		</label>
		<span id="address1_error"></span>
        </div> 
        
  
   <div class="form-group"> 
        <label class="pure-material-textfield-outlined">
		<input type="text"  name="address2" id="address2"   />
		<span>Address2(optional)</span>
		</label>
		<span id="address2_error"></span>
        </div> 
        
       <div class="form-group"> 
        <label class="pure-material-textfield-outlined">
		<input type="text"  name="address3"  id="address3"  />
		<span>Address3(optional)</span>
		</label>
		<span id="address3_error"></span>
        </div> 
        
        <div class="form-group"> 
        <label class="pure-material-textfield-outlined">
		<input type="text"  name="address4"  id="address4"   />
		<span>Address4(optional)</span>
		</label>
		<span id="address4_error"></span>
        </div> 
        
  </div>
  </div>  
   </div></div><br><br>
</div>
</div>

<% try{ %>
<div class="row">
<div class="col-12 col-lg-12">
<div class="card">
<div class="m" style="margin:10px;">


	
	<div class="row">
	<div class="col-12 col-lg-6">
	
	
				
<div class="form-group"> 
			<label class="pure-material-textfield-outlined">
				<select required class="custom-select custom-select-md"  name="select1" id="select1"  >
           			<option value="" selected>--Select--</option>
	       <%
						PreparedStatement pre =conn.prepareStatement("Select state_code,state_name from state");
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
			<select required class="custom-select custom-select-md"  name="select2" id="select2"   >   
   				<option value="" selected> --Select--</option> 
 			</select>		
	 	<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Township</span>
	    </label>
</div>  
<div class="form-group"> 
			<label class="pure-material-textfield-outlined">
				<select class="custom-select custom-select-md"   name="select3" id="select3"  disabled>
	 				<option hidden="hidden" selected> ---Select --</option>
			</select>		
	  		<span>Ward(optional)</span>
	    </label>
</div>  
</div>

<div class="col-12 col-lg-6">
	
	<div class="form-group"> 
			<label class="pure-material-textfield-outlined">
				<select class="custom-select custom-select-md"  name="select4" id="select4" disabled>
					<option  value="0" hidden="hidden" selected>---Select---</option>
  			 </select>
 			<span>Street(Optional)</span>
	     </label>
</div>
        
<div class="form-group"> 
		<label class="pure-material-textfield-outlined">
            <input type="text"   id="s_postcode"  name="s_postcode" pattern="[0-9]{8}"  placeholder=" "required />             
			<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>ZipCode</span>
	    </label>
</div>	
	
	 
<script>
/* $(document).ready(function(){
	
	$('#select2').focusout(function() {
		
		$('#agent').removeAttr("disabled"); 
	 
		var postcode=document.getElementById("s_postcode").value; 
		//alert(postcode);
		 $.ajax({
	    		url: "fectch_pickupRequest.jsp",
	    		type: 'POST',
	    		data: {postcode: postcode},
	    		success: function(data) {
	    			
	    			var agent_data = data.trim();
	    			var str = agent_data.split(":");
	    			var select = $('#agent');
    				select.find('option').remove();
    				var value=0;
    				if(agent_data=="0"){
    			    	 $('<option>').val(value).text("No Agent available in this area").appendTo(select);  	 
    			    				}
    				
	    			for(var i=0;i<str.length;i++)
	    				{
	    				
	    				//var s = str[0].split(",");
	    				var c_code=str[i].substring(0, 4);
	    				var a_code=str[i].substring(4,8);
	    				var a_name=str[i].substring(8);
	    				//c_code=c_code+":"+a_code;	 
	    				c_code=c_code+":"+a_code+":"+a_name;
	    				$('<option>').val(c_code).text(a_name).appendTo(select);
	    					
	    					
	    				}
	    	         
	    		}
	}); 
		 
	}); 
	
	$('#s_postcode').change(function() {
		
		
		$('#agent').removeAttr("disabled"); 
	 
		var postcode=document.getElementById("s_postcode").value; 
		//alert(postcode);
		 $.ajax({
	    		url: "fectch_pickupRequest.jsp",
	    		type: 'POST',
	    		data: {postcode: postcode},
	    		success: function(data) {
	    			
	    			var agent_data = data.trim();
	    			var str = agent_data.split(":");
	    			var select = $('#agent');
    				select.find('option').remove();
    				var value=0;
    				if(agent_data=="0"){
    	 $('<option>').val(value).text("No Agent available in this area").appendTo(select);  
    			 
    				 
    				}
    				
	    			for(var i=0;i<str.length;i++)
	    				{
	    				
	    				//var s = str[0].split(",");
	    				var c_code=str[i].substring(0, 4);
	    				var a_code=str[i].substring(4,8);
	    				var a_name=str[i].substring(8);
	    				
	    				c_code=c_code+":"+a_code+":"+a_name;
	    				$('<option>').val(c_code).text(a_name).appendTo(select);
	    					
	    					
	    				}
	    	         
	    		}
	}); 
		 
	}); 
});  */
	
</script>
        	
        
       <div class="form-group"> 
			<label class="pure-material-textfield-outlined">
				<select class="custom-select custom-select-md"   name="agent" id="agent" disabled required="required" 	>
	 				
	 
	 			</select>		
	  		<span><i style="color:red; margin-top:1px; font-size:20px;">*</i>Agent</span>
	    </label>
	</div>
        
        
        
	</div>
	</div>
   
   </div></div><br><br>
</div>
</div>

	<%
	conn.close(); 
	}catch(SQLException e){
		e.printStackTrace();}
	%>  


</div><%--End Container --%>

	<!-- Size and Weight Information End -->

<br><br>
 <center>  <input type="submit"   class="btn delivery-btn1 btn-3 mt-15 active" id="sub" value=Confirm> </center>
   
    </section>
</form>
</div>
  
 
    <!-- Register Area End -->
    
<script>

$('#select2').focusout(function() {
	
	$('#agent').removeAttr("disabled");  
	var postcode=document.getElementById("s_postcode").value; 
	//alert(postcode);
	 $.ajax({
    		url: "fectch_pickupRequest.jsp",
    		type: 'POST',
    		data: {postcode: postcode},
    		success: function(data) {
    			
    			var agent_data = data.trim();
    			var str = agent_data.split(":");
    			var select = $('#agent');
				select.find('option').remove();
				var value=0;
				if(agent_data=="0"){
			    	 $('<option>').val(value).text("No Agent available in this area").appendTo(select);  	 
			    				}
				
    			for(var i=0;i<str.length;i++)
    				{
    				
    				//var s = str[0].split(",");
    				var c_code=str[i].substring(0, 4);
    				var a_code=str[i].substring(4,8);
    				var a_name=str[i].substring(8);
    				//c_code=c_code+":"+a_code;	 
    				c_code=c_code+":"+a_code+":"+a_name;
    				$('<option>').val(c_code).text(a_name).appendTo(select);
    					
    					
    				}
    	         
    		}
}); 
	 
}); 

$('#s_postcode').focusout(function() {	
	
	$('#agent').removeAttr("disabled");  
	var postcode=document.getElementById("s_postcode").value; 
	//alert(postcode);
	 $.ajax({
    		url: "fectch_pickupRequest.jsp",
    		type: 'POST',
    		data: {postcode: postcode},
    		success: function(data) {
    			
    			var agent_data = data.trim();
    			var str = agent_data.split(":");
    			var select = $('#agent');
				select.find('option').remove();
				var value=0;
				if(agent_data=="0")
				{
					 $('<option>').val(value).text("No Agent available in this area").appendTo(select);  
				}
				
    			for(var i=0;i<str.length;i++)
    				{
    				
    				//var s = str[0].split(",");
    				var c_code=str[i].substring(0, 4);
    				var a_code=str[i].substring(4,8);
    				var a_name=str[i].substring(8);
    				
    				c_code=c_code+":"+a_code+":"+a_name;
    				$('<option>').val(c_code).text(a_name).appendTo(select);
    					
    					
    				}
    	         
    		}
}); 
	 
}); 

//$('#s_postcode').on('input', function() {
$('#s_postcode').keyup(function() {	
	var post_code=document.getElementById("s_postcode").value;
	var module="postalcode";
	
	 $.ajax({
	    		url: "fetch_postal.jsp",
	    		type: 'POST',
	    		data: {post_code: post_code,module:module},
	    		success: function(data)
	    		{	    		
	    			var agentList = data.trim();
	    			var str=agentList.split("$");
	    			//alert("first="+str[0]+"||second="+str[1])
	    			
	    			if(str[1].search("AAAA")>-1)
	    			{
	    				$('#select1').children('option').remove();
	    				$('#select2').children('option').remove();
	    				$('#select3').children('option').remove();
	    				$('#select4').children('option').remove();
		    			$('#select1').append(str[0]); 
	    			}
	    			else if(str[1].search("BBBB")>-1)
	    			{
	    				$('#select2').children('option').remove();
	    				$('#select3').children('option').remove();
	    				$('#select4').children('option').remove();
		    			$('#select2').append(str[0]); 
	    			}
	    			
	    			else if(str[1].search("CCCC")>-1)
	    			{
	    				$('#select3').children('option').remove();
	    				$('#select4').children('option').remove();
		    			$('#select3').append(str[0]); 
		    			$('#select3').prop("disabled", false);
	    			}
	    			
	    			else if(str[1].search("DDDD")>-1)
	    			{
		    			$('#select4').children('option').remove();
		    			$('#select4').append(str[0]);		    			
		   			 	$('#select4').prop("disabled", false);
	    			}
	    			else if(str[1].search("EEEE")>-1)
	    				{
		    				$('#select1').children('option').remove();
		    				$('#select2').children('option').remove();
		    				$('#select3').children('option').remove();
		    				$('#select4').children('option').remove();
		    				$('#select1').append(str[0]); 
		    				$('#select2').append(str[0]); 
		    				$('#select3').append(str[0]); 
		    				$('#select4').append(str[0]); 
	    				}
	    			
	    			
	    		}
	}); 
	
	
});

$("#select1").change(function()  {
	
	//var state_code=document.getElementById("select1").value;
	var state_code=$('#select1').children(":selected").attr("about");
	//alert(s1_about);
	var module="select1";
	 $.ajax({
	    		url: "fetch_postal.jsp",
	    		type: 'POST',
	    		data: {state_code: state_code,module:module},
	    		success: function(data)
	    		{	    		
	    			var agentList = data.trim();
	    		//alert(agentList);
	    			$('#select2').children('option').remove();
	    			$('#select2').append(data); 
	    			document.getElementById("s_postcode").value=state_code+"000000";
	    		}
	}); 
	
	
});
$("#select2").change(function()  {
	$('#select3').prop("disabled", false);
	//var state_code=document.getElementById("select1").value;
	//var township_code=document.getElementById("select2").value;
	var township_code=$('#select2').children(":selected").attr("about");
	var state_code=$('#select1').children(":selected").attr("about");
	var module="select2";
	 $.ajax({
	    		url: "fetch_postal.jsp",
	    		type: 'POST',
	    		data: {state_code: state_code,township_code:township_code,module:module},
	    		success: function(data)
	    		{	    		
	    			var agentList = data.trim();
	    		//alert(agentList);
	    			$('#select3').children('option').remove();
	    			$('#select3').append(data); 
	    			document.getElementById("s_postcode").value=state_code+township_code+"0000";
	    		}
	}); 
	
	
});

$("#select3").change(function()  {
	$('#select4').prop("disabled", false);
	//var state_code=document.getElementById("select1").value;
	//var township_code=document.getElementById("select2").value;
	//var ward_code=document.getElementById("select3").value;	
	var state_code=$('#select1').children(":selected").attr("about");
	var township_code=$('#select2').children(":selected").attr("about");
	var ward_code=$('#select3').children(":selected").attr("about");
	var module="select3";
	 $.ajax({
	    		url: "fetch_postal.jsp",
	    		type: 'POST',
	    		data: {state_code: state_code,township_code:township_code,ward_code:ward_code,module:module},
	    		success: function(data)
	    		{	    		
	    			var agentList = data.trim();
	    		//alert(agentList);
	    			$('#select4').children('option').remove();
	    			$('#select4').append(data); 
	    			document.getElementById("s_postcode").value=state_code+township_code+ward_code+"00";
	    		}
	}); 
	
	
});

$("#select4").change(function()  {
	
	//var state_code=document.getElementById("select1").value;
	//var township_code=document.getElementById("select2").value;
	//var ward_code=document.getElementById("select3").value;
	//var street_code=document.getElementById("select4").value;
	//var state_code=$('#select1').children(":selected").attr("about");
	var township_code=$('#select2').children(":selected").attr("about");
	var ward_code=$('#select3').children(":selected").attr("about");
	var state_code=$('#select4').children(":selected").attr("about");
	document.getElementById("s_postcode").value=state_code+township_code+ward_code+street_code;
	
});



function isLetter(evt) {
    var iKeyCode = (evt.which) ? evt.which : evt.keyCode
     if ((event.keyCode > 64 && event.keyCode < 91) || (event.keyCode > 96 && event.keyCode < 123) || event.keyCode == 8 || event.keyCode==32)
        return true; 
    
    return false;
}  

function isNumber(evt) {
    var iKeyCode = (evt.which) ? evt.which : evt.keyCode
    if (iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57))
        return false;

    return true;
}  

function noLetter(evt) {
    var iKeyCode = (evt.which) ? evt.which : evt.keyCode

    	if( 65 > iKeyCode || 90 < iKeyCode ){
    		if( 97 > iKeyCode || 122 < iKeyCode){ 
    			return ture;
    			}
    		return false;
    	}
    	

    return false;
}  

$('#planneddate').focusout(function() {

	var x = document.getElementById("planneddate").value;
	var plan=new Date(x);
 //	alert("plan "+plan);
	var planneddate_error = document.getElementById("planneddate_error");
	 
			var plan_month=plan.getMonth() ;
			var  plan_year=plan.getYear() ;
			var plan_day=plan.getDate();
			
	   /*      alert("plan_year "+plan_year);
			alert("plan_month "+plan_month);
			alert("plan_day "+plan_day); 
			 */
			var today = new Date()
			var today_month=today.getMonth() ; 
        	var today_year=today.getYear() ;
        	var today_date=today.getDate();	
        	
        /* 	  alert("today_year "+today_year);
        	alert("today_month "+today_month);
        	alert("today_date "+today_date);
        	 */
         
        	
        	if( plan_year== today_year || plan_year> today_year)
	        	{
        		if( plan_month== today_month || plan_month> today_month)
	        	{
        			if( plan_day== today_date || plan_day> today_date)
    	        	{
        				planneddate_error.textContent =" " ;
    		}
        			else { 
                		
                		
                		planneddate_error.textContent = "*Please enter valid date*" ;
                		planneddate_error.style.color = "red";
                		document.getElementById("planneddate").value="dd/mm/yyyy";
			            $("#planneddate").focus();
                		
                	}
		  }
        		else { 
            		
            		
            		planneddate_error.textContent = "*Please enter valid date*" ;
            		planneddate_error.style.color = "red";
            		document.getElementById("planneddate").value="dd/mm/yyyy";
		            $("#planneddate").focus();
            		
            	}
		}
        	else { 
        		
        		
        		planneddate_error.textContent = "*Please enter valid date*" ;
        		planneddate_error.style.color = "red";
        		document.getElementById("planneddate").value="dd/mm/yyyy";
	            $("#planneddate").focus();
        		
        	}
        
});	
        	
$("#address1").focusout(function() {
	
	var address1=document.getElementById("address1").value;
	var address1_error=document.getElementById("address1_error");
	if(address1.length>31)
		{
		
		address1_error.textContent="**Address accepts no more 30 characters**"
			document.getElementById("address1").value="";
		address1_error.style.color = "red" ;
	}
	else{
		
		address1_error.textContent="";
	}
  
});
$("#address2").focusout(function() {
	
	var address2=document.getElementById("address2").value;
	
	var address2_error=document.getElementById("address2_error");
	if(address2.length>31)
		{
		
		address2_error.textContent="**Address accepts no more 30 characters**"
			document.getElementById("address2").value="";
		address2_error.style.color = "red" ;
	}
	else{
		
		address2_error.textContent="";
	}
  
});
$("#address3").focusout(function() {

var address3=document.getElementById("address3").value;
var address3_error=document.getElementById("address3_error");

if(address3.length>31)
	{
	
	address3_error.textContent="**Address accepts no more 30 characters**"
	address3_error.style.color = "red" ;
}
else{
	
	address3_error.textContent="";
}

});
$("#address4").focusout(function() {

var address4=document.getElementById("address4").value;
var address4_error=document.getElementById("address4_error");

if(address4.length>31)
	{
	
	address4_error.textContent="**Address accepts no more 30 characters**"
	address4_error.style.color = "red" ;
}
else{
	
	address4_error.textContent="";
}

});
        	
 

</script>

	 
	


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



</html>