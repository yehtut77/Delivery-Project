<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*"%>  
  <%@page import="java.text.SimpleDateFormat,java.util.Date"%>
            <%@ page import="java.time.format.DateTimeFormatter" %>
    <%@ page import="java.time.*" %>
<%
Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
String type=request.getParameter("type");
DateTimeFormatter FOMATTER1 = DateTimeFormatter.ofPattern("MM/dd/yy");
//Local date time instance
LocalDateTime localDateTime = LocalDateTime.now();

//Get formatted String

String ldtString1=FOMATTER1.format(localDateTime);
String[] arr=ldtString1.split("/");
String date=arr[2]+arr[0];

if(type.equalsIgnoreCase("conso")){

String ccode=request.getParameter("ccode");
String track_num=request.getParameter("track_num");


PreparedStatement p=conn.prepareStatement("Select track_num,rcvr_township,rcvr_state from registration where company_code=? AND track_num=?");
p.setString(1, ccode);
p.setString(2, track_num);
ResultSet r=p.executeQuery();
if(r.next()==true){
	String reply=r.getString("track_num")+"$"+r.getString("rcvr_township")+"$"+r.getString("rcvr_state");
	out.println(reply);
}

else{
	out.println("not");
}

r.close();
p.close();
}
else if(type.equalsIgnoreCase("generate")){
System.out.println("generate");
	String agent_code=request.getParameter("agent_code");
	String[] track_num=request.getParameterValues("track_num[]");
	String ccode=request.getParameter("ccode");
	String from_state=request.getParameter("from_state");
	String to_state=request.getParameter("to_state");
	String from_township=request.getParameter("from_township");
	String to_township=request.getParameter("to_township");
	String from_state_code=null;
	String to_state_code=null;
	String from_township_code=null;
	String to_township_code=null;
	String to_agent_code=request.getParameter("to_agent_code");
	String user=request.getParameter("user");
	
	PreparedStatement p1=conn.prepareStatement("Select state_code from state where state_name=?");
	p1.setString(1, from_state);
	ResultSet f_result=p1.executeQuery();
	while(f_result.next()){
		from_state_code=f_result.getString("state_code");
		
	}
	p1=conn.prepareStatement("Select township_code from township where state_code=? AND township_name=?");
	p1.setString(1, from_state_code);
	p1.setString(2, from_township);
	ResultSet town=p1.executeQuery();
	while(town.next()){
		from_township_code=town.getString("township_code");
	}
	p1=conn.prepareStatement("Select state_code from state where state_name=?");
	p1.setString(1, to_state);
	ResultSet result=p1.executeQuery();
	while(result.next()){
		to_state_code=result.getString("state_code");
		
	}
	
	p1=conn.prepareStatement("Select township_code from township where state_code=? AND township_name=?");
	p1.setString(1, to_state_code);
	p1.setString(2, to_township);
	ResultSet tow=p1.executeQuery();
	while(tow.next()){
		to_township_code=tow.getString("township_code");
	}
	
	
	
	
	System.out.println("length="+track_num.length);
	PreparedStatement pre=conn.prepareStatement("Select period from nextkey where type=? AND company_code=?");
	pre.setString(1, "conso");
	pre.setString(2, ccode);
	ResultSet r=pre.executeQuery();
	if(r.next()==false){
		PreparedStatement pre1=conn.prepareStatement("Insert into nextkey(company_code,period,type,month,module) values(?,?,?,?,?)");	
		pre1.setString(1, ccode);
		pre1.setString(2,"00000");
		pre1.setString(3, "conso");
		pre1.setString(4,date);
		pre1.setString(5,"CMH");
		pre1.execute();
		
		/* 
		
		
		
		out.println(conso_code);
		pre.close(); */
		
	}
	int period=0;
	r.previous();
	while(r.next()){
		System.out.println("hello"+r.getString("period"));
	 period=Integer.parseInt(r.getString("period"));
	}

	period+=1;
	 pre=conn.prepareStatement("Update nextkey set month=?,period=? where company_code=? AND type=?");
	pre.setString(1, date);
	pre.setString(2, String.format("%05d", period));
	pre.setString(3, ccode);
	pre.setString(4, "conso");
	pre.execute();
	
	String conso_code="C"+ccode+date+String.format("%05d", period);
	pre=conn.prepareStatement("Insert into consolidate_hdr(company_code,agent_code,conso_code,createdby,createdate) values(?,?,?,?,?)");
	pre.setString(1, ccode);
	pre.setString(2, agent_code);
	pre.setString(3, conso_code);
	pre.setString(4, user);
	pre.setString(5, ldtString1);
	pre.execute();
	for(int i=0;i<track_num.length;i++){
		//System.out.println(track_num[i]);
	
		

	
		
		pre=conn.prepareStatement("Insert into consolidate_item(company_code,agent_code,conso_code,seq,track_num,from_state_code,to_state_code,from_township_code,to_township_code,to_agent_code,createdby,createdate) values(?,?,?,?,?,?,?,?,?,?,?,?)");
		pre.setString(1, ccode);
		pre.setString(2,agent_code);
		pre.setString(3, conso_code);
		pre.setString(4, Integer.toString(i+1));
		pre.setString(5, track_num[i]);
		pre.setString(6, from_state_code);
		pre.setString(7, to_state_code);
		pre.setString(8,from_township_code);
		pre.setString(9, to_township_code);
		pre.setString(10, to_agent_code);
		pre.setString(11, user);
		pre.setString(12, ldtString1);
		pre.execute();
		
		
		
		

	 }
	out.println(conso_code);
	
}
conn.close();
%>
