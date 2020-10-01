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
     
    
<%  System.out.println("GGOODD");HttpSession session2 = request.getSession(true);
String tracklist = (String)session2.getAttribute("tl");
System.out.print(tracklist);
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;

DateTimeFormatter FOMATTER = DateTimeFormatter.ofPattern("dd/MM/yyyy");
//Local date time instance
LocalDateTime localDateTime = LocalDateTime.now();
 
//Get formatted String
String ldtString = FOMATTER.format(localDateTime);
HttpSession ssss=request.getSession(false);  
	String n2=(String)session.getAttribute("amname"); 
	String dn=(String)session.getAttribute("DO"); 

	String staff_name=(String)ssss.getAttribute("staffName");
String ccode=(String)ssss.getAttribute("companyCode");

	String agent_code=(String)ssss.getAttribute("agentCode");
	String staff_code=(String)ssss.getAttribute("staffCode");


String alldata="",data="";
 connection=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
 
statement=connection.createStatement();
String cname="";
PreparedStatement pree = connection
		.prepareStatement("Select * from company where company_code= ? ");
pree.setString(1, ccode);
ResultSet rss = pree.executeQuery();
while (rss.next()) {
	
	cname = rss.getString("company_name");
}
rss.close();
pree.close();

String staffph="";
PreparedStatement pree2 = connection
		.prepareStatement("Select * from staff where staff_code= ? ");
pree2.setString(1, staff_code);
ResultSet rss2 = pree2.executeQuery();
while (rss2.next()) {
	
	staffph = rss2.getString("staff_phone");
}
rss2.close();
pree2.close();

int count=0;
String[] arrOfStr = tracklist.split(":"); 
for (String a : arrOfStr) {
	String a0=null,a1=null,a2=null,a3=null,a4=null,a5=null,a6=null,a7=null,a8=null,a9=null,a10=null,a11=null;
	if(a.equalsIgnoreCase("") || a.equals(null) || a.equalsIgnoreCase(" ") ){}
	else{
count=count+1;

PreparedStatement pre = connection
.prepareStatement("Select * from registration where track_num=? and agent_code=? and company_code=? ");
pre.setString(1,a);
pre.setString(2,agent_code);
pre.setString(3,ccode);


ResultSet rs = pre.executeQuery();
String period="";int inta=0;int inta1=0;int inta2=0;
if (rs.next()) {
a0=rs.getString("product_amt");if(a0!=null){
	double d1=Double.parseDouble(a0);
 inta=(int)d1;
 a0=inta+"";
 }else{a0=" ";}
a1=rs.getString("deli_charges");
if(a1==null){a1=" ";}else{double d2=Double.parseDouble(a1);
inta1=(int)d2;}
a2=rs.getString("total_amt");
if(a2==null){a2=" ";}else{double d3=Double.parseDouble(a2);
inta2=(int)d3;}
a3=rs.getString("rcvr_name");
a4=rs.getString("rcvr_phone");
a5=rs.getString("rcvr_state");
a6=rs.getString("rcvr_township");
a7=rs.getString("rcvr_addr1");
a8=rs.getString("rcvr_addr2");
a9=rs.getString("rcvr_addr3");
a10=rs.getString("rcvr_addr4");
System.out.println("GOODIDOSF"+a9+"FFFF"+a10);
a11=a7+","+a8+","+a9+","+a10;

if(a10.length() == 0){
	a11=a7+","+a8+","+a9+a10;
}
if(a9.length() == 0){
	a11=a7+","+a8+a9+a10;
}



data=count+"@"+a+"@"+a0+"@"+inta1+"@"+inta2+"@"+a3+"@"+a4+"@"+a5+"@"+a6+"@"+a11+"@";
}
rs.close();
pre.close();
 connection.close();

alldata=alldata+":"+data;}} 
	



String[][] arr = new String[count+1][10];

	
String[] arrOfStr2 = alldata.split(":");
int i=0;
for (String aa : arrOfStr2) {
if(aa.equalsIgnoreCase("") || aa.equals(null) || aa.equals(" ")){}
else{ 
	String[] arrOfStr3 = aa.split("@");
int co=0;
for (String b : arrOfStr3){
	
	arr[i][co]=b;
co=co+1;
}
i=i+1;}

}






%><html>   <style>
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

              













</canvas></p>     <table id="myTable" style="  border-collapse: collapse; width: 90em; height:30px;text-align:center;" border="1"><tr style="background-color: #f2f1ed;"><th style="height:40px;">No.</th><th>Waybill No</th><th>Product Amt</th><th>Delivery Charges</th><th>Total</th><th>Name</th><th>Phone</th><th>Region</th><th>Township</th><th>Address</th></tr></table> 
  
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


           ctx.font = "30px Times New Roman";
           ctx.fillText("<%=cname%> EXPRESS DELIVERY", 560,28);
           ctx.font = "18px Times New Roman";
           ctx.fillText("Out For Delivery List", 647,53);
           ctx.font = "25px Times New Roman";
           ctx.fillText("Do No : <%=dn%>", 1200,28);
           ctx.font = "16px Times New Roman";
           ctx.fillText("Agent : <%=agent_code%>", 1000,49);
           ctx.font = "16px Times New Roman";
           ctx.fillText("Date : <%=ldtString%>", 200,86);
           ctx.font = "16px Times New Roman";
           ctx.fillText("Delivery Staff : <%=staff_name%>", 1000,86);
           ctx.font = "16px Times New Roman";
           ctx.fillText("Phone : <%=staffph%> ", 1050,112);
           ctx2.font = "16px Times New Roman";
           ctx2.fillText(" This report is computer generated , No signature required .", 470,886 );
        
$(document).ready(function() {
	var table = document.getElementById("myTable");
<%
for(int iii=0;iii<count;iii++){
%>
	var row = table.insertRow(<%=iii+1%>);
	var cell1 = row.insertCell(0);
	var cell2 = row.insertCell(1);
	var cell3 = row.insertCell(2);
	var cell4 = row.insertCell(3);
	var cell5 = row.insertCell(4);
	var cell6 = row.insertCell(5);
	var cell7 = row.insertCell(6);
	var cell8 = row.insertCell(7);
	var cell9 = row.insertCell(8);
	var cell10 = row.insertCell(9);
	// Add some text to the new cells:
	cell1.innerHTML = "<%=arr[iii][0]%>";
	cell2.innerHTML = "<%=arr[iii][1]%>";
	cell3.innerHTML ="<%=arr[iii][2]%>"; 
	cell4.innerHTML = "<%=arr[iii][3]%>"; 
	cell5.innerHTML = "<%=arr[iii][4]%>"; 
	cell6.innerHTML = "<%=arr[iii][5]%>"; 
	cell7.innerHTML = "<%=arr[iii][6]%>"; 
	cell8.innerHTML ="<%=arr[iii][7]%>"; 
	cell9.innerHTML ="<%=arr[iii][8]%>"; 
	cell10.innerHTML ="<%=arr[iii][9]%>"; 

<%}%>
    html2canvas($('#alle'), {
        onrendered: function (canvas) {
            var data = canvas.toDataURL();
            alert("('Click OK and wait a moment')");
            var docDefinition = {
                content: [{
                    image: data,
                    width: 500
                }]
            };
            const pdfDocGenerator = pdfMake.createPdf(docDefinition);
            pdfDocGenerator.getBase64((data)=>{
            	  $.ajax({
			    		url: "OFDPS",
			    		type: 'POST',
			    		data: {
			    			data64: data},
			    		success: function(data) {
			    			window.location = 'Reg';
			    		}
			    		});
            });
        }
    
});
    
    
    });
</script></div>
</body>
</html>
