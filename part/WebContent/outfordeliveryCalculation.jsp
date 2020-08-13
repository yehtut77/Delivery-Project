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
       
        
<%
String addedstring="0000000";
HttpSession ssss=request.getSession(false);  
	 
	String staffName=(String)ssss.getAttribute("staffName");
String companyCode=(String)ssss.getAttribute("companyCode");

	String agentCode=(String)ssss.getAttribute("agentCode");
	String staffCode=(String)ssss.getAttribute("staffCode");
	
	
	String typenext=request.getParameter("tt");
	String cond=request.getParameter("condition");
	String name=request.getParameter("name");

	String typenext2=typenext.replace("$",":");
String n=null;
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
String typenexttrim=typenext.trim();
connection=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");


if(cond.equalsIgnoreCase("ok")){

	String[] arrOfStr = typenext2.split(":"); 

	for (String a : arrOfStr) {
		if(a.equalsIgnoreCase("") || a.equals(null)){}
		else{
			System.out.println(a);
			String query =
				    "update registration " +
				    "set stat = ?, " +
				    "updateby = ?" +
				    "where track_num = ? and company_code=? and agent_code=? "; 
	      PreparedStatement preparedStmt = connection.prepareStatement(query);
	      preparedStmt.setString(1,"G");
	      preparedStmt.setString(2,name);
	      preparedStmt.setString(3,a);
     preparedStmt.setString(4,companyCode);
     preparedStmt.setString(5,agentCode);
	      preparedStmt.executeUpdate();
	      }}
 


	PreparedStatement pre = connection
			.prepareStatement("Select period from nextkey where company_code=? and agent_code=? and module=? ");
	pre.setString(1, companyCode);
	pre.setString(2, agentCode);
	pre.setString(3,"OFD");
	ResultSet rs = pre.executeQuery();
	String period="";
	while (rs.next()) {
		
		period = rs.getString("period");
}

if(period.equalsIgnoreCase("null")|| period.equalsIgnoreCase("")){
	
	PreparedStatement  pre2=null;

	pre2=connection.prepareStatement("insert into nextkey(company_code,agent_code,period,module,staff_code)"+
	        "values(?,?,?,?)");

	pre2.setString(1,companyCode);
	pre2.setString(2,agentCode);
	pre2.setString(3,"0000000");
	pre2.setString(4,"OFD");
		pre2.setString(5,staffCode);


	pre2.executeUpdate();
}

else{

int add=Integer.parseInt(period);
int result=add+1;
int added=result;

int count = 0;
while(result != 0)
{
    // num = num/10
    result /= 10;
    ++count;
}

if(count==7){addedstring=""+added;}
if(count==6){addedstring="0"+added;}
if(count==5){addedstring="00"+added;}
if(count==4){addedstring="000"+added;}
if(count==3){addedstring="0000"+added;}
if(count==2){addedstring="00000"+added;}
if(count==1){addedstring="000000"+added;}
System.out.println(period+"is my cat");
System.out.println(add+"is my car");

System.out.println(added+"is my dog");
System.out.println(addedstring+"is my name");

	String query =
		    "update nextkey " +
		    "set period = ?" +
				    "where company_code = ? and " +
		    "agent_code=? ";
		    	
  PreparedStatement preparedStmt = connection.prepareStatement(query);
  preparedStmt.setString(1,addedstring);
  preparedStmt.setString(2,companyCode);
  preparedStmt.setString(3,agentCode);
  preparedStmt.executeUpdate();
	
}


DateTimeFormatter dat = DateTimeFormatter.ofPattern("dd/MM/yyyy hh:mm a");
LocalDateTime localDateTime = LocalDateTime.now();
String ldtString2 = dat.format(localDateTime);

DateTimeFormatter FOMATTER = DateTimeFormatter.ofPattern("yyyy/MM/dd");
//Local date time instance
LocalDateTime localDateTime2 = LocalDateTime.now();
 
//Get formatted String
String ldtString = FOMATTER.format(localDateTime2);

 String year=ldtString.substring(0,2);

String DOnum="D"+year+"-"+addedstring;

PreparedStatement  pre2=null;

pre2=connection.prepareStatement("insert into do_hdr(company_code,agent_code,do_date,do_num,stat,staff_code,createdby,createdate)"+
        "values(?,?,?,?,?,?,?,?)");

pre2.setString(1,companyCode);
pre2.setString(2,agentCode);
pre2.setString(3,ldtString2);
pre2.setString(4,DOnum);
pre2.setString(5,"O");
pre2.setString(6,staffCode);
pre2.setString(7,staffName);
pre2.setString(8,ldtString2);


pre2.executeUpdate();
int countrec=0;
for (String a : arrOfStr) {
	if(a.equalsIgnoreCase("") || a.equals(null)){}
	else{
		countrec=countrec+1;
		String countrecstr=countrec+"";
		PreparedStatement  pre3=null;

		pre3=connection.prepareStatement("insert into do_item(company_code,do_num,do_seq,stat,tracking_num,createdby,createdate)"+
		        "values(?,?,?,?,?,?,?)");
String aa=a.replace(" ","");
System.out.println(aa);

		pre3.setString(1,companyCode);
		pre3.setString(2,DOnum);
		pre3.setString(3,countrecstr);
		pre3.setString(4,"O");
		pre3.setString(5,aa);
	
		pre3.setString(6,staffName);
		pre3.setString(7,ldtString2);


		pre3.executeUpdate();
		


		PreparedStatement pree2 = connection
				.prepareStatement("Select * from staff where company_code=? and parent_agent_code=? and staff_code=?");
		pree2.setString(1, companyCode);
		pree2.setString(2, agentCode);
		pree2.setString(3, staffCode);
		ResultSet rss2 = pree2.executeQuery();
		String sph="";
		while (rss2.next()) {
			
			sph = rss2.getString("staff_phone");
	}
		PreparedStatement pree3 = connection
				.prepareStatement("Select deli_charges from registration where track_num=? and company_code=? and agent_code=?");
		pree3.setString(1, aa);
		pree3.setString(2, companyCode);
		pree3.setString(3, agentCode);
	
		ResultSet rss3 = pree3.executeQuery();
		String delichar="";
		if (rss3.next()) {
			
			delichar = rss3.getString("deli_charges");
	}
PreparedStatement pree = connection
.prepareStatement("Select trans_num from transaction");

ResultSet rss = pree.executeQuery();
String period2="";
while (rss.next()) {

period2 = rss.getString("trans_num");
}
int add=Integer.parseInt(period2);
int result=add+1;
int added=result;

int count = 0;
while(result != 0)
{
    // num = num/10
    result /= 10;
    ++count;
}

if(count==4){addedstring=""+added;}
if(count==3){addedstring="0"+added;}
if(count==2){addedstring="00"+added;}
if(count==1){addedstring="000"+added;}
		PreparedStatement pre4=connection.prepareStatement("insert into transaction(trans_num,trans_date,company_code,agent_code,staff_username,staff_phone,track_num,track_stat,ref_type,delivery_charges,createdby, updatedby, createdate, modifydate)"+
		        "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

		pre4.setString(1,addedstring);
		pre4.setString(2,ldtString2);
		pre4.setString(3,companyCode);
		pre4.setString(4,agentCode);
		pre4.setString(5,staffName);
	
		pre4.setString(6,sph);
		pre4.setString(7,aa);
		pre4.setString(8,"G");
		pre4.setString(9," ");

		pre4.setString(10,delichar);
		pre4.setString(11,staffName);

		pre4.setString(12,"");
		pre4.setString(13,ldtString2);
	
		pre4.setString(14,"");



		pre4.executeUpdate();
		HttpSession s=request.getSession();
				s.setAttribute("tl",typenext2);
				s.setAttribute("DO",DOnum);
		
	}
	}


}
%>