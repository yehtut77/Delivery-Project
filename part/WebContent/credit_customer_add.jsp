<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>  
    <%@ page import="java.time.format.DateTimeFormatter" %>
    <%@ page import="java.time.*" %>
<%
//Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/delivery1","root","root");
Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");

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
int format=0;
String cust_code;
int c2=0;
String c1,f_code;
String cust_code2;
String[] arr;
boolean flag=false;
String currency1=currency.substring(0,1);
PreparedStatement p=conn.prepareStatement("Select cust_code1 from credit_cust where cust_code2=?");
p.setString(1, currency1);

ResultSet r=p.executeQuery();
while(r.next()){
	 cust_code=r.getString("cust_code1");
	 arr=cust_code.split("-");
	 c2=Integer.parseInt(arr[1]);
	 format=Integer.parseInt(arr[0].substring(0,1));
	 if(c2>=99999){
	 	format+=1;
	 	c2=0;
	 	
	 }
	}




c1=format+"C";
c2+=1;
f_code=String.format("%05d", c2);
cust_code=c1+"-"+f_code;
cust_code2=currency1;



DateTimeFormatter FOMATTER = DateTimeFormatter.ofPattern("MM/dd/yyyy 'at' hh:mm a");

//Local date time instance
LocalDateTime localDateTime = LocalDateTime.now();

//Get formatted String
String ldtString = FOMATTER.format(localDateTime);

PreparedStatement pre=conn.prepareStatement
("Insert into credit_cust(company_code,cust_name,cust_addr1,cust_addr2,cust_addr3,cust_addr4,cust_state,cust_township,cust_ward,cust_street,cust_postal,cust_country,cust_phone,cust_email,currency,cust_bankcardtype,cust_bankusername,cust_bankacctno,cust_bankexprdate,cust_bankname,createdby,createdate,cust_code1,cust_code2,username,password)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
pre.setString(1, ccode);
pre.setString(2, name);
pre.setString(3, address1);
pre.setString(4, address2);
pre.setString(5, address3);
pre.setString(6, address4);
pre.setString(7, state);

pre.setString(8, township);
pre.setString(9, ward);
pre.setString(10, street);
pre.setString(11, postcode);
pre.setString(12, country);
pre.setString(13, phone);
pre.setString(14, email);
pre.setString(15, currency);
pre.setString(16, cardtype);
pre.setString(17, busername);
pre.setString(18, accno);
pre.setString(19, edate);
pre.setString(20, bname);
pre.setString(21, staff_name);
pre.setString(22, ldtString);
pre.setString(23, cust_code);
pre.setString(24, cust_code2);
pre.setString(25, username);
pre.setString(26, password);


pre.execute();

/* p=conn.prepareStatement("update credit_cust set cust_name=?,cust_addr1=?,cust_addr2=?,cust_addr3=?,cust_addr4=?,cust_state=?,cust_township=?,cust_ward=?,cust_street=?,cust_postal=?,cust_country=?,cust_phone=?,cust_email=?,currency=?,cust_bankcardtype=?,cust_bankusername=?,cust_bankacctno=?,cust_bankexprdate=?,cust_bankname=?,updatedby=?,modifydate=?,username=?,password=? where cust_phone=?");
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
p.setString(12, phone);
p.setString(13, email);
p.setString(14, currency);

p.setString(15, cardtype);
p.setString(16, busername);
p.setString(17, accno);
p.setString(18, edate);
p.setString(19, bname);
p.setString(20, staff_name);
p.setString(21, ldtString);
p.setString(22, username);
p.setString(23, password);
p.setString(24, phone);

p.execute(); */
conn.close();

%>

