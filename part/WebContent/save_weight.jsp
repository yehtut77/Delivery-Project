<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.time.format.DateTimeFormatter" %>
    <%@ page import="java.time.*" %>
<%
try{
//Connection con=DriverManager.getConnection("jdbc:mysql://localhost/delivery1","root","root");
Connection con=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");

String type=request.getParameter("type");

if(type.equalsIgnoreCase("edit_uom")){
String um_code=request.getParameter("um_code");
String u_m=request.getParameter("u_m");
String isvalid=request.getParameter("isvalid");
	System.out.println(um_code);
	System.out.println(u_m);
	System.out.println(isvalid);

	PreparedStatement p2=con.prepareStatement("Update uom set um_code=?,u_m=?,isvalid_um=? where um_code=?");
	p2.setString(1,um_code);
	p2.setString(2,u_m);
	p2.setString(3,isvalid);
	p2.setString(4,um_code);
	p2.execute();
		response.sendRedirect("add_weight.jsp");
}

	


if(type.equalsIgnoreCase("check")){
	String check=request.getParameter("check");
	
check=check.toLowerCase();
	PreparedStatement p1=con.prepareStatement("Select* from uom where u_m=?");
	p1.setString(1, check);
	
	ResultSet r=p1.executeQuery();
	if(r.next()){
		out.println("ok");
	}
	
}
if(type.equalsIgnoreCase("weight")){
String charges_code=request.getParameter("data");

String from_weight=request.getParameter("from_weight");
	String to_weight=request.getParameter("to_weight");
	
	String uom_code=request.getParameter("uom_code");//this **
	String user=request.getParameter("user");
	String f_state=request.getParameter("f_state");
	String t_state=request.getParameter("t_state");
	String f_township=request.getParameter("f_township");
	String t_township=request.getParameter("t_township");
	String size=request.getParameter("size");
	String delivery_charges=request.getParameter("delivery_charges");
	String transportation_charges=request.getParameter("transportation_charges");
	String uom=null;
	String f_state_code=null;
	String t_state_code=null;
	String f_township_code=null;
	String t_township_code=null;
	String company_code=request.getParameter("company_code");
	PreparedStatement p=con.prepareStatement("Select* from uom where um_code=?");
	p.setString(1, uom_code);
	ResultSet r1=p.executeQuery();
	while(r1.next()){
		uom=r1.getString("u_m");
	}
	PreparedStatement p1=con.prepareStatement("Select* from state");
	ResultSet r2=p1.executeQuery();
	while(r2.next()){
		if(r2.getString("state_name").equalsIgnoreCase(f_state)){
			f_state_code=r2.getString("state_code");
		}
		if(r2.getString("state_name").equalsIgnoreCase(t_state)){
			t_state_code=r2.getString("state_code");
		}
	}
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("Select* from township");
	while(rs.next()){
		if(rs.getString("township_name").equalsIgnoreCase(f_township)){
			f_township_code=rs.getString("township_code");
		}
		if(rs.getString("township_name").equalsIgnoreCase(t_township)){
			t_township_code=rs.getString("township_code");
		}
	}

	
		Statement s11=con.createStatement();
		ResultSet r11=s11.executeQuery("Select* from charges");
		String[] curr_code=null;
		int changecode=0;
		String result=null;
		while(r11.next()){
			 curr_code=r11.getString("charges_code").split("-");
			 changecode = Integer.parseInt(curr_code[1]);
		}
		 
		changecode+=1;
		 result =company_code+"-"+ String.format("%04d", changecode);
		 
	
	/* System.out.println(f_state_code);
	System.out.println(t_state_code);
	System.out.println(f_township_code);
	System.out.println(t_township_code); */
	 /* System.out.println(from_weight);
	System.out.println(to_weight);
	System.out.println(uom);
	System.out.println(uom_code);
	System.out.println(user);
	System.out.println(f_state);
	System.out.println(t_state);
	System.out.println(f_township);
	System.out.println(t_township);
	System.out.println(size);
	System.out.println(delivery_charges);
	System.out.println(transportation_charges); */

	DateTimeFormatter FOMATTER = DateTimeFormatter.ofPattern("MM/dd/yyyy 'at' hh:mm a");

	//Local date time instance
	LocalDateTime localDateTime = LocalDateTime.now();
	 System.out.println("hello");
	//Get formatted String
	String ldtString = FOMATTER.format(localDateTime);
	if(charges_code==null || charges_code==""){
	System.out.println("charges code in null or something");
	 PreparedStatement pre=con.prepareStatement("Insert into charges(company_code,from_state_code,from_state_desc,from_township_code,from_township_desc,to_state_code,to_state_desc,to_township_code,to_township_desc,from_weight,to_weight,size,transportation_charges,delivery_charges,um_code,createdby,createdate,u_m,charges_code)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
	pre.setString(1,company_code);
	pre.setString(2,f_state_code);//to_state_code,to_state_desc,to_township_code,to_township_desc,from_weight,to_weight,size,transportation_charges,delivery_charges,um_code,createdby,createdate,updatedby,modifydate,u_m
	pre.setString(3,f_state);
	pre.setString(4,f_township_code);
	pre.setString(5,f_township);
	pre.setString(6,t_state_code);
	pre.setString(7,t_state);
	pre.setString(8,t_township_code);
	pre.setString(9,t_township);
	pre.setString(10,from_weight);
	pre.setString(11,to_weight);
	pre.setString(12,size);
	pre.setString(13,transportation_charges);
	pre.setString(14,delivery_charges);
	pre.setString(15,uom_code);
	pre.setString(16, user);
	pre.setString(17,ldtString );
	pre.setString(18, uom);
	pre.setString(19, result);

	pre.execute();
	response.sendRedirect("add_weight.jsp");
	}
	else{
	System.out.println("Hello saveweight.jsp");
	 PreparedStatement pre=con.prepareStatement("Update charges set company_code=?,from_state_code=?,from_state_desc=?,from_township_code=?,from_township_desc=?,to_state_code=?,to_state_desc=?,to_township_code=?,to_township_desc=?,from_weight=?,to_weight=?,size=?,transportation_charges=?,delivery_charges=?,um_code=?,updatedby=?,modifydate=?,u_m=? where charges_code=?");
	pre.setString(1,company_code);
	pre.setString(2,f_state_code);//to_state_code,to_state_desc,to_township_code,to_township_desc,from_weight,to_weight,size,transportation_charges,delivery_charges,um_code,createdby,createdate,updatedby,modifydate,u_m
	pre.setString(3,f_state);
	pre.setString(4,f_township_code);
	pre.setString(5,f_township);
	pre.setString(6,t_state_code);
	pre.setString(7,t_state);
	pre.setString(8,t_township_code);
	pre.setString(9,t_township);
	pre.setString(10,from_weight);
	pre.setString(11,to_weight);
	pre.setString(12,size);
	pre.setString(13,transportation_charges);
	pre.setString(14,delivery_charges);
	pre.setString(15,uom_code);
	pre.setString(16, user);
	pre.setString(17,ldtString );
	pre.setString(18, uom);
	pre.setString(19, charges_code);

	pre.execute();
	response.sendRedirect("add_weight.jsp");
	    
	}
	
}
if(type.equalsIgnoreCase("um")){
String  um_code=request.getParameter("um_code");
String uom1=request.getParameter("uom1");
String valid=request.getParameter("valid");
uom1=uom1.toLowerCase();
 

/* System.out.println(um_code);
System.out.println(uom1);
System.out.println(valid); */
PreparedStatement p=con.prepareStatement("insert into uom (um_code,u_m,isvalid_um) values(?,?,?)");
p.setString(1, um_code);
p.setString(2, uom1);
p.setString(3,valid);
p.execute();

response.sendRedirect("add_weight.jsp");
}
		
	

con.close();	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	




%>
    