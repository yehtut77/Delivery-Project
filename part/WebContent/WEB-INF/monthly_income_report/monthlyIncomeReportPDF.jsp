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
String para1=request.getParameter("para1");
String para2=request.getParameter("para2");
String para3=request.getParameter("para3");
String para4=request.getParameter("para4");
String para5=request.getParameter("para5");

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
    </style><body id="alle"><div id="whole"><p id="tab"><canvas id="canvas" style="border:2px solid black;" width="1439" height="160">



</canvas></p>        

 <table id="myTable" style="  border-collapse: collapse; width: 90em; height:60px;text-align:center;" border="1"><tr style="background-color: #f2f1ed;"><th>Agent Code</th><th> Agent Name</th><th>Credit Income  </th></tr></table> 
  
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
           ctx.fillText("<%=cname%>", 560,28);
           ctx.font = "20px Times New Roman";
           ctx.fillText("Monthly Income Report", 570,53);
           ctx.font = "bold 24px Times New Roman";
           ctx.fillText("Period : <%=para2%> ", 80,86);
          ctx.font = "bold 18px Times New Roman";
           ctx.fillText("Forecast Budget", 880,86);
            ctx.font = "bold  18px Times New Roman";
           ctx.fillText("Credit Income ", 880,106);
           ctx2.font = "16px Times New Roman";
           ctx.fillText("<%=para3%>",1040,86);
           ctx2.font = "16px Times New Roman";
           ctx.fillText("<%=para1%>", 1040,106);
           ctx2.font = "16px Times New Roman";
           ctx2.fillText(" This report is computer generated , No signature required .", 470,886 );
        
$(document).ready(function() {
var alldata='<%=para4%>';
var total='<%=para1%>';
var date='<%=para2%>';
var ctotal='<%=para3%>';
var count='<%=para5%>';

var table2 = document.getElementById("myTable");
var res=alldata.split("^");
var co=0;
       for(var i=1;i<=count;i++){
       co=co+1;
               var each=res[i].split("$");
                var row2 = table2.insertRow(i);
				var cell11 = row2.insertCell(0);
				var cell22 = row2.insertCell(1);
				var cell33 = row2.insertCell(2);
				cell11.innerHTML =each[0]; 
				cell22.innerHTML =each[1]; 
				cell33.innerHTML =each[2];
                                        }
                    new sorttab();
                var row = table2.insertRow(co+1);
				var cell1 = row.insertCell(0);
				var cell2 = row.insertCell(1);
				var cell3 = row.insertCell(2);
				cell1.innerHTML =""; 
				cell2.innerHTML ="<b>Total</b> "; 
				cell3.innerHTML ="<b><%=para1%></b>";
                                        
		
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
			    		url: "MIRPDFS",
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

    });			

</script><script>
function sorttab(){
var table, rows, switching, i, x, y, shouldSwitch;
  table = document.getElementById("myTable");
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
</script></div> 
</body>
</html>
