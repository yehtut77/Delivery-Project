<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%
	

String decision=request.getParameter("decision");
String tn=request.getParameter("track_num");


HttpSession ssss=request.getSession(false);  

String companyCode=(String)ssss.getAttribute("companyCode");
//String ccode="0001";
String agentCode=(String)ssss.getAttribute("agentCode");
System.out.println(agentCode);
System.out.println(companyCode);
String tntrim=tn.trim();


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
String ftrim="";
//connection=DriverManager.getConnection("jdbc:mysql://localhost/delivery","root","root");  
connection=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
statement=connection.createStatement();


if (decision.equalsIgnoreCase("t")){
		
		PreparedStatement pre2 = connection.prepareStatement("Select * from registration where track_num=? and agent_code=? and company_code=?");
		    pre2.setString(1, tntrim);
			pre2.setString(2, agentCode);
			pre2.setString(3, companyCode);
		ResultSet rs2 = pre2.executeQuery();
        String id=null,id2=null,id3=null,id4=null,id5=null,id6=null,id7=null,id8=null,id9=null;
    	String data=null;
		while (rs2.next()) {
		
			a = rs2.getString("id");
			b = rs2.getString("company_code");
			c = rs2.getString("agent_code");
			d = rs2.getString("staff_code");
			e = rs2.getString("trans_date");
			f = rs2.getString("track_num");
			ftrim=f.trim();
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

		String c1="",c2="";
		c1=g.substring(0,8);
		c2=g.substring(8,9);
			
				
			PreparedStatement pre = connection.prepareStatement("Select * from credit_cust where cust_code1 =? and cust_code2=? and company_code=? ");
			pre.setString(1,c1);
			pre.setString(2,c2);
			pre.setString(3,companyCode);
			ResultSet rs = pre.executeQuery();
			
			if (rs.next()) {
				id=rs.getString("cust_name");
				id2=rs.getString("cust_phone");
				id3=rs.getString("cust_addr1");
				id4=rs.getString("cust_addr2");
				id5=rs.getString("cust_addr3");
				id6=rs.getString("cust_addr4");
				id7=rs.getString("cust_postal");
				id8=rs.getString("cust_township");
				id9=rs.getString("cust_state");
			}
		    	rs.close();
			pre.close();
		}
			pre2.close();
			rs2.close();
			
		
			
			
			String pickdate="",pickby="";
			PreparedStatement pref = connection.prepareStatement("Select * from pickup where track_num =? and agent_code=? and company_code=?");
			pref.setString(1, ftrim);
			pref.setString(2, agentCode);
			pref.setString(3, companyCode);
			ResultSet rss = pref.executeQuery();
			
			if(rss.next()) {
				pickdate=rss.getString("pickup_date");
				pickby=rss.getString("staff_code");
				
		
			}
				rss.close();
				pref.close();
			
			String pb="";
			PreparedStatement pre_staff = connection.prepareStatement("Select * from staff where agent_code=? and company_code=? and staff_code =?");
			pre_staff.setString(1, agentCode);
			pre_staff.setString(2, companyCode);
			pre_staff.setString(3, pickby);
			ResultSet rs_staff = pre_staff.executeQuery();
			if (rs_staff.next()) {
				pb=rs_staff.getString("staff_name");

			}
				rs_staff.close();
				pre_staff.close();

			
			String waybilltype="";
			PreparedStatement pre_paymentmode = connection.prepareStatement("Select * from paymentmode where company_code=? and payment_code =?");
			pre_paymentmode.setString(1, companyCode);
			pre_paymentmode.setString(2, s);
			ResultSet rs_paymentmode = pre_paymentmode.executeQuery();
			if(rs_paymentmode.next()) {
				waybilltype=rs_paymentmode.getString("payment_description");

			}
				rs_paymentmode.close();
			pre_paymentmode.close();
			String stat="",des="";
			PreparedStatement pref4 = connection.prepareStatement("Select * from stat where stat_code =?");
			pref4.setString(1, cc);
			ResultSet rss4 = pref4.executeQuery();
			if(rss4.next()) {
				des=rss4.getString("description");

			}
				rss4.close();
			pref4.close();
			String do_date=" ",sname=" ";
			System.out.println(aa);
			System.out.println(bb);
			System.out.println(cc);
			System.out.println(c);
			System.out.println(d);
			System.out.println(e);
			System.out.println(f);
			
			if(cc.equalsIgnoreCase("G")){
				String do_num="",comc="",sc="",ac="";
				PreparedStatement pref5 = connection.prepareStatement("Select do_num from do_item where company_code=? and tracking_num =?");
				pref5.setString(1, companyCode);
				pref5.setString(2, ftrim);
				ResultSet rss5 = pref5.executeQuery();
				if (rss5.next()) {
					do_num=rss5.getString("do_num");

				}
					rss5.close();
			pref5.close();
				PreparedStatement pref6 = connection.prepareStatement("Select do_date,company_code,agent_code,staff_code from do_hdr where agent_code=? and company_code=? and do_num =?");
				pref6.setString(1, agentCode);
				pref6.setString(2, companyCode);
				pref6.setString(3, do_num);
				ResultSet rss6 = pref6.executeQuery();
				if(rss6.next()) {
					do_date=rss6.getString("do_date");
					comc=rss6.getString("company_code");
					ac=rss6.getString("agent_code");
					sc=rss6.getString("staff_code");

				}	rss6.close();
			pref6.close();
				PreparedStatement pref7 = connection.prepareStatement("Select staff_name from staff where company_code =? and staff_code =? and agent_code=? ");
				pref7.setString(1, comc);
				pref7.setString(2, sc);
				pref7.setString(3, ac);
				
				ResultSet rss7 = pref7.executeQuery();
				if(rss7.next()) {
				
					sname=rss7.getString("staff_name");
			}
			rss7.close();
			pref7.close();
			
			
			}
data=id+" $"+id2+" $"+id3+" $"+id4+" $"+id5+" $"+id6+" $"+id7+" $"+id8+" $"+id9+" $"+a+"  $"+b+"  $"+c+"  $"+d+"  $"+e+"  $"+f+"  $"+g+"  $"+h+"  $"+i+"  $"+j+"  $"+k+"  $"+l+"  $"+m+"  $"+n+"  $"+o+"  $"+p+"  $"+q+"  $"+r+"  $"+s+"  $"+t+"  $"+u+"  $"+v+"  $"+w+"  $"+x+"  $"+y+"  $"+z+"  $"+aa+"  $"+bb+"  $"+cc+"  $"+dd+"  $"+ee+"  $"+ff+"  $"+gg+"  $"+hh+"  $"+ii+"  $"+pickdate+" $"+pb+" $"+waybilltype+" $"+des+" $"+do_date+" $"+sname+" $";	

		
	connection.close();
out.print(data);
	}
%>
