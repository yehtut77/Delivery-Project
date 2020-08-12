<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
       <%@ page import="java.time.format.DateTimeFormatter" %>
    <%@ page import="java.time.*" %>
<%
//Connection con=DriverManager.getConnection("jdbc:mysql://localhost/delivery1","root","root");
Connection con=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
String type=request.getParameter("type");
String user=request.getParameter("user");




DateTimeFormatter FOMATTER = DateTimeFormatter.ofPattern("MM/dd/yyyy 'at' hh:mm a");

//Local date time instance
LocalDateTime localDateTime = LocalDateTime.now();

//Get formatted String
String ldtString = FOMATTER.format(localDateTime);
if(type.equalsIgnoreCase("edit_curr")){
    String ccode=request.getParameter("curr_code");
    String desc=request.getParameter("description");
    PreparedStatement p2=con.prepareStatement("Update curr_desc set description=?,updateby=?,modifydate=? where curr_code=?");
    p2.setString(1, desc);
    p2.setString(2, user);
    p2.setString(3, ldtString);
    p2.setString(4, ccode);
    p2.execute();
    
    
    response.sendRedirect("currency.jsp");
    
    
    
    
}
if(type.equalsIgnoreCase("check")){
	String check=request.getParameter("check");
	check=check.toUpperCase();
	Statement st=con.createStatement();
	PreparedStatement p1=con.prepareStatement("Select* from curr_desc where description=?");
	p1.setString(1, check);
	
	ResultSet r=p1.executeQuery();
	if(r.next()){
		out.println("ok");
	}
	
}
if(type.equalsIgnoreCase("create")){
	
String curr_code=request.getParameter("curr_code");
String desc=request.getParameter("desc");

desc=desc.toUpperCase();

/*  PreparedStatement p=con.prepareStatement("insert into curr_desc (curr_code,desc)values(?,?);");
p.setString(1, curr_code);
p.setString(2, desc);
p.execute();  */
PreparedStatement p=con.prepareStatement("insert into curr_desc (curr_code,description,createdby,createdate) values(?,?,?,?)");
p.setString(1, curr_code);
p.setString(2, desc);
p.setString(3, user);
p.setString(4, ldtString);


p.execute();
response.sendRedirect("currency.jsp");
}
if(type.equalsIgnoreCase("update")){
	String from_currency=request.getParameter("from_currency");
	String to_currency=request.getParameter("to_currency");
	String exchange=request.getParameter("exchange");
	String id=request.getParameter("id");
	Statement s=con.createStatement();
 	boolean flag=false;
 
	ResultSet rs=s.executeQuery("Select * from currency");
	while(rs.next()){
	String temp=rs.getString("curr_code");
	System.out.println(temp);
	System.out.println(from_currency);
		if(temp.equalsIgnoreCase(from_currency)){
			flag=true;
		}
	}
	PreparedStatement p1=con.prepareStatement("Select* from curr_desc where curr_code=?");
	p1.setString(1, from_currency);
	ResultSet rs1=p1.executeQuery();
	String curr_desc=null;
	while(rs1.next()){
		curr_desc=rs1.getString("description");
	}
	
	if(flag==false){
		PreparedStatement p=con.prepareStatement("insert into currency (from_curr,to_curr,exch_rate,createdby,createdate,curr_code) values(?,?,?,?,?,?)");
		p.setString(1, curr_desc);
		p.setString(2, to_currency);
		p.setString(3, exchange);
		p.setString(4, user);
		p.setString(5, ldtString);
			p.setString(6, from_currency);
		

		p.execute();
	}
	if(flag==true){
	
	 PreparedStatement pre=con.prepareStatement("Update currency set exch_rate=?,updatedby=?,modifydate=? where curr_code=?");

	pre.setString(1, exchange);
	pre.setString(2, user);
	pre.setString(3, ldtString);
	pre.setString(4, from_currency);
	pre.execute(); }
	response.sendRedirect("currency.jsp");
}
con.close();


%>