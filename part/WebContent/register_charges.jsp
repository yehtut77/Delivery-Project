<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<%
//Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/delivery1","root","root"); 
Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");

String type=request.getParameter("type");
if(type.equalsIgnoreCase("charges")){

	String s_postcode=request.getParameter("s_postcode");
	String r_postcode=request.getParameter("r_postcode");
	String s_curr=request.getParameter("s_curr");
	String r_curr=request.getParameter("r_curr");
	String weight=request.getParameter("weight");
	String size=request.getParameter("size");
	String ccode=request.getParameter("ccode");
	System.out.println(ccode);

String s_postcode1,s_postcode2,r_postcode2;
String r_postcode1=null;
String reply=null;
if(!s_postcode.equals(null) && !r_postcode.equals(null) && !s_curr.equals(null) && !r_curr.equals(null) && !weight.equals(null) && !size.equals(null) ){
	float w=Float.parseFloat(weight);
	float s=Float.parseFloat(size);
if(!s_curr.equalsIgnoreCase(r_curr)){
	PreparedStatement pre=conn.prepareStatement("Select exch_rate from currency where curr_code=?");
	pre.setString(1, s_curr);
	ResultSet curr_result=pre.executeQuery();
	if(curr_result.next()){
		reply=curr_result.getString("exch_rate");
		
		
	}
	s_postcode=s_postcode.substring(0,4);
	r_postcode=r_postcode.substring(0,4);
	s_postcode1=s_postcode.substring(0,2);
	s_postcode2=s_postcode.substring(2,4);
	r_postcode1=r_postcode.substring(0,2);
	r_postcode2=r_postcode.substring(2,4);
	PreparedStatement p=conn.prepareStatement("Select delivery_charges,transportation_charges,from_weight,to_weight,size from charges where from_state_code=? And from_township_code=? And to_state_code=? And to_township_code=? AND company_code=? order by size ASC");
	p.setString(1, s_postcode1);
	p.setString(2, s_postcode2);
	p.setString(3, r_postcode1);
	p.setString(4, r_postcode2);
	p.setString(5, ccode);
	ResultSet r=p.executeQuery();
	while(r.next()){
		
	System.out.println("In Loop");

		 if(w>=r.getFloat("from_weight") && w<=r.getFloat("to_weight")){
			if(s<=r.getFloat("size")){
			reply+="-"+r.getString("transportation_charges")+"-"+r.getString("delivery_charges");break;
			}
			else if(s>=r.getFloat("size")){
				r.next();
				reply+="-"+r.getString("transportation_charges")+"-"+r.getString("delivery_charges");break;
			}
		}  
	}
	
	
	
}


if(s_curr.equalsIgnoreCase(r_curr)){
	
	s_postcode=s_postcode.substring(0,4);
	r_postcode=r_postcode.substring(0,4);
	s_postcode1=s_postcode.substring(0,2);
	s_postcode2=s_postcode.substring(2,4);
	r_postcode1=r_postcode.substring(0,2);
	r_postcode2=r_postcode.substring(2,4);
	PreparedStatement p=conn.prepareStatement("Select delivery_charges,transportation_charges,from_weight,to_weight,size from charges where from_state_code=? And from_township_code=? And to_state_code=? And to_township_code=?  AND company_code=? order by size ASC");
	p.setString(1, s_postcode1);
	p.setString(2, s_postcode2);
	p.setString(3, r_postcode1);
	p.setString(4, r_postcode2);
		p.setString(5, ccode);
	ResultSet r=p.executeQuery();
	while(r.next()){
		
	

		 if(w>=r.getFloat("from_weight") && w<=r.getFloat("to_weight")){
			if(s<=r.getFloat("size")){
			reply=r.getString("transportation_charges")+"-"+r.getString("delivery_charges");break;
			}
			else if(s>=r.getFloat("size")){
				r.next();
				reply=r.getString("transportation_charges")+"-"+r.getString("delivery_charges");break;
			}
		}  
	}
	
	
	
}
out.println(reply);
}
}
else if(type.equalsIgnoreCase("phone")){
	

	String curr=request.getParameter("curr");
	String ccode=request.getParameter("ccode");
	System.out.println("company_code:"+ccode);
	PreparedStatement p=conn.prepareStatement("Select* from curr_desc where curr_code=?");
	p.setString(1, curr);
	ResultSet r2=p.executeQuery();
	while(r2.next()){
		curr=r2.getString("description");
	}
	String s_phone=request.getParameter("s_phone");
	
	PreparedStatement pre=conn.prepareStatement("Select* from credit_cust where cust_phone=? AND currency=? AND company_code=?");
	pre.setString(1, s_phone);
	pre.setString(2, curr);
	pre.setString(3, ccode);
	ResultSet r=pre.executeQuery();
	
	if(r.next()==true){
		
		String cust_addr3=r.getString("cust_addr3");
		String cust_addr4=r.getString("cust_addr4");
		String cust_countrycode=r.getString("cust_country");
		
		String cust_email=r.getString("cust_email");
		if(cust_email==null){
			cust_email="-";
		}
		
		if(cust_addr3==null){
			cust_addr3="-";
		}
		if(cust_addr4==null){
			cust_addr4="-";
		}
		String cust_code=r.getString("cust_code1")+r.getString("cust_code2");
		
		String re=r.getString("cust_name")+"$"+r.getString("cust_addr1")+"$"+r.getString("cust_addr2")+"$"+cust_addr3+"$"+cust_addr4+"$"+r.getString("cust_postal")+"$"+cust_countrycode+"$"+cust_code;
		out.println(re);
	}
	else{
		out.println("not");
	}
	
}
else if(type.equalsIgnoreCase("r_phone")){
	String curr=request.getParameter("curr");
	
	String r_phone=request.getParameter("r_phone");

	
	PreparedStatement pre=conn.prepareStatement("Select* from rcvr where rcvr_phone=? AND currency=?");
	pre.setString(1, r_phone);
	pre.setString(2, curr);
	ResultSet r=pre.executeQuery();
	
	if(r.next()==true){
		
		String cust_addr3=r.getString("rcvr_addr3");
		String cust_addr4=r.getString("rcvr_addr4");
		String cust_countrycode=r.getString("rcvr_country");
		
	
		
		if(cust_addr3==null){
			cust_addr3="-";
		}
		if(cust_addr4==null){
			cust_addr4="-";
		}
		
		
		String re=r.getString("rcvr_name")+"$"+r.getString("rcvr_addr1")+"$"+r.getString("rcvr_addr2")+"$"+cust_addr3+"$"+cust_addr4+"$"+r.getString("rcvr_postal")+"$"+cust_countrycode+"$"+r.getString("rcvr_code");
		out.println(re);
	}
	else{
		out.println("not");
	}
}

	


conn.close();
%>