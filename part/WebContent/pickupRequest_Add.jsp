<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
	<%@ page import="java.io.*"%>	
	<%@ page import="java.util.Base64"%>
	<%@ page import="java.time.LocalDateTime" %>
	<%@ page import="java.time.format.DateTimeFormatter"%>
	<%@ page import="java.text.SimpleDateFormat" %>	
	<%@ page import="java.util.Date"%>

<%
 
	

	String name=request.getParameter("sender_name");
	String contact_ph=request.getParameter("phono");
	String contact_person=request.getParameter("contact_person");
	String pickup_date=request.getParameter("pickup_date");
	
	String address1=request.getParameter("address1");
	String address2=request.getParameter("address2");
	if(address2==null)address2=" ";
	String address3=request.getParameter("address3");
	if(address3==null)address3=" ";
	String address4=request.getParameter("address4");
	if(address4==null)address4=" ";

	String a_state=request.getParameter("select1" );
	String a_township=request.getParameter("select2"  );
	String a_ward=request.getParameter("select3" );
	if(a_ward==null)a_ward=" ";
	String a_street=request.getParameter("select4"  );
	if(a_street==null)a_street=" ";
	String postal_code=request.getParameter("s_postcode");
	String agent=request.getParameter("agent");
	
        	String body=address1+" |"+address2+" |"+address3+" |"+address4+" |"+a_state+" |"+a_township	+" |"+a_ward+" |"+a_street+" |"+postal_code+" |"+contact_ph+" |"+contact_person+" |"+pickup_date;


	 DateTimeFormatter FOMATTER = DateTimeFormatter.ofPattern("MM/dd/yyyy 'at' hh:mm a");
	 LocalDateTime localDateTime = LocalDateTime.now();
	 String ldtString = FOMATTER.format(localDateTime);
  

 
	 	String[] str=new String[9];
	 	str = agent.split(":");
	 
	    String c_code=str[0] ;
		String a_code=str[1] ;
		String a_name=str[2] ;


  try { 
	  
	 // Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/delivery","root","root"); 
	 PreparedStatement pre=null;
	 Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
  
  		pre=conn. prepareStatement("insert into agent_inbox(trans_date,company_code,agent_code,sender_code,sender_name,body,created_date,createdby,read_unread,module_code)"
  			+ "values(?,?,?,?,?,?,?,?,?,?)");
  
  
	  pre.setString(1,ldtString); 
	  pre.setString(2,c_code);
	  pre.setString(3,a_code); 		 
	  pre.setString(4,"PUR");
	  pre.setString(5,name);
	  pre.setString(6,body);
	  pre.setString(7,ldtString);
	  pre.setString(8,name);
	  pre.setString(9,"ur");
	  pre.setString(10,"PUR");
	  pre.executeUpdate();
	   
	 PreparedStatement  pre_noti=conn. prepareStatement("insert into agent_noti(company_code,agent_code,sender_code,sub)"
  			+ "values(?,?,?,?)");
  	  pre_noti.setString(1,c_code);
	  pre_noti.setString(2,a_code); 		 
	  pre_noti.setString(3,"PUR");
	  pre_noti.setString(4,"Pick-Up Request");
	  pre_noti.executeUpdate();
	  
	  conn.close(); 
	  response.sendRedirect("pickupRequest.jsp");
 

	}catch(Exception e){out.println(e);}   
  

%>
