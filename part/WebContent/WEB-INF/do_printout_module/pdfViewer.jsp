<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import=" java.io.File"%>
    <%
HttpSession ssss=request.getSession(false);  
	String n2=(String)ssss.getAttribute("filename"); 
		String tp=(String)ssss.getAttribute("tempo"); 
             System.out.println(tp);

String n3="OFD/"+n2;
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Do Printout</title>

</head>
<body>

<embed type="application/pdf" src="<%=n3%>" style="width:100%; height:620px"></embed>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
			 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</body>
<script>
	$(document).ready(function() {

			setTimeout(function(){
		var tp='<%=tp%>';	
		var fn='<%=n3%>';	
		var tpt=tp.trim();
		if(tpt=='yes'){
		   $.ajax({
						    		url: "CRADRPD",
						    		type: 'POST',
						    		data: {
						    		    
						    		    filename: '<%=n3%>'
						    		  
						    		},
						    		success: function(data) {
			    		 }}); 
		}else{}
			
		}, 10000);
		
				  });

</script>

			
</html>