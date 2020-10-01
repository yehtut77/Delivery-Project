<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%
	
	 HttpSession ssss=request.getSession(false);  
	String staffName=(String)ssss.getAttribute("staffName");
	String companyCode=(String)ssss.getAttribute("companyCode");
	String agentCode=(String)ssss.getAttribute("agentCode");
	String staffCode=(String)ssss.getAttribute("staffCode");
	String checknext=request.getParameter("checknext");
    String typenext=request.getParameter("typenext");


Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
String a=null;
String b=null;
String c=null;
String d=null;
String e=null;
String f=null;
String g=null;
String h=null;
String i=null;
String j=null;
String k=null;
String l=null;
String m=null;
String n=null;
String o=null;
String p=null;
String q=null;
String r=null;
String s=null;
String t=null;
String u=null;
String v=null;
String w=null;
String x=null;
String y=null;
String z=null;
String aa=null;
String bb=null;
String cc=null;
String dd=null;
String ee=null;
String ff=null;
String gg=null;
String hh=null;
String ii=null;

//connection=DriverManager.getConnection("jdbc:mysql://localhost/delivery","root","root");  
connection=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
statement=connection.createStatement();
String typenexttrim=typenext.trim();

		if (checknext.equalsIgnoreCase("1")) {
	

			PreparedStatement pre = connection.prepareStatement("Select * from registration where agent_code=? and company_code=? and track_num=?");
			pre.setString(1, agentCode);
			pre.setString(2, companyCode);
			pre.setString(3, typenexttrim);
			ResultSet rs = pre.executeQuery();
			System.out.println("agentCode="+agentCode);
			System.out.println("companyCode="+companyCode);
			System.out.println("typenexttrim="+typenexttrim);
			while (rs.next()) {
				
				a = rs.getString("id");
				b = rs.getString("company_code");
				c = rs.getString("agent_code");
				d = rs.getString("staff_code");
				e = rs.getString("trans_date");
				f = rs.getString("track_num");
				g = rs.getString("sender_code");
				h = rs.getString("rcvr_name");
				i = rs.getString("rcvr_addr1");
				j = rs.getString("rcvr_addr2");
				k = rs.getString("rcvr_addr3");
				l = rs.getString("rcvr_addr4");
				m = rs.getString("rcvr_state");
				n = rs.getString("rcvr_township");
				o = rs.getString("rcvr_ward");
				p = rs.getString("rcvr_street");
					q = rs.getString("rcvr_postal");
				r = rs.getString("rcvr_phone");
				s = rs.getString("payment_code");
				t = rs.getString("rcvd_code");
				u = rs.getString("drop_point_code");
				v = rs.getString("weight");
				w = rs.getString("size");
				x = rs.getString("deli_charges");
				y = rs.getString("trans_charges");
				z = rs.getString("product_amt");
				aa = rs.getString("cur_charges");
				bb = rs.getString("total_amt");
				cc = rs.getString("stat");
				dd = rs.getString("item_desc");
				ee = rs.getString("planned_deli_date");
				ff = rs.getString("createdby");
				gg = rs.getString("updateby");
				hh = rs.getString("createdate");
				ii = rs.getString("modifydate");
				
out.println(checknext+"$"+a+"$"+b+"$"+c+"$"+d+"$"+e+"$"+f+"$"+g+"$"+h+"$"+i+"$"+j+"$"+k+"$"+l+"$"+m+"$"+n+"$"+o+"$"+p+"$"+q+"$"+r+"$"+s+"$"+t+"$"+u+"$"+v+"$"+w+"$"+x+"$"+y+"$"+z+"$"+aa+"$"+bb+"$"+cc+"$"+dd+"$"+ee+"$"+ff+"$"+gg+"$"+hh+"$"+ii+"$");

			}
			rs.close();
			pre.close();
		}
	
		if (checknext.equalsIgnoreCase("2")) {
String id="",cuscode="",cuscode2="";	int count=0;
String data="",alldata="";
			PreparedStatement pre = connection
					.prepareStatement("Select * from credit_cust where cust_name=?");
			pre.setString(1, typenext);
			ResultSet rs = pre.executeQuery();
			while (rs.next()) {
				cuscode=rs.getString("cust_code1");
				cuscode2=rs.getString("cust_code2");
				id=cuscode+cuscode2;
				System.out.println(cuscode);
				System.out.println(cuscode2);
				
			
			PreparedStatement pre2 = connection
					.prepareStatement("Select * from registration where sender_code=?");
			pre2.setString(1, id);
			ResultSet rs2 = pre2.executeQuery();
	
			while (rs2.next()) {
				count++;
				a = rs2.getString("id");
				b = rs2.getString("company_code");
				c = rs2.getString("agent_code");
				d = rs2.getString("staff_code");
				e = rs2.getString("trans_date");
				f = rs2.getString("track_num");
				g = rs2.getString("sender_code");
				h = rs2.getString("rcvr_name");
				i = rs2.getString("rcvr_addr1");
				j = rs2.getString("rcvr_addr2");
				k = rs2.getString("rcvr_addr3");
				l = rs2.getString("rcvr_addr4");
				m = rs2.getString("rcvr_state");
				n = rs2.getString("rcvr_township");
				o = rs2.getString("rcvr_ward");
				p = rs2.getString("rcvr_street");
					q = rs2.getString("rcvr_postal");
				r = rs2.getString("rcvr_phone");
				s = rs2.getString("payment_code");
				t = rs2.getString("rcvd_code");
				u = rs2.getString("drop_point_code");
				v = rs2.getString("weight");
				w = rs2.getString("size");
				x = rs2.getString("deli_charges");
				y = rs2.getString("trans_charges");
				z = rs2.getString("product_amt");
				aa = rs2.getString("cur_charges");
				bb = rs2.getString("total_amt");
				cc = rs2.getString("stat");
				dd = rs2.getString("item_desc");
				ee = rs2.getString("planned_deli_date");
				ff = rs2.getString("createdby");
				gg = rs2.getString("updateby");
				hh = rs2.getString("createdate");
				ii = rs2.getString("modifydate");
				
data=a+"  $"+b+"  $"+c+"  $"+d+"  $"+e+"  $"+f+"  $"+g+"  $"+h+"  $"+i+"  $"+j+"  $"+k+"  $"+l+"  $"+m+"  $"+n+"  $"+o+"  $"+p+"  $"+q+"  $"+r+"  $"+s+"  $"+t+"  $"+u+"  $"+v+"  $"+w+"  $"+x+"  $"+y+"  $"+z+"  $"+aa+"  $"+bb+"  $"+cc+"  $"+dd+"  $"+ee+"  $"+ff+"  $"+gg+"  $"+hh+"  $"+ii+"  $";	
alldata=alldata+data;

			}
			    		rs2.close();
			pre2.close();
			}
				String finalresult=checknext+"$"+count+"$"+alldata;
			
			
			rs.close();
			pre.close();
	out.print(finalresult);
		}
		if (checknext.equalsIgnoreCase("3")) {
			int count=0;
			String data="",alldata="";
			String id="",cuscode="",cuscode2="";
			PreparedStatement pre = connection
					.prepareStatement("Select * from credit_cust where cust_phone=?");
			pre.setString(1, typenext);
			ResultSet rs = pre.executeQuery();
			while (rs.next()) {
				cuscode=rs.getString("cust_code1");
				cuscode2=rs.getString("cust_code2");
				id=cuscode+cuscode2;	
			PreparedStatement pre2 = connection
					.prepareStatement("Select * from registration where sender_code=?");
			pre2.setString(1, id);
			ResultSet rs2 = pre2.executeQuery();
	
			while (rs2.next()) {
				count++;
				a = rs2.getString("id");
				b = rs2.getString("company_code");
				c = rs2.getString("agent_code");
				d = rs2.getString("staff_code");
				e = rs2.getString("trans_date");
				f = rs2.getString("track_num");
				g = rs2.getString("sender_code");
				h = rs2.getString("rcvr_name");
				i = rs2.getString("rcvr_addr1");
				j = rs2.getString("rcvr_addr2");
				k = rs2.getString("rcvr_addr3");
				l = rs2.getString("rcvr_addr4");
				m = rs2.getString("rcvr_state");
				n = rs2.getString("rcvr_township");
				o = rs2.getString("rcvr_ward");
				p = rs2.getString("rcvr_street");
					q = rs2.getString("rcvr_postal");
				r = rs2.getString("rcvr_phone");
				s = rs2.getString("payment_code");
				t = rs2.getString("rcvd_code");
				u = rs2.getString("drop_point_code");
				v = rs2.getString("weight");
				w = rs2.getString("size");
				x = rs2.getString("deli_charges");
				y = rs2.getString("trans_charges");
				z = rs2.getString("product_amt");
				aa = rs2.getString("cur_charges");
				bb = rs2.getString("total_amt");
				cc = rs2.getString("stat");
				dd = rs2.getString("item_desc");
				ee = rs2.getString("planned_deli_date");
				ff = rs2.getString("createdby");
				gg = rs2.getString("updateby");
				hh = rs2.getString("createdate");
				ii = rs2.getString("modifydate");
				
data=a+"  $"+b+"  $"+c+"  $"+d+"  $"+e+"  $"+f+"  $"+g+"  $"+h+"  $"+i+"  $"+j+"  $"+k+"  $"+l+"  $"+m+"  $"+n+"  $"+o+"  $"+p+"  $"+q+"  $"+r+"  $"+s+"  $"+t+"  $"+u+"  $"+v+"  $"+w+"  $"+x+"  $"+y+"  $"+z+"  $"+aa+"  $"+bb+"  $"+cc+"  $"+dd+"  $"+ee+"  $"+ff+"  $"+gg+"  $"+hh+"  $"+ii+"  $";	
alldata=alldata+data;

			}	rs2.close();
			pre2.close();}
				String finalresult=checknext+"$"+count+"$"+alldata;
			
								rs.close();
			pre.close();
		
			
	out.print(finalresult);
		}

		if (checknext.equalsIgnoreCase("4")){
		
			PreparedStatement pre2 = connection
					.prepareStatement("Select * from registration where rcvr_name=?");
			pre2.setString(1, typenext);
			ResultSet rs2 = pre2.executeQuery();
		int count=0;
		String data="",alldata="";
			while (rs2.next()) {
				count++;
				a = rs2.getString("id");
				b = rs2.getString("company_code");
				c = rs2.getString("agent_code");
				d = rs2.getString("staff_code");
				e = rs2.getString("trans_date");
				f = rs2.getString("track_num");
				g = rs2.getString("sender_code");
				h = rs2.getString("rcvr_name");
				i = rs2.getString("rcvr_addr1");
				j = rs2.getString("rcvr_addr2");
				k = rs2.getString("rcvr_addr3");
				l = rs2.getString("rcvr_addr4");
				m = rs2.getString("rcvr_state");
				n = rs2.getString("rcvr_township");
				o = rs2.getString("rcvr_ward");
				p = rs2.getString("rcvr_street");
					q = rs2.getString("rcvr_postal");
				r = rs2.getString("rcvr_phone");
				s = rs2.getString("payment_code");
				t = rs2.getString("rcvd_code");
				u = rs2.getString("drop_point_code");
				v = rs2.getString("weight");
				w = rs2.getString("size");
				x = rs2.getString("deli_charges");
				y = rs2.getString("trans_charges");
				z = rs2.getString("product_amt");
				aa = rs2.getString("cur_charges");
				bb = rs2.getString("total_amt");
				cc = rs2.getString("stat");
				dd = rs2.getString("item_desc");
				ee = rs2.getString("planned_deli_date");
				ff = rs2.getString("createdby");
				gg = rs2.getString("updateby");
				hh = rs2.getString("createdate");
				ii = rs2.getString("modifydate");
				
data=a+"  $"+b+"  $"+c+"  $"+d+"  $"+e+"  $"+f+"  $"+g+"  $"+h+"  $"+i+"  $"+j+"  $"+k+"  $"+l+"  $"+m+"  $"+n+"  $"+o+"  $"+p+"  $"+q+"  $"+r+"  $"+s+"  $"+t+"  $"+u+"  $"+v+"  $"+w+"  $"+x+"  $"+y+"  $"+z+"  $"+aa+"  $"+bb+"  $"+cc+"  $"+dd+"  $"+ee+"  $"+ff+"  $"+gg+"  $"+hh+"  $"+ii+"  $";	
alldata=alldata+data;

			}
				String finalresult=checknext+"$"+count+"$"+alldata;
			
			rs2.close();
			pre2.close();
				
	out.print(finalresult);
		}
		if (checknext.equalsIgnoreCase("5")){
		
			PreparedStatement pre2 = connection
					.prepareStatement("Select * from registration where rcvr_phone=?");
			pre2.setString(1, typenext);
			ResultSet rs2 = pre2.executeQuery();
		int count=0;
		String data="",alldata="";
			while (rs2.next()) {
				count++;
				a = rs2.getString("id");
				b = rs2.getString("company_code");
				c = rs2.getString("agent_code");
				d = rs2.getString("staff_code");
				e = rs2.getString("trans_date");
				f = rs2.getString("track_num");
				g = rs2.getString("sender_code");
				h = rs2.getString("rcvr_name");
				i = rs2.getString("rcvr_addr1");
				j = rs2.getString("rcvr_addr2");
				k = rs2.getString("rcvr_addr3");
				l = rs2.getString("rcvr_addr4");
				m = rs2.getString("rcvr_state");
				n = rs2.getString("rcvr_township");
				o = rs2.getString("rcvr_ward");
				p = rs2.getString("rcvr_street");
					q = rs2.getString("rcvr_postal");
				r = rs2.getString("rcvr_phone");
				s = rs2.getString("payment_code");
				t = rs2.getString("rcvd_code");
				u = rs2.getString("drop_point_code");
				v = rs2.getString("weight");
				w = rs2.getString("size");
				x = rs2.getString("deli_charges");
				y = rs2.getString("trans_charges");
				z = rs2.getString("product_amt");
				aa = rs2.getString("cur_charges");
				bb = rs2.getString("total_amt");
				cc = rs2.getString("stat");
				dd = rs2.getString("item_desc");
				ee = rs2.getString("planned_deli_date");
				ff = rs2.getString("createdby");
				gg = rs2.getString("updateby");
				hh = rs2.getString("createdate");
				ii = rs2.getString("modifydate");
				
data=a+"  $"+b+"  $"+c+"  $"+d+"  $"+e+"  $"+f+"  $"+g+"  $"+h+"  $"+i+"  $"+j+"  $"+k+"  $"+l+"  $"+m+"  $"+n+"  $"+o+"  $"+p+"  $"+q+"  $"+r+"  $"+s+"  $"+t+"  $"+u+"  $"+v+"  $"+w+"  $"+x+"  $"+y+"  $"+z+"  $"+aa+"  $"+bb+"  $"+cc+"  $"+dd+"  $"+ee+"  $"+ff+"  $"+gg+"  $"+hh+"  $"+ii+"  $";	
alldata=alldata+data;

			}
				String finalresult=checknext+"$"+count+"$"+alldata;
			
			
			rs2.close();
			pre2.close();
		
	out.print(finalresult);
		}
		if (checknext.equalsIgnoreCase("6")){
			
			PreparedStatement pre2 = connection
					.prepareStatement("Select * from registration where planned_deli_date=?");
			pre2.setString(1, typenext);
			ResultSet rs2 = pre2.executeQuery();
		int count=0;
		String data="",alldata="";
			while (rs2.next()) {
				count++;
				a = rs2.getString("id");
				b = rs2.getString("company_code");
				c = rs2.getString("agent_code");
				d = rs2.getString("staff_code");
				e = rs2.getString("trans_date");
				f = rs2.getString("track_num");
				g = rs2.getString("sender_code");
				h = rs2.getString("rcvr_name");
				i = rs2.getString("rcvr_addr1");
				j = rs2.getString("rcvr_addr2");
				k = rs2.getString("rcvr_addr3");
				l = rs2.getString("rcvr_addr4");
				m = rs2.getString("rcvr_state");
				n = rs2.getString("rcvr_township");
				o = rs2.getString("rcvr_ward");
				p = rs2.getString("rcvr_street");
					q = rs2.getString("rcvr_postal");
				r = rs2.getString("rcvr_phone");
				s = rs2.getString("payment_code");
				t = rs2.getString("rcvd_code");
				u = rs2.getString("drop_point_code");
				v = rs2.getString("weight");
				w = rs2.getString("size");
				x = rs2.getString("deli_charges");
				y = rs2.getString("trans_charges");
				z = rs2.getString("product_amt");
				aa = rs2.getString("cur_charges");
				bb = rs2.getString("total_amt");
				cc = rs2.getString("stat");
				dd = rs2.getString("item_desc");
				ee = rs2.getString("planned_deli_date");
				ff = rs2.getString("createdby");
				gg = rs2.getString("updateby");
				hh = rs2.getString("createdate");
				ii = rs2.getString("modifydate");
				
data=a+"  $"+b+"  $"+c+"  $"+d+"  $"+e+"  $"+f+"  $"+g+"  $"+h+"  $"+i+"  $"+j+"  $"+k+"  $"+l+"  $"+m+"  $"+n+"  $"+o+"  $"+p+"  $"+q+"  $"+r+"  $"+s+"  $"+t+"  $"+u+"  $"+v+"  $"+w+"  $"+x+"  $"+y+"  $"+z+"  $"+aa+"  $"+bb+"  $"+cc+"  $"+dd+"  $"+ee+"  $"+ff+"  $"+gg+"  $"+hh+"  $"+ii+"  $";	
alldata=alldata+data;

			}
				String finalresult=checknext+"$"+count+"$"+alldata;
				
			rs2.close();
			pre2.close();
	
						
	out.print(finalresult);
		}
		
%>
