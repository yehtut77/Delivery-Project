<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
  <%@page import="java.text.SimpleDateFormat,java.util.Date"%>
            <%@ page import="java.time.format.DateTimeFormatter" %>
    <%@ page import="java.time.*" %>
     
    
<% HttpSession session2 = request.getSession(true);

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;

DateTimeFormatter FOMATTER = DateTimeFormatter.ofPattern("dd/MM/yyyy");
//Local date time instance
LocalDateTime localDateTime = LocalDateTime.now();
 
//Get formatted String
String ldtString = FOMATTER.format(localDateTime);
HttpSession ssss=request.getSession(false);  


	String staff_name=(String)ssss.getAttribute("staffName");
String ccode=(String)ssss.getAttribute("companyCode");

	String agent_code=(String)ssss.getAttribute("agentCode");
	String staff_code=(String)ssss.getAttribute("staffCode");
String cdata=request.getParameter("para1");
String ddata=request.getParameter("para2");
String data2=request.getParameter("para3");
String data4=request.getParameter("para4");
String data5=request.getParameter("para5");
String data6=request.getParameter("para6");
String data7=request.getParameter("para7");


int intt=Integer.parseInt(cdata);
String[][] arr = new String[intt+1][6];


String[] arrOfStr2 = ddata.split(",");
int i=0;
for (String aa : arrOfStr2) {
if(aa.equalsIgnoreCase("") || aa.equals(null)){}
else{ 
	String[] arrOfStr3 = aa.split(":");
int co=0;
for (String b : arrOfStr3){
	
	arr[i][co]=b;
co=co+1;
}
i=i+1;}

}
connection=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
PreparedStatement pre_company = connection
.prepareStatement("Select company_name from company where company_code=?");
pre_company.setString(1, ccode);

ResultSet rs_company = pre_company.executeQuery();
String cname="";
if (rs_company.next()) {
cname=rs_company.getString("company_name");}
%>
 
<html>   <style>
        canvas:focus{outline:none;}
        * {
   margin: 0;
   padding: 0;
}
.WebContainer{
    width: 100%;
    height: auto;
}
.articles{
    width:90%; /*Takes 90% width from WebContainer*/
    height: auto;
    margin: auto;
} 
    </style><body id="alle"><div id="whole"><p id="tab"><canvas id="canvas" style="border:2px solid black;" width="1439" height="120">

              













</canvas></p>          <table id="myTable2" style="  border-collapse: collapse; width: 90em; height:30px;text-align:center;" border="1"><tr style="background-color: #f2f1ed;"><th style="height:40px;">Transaction Date</th><th>Agent Code</th><th>Agent Name</th><th>Total Received</th><th>Total Delivered</th></tr></table> 

<canvas id="canvas3" style="border:2px solid black;" width="1439" height="120"></canvas>
 <table id="myTable" style="  border-collapse: collapse; width: 90em; height:30px;text-align:center;" border="1"><tr style="background-color: #f2f1ed;"><th style="height:40px;">Transaction Date</th><th>Agent Code</th><th> Agent Name</th><th>Tracking Number </th><th>Received</th><th>Delivered</th></tr></table> 
  
  <canvas id="canvas2" style="border:2px solid black;" width="1439" height="920">

             

</canvas>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.22/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
    <script>
   
var canvas = document.getElementById("canvas");
var ctx = canvas.getContext("2d");

var canvas2 = document.getElementById("canvas2");
var ctx2 = canvas2.getContext("2d");

var canvas3 = document.getElementById("canvas3");
var ctx3 = canvas3.getContext("2d");
           ctx.font = "30px Times New Roman";
           ctx.fillText("<%=cname%>", 560,28);
           ctx.font = "20px Times New Roman";
           ctx.fillText("Total Received and Delivered Report", 570,53);
           ctx3.font = "bold 19px Times New Roman";
           ctx3.fillText("Transaction Details", 80,112);
           ctx3.font = " 19px Times New Roman";
           ctx3.fillText("<%=data7%>", 1283,50);
           ctx3.font = " 19px Times New Roman";
           ctx3.fillText(" <%=data6%>",980 ,50);
           ctx3.font = " 19px Times New Roman";
           ctx3.fillText(" Total",700,50);
           ctx.font = "18px Times New Roman";
           ctx.fillText("Transaction as at 	From Date <%=data4%> To Date <%=data5%>", 80,86);
           ctx.font = "bold 19px Times New Roman";
           ctx.fillText("Summary", 80,112);
           ctx2.font = "16px Times New Roman";
           ctx2.fillText(" This report is computer generated , No signature required .", 470,886 );
        
$(document).ready(function() {
	var cdata='<%=cdata%>';
	var ddata='<%=ddata%>';
	var data2='<%=data2%>';
		new takepdf();

	<%
	
	for(int iii=0;iii<(intt-3);iii++){
	if(arr[iii][4]==null){arr[iii][4]="";}
	if(arr[iii][5]==null){arr[iii][5]="";}
	
	%>
		
				var table = document.getElementById("myTable");
				  var row = table.insertRow(<%=iii+1%>);
				var cell1 = row.insertCell(0);
				var cell2 = row.insertCell(1);
				var cell3 = row.insertCell(2);
				var cell4 = row.insertCell(3);
				var cell5 = row.insertCell(4);
				var cell6 = row.insertCell(5);
				cell1.innerHTML = "<%=arr[iii][0]%>";
				cell2.innerHTML = "<%=arr[iii][1]%>";
				cell3.innerHTML ="<%=arr[iii][2]%>"; 
				cell4.innerHTML = "<%=arr[iii][3]%>"; 
				cell5.innerHTML = "<%=arr[iii][4]%>"; 
				cell6.innerHTML = "<%=arr[iii][5]%>"; 
				<%
			}
%>
	  var table2 = document.getElementById("myTable2");
		 var res=data2.split("*");
		  for(var ii=1;ii<=9;ii++){
			
			    var des = res[ii].split("^");
				
			    var row2 = table2.insertRow(ii);
				var cell11 = row2.insertCell(0);
				var cell22 = row2.insertCell(1);
				var cell33 = row2.insertCell(2);
				var cell44 = row2.insertCell(3);
				var cell55 = row2.insertCell(4);
				cell11.innerHTML =des[0]; 
				cell22.innerHTML =des[1]; 
				cell33.innerHTML =des[2];
				cell44.innerHTML = des[3];
				cell55.innerHTML = des[4];
			
				}


    
    
    });
</script>
<script>	function takepdf(){
    html2canvas($('#alle'), {
        onrendered: function (canvas) {
            var data = canvas.toDataURL();
            alert("Wait a moment , (click 'ok')");
            var docDefinition = {
                content: [{
                    image: data,
                    width: 500
                }]
            };
            const pdfDocGenerator = pdfMake.createPdf(docDefinition);
            pdfDocGenerator.getBase64((data)=>{
            	 $.ajax({
			    		url: "CRADRPS",
			    		type: 'POST',
			    		data: {
			    			data64: data},
			    		success: function(data) {
			    			window.location.href="PDFV"; 
			    		}
			    		});
            });
        }
    
});
    
			}

</script></div> 
</body>
</html>
