<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@ page import="java.time.format.DateTimeFormatter" %>
    <%@ page import="java.time.*" %>
<%
String type=request.getParameter("type");

DateTimeFormatter FOMATTER = DateTimeFormatter.ofPattern("MM/dd/yyyy 'at' hh:mm a");

	//Local date time instance
	LocalDateTime localDateTime = LocalDateTime.now();
	
	//Get formatted String
	String ldtString = FOMATTER.format(localDateTime);
Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");

//Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/delivery1", "root", "root");
if(type.equalsIgnoreCase("ward_check")){
	
	String state_code=request.getParameter("state_code");
	String township_name=request.getParameter("township_name");
	String ward_name=request.getParameter("ward_name");
	String township_code=null;
PreparedStatement p=conn.prepareStatement("Select* from township where state_code=? AND township_name=?");
p.setString(1, state_code);
p.setString(2, township_name);

ResultSet r=p.executeQuery();
while(r.next()){
	township_code=r.getString("township_code");
}
	PreparedStatement pre=conn.prepareStatement("Select * from ward where state_code=? AND township_code=?");
	 pre.setString(1, state_code); 
	 pre.setString(2, township_code); 
	 
	 
	 ResultSet rs=pre.executeQuery();
	while(rs.next()){
		if(ward_name.equalsIgnoreCase(rs.getString("ward_name"))){
			out.println("ok");
			break;
		}
	}
	
}
else if(type.equalsIgnoreCase("insert_ward")){
	String user=request.getParameter("user");
	String state_name=request.getParameter("state_name");
	String township_name=request.getParameter("township_name");
	String ward_name=request.getParameter("ward_name");
	String state_code=null;
	String township_code=null;
	PreparedStatement p=conn.prepareStatement("Select* from state where state_name=?");
	p.setString(1, state_name);
	ResultSet r=p.executeQuery();
	while(r.next()){
		state_code=r.getString("state_code");
		
	}
	PreparedStatement pp=conn.prepareStatement("Select* from township where state_code=? AND township_name=?");
	pp.setString(1, state_code);
	pp.setString(2, township_name);
	ResultSet rr=pp.executeQuery();
	while(rr.next()){
		township_code=rr.getString("township_code");
		
	}
	 String final_code=null;
	 int ward_code=0;
	
	 PreparedStatement pr=conn.prepareStatement("Select* from ward where state_code=? AND township_code=?");
	 pr.setString(1, state_code);
	 pr.setString(2, township_code);
	 
	    ResultSet r1=pr.executeQuery();
	    while(r1.next()){
	        ward_code=Integer.parseInt(r1.getString("ward_code"));
	    }
	    ward_code+=1;
	    final_code=String.format("%02d", ward_code);
	    PreparedStatement ppp=conn.prepareStatement("Insert into ward(ward_code,state_code,township_code,ward_name,createby,createdate)values(?,?,?,?,?,?)");
	    ppp.setString(1,final_code);
	    ppp.setString(2,state_code);
	    ppp.setString(3,township_code);
	    ppp.setString(4,ward_name);
	    ppp.setString(5,user);
	    ppp.setString(6,ldtString);
	    ppp.execute();
	    response.sendRedirect("state_division.jsp");

}
else if(type.equalsIgnoreCase("street_check")){

	String state_code=request.getParameter("state_code");
	String township_code=request.getParameter("township_code");
	String ward_code=request.getParameter("ward_code");
	String street_name=request.getParameter("street_name");
	PreparedStatement p=conn.prepareStatement("Select* from street where state_code=? AND township_code=?");
	p.setString(1, state_code);
	p.setString(2, township_code);
	ResultSet rs=p.executeQuery();
	while(rs.next()){
		if(ward_code.equalsIgnoreCase(rs.getString("ward_code")) && street_name.equalsIgnoreCase(rs.getString("street_name"))){
			out.println("ok");break;
		}
	}
}
else if(type.equalsIgnoreCase("insert_street")){
	
	String state_name=request.getParameter("state_name");
	String state_code=null;
	String township_code=request.getParameter("township_code");
	String ward_code=request.getParameter("ward_code");
	String street_name=request.getParameter("street_name");
	String user=request.getParameter("user");
	PreparedStatement p=conn.prepareStatement("Select* from state where state_name=?");
	p.setString(1, state_name);
	ResultSet r=p.executeQuery();
	while(r.next()){
		state_code=r.getString("state_code");
	}
	
	String final_code=null;
	 int street_code=0;
		
	
	    PreparedStatement pp=conn.prepareStatement("Select* from street where ward_code=?");
	    pp.setString(1, ward_code);
	    ResultSet rs=pp.executeQuery();
	    
	    while(rs.next()){
	    	
	        street_code=Integer.parseInt(rs.getString("street_code"));
	    	  }
	    street_code+=1;
	    final_code=String.format("%02d", street_code);
	PreparedStatement pre=conn.prepareStatement("Insert into street(street_code,ward_code,township_code,state_code,street_name,createby,createdate)values(?,?,?,?,?,?,?)");
	pre.setString(1, final_code);
	pre.setString(2, ward_code);
	pre.setString(3, township_code);
	pre.setString(4, state_code);
	pre.setString(5, street_name);
	pre.setString(6, user);
	pre.setString(7, ldtString);
	pre.execute();
	response.sendRedirect("state_division.jsp");
}


conn.close();
%>