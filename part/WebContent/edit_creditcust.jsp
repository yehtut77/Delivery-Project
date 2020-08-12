<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
     <%@ page import="java.time.format.DateTimeFormatter" %>
    <%@ page import="java.time.*" %>
<%Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
DateTimeFormatter FOMATTER = DateTimeFormatter.ofPattern("MM/dd/yyyy 'at' hh:mm a");

//Local date time instance
LocalDateTime localDateTime = LocalDateTime.now();

//Get formatted String
String ldtString = FOMATTER.format(localDateTime);

String type=request.getParameter("type");


if(type.equalsIgnoreCase("edit")){
	
	String phone=request.getParameter("phone");
	String curr=request.getParameter("curr");
	PreparedStatement pre=conn.prepareStatement("Select* from credit_cust where cust_phone=? AND currency=?");
	pre.setString(1, phone);
	pre.setString(2, curr);
	ResultSet r=pre.executeQuery();
	if(r.next()==true){
		String cust_addr3=r.getString("cust_addr3");
		String cust_addr4=r.getString("cust_addr4");
		String cust_countrycode=r.getString("cust_country");
		
		String cust_email=r.getString("cust_email");
		if(cust_email.equalsIgnoreCase(null)){
			cust_email="-";
		}
		
		if(cust_addr3.equalsIgnoreCase(null)){
			cust_addr3="-";
		}
		if(cust_addr4.equalsIgnoreCase(null)){
			cust_addr4="-";
		}
		String cust_bank_expdate=r.getString("cust_bankexprdate");
		String[] arr=cust_bank_expdate.split("/");
	String re=r.getString("cust_name")+"$"+r.getString("cust_addr1")+"$"+r.getString("cust_addr2")+"$"+cust_addr3+"$"+cust_addr4+"$"+r.getString("cust_postal")+"$"+cust_countrycode+"$"+r.getString("cust_email")+"$"+r.getString("cust_bankcardtype")+"$"+r.getString("cust_bankusername")+"$"+r.getString("cust_bankacctno")+"$"+arr[0]+"$"+arr[1]+"$"+r.getString("cust_bankname")+"$"+r.getString("username")+"$"+r.getString("password");
	out.println(re);
	
	}
	else{
		out.println("not");
	}
	
	
			
}

else if(type.equalsIgnoreCase("check_phone")){
    
  String ccode=request.getParameter("ccode");
    String phone=request.getParameter("phone");
    System.out.println("phone"+phone);
    	PreparedStatement pre=conn.prepareStatement("Select cust_phone from credit_cust where cust_phone=? AND company_code=?");
    	pre.setString(1,phone);
    	pre.setString(2,ccode);
    	ResultSet r=pre.executeQuery();
    	if(r.next()){
    	    out.println("ok");
    	}
    
}
else if(type.equalsIgnoreCase("update")){

	String staff_name=request.getParameter("staff_name");
	String ccode=request.getParameter("ccode");
	String name=request.getParameter("name");
	String phone=request.getParameter("phone");
	String email=request.getParameter("email");
	String currency=request.getParameter("currency");
	String address1=request.getParameter("address1");
	String address2=request.getParameter("address2");
	String address3=request.getParameter("address3");
	String address4=request.getParameter("address4");
	String country=request.getParameter("country");
	String state=request.getParameter("select1");
	String township=request.getParameter("select2");
	String ward=request.getParameter("select3");
	String street=request.getParameter("select4");
	String postcode=request.getParameter("postcode");
	String bname=request.getParameter("bname");
	String busername=request.getParameter("busername");
	String accno=request.getParameter("accno");
	String cardtype=request.getParameter("bcard");
	String emonth=request.getParameter("emonth");
	String eyear=request.getParameter("eyear");
	String edate=emonth+"/"+eyear;
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	PreparedStatement p=conn.prepareStatement("Update credit_cust set cust_name=?,cust_addr1=?,cust_addr2=?,cust_addr3=?,cust_addr4=?,cust_state=?,cust_township=?,cust_ward=?,cust_street=?,cust_postal=?,cust_country=?,cust_email=?,currency=?,cust_bankcardtype=?,cust_bankusername=?,cust_bankacctno=?,cust_bankexprdate=?,cust_bankname=?,updatedby=?,modifydate=?,username=?,password=? where cust_phone=?");
	p.setString(1, name);
	p.setString(2, address1);
	p.setString(3, address2);
	p.setString(4, address3);
	p.setString(5, address4);
	p.setString(6, state);
	p.setString(7, township);
	p.setString(8, ward);
	p.setString(9, street);
	p.setString(10, postcode);
	p.setString(11, country);
	p.setString(12, email);
	p.setString(13, currency);
	p.setString(14, cardtype);
	p.setString(15, busername);
	p.setString(16, accno);
	p.setString(17, edate);
	p.setString(18, bname);
	p.setString(19, staff_name);
	p.setString(20, ldtString);
	p.setString(21, username);
	p.setString(22, password);
	p.setString(23, phone);
	p.execute();
	
	
	

}
conn.close();



%>