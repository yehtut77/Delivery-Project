<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import=" java.io.File"%>
<%@page import=" java.io.FileOutputStream"%>
<%@page import=" java.io.FileInputStream"%>

<%@page import=" java.util.Base64"%>
<%@page import=" java.awt.Desktop"%>



<%@page import="java.sql.PreparedStatement"%>
  <%@page import="java.text.SimpleDateFormat,java.util.Date"%>
            <%@ page import="java.time.format.DateTimeFormatter" %>
    <%@ page import="java.time.*" %>
<%


DateTimeFormatter dat = DateTimeFormatter.ofPattern("dd/MM/yyyy hh:mm a");
LocalDateTime localDateTime = LocalDateTime.now();
String ldtString2 = dat.format(localDateTime);

DateTimeFormatter FOMATTER = DateTimeFormatter.ofPattern("yyyy/MM/dd");
//Local date time instance
LocalDateTime localDateTime2 = LocalDateTime.now();
 
//Get formatted String
String ldtString = FOMATTER.format(localDateTime2);

HttpSession ssss=request.getSession(false);  
String staff_name=(String)ssss.getAttribute("staffName");
String ccode=(String)ssss.getAttribute("companyCode");

String agent_code=(String)ssss.getAttribute("agentCode");
String staff_code=(String)ssss.getAttribute("staffCode");


	String data=request.getParameter("data64");

File file = new File("/home/teamrame/jvm/apache-tomcat-9.0.12/domains/delivery.teamramen.net/ROOT/DO.pdf");

try ( FileOutputStream fos = new FileOutputStream(file); ) {
  // To be short I use a corrupted PDF string, so make sure to use a valid one if you want to preview the PDF file
  String b64 =data;
  byte[] decoder = Base64.getDecoder().decode(b64);

  fos.write(decoder);
  System.out.println("PDF File Saved");
 
  Connection connection=null;
 connection=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
  
   PreparedStatement  pre3=null,pre2=null;
	pre3=connection.prepareStatement("insert into agent_inbox(trans_date, company_code, agent_code, sender_code, sender_name, body, attachment,created_date, createdby,module_code,read_unread)"+
	        "values(?,?,?,?,?,?,?,?,?,?,?)");
	String bod="Dear "+staff_name+"$"+"Delivery List For "+ldtString2+" as attached"+"$$Safe Drive! ";
    FileInputStream input = new FileInputStream(file);
    pre3.setString(1,ldtString2);
    pre3.setString(2,ccode);
    pre3.setString(3,agent_code);
    pre3.setString(4,"OFD");
    pre3.setString(5,staff_name);
    pre3.setString(6,bod);
    		
    pre3.setBlob(7,input);
    pre3.setString(8,ldtString2);
    pre3.setString(9,staff_name);
    pre3.setString(10,"OFD");
    pre3.setString(11,"ur");
	pre3.executeUpdate();
	pre2=connection.prepareStatement("insert into agent_noti(agent_code, company_code, sender_code, sub)"+
	        "values(?,?,?,?)");
    pre2.setString(1,agent_code);
    pre2.setString(2,ccode);
    pre2.setString(3,"OFD");
    pre2.setString(4,"Out for delivery");
   
  
	pre2.executeUpdate();
	System.out.print("GGGGGFFFF");
	
	} catch (Exception e) {
  e.printStackTrace();
}

%>