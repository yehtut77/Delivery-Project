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
 connection=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
 
String listofid=request.getParameter("para1");
String vnum=request.getParameter("para2");
String pcode=request.getParameter("para3");


  PreparedStatement pre_ph = connection
		.prepareStatement("Select staff_township,staff_division,staff_phone from staff where company_code=? and agent_code=? and staff_code=?");
pre_ph.setString(1, ccode);
pre_ph.setString(2, agent_code);
pre_ph.setString(3, staff_code);
ResultSet rs_ph= pre_ph.executeQuery();
String sph="",st="",sd="";

while (rs_ph.next()) {
	
	sph = rs_ph.getString("staff_phone");
		st = rs_ph.getString("staff_township");
	sd = rs_ph.getString("staff_division");

}

PreparedStatement pre_company = connection
		.prepareStatement("Select company_name from company where company_code=?");
pre_company.setString(1, ccode);

ResultSet rs_company = pre_company.executeQuery();
String cname="";
if (rs_company.next()) {
cname=rs_company.getString("company_name");}

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
.verticalTableHeader {
    text-align:center;
    transform: rotate(90deg);

}
    </style><body id="alle"><div id="whole"><p id="tab"><canvas id="canvas" style="border:2px solid black;" width="1439" height="120">

              













</canvas></p>     <table id="myTable" style="  border-collapse: collapse; width: 90em; height:30px;text-align:center;" border="1"><tr style="background-color: #f2f1ed;"><th style="height:90px;">No.</th><th> Delivered Date</th><th> Waybill Number</th><th>Product<br> Amount</th><th>Delivery<br> Charges</th><th>Prepaid<br> Amount</th><th>Total<br> Amount</th><th  ><b class="verticalTableHeader">Delivered</b></th><th  ><b class="verticalTableHeader">Canceled</b></th><th><b class="verticalTableHeader">Redelivered</b></th><th>Name</th><th>Region</th><th>Township</th></tr></table> 
  
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
           ctx.font = "18px Times New Roman";
           ctx.fillText("Payment To Credit Customer ",598,53);
         
           ctx.font = "16px Times New Roman";
           ctx.fillText("<%=staff_name%>", 1050,73);
           ctx.font = "16px Times New Roman";
           ctx.fillText("<%=ldtString%>", 200,86);
           ctx.font = "16px Times New Roman";
             ctx.fillText("<%=vnum%>", 200,104);
           ctx.font = "16px Times New Roman";
           ctx.fillText("<%=sd%>,<%=st%>", 1050,94);
           ctx.font = "16px Times New Roman";
           ctx.fillText("<%=sph%>", 1050,112);
           ctx2.font = "16px Times New Roman";
           ctx2.fillText("We only guarantee under the price of 200,000 kyats for each goods.", 447,856 );
            ctx2.font = "16px Times New Roman";
           ctx2.fillText(" This report is computer generated , No signature required .", 470,886 );
           
              ctx2.font = "16px Times New Roman";
           ctx2.fillText("Refund Amount =", 470,70 );
        ctx2.font = "16px Times New Roman";
           ctx2.fillText("Total Amount -", 590,60 );
           ctx2.font = "16px Times New Roman";
           ctx2.fillText("Delivery Charges", 690,60 );
           
$(document).ready(function() {

	var table = document.getElementById("myTable");
<%
int count=0;
String lidd=listofid.replace("*",":");

        	String[] arrOfStr = lidd.split(":"); 
int totalresult=0,totaldeli=0,totalpro=0;
	for (String aa : arrOfStr) {
String bbb=aa.trim();
	if(bbb==null || bbb.equals("null")){}else{
		PreparedStatement pre_type = connection.prepareStatement("Select payment_code,stat from registration where id=?");
		pre_type.setString(1,bbb);
		String paytype="",statnew="";
			ResultSet rs_type = pre_type.executeQuery();
			if (rs_type.next()) {
			    paytype=rs_type.getString("payment_code");	
			    statnew=rs_type.getString("stat");

			}
			if(statnew.equals("D")){
				String pttrim=paytype.trim();
				PreparedStatement pre_13 = connection.prepareStatement("Select payment_description  from paymentmode where payment_code=? and company_code=?");
		pre_13.setString(1,pttrim);
			pre_13.setString(2,ccode);
		String trueorf="",toftrim="";
			ResultSet rs_13 = pre_13.executeQuery();
			if (rs_13.next()) {
			    trueorf=rs_13.getString("payment_description");
			}
			toftrim=trueorf.trim();
			if(toftrim.equals("Charge to Receiver")){
	count=count+1;
		PreparedStatement pre = connection.prepareStatement("Select track_num,deli_charges,trans_charges,stat,product_amt,total_amt,rcvr_name,rcvr_phone,rcvr_township,rcvr_state,createdate from registration where id=?");
		pre.setString(1,bbb);
			ResultSet rs = pre.executeQuery();
			if (rs.next()) {
				String stat="",statsymd="",statsymc="",statsymr="";
				stat=rs.getString("stat");
				if(stat.equals("D")){statsymd= "&#11044";}
				if(stat.equals("C")){statsymc= "&#11044";}
				if(stat.equals("R")){statsymr= "&#11044";}
					String pamt="";
			pamt=rs.getString("product_amt");
String damt="";
if( pamt==null || pamt.equals("null")){pamt=" ";}else{
	double d1=Double.parseDouble(pamt);
 int inta=(int)d1;
    totalpro=totalpro+inta;

 pamt=inta+"";
 }
 		damt=rs.getString("deli_charges");

if( damt==null || damt.equals("null")){damt=" ";}else{
	double d1=Double.parseDouble(damt);
 int inta=(int)d1;
    totaldeli=totaldeli+inta;

 damt=inta+"";
 }
 	String tamt="";
		String total1=rs.getString("product_amt");
        String total2=rs.getString("deli_charges");
        int t1=0,t2=0;
if( total1==null || total1.equals("null")){t1=0;}else{
	double d1=Double.parseDouble(total1);
  t1=(int)d1;
  }	
if( total2==null || total2.equals("null")){t2=0;}else{
	double d2=Double.parseDouble(total2);
  t2=(int)d2;
  }	
  int finalt=t2;
   totalresult=totalresult+finalt;
  tamt=""+finalt;

%>
	var row = table.insertRow(<%=count%>);
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
		var cell11 = row.insertCell(10);
			var cell12 = row.insertCell(11);
				var cell13 = row.insertCell(12);
	// Add some text to the new cells:
	cell1.innerHTML = "<%=count%>";
	cell2.innerHTML = "<%=rs.getString("createdate").substring(0,10)%>";
	cell3.innerHTML ="<%=rs.getString("track_num")%>"; 
	cell4.innerHTML = "<%=pamt%>"; 
	cell5.innerHTML = "<%=damt%>"; 
	cell6.innerHTML = " "; 
	cell7.innerHTML = "<%=tamt%>"; 
	cell8.innerHTML =" <%=statsymd%>"; 
	cell9.innerHTML =" <%=statsymc%> "; 
	cell10.innerHTML =" <%=statsymr%> "; 
	cell11.innerHTML ="<%= rs.getString("rcvr_name")%>"; 
	cell12.innerHTML ="<%= rs.getString("rcvr_state")%>"; 
		cell13.innerHTML ="<%= rs.getString("rcvr_township")%>"; 
<%}}}}}%>


<%
String lidd22=listofid.replace("*",":");

        	String[] arrOfStr22 = lidd22.split(":"); 

	for (String aa22 : arrOfStr22) {
String bbb22=aa22.trim();
	if(bbb22==null || bbb22.equals("null")){}else{
		PreparedStatement pre_type = connection.prepareStatement("Select payment_code,stat from registration where id=?");
		pre_type.setString(1,bbb22);
		String paytype="",statnew="";
			ResultSet rs_type = pre_type.executeQuery();
			if (rs_type.next()) {
			    paytype=rs_type.getString("payment_code");	
			    statnew=rs_type.getString("stat");

			}
			if(statnew.equals("D")){
				String pttrim=paytype.trim();
				PreparedStatement pre_13 = connection.prepareStatement("Select payment_description  from paymentmode where payment_code=? and company_code=?");
		pre_13.setString(1,pttrim);
			pre_13.setString(2,ccode);
		String trueorf="",toftrim="";
			ResultSet rs_13 = pre_13.executeQuery();
			if (rs_13.next()) {
			    trueorf=rs_13.getString("payment_description");
			}
			toftrim=trueorf.trim();
			if(toftrim.equals("Prepaid")){
	count=count+1;
		PreparedStatement pre = connection.prepareStatement("Select track_num,deli_charges,trans_charges,stat,product_amt,total_amt,rcvr_name,rcvr_phone,rcvr_township,rcvr_state,createdate from registration where id=?");
		pre.setString(1,bbb22);
			ResultSet rs = pre.executeQuery();
			if (rs.next()) {
				String stat="",statsymd="",statsymc="",statsymr="";
				stat=rs.getString("stat");
				if(stat.equals("D")){statsymd= "&#11044";}
				if(stat.equals("C")){statsymc= "&#11044";}
				if(stat.equals("R")){statsymr= "&#11044";}
					String pamt="";
			pamt=rs.getString("product_amt");
String damt="";
if( pamt==null || pamt.equals("null")){pamt=" ";}else{
	double d1=Double.parseDouble(pamt);
 int inta=(int)d1;
    totalpro=totalpro+inta;

 pamt=inta+"";
 }
 		damt=rs.getString("deli_charges");

if( damt==null || damt.equals("null")){damt=" ";}else{
	double d1=Double.parseDouble(damt);
 int inta=(int)d1;
    totaldeli=totaldeli+inta;

 damt=inta+"";
 }
 	String tamt="";
		String total1=rs.getString("product_amt");
        String total2=rs.getString("deli_charges");
        int t1=0,t2=0;
if( total1==null || total1.equals("null")){t1=0;}else{
	double d1=Double.parseDouble(total1);
  t1=(int)d1;
  }	
if( total2==null || total2.equals("null")){t2=0;}else{
	double d2=Double.parseDouble(total2);
  t2=0;
  }	
  int finalt=t2;
   totalresult=totalresult+finalt;
  tamt=""+finalt;

%>
	var row = table.insertRow(<%=count%>);
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
		var cell11 = row.insertCell(10);
			var cell12 = row.insertCell(11);
				var cell13 = row.insertCell(12);
	// Add some text to the new cells:
	cell1.innerHTML = "<%=count%>";
	cell2.innerHTML = "<%=rs.getString("createdate").substring(0,10)%>";
	cell3.innerHTML ="<%=rs.getString("track_num")%>"; 
	cell4.innerHTML = "<%=pamt%>"; 
	cell5.innerHTML = "<%=damt%>"; 
	cell6.innerHTML = " "; 
	cell7.innerHTML = "<%=tamt%>"; 
	cell8.innerHTML =" <%=statsymd%>"; 
	cell9.innerHTML =" <%=statsymc%> "; 
	cell10.innerHTML =" <%=statsymr%> "; 
	cell11.innerHTML ="<%= rs.getString("rcvr_name")%>"; 
	cell12.innerHTML ="<%= rs.getString("rcvr_state")%>"; 
		cell13.innerHTML ="<%= rs.getString("rcvr_township")%>"; 
<%}}}}}%>

<%
String lidd222=listofid.replace("*",":");

        	String[] arrOfStr222 = lidd222.split(":"); 

	for (String aa222 : arrOfStr222) {
String bbb222=aa222.trim();
	if(bbb222==null || bbb222.equals("null")){}else{
		PreparedStatement pre_type = connection.prepareStatement("Select payment_code,stat from registration where id=?");
		pre_type.setString(1,bbb222);
		String paytype="",statnew="";
			ResultSet rs_type = pre_type.executeQuery();
			if (rs_type.next()) {
			    paytype=rs_type.getString("payment_code");	
			    statnew=rs_type.getString("stat");

			}
			if(statnew.equals("D")){
				String pttrim=paytype.trim();
				PreparedStatement pre_13 = connection.prepareStatement("Select payment_description  from paymentmode where payment_code=? and company_code=?");
		pre_13.setString(1,pttrim);
			pre_13.setString(2,ccode);
		String trueorf="",toftrim="";
			ResultSet rs_13 = pre_13.executeQuery();
			if (rs_13.next()) {
			    trueorf=rs_13.getString("payment_description");
			}
			toftrim=trueorf.trim();
			if(toftrim.equals("Cash On Delivery")){
	count=count+1;
		PreparedStatement pre = connection.prepareStatement("Select track_num,deli_charges,trans_charges,stat,product_amt,total_amt,rcvr_name,rcvr_phone,rcvr_township,rcvr_state,createdate from registration where id=?");
		pre.setString(1,bbb222);
			ResultSet rs = pre.executeQuery();
			if (rs.next()) {
				String stat="",statsymd="",statsymc="",statsymr="";
				stat=rs.getString("stat");
				if(stat.equals("D")){statsymd= "&#11044";}
				if(stat.equals("C")){statsymc= "&#11044";}
				if(stat.equals("R")){statsymr= "&#11044";}
					String pamt="";
			pamt=rs.getString("product_amt");
String damt="";
if( pamt==null || pamt.equals("null")){pamt=" ";}else{
	double d1=Double.parseDouble(pamt);
 int inta=(int)d1;
    totalpro=totalpro+inta;

 pamt=inta+"";
 }
 		damt=rs.getString("deli_charges");

if( damt==null || damt.equals("null")){damt=" ";}else{
	double d1=Double.parseDouble(damt);
 int inta=(int)d1;
    totaldeli=totaldeli+inta;

 damt=inta+"";
 }
 	String tamt="";
		String total1=rs.getString("product_amt");
        String total2=rs.getString("deli_charges");
        int t1=0,t2=0;
if( total1==null || total1.equals("null")){t1=0;}else{
	double d1=Double.parseDouble(total1);
  t1=(int)d1;
  }	
if( total2==null || total2.equals("null")){t2=0;}else{
	double d2=Double.parseDouble(total2);
  t2=(int)d2;
  }	
  int finalt=t1+t2;
   totalresult=totalresult+finalt;
  tamt=""+finalt;

%>
	var row = table.insertRow(<%=count%>);
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
		var cell11 = row.insertCell(10);
			var cell12 = row.insertCell(11);
				var cell13 = row.insertCell(12);
	// Add some text to the new cells:
	cell1.innerHTML = "<%=count%>";
	cell2.innerHTML = "<%=rs.getString("createdate").substring(0,10)%>";
	cell3.innerHTML ="<%=rs.getString("track_num")%>"; 
	cell4.innerHTML = "<%=pamt%>"; 
	cell5.innerHTML = "<%=damt%>"; 
	cell6.innerHTML = " "; 
	cell7.innerHTML = "<%=tamt%>"; 
	cell8.innerHTML =" <%=statsymd%>"; 
	cell9.innerHTML =" <%=statsymc%> "; 
	cell10.innerHTML =" <%=statsymr%> "; 
	cell11.innerHTML ="<%= rs.getString("rcvr_name")%>"; 
	cell12.innerHTML ="<%= rs.getString("rcvr_state")%>"; 
		cell13.innerHTML ="<%= rs.getString("rcvr_township")%>"; 
<%}}}}}%>

<%
String lidddd=listofid.replace("*",":");

        	String[] arrOfStrr = lidddd.split(":"); 
	for (String aar : arrOfStrr) {
String bbbr=aar.trim();
	if(bbbr==null || bbbr.equals("null")){}else{
		PreparedStatement pre_type = connection.prepareStatement("Select payment_code,stat from registration where id=?");
		pre_type.setString(1,bbbr);
		String paytype="",statnew="";
			ResultSet rs_type = pre_type.executeQuery();
			if (rs_type.next()) {
			    paytype=rs_type.getString("payment_code");	
			    statnew=rs_type.getString("stat");

			}
			if(statnew.equals("C")){
				String pttrim=paytype.trim();
				PreparedStatement pre_13 = connection.prepareStatement("Select payment_description  from paymentmode where payment_code=? and company_code=?");
		pre_13.setString(1,pttrim);
			pre_13.setString(2,ccode);
		String trueorf="",toftrim="";
			ResultSet rs_13 = pre_13.executeQuery();
			if (rs_13.next()) {
			    trueorf=rs_13.getString("payment_description");
			}
			toftrim=trueorf.trim();
			if(toftrim.equals("Charge to Receiver")){
	count=count+1;
		PreparedStatement pre = connection.prepareStatement("Select track_num,deli_charges,trans_charges,stat,product_amt,total_amt,rcvr_name,rcvr_phone,rcvr_township,rcvr_state,createdate from registration where id=?");
		pre.setString(1,bbbr);
			ResultSet rs = pre.executeQuery();
			if (rs.next()) {
				String stat="",statsymd="",statsymc="",statsymr="";
				stat=rs.getString("stat");
				if(stat.equals("D")){statsymd= "&#11044";}
				if(stat.equals("C")){statsymc= "&#11044";}
				if(stat.equals("R")){statsymr= "&#11044";}
					String pamt="";
			pamt=rs.getString("product_amt");
String damt="";
if( pamt==null || pamt.equals("null")){pamt=" ";}else{
	double d1=Double.parseDouble(pamt);
 int inta=(int)d1;
    totalpro=totalpro+inta;

 pamt=inta+"";
 }
 		damt=rs.getString("deli_charges");

if( damt==null || damt.equals("null")){damt=" ";}else{
	double d1=Double.parseDouble(damt);
 int inta=(int)d1;
    totaldeli=totaldeli+inta;

 damt=inta+"";
 }
 	String tamt="";
		String total1=rs.getString("product_amt");
        String total2=rs.getString("deli_charges");
        int t1=0,t2=0;
if( total1==null || total1.equals("null")){t1=0;}else{
	double d1=Double.parseDouble(total1);
  t1=(int)d1;
  }	
if( total2==null || total2.equals("null")){t2=0;}else{
	double d2=Double.parseDouble(total2);
  t2=(int)d2;
  }	
  int finalt=t2;
   totalresult=totalresult+finalt;
  tamt=""+finalt;

%>
	var row = table.insertRow(<%=count%>);
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
		var cell11 = row.insertCell(10);
			var cell12 = row.insertCell(11);
				var cell13 = row.insertCell(12);
	// Add some text to the new cells:
	cell1.innerHTML = "<%=count%>";
	cell2.innerHTML = "<%=rs.getString("createdate").substring(0,10)%>";
	cell3.innerHTML ="<%=rs.getString("track_num")%>"; 
	cell4.innerHTML = "<%=pamt%>"; 
	cell5.innerHTML = "<%=damt%>"; 
	cell6.innerHTML = " "; 
	cell7.innerHTML = "<%=tamt%>"; 
	cell8.innerHTML =" <%=statsymd%>"; 
	cell9.innerHTML =" <%=statsymc%> "; 
	cell10.innerHTML =" <%=statsymr%> "; 
	cell11.innerHTML ="<%= rs.getString("rcvr_name")%>"; 
	cell12.innerHTML ="<%= rs.getString("rcvr_state")%>"; 
		cell13.innerHTML ="<%= rs.getString("rcvr_township")%>"; 
<%}}}}}%>


<%
String lidd223=listofid.replace("*",":");

        	String[] arrOfStr223 = lidd223.split(":"); 

	for (String aa223 : arrOfStr223) {
String bbb223=aa223.trim();
	if(bbb223==null || bbb223.equals("null")){}else{
		PreparedStatement pre_type = connection.prepareStatement("Select payment_code,stat from registration where id=?");
		pre_type.setString(1,bbb223);
		String paytype="",statnew="";
			ResultSet rs_type = pre_type.executeQuery();
			if (rs_type.next()) {
			    paytype=rs_type.getString("payment_code");	
			    statnew=rs_type.getString("stat");

			}
			if(statnew.equals("C")){
				String pttrim=paytype.trim();
				PreparedStatement pre_13 = connection.prepareStatement("Select payment_description  from paymentmode where payment_code=? and company_code=?");
		pre_13.setString(1,pttrim);
			pre_13.setString(2,ccode);
		String trueorf="",toftrim="";
			ResultSet rs_13 = pre_13.executeQuery();
			if (rs_13.next()) {
			    trueorf=rs_13.getString("payment_description");
			}
			toftrim=trueorf.trim();
			if(toftrim.equals("Prepaid")){
	count=count+1;
		PreparedStatement pre = connection.prepareStatement("Select track_num,deli_charges,trans_charges,stat,product_amt,total_amt,rcvr_name,rcvr_phone,rcvr_township,rcvr_state,createdate from registration where id=?");
		pre.setString(1,bbb223);
			ResultSet rs = pre.executeQuery();
			if (rs.next()) {
				String stat="",statsymd="",statsymc="",statsymr="";
				stat=rs.getString("stat");
				if(stat.equals("D")){statsymd= "&#11044";}
				if(stat.equals("C")){statsymc= "&#11044";}
				if(stat.equals("R")){statsymr= "&#11044";}
					String pamt="";
			pamt=rs.getString("product_amt");
String damt="";
if( pamt==null || pamt.equals("null")){pamt=" ";}else{
	double d1=Double.parseDouble(pamt);
 int inta=(int)d1;
    totalpro=totalpro+inta;

 pamt=inta+"";
 }
 		damt=rs.getString("deli_charges");

if( damt==null || damt.equals("null")){damt=" ";}else{
	double d1=Double.parseDouble(damt);
 int inta=(int)d1;
    totaldeli=totaldeli+inta;

 damt=inta+"";
 }
 	String tamt="";
		String total1=rs.getString("product_amt");
        String total2=rs.getString("deli_charges");
        int t1=0,t2=0;
if( total1==null || total1.equals("null")){t1=0;}else{
	double d1=Double.parseDouble(total1);
  t1=(int)d1;
  }	
if( total2==null || total2.equals("null")){t2=0;}else{
	double d2=Double.parseDouble(total2);
  t2=(int)d2;
  }	
  int finalt=0;
   totalresult=totalresult+finalt;
  tamt=""+finalt;

%>
	var row = table.insertRow(<%=count%>);
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
		var cell11 = row.insertCell(10);
			var cell12 = row.insertCell(11);
				var cell13 = row.insertCell(12);
	// Add some text to the new cells:
	cell1.innerHTML = "<%=count%>";
	cell2.innerHTML = "<%=rs.getString("createdate").substring(0,10)%>";
	cell3.innerHTML ="<%=rs.getString("track_num")%>"; 
	cell4.innerHTML = "<%=pamt%>"; 
	cell5.innerHTML = "<%=damt%>"; 
	cell6.innerHTML = " "; 
	cell7.innerHTML = "<%=tamt%>"; 
	cell8.innerHTML =" <%=statsymd%>"; 
	cell9.innerHTML =" <%=statsymc%> "; 
	cell10.innerHTML =" <%=statsymr%> "; 
	cell11.innerHTML ="<%= rs.getString("rcvr_name")%>"; 
	cell12.innerHTML ="<%= rs.getString("rcvr_state")%>"; 
		cell13.innerHTML ="<%= rs.getString("rcvr_township")%>"; 
<%}}}}}%>

<%
String lidd2224=listofid.replace("*",":");

        	String[] arrOfStr2224 = lidd2224.split(":"); 

	for (String aa2224 : arrOfStr2224) {
String bbb2224=aa2224.trim();
	if(bbb2224==null || bbb2224.equals("null")){}else{
		PreparedStatement pre_type = connection.prepareStatement("Select payment_code,stat from registration where id=?");
		pre_type.setString(1,bbb2224);
		String paytype="",statnew="";
			ResultSet rs_type = pre_type.executeQuery();
			if (rs_type.next()) {
			    paytype=rs_type.getString("payment_code");	
			    statnew=rs_type.getString("stat");

			}
			if(statnew.equals("C")){
				String pttrim=paytype.trim();
				PreparedStatement pre_13 = connection.prepareStatement("Select payment_description  from paymentmode where payment_code=? and company_code=?");
		pre_13.setString(1,pttrim);
			pre_13.setString(2,ccode);
		String trueorf="",toftrim="";
			ResultSet rs_13 = pre_13.executeQuery();
			if (rs_13.next()) {
			    trueorf=rs_13.getString("payment_description");
			}
			toftrim=trueorf.trim();
			if(toftrim.equals("Cash On Delivery")){
	count=count+1;
		PreparedStatement pre = connection.prepareStatement("Select track_num,deli_charges,trans_charges,stat,product_amt,total_amt,rcvr_name,rcvr_phone,rcvr_township,rcvr_state,createdate from registration where id=?");
		pre.setString(1,bbb2224);
			ResultSet rs = pre.executeQuery();
			if (rs.next()) {
				String stat="",statsymd="",statsymc="",statsymr="";
				stat=rs.getString("stat");
				if(stat.equals("D")){statsymd= "&#11044";}
				if(stat.equals("C")){statsymc= "&#11044";}
				if(stat.equals("R")){statsymr= "&#11044";}
					String pamt="";
			pamt=rs.getString("product_amt");
String damt="";
if( pamt==null || pamt.equals("null")){pamt=" ";}else{
	double d1=Double.parseDouble(pamt);
 int inta=(int)d1;
    totalpro=totalpro+inta;

 pamt=inta+"";
 }
 		damt=rs.getString("deli_charges");

if( damt==null || damt.equals("null")){damt=" ";}else{
	double d1=Double.parseDouble(damt);
 int inta=(int)d1;
    totaldeli=totaldeli+inta;

 damt=inta+"";
 }
 	String tamt="";
		String total1=rs.getString("product_amt");
        String total2=rs.getString("deli_charges");
        int t1=0,t2=0;
if( total1==null || total1.equals("null")){t1=0;}else{
	double d1=Double.parseDouble(total1);
  t1=(int)d1;
  }	
if( total2==null || total2.equals("null")){t2=0;}else{
	double d2=Double.parseDouble(total2);
  t2=(int)d2;
  }	
  int finalt=t1+t2;
   totalresult=totalresult+finalt;
  tamt=""+finalt;

%>
	var row = table.insertRow(<%=count%>);
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
		var cell11 = row.insertCell(10);
			var cell12 = row.insertCell(11);
				var cell13 = row.insertCell(12);
	// Add some text to the new cells:
	cell1.innerHTML = "<%=count%>";
	cell2.innerHTML = "<%=rs.getString("createdate").substring(0,10)%>";
	cell3.innerHTML ="<%=rs.getString("track_num")%>"; 
	cell4.innerHTML = "<%=pamt%>"; 
	cell5.innerHTML = "<%=damt%>"; 
	cell6.innerHTML = " "; 
	cell7.innerHTML = "<%=tamt%>"; 
	cell8.innerHTML =" <%=statsymd%>"; 
	cell9.innerHTML =" <%=statsymc%> "; 
	cell10.innerHTML =" <%=statsymr%> "; 
	cell11.innerHTML ="<%= rs.getString("rcvr_name")%>"; 
	cell12.innerHTML ="<%= rs.getString("rcvr_state")%>"; 
		cell13.innerHTML ="<%= rs.getString("rcvr_township")%>"; 
<%}}}}}%>
<%
String lidde=listofid.replace("*",":");

        	String[] arrOfStre = lidde.split(":"); 
	for (String aae : arrOfStre) {
String bbbe=aae.trim();
	if(bbbe==null || bbbe.equals("null")){}else{
		PreparedStatement pre_type = connection.prepareStatement("Select payment_code,stat from registration where id=?");
		pre_type.setString(1,bbbe);
		String paytype="",statnew="";
			ResultSet rs_type = pre_type.executeQuery();
			if (rs_type.next()) {
			    paytype=rs_type.getString("payment_code");	
			    statnew=rs_type.getString("stat");

			}
			if(statnew.equals("R")){
				String pttrim=paytype.trim();
				PreparedStatement pre_13 = connection.prepareStatement("Select payment_description  from paymentmode where payment_code=? and company_code=?");
		pre_13.setString(1,pttrim);
			pre_13.setString(2,ccode);
		String trueorf="",toftrim="";
			ResultSet rs_13 = pre_13.executeQuery();
			if (rs_13.next()) {
			    trueorf=rs_13.getString("payment_description");
			}
			toftrim=trueorf.trim();
			if(toftrim.equals("Charge to Receiver")){
	count=count+1;
		PreparedStatement pre = connection.prepareStatement("Select track_num,deli_charges,trans_charges,stat,product_amt,total_amt,rcvr_name,rcvr_phone,rcvr_township,rcvr_state,createdate from registration where id=?");
		pre.setString(1,bbbe);
			ResultSet rs = pre.executeQuery();
			if (rs.next()) {
				String stat="",statsymd="",statsymc="",statsymr="";
				stat=rs.getString("stat");
				if(stat.equals("D")){statsymd= "&#11044";}
				if(stat.equals("C")){statsymc= "&#11044";}
				if(stat.equals("R")){statsymr= "&#11044";}
					String pamt="";
			pamt=rs.getString("product_amt");
String damt="";
if( pamt==null || pamt.equals("null")){pamt=" ";}else{
	double d1=Double.parseDouble(pamt);
 int inta=(int)d1;
    totalpro=totalpro+inta;

 pamt=inta+"";
 }
 		damt=rs.getString("deli_charges");

if( damt==null || damt.equals("null")){damt=" ";}else{
	double d1=Double.parseDouble(damt);
 int inta=(int)d1;
    totaldeli=totaldeli+inta;

 damt=inta+"";
 }
 	String tamt="";
		String total1=rs.getString("product_amt");
        String total2=rs.getString("deli_charges");
        int t1=0,t2=0;
if( total1==null || total1.equals("null")){t1=0;}else{
	double d1=Double.parseDouble(total1);
  t1=(int)d1;
  }	
if( total2==null || total2.equals("null")){t2=0;}else{
	double d2=Double.parseDouble(total2);
  t2=(int)d2;
  }	
  int finalt=t2;
   totalresult=totalresult+finalt;

  tamt=""+finalt;
%>
	var row = table.insertRow(<%=count%>);
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
		var cell11 = row.insertCell(10);
			var cell12 = row.insertCell(11);
				var cell13 = row.insertCell(12);
	// Add some text to the new cells:
	cell1.innerHTML = "<%=count%>";
	cell2.innerHTML = "<%=rs.getString("createdate").substring(0,10)%>";
	cell3.innerHTML ="<%=rs.getString("track_num")%>"; 
	cell4.innerHTML = "<%=pamt%>"; 
	cell5.innerHTML = "<%=damt%>"; 
	cell6.innerHTML = " "; 
	cell7.innerHTML = "<%=tamt%>"; 
	cell8.innerHTML =" <%=statsymd%>"; 
	cell9.innerHTML =" <%=statsymc%> "; 
	cell10.innerHTML =" <%=statsymr%> "; 
	cell11.innerHTML ="<%= rs.getString("rcvr_name")%>"; 
	cell12.innerHTML ="<%= rs.getString("rcvr_state")%>"; 
		cell13.innerHTML ="<%= rs.getString("rcvr_township")%>"; 
<%}}}}}%>


<%
String lidd22q=listofid.replace("*",":");

        	String[] arrOfStr22q = lidd22q.split(":"); 

	for (String aa22q : arrOfStr22q) {
String bbb22q=aa22q.trim();
	if(bbb22q==null || bbb22q.equals("null")){}else{
		PreparedStatement pre_type = connection.prepareStatement("Select payment_code,stat from registration where id=?");
		pre_type.setString(1,bbb22q);
		String paytype="",statnew="";
			ResultSet rs_type = pre_type.executeQuery();
			if (rs_type.next()) {
			    paytype=rs_type.getString("payment_code");	
			    statnew=rs_type.getString("stat");

			}
			if(statnew.equals("R")){
				String pttrim=paytype.trim();
				PreparedStatement pre_13 = connection.prepareStatement("Select payment_description  from paymentmode where payment_code=? and company_code=?");
		pre_13.setString(1,pttrim);
			pre_13.setString(2,ccode);
		String trueorf="",toftrim="";
			ResultSet rs_13 = pre_13.executeQuery();
			if (rs_13.next()) {
			    trueorf=rs_13.getString("payment_description");
			}
			toftrim=trueorf.trim();
			if(toftrim.equals("Prepaid")){
	count=count+1;
		PreparedStatement pre = connection.prepareStatement("Select track_num,deli_charges,trans_charges,stat,product_amt,total_amt,rcvr_name,rcvr_phone,rcvr_township,rcvr_state,createdate from registration where id=?");
		pre.setString(1,bbb22q);
			ResultSet rs = pre.executeQuery();
			if (rs.next()) {
				String stat="",statsymd="",statsymc="",statsymr="";
				stat=rs.getString("stat");
				if(stat.equals("D")){statsymd= "&#11044";}
				if(stat.equals("C")){statsymc= "&#11044";}
				if(stat.equals("R")){statsymr= "&#11044";}
					String pamt="";
			pamt=rs.getString("product_amt");
String damt="";
if( pamt==null || pamt.equals("null")){pamt=" ";}else{
	double d1=Double.parseDouble(pamt);
 int inta=(int)d1;
    totalpro=totalpro+inta;

 pamt=inta+"";
 }
 		damt=rs.getString("deli_charges");

if( damt==null || damt.equals("null")){damt=" ";}else{
	double d1=Double.parseDouble(damt);
 int inta=(int)d1;
    totaldeli=totaldeli+inta;

 damt=inta+"";
 }
 	String tamt="";
		String total1=rs.getString("product_amt");
        String total2=rs.getString("deli_charges");
        int t1=0,t2=0;
if( total1==null || total1.equals("null")){t1=0;}else{
	double d1=Double.parseDouble(total1);
  t1=(int)d1;
  }	
if( total2==null || total2.equals("null")){t2=0;}else{
	double d2=Double.parseDouble(total2);
  t2=(int)d2;
  }	
  int finalt=0;
   totalresult=totalresult+finalt;
  tamt=""+finalt;

%>
	var row = table.insertRow(<%=count%>);
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
		var cell11 = row.insertCell(10);
			var cell12 = row.insertCell(11);
				var cell13 = row.insertCell(12);
	// Add some text to the new cells:
	cell1.innerHTML = "<%=count%>";
	cell2.innerHTML = "<%=rs.getString("createdate").substring(0,10)%>";
	cell3.innerHTML ="<%=rs.getString("track_num")%>"; 
	cell4.innerHTML = "<%=pamt%>"; 
	cell5.innerHTML = "<%=damt%>"; 
	cell6.innerHTML = " "; 
	cell7.innerHTML = "<%=tamt%>"; 
	cell8.innerHTML =" <%=statsymd%>"; 
	cell9.innerHTML =" <%=statsymc%> "; 
	cell10.innerHTML =" <%=statsymr%> "; 
	cell11.innerHTML ="<%= rs.getString("rcvr_name")%>"; 
	cell12.innerHTML ="<%= rs.getString("rcvr_state")%>"; 
		cell13.innerHTML ="<%= rs.getString("rcvr_township")%>"; 
<%}}}}}%>

<%
String lidd222w=listofid.replace("*",":");

        	String[] arrOfStr222w = lidd222w.split(":"); 

	for (String aa222w : arrOfStr222w) {
String bbb222w=aa222w.trim();
	if(bbb222w==null || bbb222w.equals("null")){}else{
		PreparedStatement pre_type = connection.prepareStatement("Select payment_code,stat from registration where id=?");
		pre_type.setString(1,bbb222w);
		String paytype="",statnew="";
			ResultSet rs_type = pre_type.executeQuery();
			if (rs_type.next()) {
			    paytype=rs_type.getString("payment_code");	
			    statnew=rs_type.getString("stat");

			}
			if(statnew.equals("R")){
				String pttrim=paytype.trim();
				PreparedStatement pre_13 = connection.prepareStatement("Select payment_description  from paymentmode where payment_code=? and company_code=?");
		pre_13.setString(1,pttrim);
			pre_13.setString(2,ccode);
		String trueorf="",toftrim="";
			ResultSet rs_13 = pre_13.executeQuery();
			if (rs_13.next()) {
			    trueorf=rs_13.getString("payment_description");
			}
			toftrim=trueorf.trim();
			if(toftrim.equals("Cash On Delivery")){
	count=count+1;
		PreparedStatement pre = connection.prepareStatement("Select track_num,deli_charges,trans_charges,stat,product_amt,total_amt,rcvr_name,rcvr_phone,rcvr_township,rcvr_state,createdate from registration where id=?");
		pre.setString(1,bbb222w);
			ResultSet rs = pre.executeQuery();
			if (rs.next()) {
				String stat="",statsymd="",statsymc="",statsymr="";
				stat=rs.getString("stat");
				if(stat.equals("D")){statsymd= "&#11044";}
				if(stat.equals("C")){statsymc= "&#11044";}
				if(stat.equals("R")){statsymr= "&#11044";}
					String pamt="";
			pamt=rs.getString("product_amt");
String damt="";
if( pamt==null || pamt.equals("null")){pamt=" ";}else{
	double d1=Double.parseDouble(pamt);
 int inta=(int)d1;
    totalpro=totalpro+inta;

 pamt=inta+"";
 }
 		damt=rs.getString("deli_charges");

if( damt==null || damt.equals("null")){damt=" ";}else{
	double d1=Double.parseDouble(damt);
 int inta=(int)d1;
    totaldeli=totaldeli+inta;

 damt=inta+"";
 }
 	String tamt="";
		String total1=rs.getString("product_amt");
        String total2=rs.getString("deli_charges");
        int t1=0,t2=0;
if( total1==null || total1.equals("null")){t1=0;}else{
	double d1=Double.parseDouble(total1);
  t1=(int)d1;
  }	
if( total2==null || total2.equals("null")){t2=0;}else{
	double d2=Double.parseDouble(total2);
  t2=(int)d2;
  }	
  int finalt=t1+t2;
   totalresult=totalresult+finalt;
  tamt=""+finalt;

%>
	var row = table.insertRow(<%=count%>);
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
		var cell11 = row.insertCell(10);
			var cell12 = row.insertCell(11);
				var cell13 = row.insertCell(12);
	// Add some text to the new cells:
	cell1.innerHTML = "<%=count%>";
	cell2.innerHTML = "<%=rs.getString("createdate").substring(0,10)%>";
	cell3.innerHTML ="<%=rs.getString("track_num")%>"; 
	cell4.innerHTML = "<%=pamt%>"; 
	cell5.innerHTML = "<%=damt%>"; 
	cell6.innerHTML = " "; 
	cell7.innerHTML = "<%=tamt%>"; 
	cell8.innerHTML =" <%=statsymd%>"; 
	cell9.innerHTML =" <%=statsymc%> "; 
	cell10.innerHTML =" <%=statsymr%> "; 
	cell11.innerHTML ="<%= rs.getString("rcvr_name")%>"; 
	cell12.innerHTML ="<%= rs.getString("rcvr_state")%>"; 
		cell13.innerHTML ="<%= rs.getString("rcvr_township")%>"; 
<%}}}}}%>
<%
count=count+1;
int finalres=totalresult-totaldeli;%>
var row = table.insertRow(<%=count%>);
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
		var cell11 = row.insertCell(10);
			var cell12 = row.insertCell(11);
				var cell13 = row.insertCell(12);
	// Add some text to the new cells:
	cell1.innerHTML = " ";
	cell2.innerHTML = " ";
	cell3.innerHTML ="<b>Total</b>"; 
	cell4.innerHTML = "<b><%=totalpro%></b>"; 
	cell5.innerHTML = "<b><%=totaldeli%></b>"; 
	cell6.innerHTML = " "; 
	cell7.innerHTML = "<b><%=totalresult%></b>"; 
	cell8.innerHTML =""; 
	cell9.innerHTML ="  "; 
	cell10.innerHTML =" "; 
	cell11.innerHTML =""; 
	cell12.innerHTML =""; 
		cell13.innerHTML =""; 

  ctx2.font = "16px Times New Roman";
           ctx2.fillText("=  "+"<%=finalres%>", 810,70 );
             ctx2.font = "16px Times New Roman";
           ctx2.fillText("<%=totalresult%> - ", 620,80 );
           ctx2.font = "16px Times New Roman";
           ctx2.fillText("<%=totaldeli%>", 690,80 );
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
          
            var a='<%=listofid%>';
            var b='<%=vnum%>';
            var c='<%=finalres%>';
            var d='<%=pcode%>';
            	  $.ajax({
			    		url: "PCPDF",
			    		type: 'POST',
			    		data: {
			    			data64: data,
			    		    listofid:a,
			    		    vnum:b,
			    		    finalresult:c,
			    		     pcode:d
			    		},
			    		success: function(data) {
         window.close();
		    		}
			    		});
            	
            });
        }
    
});
    
    
    });
</script></div>
</body>
</html>
