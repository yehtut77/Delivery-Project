<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.SimpleDateFormat"%>
  <%@page import="java.text.SimpleDateFormat"%>
  <%@page import="java.util.Date"%>
  <%@ page import="java.time.format.DateTimeFormatter" %>
    <%@ page import="java.time.*" %>
<%
 	int flagform=0;
	 HttpSession ssss=request.getSession(false);  
	String staffName=(String)ssss.getAttribute("staffName");
	String companyCode=(String)ssss.getAttribute("companyCode");
	String agentCode=(String)ssss.getAttribute("agentCode");
	String staffCode=(String)ssss.getAttribute("staffCode");
	DateTimeFormatter dat = DateTimeFormatter.ofPattern("dd/MM/yyyy hh:mm a");
LocalDateTime localDateTime = LocalDateTime.now();
String ldtString2 = dat.format(localDateTime);
String yearh=ldtString2.substring(8,10);
String monthh=ldtString2.substring(3,5);
Connection connection = null;

String cc=null;
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
 String cond=request.getParameter("cond");

connection=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");

	if(cond.equals("one")){
int totaldelionly=0;
int totalamountonly=0;

	String date1=request.getParameter("d1");
    String date2=request.getParameter("d2");
   	   	String ccus=request.getParameter("ccus");
String cus=ccus.replace('|',':');
String[] words=cus.split(":");
String sco="";
for(String www:words){
sco=www;}
int flag=0,delivered=0,reject=0,redeliver=0,totalall=0,totaldeli=0,transtotal=0;
String data="",alldata="";
			PreparedStatement pre = connection.prepareStatement("Select payment_code,id,track_num,deli_charges,trans_charges,stat,product_amt,total_amt,rcvr_name,rcvr_phone,rcvr_township,rcvr_state,createdate from registration where stat=? and company_code=? and sender_code=?");
			pre.setString(1,"D");
			pre.setString(2,companyCode);
			pre.setString(3,sco);

			ResultSet rs = pre.executeQuery();
			while (rs.next()) {
				String pacode="";
			    pacode=rs.getString("payment_code");
			    String pacodet=pacode.trim();
			    	PreparedStatement pre_13 = connection.prepareStatement("Select payment_description  from paymentmode where payment_code=? and company_code=?");
		pre_13.setString(1,pacodet);
			pre_13.setString(2,companyCode);
		String trueorf="",toftrim="";
			ResultSet rs_13 = pre_13.executeQuery();
			if (rs_13.next()) {
			    trueorf=rs_13.getString("payment_description");
			}
			toftrim=trueorf.trim();
			    if(toftrim.equals("Charge to Receiver")){
				cc=rs.getString("createdate");
                SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
                String day=cc.substring(3,5);
                String month=cc.substring(0,2);
                String year=cc.substring(6,10);
            	String statcheck = rs.getString("stat").trim();

        Date datetype1 = sdf.parse(day+"-"+month+"-"+year);
                String days=date1.substring(8,10);
                String months=date1.substring(5,7);
                String years=date1.substring(0,4); 
               String days2=date2.substring(8,10);
                String months2=date2.substring(5,7);
                String years2=date2.substring(0,4); 
        Date datetypes1 = sdf.parse(days+"-"+months+"-"+years);
        Date datetypes2 = sdf.parse(days2+"-"+months2+"-"+years2);
       
if (datetype1.compareTo(datetypes1) == 0 || datetype1.compareTo(datetypes1) > 0  ) {
    if (datetype1.compareTo(datetypes2) == 0 || datetype1.compareTo(datetypes2) < 0){
    flagform=1;
    flag=flag+1;
                a = rs.getString("track_num");
				b = rs.getString("deli_charges");
				c = rs.getString("trans_charges");
				d = rs.getString("stat");
				e = rs.getString("product_amt");
				f = rs.getString("total_amt");
				g = rs.getString("rcvr_name");
				h = rs.getString("rcvr_phone");
				i = rs.getString("rcvr_township");
				j = rs.getString("rcvr_state");
				z= rs.getString("id");
				if(b.equals("") || b.equals(" ") || b.equals("null") || b==null){b="0";}
				if(c.equals("") || c.equals(" ") || c.equals("null") || c==null){c="0";}
			    if(e.equals("") || e.equals(" ") || e.equals("null") || e==null){c="0";}

				String dtrim=d.trim();

				if(dtrim.equals("D")){delivered=delivered+1;}
				if(dtrim.equals("C")){reject=reject+1;}
				if(dtrim.equals("R")){redeliver=redeliver+1;}
				
				double deli=Double.parseDouble(b);
                double trans=Double.parseDouble(c);
                int deli2=(int)deli;
                totaldelionly=totaldelionly+deli2;
                totalamountonly=totalamountonly+deli2;
                int trans2=(int)trans;
                int totalresult=deli2+trans2;
                String stresu=""+totalresult;
                double alltotal=Double.parseDouble(f);
                int alltotal2=(int)alltotal;
                totalall=totalall+alltotal2;
                totaldeli=totaldeli+totalresult;   

                y=y+"*"+z;
        data=a+"%"+stresu+"%"+d+"%"+e+"%"+f+"%"+g+"%"+h+"%"+i+"%"+j+"%"+cc;
        alldata=alldata+"$"+data;
    }else{    
    }
}else{                
}
}else{}
		}
	
		PreparedStatement pre2 = connection.prepareStatement("Select payment_code,id,track_num,deli_charges,trans_charges,stat,product_amt,total_amt,rcvr_name,rcvr_phone,rcvr_township,rcvr_state,createdate from registration where stat=? and company_code=? and sender_code=?");
			pre2.setString(1,"D");
			pre2.setString(2,companyCode);
			pre2.setString(3,sco);
			ResultSet rs2 = pre2.executeQuery();
			while (rs2.next()) {
				String pacode="";
			    pacode=rs2.getString("payment_code");
			    String pacodet=pacode.trim();
			  	PreparedStatement pre_13 = connection.prepareStatement("Select payment_description  from paymentmode where payment_code=? and company_code=?");
		pre_13.setString(1,pacodet);
			pre_13.setString(2,companyCode);
		String trueorf="",toftrim="";
			ResultSet rs_13 = pre_13.executeQuery();
			if (rs_13.next()) {
			    trueorf=rs_13.getString("payment_description");
			}
			toftrim=trueorf.trim();
			    if(toftrim.equals("Prepaid")){
				cc=rs2.getString("createdate");
                SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
                String day=cc.substring(3,5);
                String month=cc.substring(0,2);
                String year=cc.substring(6,10);
            	String statcheck = rs2.getString("stat").trim();

        Date datetype1 = sdf.parse(day+"-"+month+"-"+year);
                String days=date1.substring(8,10);
                String months=date1.substring(5,7);
                String years=date1.substring(0,4); 
               String days2=date2.substring(8,10);
                String months2=date2.substring(5,7);
                String years2=date2.substring(0,4); 
        Date datetypes1 = sdf.parse(days+"-"+months+"-"+years);
        Date datetypes2 = sdf.parse(days2+"-"+months2+"-"+years2);
       
if (datetype1.compareTo(datetypes1) == 0 || datetype1.compareTo(datetypes1) > 0  ) {
    if (datetype1.compareTo(datetypes2) == 0 || datetype1.compareTo(datetypes2) < 0){
        flagform=1;

    flag=flag+1;
                a = rs2.getString("track_num");
				b = rs2.getString("deli_charges");
				c = rs2.getString("trans_charges");
				d = rs2.getString("stat");
				e = rs2.getString("product_amt");
				f = rs2.getString("total_amt");
				g = rs2.getString("rcvr_name");
				h = rs2.getString("rcvr_phone");
				i = rs2.getString("rcvr_township");
				j = rs2.getString("rcvr_state");
				z= rs2.getString("id");
				if(b.equals("") || b.equals(" ") || b.equals("null") || b==null){b="0";}
				if(c.equals("") || c.equals(" ") || c.equals("null") || c==null){c="0";}
			    if(e.equals("") || e.equals(" ") || e.equals("null") || e==null){c="0";}

				String dtrim=d.trim();

				if(dtrim.equals("D")){delivered=delivered+1;}
				if(dtrim.equals("C")){reject=reject+1;}
				if(dtrim.equals("R")){redeliver=redeliver+1;}
				
				double deli=Double.parseDouble(b);
                double trans=Double.parseDouble(c);
                int deli2=(int)deli;
                int trans2=(int)trans;
                int totalresult=deli2+trans2;
                String stresu=""+totalresult;
                totaldelionly=totaldelionly+deli2;
                totalamountonly=totalamountonly+0;
                double alltotal=Double.parseDouble(f);
                int alltotal2=(int)alltotal;
                totalall=totalall+alltotal2;
                totaldeli=totaldeli+totalresult;        System.out.println("LEgitA"+deli2);
                System.out.println("LEgitC"+totaldelionly);
                System.out.println("LEgitD"+totalamountonly);

                y=y+"*"+z;
        data=a+"%"+stresu+"%"+d+"%"+e+"%"+f+"%"+g+"%"+h+"%"+i+"%"+j+"%"+cc;
        alldata=alldata+"$"+data;
    }else{    
    }
}else{                
}
}else{}
		}
		PreparedStatement pre3 = connection.prepareStatement("Select payment_code,id,track_num,deli_charges,trans_charges,stat,product_amt,total_amt,rcvr_name,rcvr_phone,rcvr_township,rcvr_state,createdate from registration where stat=? and company_code=? and sender_code=?");
			pre3.setString(1,"D");
			pre3.setString(2,companyCode);
			pre3.setString(3,sco);
			ResultSet rs3 = pre3.executeQuery();
			while (rs3.next()) {
				String pacode="";
			    pacode=rs3.getString("payment_code");
			    String pacodet=pacode.trim();
			  	PreparedStatement pre_13 = connection.prepareStatement("Select payment_description  from paymentmode where payment_code=? and company_code=?");
		pre_13.setString(1,pacodet);
			pre_13.setString(2,companyCode);
		String trueorf="",toftrim="";
			ResultSet rs_13 = pre_13.executeQuery();
			if (rs_13.next()) {
			    trueorf=rs_13.getString("payment_description");
			}
			toftrim=trueorf.trim();
			    if(toftrim.equals("Cash On Delivery")){
				cc=rs3.getString("createdate");
                SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
                String day=cc.substring(3,5);
                String month=cc.substring(0,2);
                String year=cc.substring(6,10);
            	String statcheck = rs3.getString("stat").trim();

        Date datetype1 = sdf.parse(day+"-"+month+"-"+year);
                String days=date1.substring(8,10);
                String months=date1.substring(5,7);
                String years=date1.substring(0,4); 
               String days2=date2.substring(8,10);
                String months2=date2.substring(5,7);
                String years3=date2.substring(0,4); 
        Date datetypes1 = sdf.parse(days+"-"+months+"-"+years);
        Date datetypes2 = sdf.parse(days2+"-"+months2+"-"+years3);
       
if (datetype1.compareTo(datetypes1) == 0 || datetype1.compareTo(datetypes1) > 0  ) {
    if (datetype1.compareTo(datetypes2) == 0 || datetype1.compareTo(datetypes2) < 0){
        flagform=1;

    flag=flag+1;
                a = rs3.getString("track_num");
				b = rs3.getString("deli_charges");
				c = rs3.getString("trans_charges");
				d = rs3.getString("stat");
				e = rs3.getString("product_amt");
				f = rs3.getString("total_amt");
				g = rs3.getString("rcvr_name");
				h = rs3.getString("rcvr_phone");
				i = rs3.getString("rcvr_township");
				j = rs3.getString("rcvr_state");
				z= rs3.getString("id");
				if(b.equals("") || b.equals(" ") || b.equals("null") || b==null){b="0";}
				if(c.equals("") || c.equals(" ") || c.equals("null") || c==null){c="0";}
			    if(e.equals("") || e.equals(" ") || e.equals("null") || e==null){c="0";}
				String dtrim=d.trim();

				if(dtrim.equals("D")){delivered=delivered+1;}
				if(dtrim.equals("C")){reject=reject+1;}
				if(dtrim.equals("R")){redeliver=redeliver+1;}
				
				double deli=Double.parseDouble(b);
                double trans=Double.parseDouble(c);
                int deli2=(int)deli;
                int trans2=(int)trans;
                int totalresult=deli2+trans2;
                  double pro=Double.parseDouble(e);
                int pro2=(int)pro;
                String stresu=""+totalresult;
                totaldelionly=totaldelionly+deli2;
                totalamountonly=totalamountonly+deli2+pro2;
                double alltotal=Double.parseDouble(f);
                int alltotal2=(int)alltotal;
                totalall=totalall+alltotal2;
                totaldeli=totaldeli+totalresult;        System.out.println("LEgitA"+deli2);
                System.out.println("LEgitB"+pro2);
                System.out.println("LEgitC"+totaldelionly);
                System.out.println("LEgitD"+totalamountonly);

                y=y+"*"+z;
        data=a+"%"+stresu+"%"+d+"%"+e+"%"+f+"%"+g+"%"+h+"%"+i+"%"+j+"%"+cc;
        alldata=alldata+"$"+data;
    }else{    
    }
}else{                
}
}else{}
		}
		PreparedStatement pre4 = connection.prepareStatement("Select payment_code,id,track_num,deli_charges,trans_charges,stat,product_amt,total_amt,rcvr_name,rcvr_phone,rcvr_township,rcvr_state,createdate from registration where stat=? and company_code=? and sender_code=?");
			pre4.setString(1,"C");
				pre4.setString(2,companyCode);
			pre4.setString(3,sco);
			ResultSet rs4 = pre4.executeQuery();
			while (rs4.next()) {
				String pacode="";
			    pacode=rs4.getString("payment_code");
			    String pacodet=pacode.trim();
			   	PreparedStatement pre_13 = connection.prepareStatement("Select payment_description  from paymentmode where payment_code=? and company_code=?");
		pre_13.setString(1,pacodet);
			pre_13.setString(2,companyCode);
		String trueorf="",toftrim="";
			ResultSet rs_13 = pre_13.executeQuery();
			if (rs_13.next()) {
			    trueorf=rs_13.getString("payment_description");
			}
			toftrim=trueorf.trim();
			    if(toftrim.equals("Charge to Receiver")){
				cc=rs4.getString("createdate");
                SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
             String day=cc.substring(3,5);
                String month=cc.substring(0,2);
                String year=cc.substring(6,10);
            	String statcheck = rs4.getString("stat").trim();

        Date datetype1 = sdf.parse(day+"-"+month+"-"+year);
                String days=date1.substring(8,10);
                String months=date1.substring(5,7);
                String years=date1.substring(0,4); 
               String days2=date2.substring(8,10);
                String months2=date2.substring(5,7);
                String years4=date2.substring(0,4); 
        Date datetypes1 = sdf.parse(days+"-"+months+"-"+years);
        Date datetypes2 = sdf.parse(days2+"-"+months2+"-"+years4);
       
if (datetype1.compareTo(datetypes1) == 0 || datetype1.compareTo(datetypes1) > 0  ) {
    if (datetype1.compareTo(datetypes2) == 0 || datetype1.compareTo(datetypes2) < 0){
        flagform=1;

    flag=flag+1;
                a = rs4.getString("track_num");
				b = rs4.getString("deli_charges");
				c = rs4.getString("trans_charges");
				d = rs4.getString("stat");
				e = rs4.getString("product_amt");
				f = rs4.getString("total_amt");
				g = rs4.getString("rcvr_name");
				h = rs4.getString("rcvr_phone");
				i = rs4.getString("rcvr_township");
				j = rs4.getString("rcvr_state");
				z= rs4.getString("id");
				if(b.equals("") || b.equals(" ")){b="0";}
				if(c.equals("") || c.equals(" ")){c="0";}
				String dtrim=d.trim();

				if(dtrim.equals("D")){delivered=delivered+1;}
				if(dtrim.equals("C")){reject=reject+1;}
				if(dtrim.equals("R")){redeliver=redeliver+1;}
				
				double deli=Double.parseDouble(b);
                double trans=Double.parseDouble(c);
                int deli2=(int)deli;
                int trans2=(int)trans;
                int totalresult=deli2+trans2;
                String stresu=""+totalresult;
                totaldelionly=totaldelionly+deli2;
                totalamountonly=totalamountonly+deli2;
                double alltotal=Double.parseDouble(f);
                int alltotal2=(int)alltotal;
                totalall=totalall+alltotal2;
                totaldeli=totaldeli+totalresult;       System.out.println("LEgitA"+deli2);
                System.out.println("LEgitC"+totaldelionly);
                System.out.println("LEgitD"+totalamountonly);

                y=y+"*"+z;
        data=a+"%"+stresu+"%"+d+"%"+e+"%"+f+"%"+g+"%"+h+"%"+i+"%"+j+"%"+cc;
        alldata=alldata+"$"+data;
    }else{    
    }
}else{                
}
}else{}
		}
		PreparedStatement pre5 = connection.prepareStatement("Select payment_code,id,track_num,deli_charges,trans_charges,stat,product_amt,total_amt,rcvr_name,rcvr_phone,rcvr_township,rcvr_state,createdate from registration where stat=? and company_code=? and sender_code=?");
			pre5.setString(1,"C");
				pre5.setString(2,companyCode);
			pre5.setString(3,sco);
			ResultSet rs5 = pre5.executeQuery();
			while (rs5.next()) {
				String pacode="";
			    pacode=rs5.getString("payment_code");
			    String pacodet=pacode.trim();
			  	PreparedStatement pre_13 = connection.prepareStatement("Select payment_description  from paymentmode where payment_code=? and company_code=?");
		pre_13.setString(1,pacodet);
			pre_13.setString(2,companyCode);
		String trueorf="",toftrim="";
			ResultSet rs_13 = pre_13.executeQuery();
			if (rs_13.next()) {
			    trueorf=rs_13.getString("payment_description");
			}
			toftrim=trueorf.trim();
			    if(toftrim.equals("Prepaid")){
				cc=rs5.getString("createdate");
                SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
                String day=cc.substring(3,5);
                String month=cc.substring(0,2);
                String year=cc.substring(6,10);
            	String statcheck = rs5.getString("stat").trim();

        Date datetype1 = sdf.parse(day+"-"+month+"-"+year);
                String days=date1.substring(8,10);
                String months=date1.substring(5,7);
                String years=date1.substring(0,4); 
               String days2=date2.substring(8,10);
                String months2=date2.substring(5,7);
                String years5=date2.substring(0,4); 
        Date datetypes1 = sdf.parse(days+"-"+months+"-"+years);
        Date datetypes2 = sdf.parse(days2+"-"+months2+"-"+years5);
       
if (datetype1.compareTo(datetypes1) == 0 || datetype1.compareTo(datetypes1) > 0  ) {
    if (datetype1.compareTo(datetypes2) == 0 || datetype1.compareTo(datetypes2) < 0){
        flagform=1;

    flag=flag+1;
                a = rs5.getString("track_num");
				b = rs5.getString("deli_charges");
				c = rs5.getString("trans_charges");
				d = rs5.getString("stat");
				e = rs5.getString("product_amt");
				f = rs5.getString("total_amt");
				g = rs5.getString("rcvr_name");
				h = rs5.getString("rcvr_phone");
				i = rs5.getString("rcvr_township");
				j = rs5.getString("rcvr_state");
				z= rs5.getString("id");
				if(b.equals("") || b.equals(" ") || b.equals("null") || b==null){b="0";}
				if(c.equals("") || c.equals(" ") || c.equals("null") || c==null){c="0";}
			    if(e.equals("") || e.equals(" ") || e.equals("null") || e==null){c="0";}

				String dtrim=d.trim();

				if(dtrim.equals("D")){delivered=delivered+1;}
				if(dtrim.equals("C")){reject=reject+1;}
				if(dtrim.equals("R")){redeliver=redeliver+1;}
				
				double deli=Double.parseDouble(b);
                double trans=Double.parseDouble(c);
                int deli2=(int)deli;
                int trans2=(int)trans;
                int totalresult=deli2+trans2;
                String stresu=""+totalresult;
                totaldelionly=totaldelionly+deli2;
                totalamountonly=totalamountonly+0;
                double alltotal=Double.parseDouble(f);
                int alltotal2=(int)alltotal;
                totalall=totalall+alltotal2;
                totaldeli=totaldeli+totalresult;        System.out.println("LEgitA"+deli2);
                System.out.println("LEgitC"+totaldelionly);
                System.out.println("LEgitD"+totalamountonly);

                y=y+"*"+z;
        data=a+"%"+stresu+"%"+d+"%"+e+"%"+f+"%"+g+"%"+h+"%"+i+"%"+j+"%"+cc;
        alldata=alldata+"$"+data;
    }else{    
    }
}else{                
}
}else{}
		}
		PreparedStatement pre6 = connection.prepareStatement("Select payment_code,id,track_num,deli_charges,trans_charges,stat,product_amt,total_amt,rcvr_name,rcvr_phone,rcvr_township,rcvr_state,createdate from registration where stat=? and company_code=? and sender_code=?");
			pre6.setString(1,"C");
			pre6.setString(2,companyCode);
			pre6.setString(3,sco);
			ResultSet rs6 = pre6.executeQuery();
			while (rs6.next()) {
				String pacode="";
			    pacode=rs6.getString("payment_code");
			    String pacodet=pacode.trim();
			    	PreparedStatement pre_13 = connection.prepareStatement("Select payment_description  from paymentmode where payment_code=? and company_code=?");
		pre_13.setString(1,pacodet);
			pre_13.setString(2,companyCode);
		String trueorf="",toftrim="";
			ResultSet rs_13 = pre_13.executeQuery();
			if (rs_13.next()) {
			    trueorf=rs_13.getString("payment_description");
			}
			toftrim=trueorf.trim();
			    if(toftrim.equals("Cash On Delivery")){
				cc=rs6.getString("createdate");
                SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
               String day=cc.substring(3,5);
                String month=cc.substring(0,2);
                String year=cc.substring(6,10);
            	String statcheck = rs6.getString("stat").trim();

        Date datetype1 = sdf.parse(day+"-"+month+"-"+year);
                String days=date1.substring(8,10);
                String months=date1.substring(5,7);
                String years=date1.substring(0,4); 
               String days2=date2.substring(8,10);
                String months2=date2.substring(5,7);
                String years6=date2.substring(0,4); 
        Date datetypes1 = sdf.parse(days+"-"+months+"-"+years);
        Date datetypes2 = sdf.parse(days2+"-"+months2+"-"+years6);
       
if (datetype1.compareTo(datetypes1) == 0 || datetype1.compareTo(datetypes1) > 0  ) {
    if (datetype1.compareTo(datetypes2) == 0 || datetype1.compareTo(datetypes2) < 0){
        flagform=1;

    flag=flag+1;
                a = rs6.getString("track_num");
				b = rs6.getString("deli_charges");
				c = rs6.getString("trans_charges");
				d = rs6.getString("stat");
				e = rs6.getString("product_amt");
				f = rs6.getString("total_amt");
				g = rs6.getString("rcvr_name");
				h = rs6.getString("rcvr_phone");
				i = rs6.getString("rcvr_township");
				j = rs6.getString("rcvr_state");
				z= rs6.getString("id");
				if(b.equals("") || b.equals(" ") || b.equals("null") || b==null){b="0";}
				if(c.equals("") || c.equals(" ") || c.equals("null") || c==null){c="0";}
			    if(e.equals("") || e.equals(" ") || e.equals("null") || e==null){c="0";}

				String dtrim=d.trim();

				if(dtrim.equals("D")){delivered=delivered+1;}
				if(dtrim.equals("C")){reject=reject+1;}
				if(dtrim.equals("R")){redeliver=redeliver+1;}
				
				double deli=Double.parseDouble(b);
                double trans=Double.parseDouble(c);
                int deli2=(int)deli;
                int trans2=(int)trans;
                int totalresult=deli2+trans2;
                 double pro=Double.parseDouble(e);
                int pro2=(int)pro;
                String stresu=""+totalresult;
                totaldelionly=totaldelionly+deli2;
                totalamountonly=totalamountonly+deli2+pro2;
                double alltotal=Double.parseDouble(f);
                int alltotal2=(int)alltotal;
                totalall=totalall+alltotal2;
                totaldeli=totaldeli+totalresult;        System.out.println("LEgitA"+deli2);
                System.out.println("LEgitB"+pro2);
                System.out.println("LEgitC"+totaldelionly);
                System.out.println("LEgitD"+totalamountonly);

                y=y+"*"+z;
        data=a+"%"+stresu+"%"+d+"%"+e+"%"+f+"%"+g+"%"+h+"%"+i+"%"+j+"%"+cc;
        alldata=alldata+"$"+data;
    }else{    
    }
}else{                
}
}else{}
		}
		PreparedStatement pre7 = connection.prepareStatement("Select payment_code,id,track_num,deli_charges,trans_charges,stat,product_amt,total_amt,rcvr_name,rcvr_phone,rcvr_township,rcvr_state,createdate from registration where stat=? and company_code=? and sender_code=?");
			pre7.setString(1,"R");
			pre7.setString(2,companyCode);
			pre7.setString(3,sco);
			ResultSet rs7 = pre7.executeQuery();
			while (rs7.next()) {
				String pacode="";
			    pacode=rs7.getString("payment_code");
			    String pacodet=pacode.trim();
			  	PreparedStatement pre_13 = connection.prepareStatement("Select payment_description  from paymentmode where payment_code=? and company_code=?");
		pre_13.setString(1,pacodet);
			pre_13.setString(2,companyCode);
		String trueorf="",toftrim="";
			ResultSet rs_13 = pre_13.executeQuery();
			if (rs_13.next()) {
			    trueorf=rs_13.getString("payment_description");
			}
			toftrim=trueorf.trim();
			    if(toftrim.equals("Charge to Receiver")){
				cc=rs7.getString("createdate");
                SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
             String day=cc.substring(3,5);
                String month=cc.substring(0,2);
                String year=cc.substring(6,10);
            	String statcheck = rs7.getString("stat").trim();

        Date datetype1 = sdf.parse(day+"-"+month+"-"+year);
                String days=date1.substring(8,10);
                String months=date1.substring(5,7);
                String years=date1.substring(0,4); 
               String days2=date2.substring(8,10);
                String months2=date2.substring(5,7);
                String years7=date2.substring(0,4); 
        Date datetypes1 = sdf.parse(days+"-"+months+"-"+years);
        Date datetypes2 = sdf.parse(days2+"-"+months2+"-"+years7);
       
if (datetype1.compareTo(datetypes1) == 0 || datetype1.compareTo(datetypes1) > 0  ) {
    if (datetype1.compareTo(datetypes2) == 0 || datetype1.compareTo(datetypes2) < 0){
        flagform=1;

    flag=flag+1;
                a = rs7.getString("track_num");
				b = rs7.getString("deli_charges");
				c = rs7.getString("trans_charges");
				d = rs7.getString("stat");
				e = rs7.getString("product_amt");
				f = rs7.getString("total_amt");
				g = rs7.getString("rcvr_name");
				h = rs7.getString("rcvr_phone");
				i = rs7.getString("rcvr_township");
				j = rs7.getString("rcvr_state");
				z= rs7.getString("id");
				if(b.equals("") || b.equals(" ")){b="0";}
				if(c.equals("") || c.equals(" ")){c="0";}
				String dtrim=d.trim();

				if(dtrim.equals("D")){delivered=delivered+1;}
				if(dtrim.equals("C")){reject=reject+1;}
				if(dtrim.equals("R")){redeliver=redeliver+1;}
				
				double deli=Double.parseDouble(b);
                double trans=Double.parseDouble(c);
                int deli2=(int)deli;
                int trans2=(int)trans;
                int totalresult=deli2+trans2;
                String stresu=""+totalresult;
                totaldelionly=totaldelionly+deli2;
                totalamountonly=totalamountonly+deli2;
                double alltotal=Double.parseDouble(f);
                int alltotal2=(int)alltotal;
                totalall=totalall+alltotal2;
                totaldeli=totaldeli+totalresult; 
                      System.out.println("LEgitA"+deli2);
                System.out.println("LEgitC"+totaldelionly);
                System.out.println("LEgitD"+totalamountonly);

                y=y+"*"+z;
        data=a+"%"+stresu+"%"+d+"%"+e+"%"+f+"%"+g+"%"+h+"%"+i+"%"+j+"%"+cc;
        alldata=alldata+"$"+data;
    }else{    
    }
}else{                
}
}else{}
		}
		PreparedStatement pre8 = connection.prepareStatement("Select payment_code,id,track_num,deli_charges,trans_charges,stat,product_amt,total_amt,rcvr_name,rcvr_phone,rcvr_township,rcvr_state,createdate from registration where stat=? and company_code=? and sender_code=?");
			pre8.setString(1,"R");
				pre8.setString(2,companyCode);
			pre8.setString(3,sco);
			ResultSet rs8 = pre8.executeQuery();
			while (rs8.next()) {
				String pacode="";
			    pacode=rs8.getString("payment_code");
			    String pacodet=pacode.trim();
			   	PreparedStatement pre_13 = connection.prepareStatement("Select payment_description  from paymentmode where payment_code=? and company_code=?");
		pre_13.setString(1,pacodet);
			pre_13.setString(2,companyCode);
		String trueorf="",toftrim="";
			ResultSet rs_13 = pre_13.executeQuery();
			if (rs_13.next()) {
			    trueorf=rs_13.getString("payment_description");
			}
			toftrim=trueorf.trim();
			    if(toftrim.equals("Prepaid")){
				cc=rs8.getString("createdate");
                SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
               String day=cc.substring(3,5);
                String month=cc.substring(0,2);
                String year=cc.substring(6,10);
            	String statcheck = rs8.getString("stat").trim();

        Date datetype1 = sdf.parse(day+"-"+month+"-"+year);
                String days=date1.substring(8,10);
                String months=date1.substring(5,7);
                String years=date1.substring(0,4); 
               String days2=date2.substring(8,10);
                String months2=date2.substring(5,7);
                String years8=date2.substring(0,4); 
        Date datetypes1 = sdf.parse(days+"-"+months+"-"+years);
        Date datetypes2 = sdf.parse(days2+"-"+months2+"-"+years8);
       
if (datetype1.compareTo(datetypes1) == 0 || datetype1.compareTo(datetypes1) > 0  ) {
    if (datetype1.compareTo(datetypes2) == 0 || datetype1.compareTo(datetypes2) < 0){
        flagform=1;

    flag=flag+1;
                a = rs8.getString("track_num");
				b = rs8.getString("deli_charges");
				c = rs8.getString("trans_charges");
				d = rs8.getString("stat");
				e = rs8.getString("product_amt");
				f = rs8.getString("total_amt");
				g = rs8.getString("rcvr_name");
				h = rs8.getString("rcvr_phone");
				i = rs8.getString("rcvr_township");
				j = rs8.getString("rcvr_state");
				z= rs8.getString("id");
				if(b.equals("") || b.equals(" ") || b.equals("null") || b==null){b="0";}
				if(c.equals("") || c.equals(" ") || c.equals("null") || c==null){c="0";}
			    if(e.equals("") || e.equals(" ") || e.equals("null") || e==null){c="0";}

				String dtrim=d.trim();

				if(dtrim.equals("D")){delivered=delivered+1;}
				if(dtrim.equals("C")){reject=reject+1;}
				if(dtrim.equals("R")){redeliver=redeliver+1;}
				
				double deli=Double.parseDouble(b);
                double trans=Double.parseDouble(c);
                int deli2=(int)deli;
                int trans2=(int)trans;
                int totalresult=deli2+trans2;
                String stresu=""+totalresult;
                totaldelionly=totaldelionly+deli2;
                totalamountonly=totalamountonly+0;
                double alltotal=Double.parseDouble(f);
                int alltotal2=(int)alltotal;
                totalall=totalall+alltotal2;
                totaldeli=totaldeli+totalresult;
                 System.out.println("LEgitA"+deli2);
                System.out.println("LEgitC"+totaldelionly);
                System.out.println("LEgitD"+totalamountonly);
                y=y+"*"+z;
        data=a+"%"+stresu+"%"+d+"%"+e+"%"+f+"%"+g+"%"+h+"%"+i+"%"+j+"%"+cc;
        alldata=alldata+"$"+data;
    }else{    
    }
}else{                
}
}else{}
		}
		PreparedStatement pre9 = connection.prepareStatement("Select payment_code,id,track_num,deli_charges,trans_charges,stat,product_amt,total_amt,rcvr_name,rcvr_phone,rcvr_township,rcvr_state,createdate from registration where stat=? and company_code=? and sender_code=?");
			pre9.setString(1,"R");
				pre9.setString(2,companyCode);
			pre9.setString(3,sco);
			ResultSet rs9 = pre9.executeQuery();
			while (rs9.next()) {
				String pacode="";
			    pacode=rs9.getString("payment_code");
			    String pacodet=pacode.trim();
			   	PreparedStatement pre_13 = connection.prepareStatement("Select payment_description  from paymentmode where payment_code=? and company_code=?");
		pre_13.setString(1,pacodet);
			pre_13.setString(2,companyCode);
		String trueorf="",toftrim="";
			ResultSet rs_13 = pre_13.executeQuery();
			if (rs_13.next()) {
			    trueorf=rs_13.getString("payment_description");
			}
			toftrim=trueorf.trim();
			    if(toftrim.equals("Cash On Delivery")){
				cc=rs9.getString("createdate");
                SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
              String day=cc.substring(3,5);
                String month=cc.substring(0,2);
                String year=cc.substring(6,10);
            	String statcheck = rs9.getString("stat").trim();

        Date datetype1 = sdf.parse(day+"-"+month+"-"+year);
                String days=date1.substring(8,10);
                String months=date1.substring(5,7);
                String years=date1.substring(0,4); 
               String days2=date2.substring(8,10);
                String months2=date2.substring(5,7);
                String years9=date2.substring(0,4); 
        Date datetypes1 = sdf.parse(days+"-"+months+"-"+years);
        Date datetypes2 = sdf.parse(days2+"-"+months2+"-"+years9);
       
if (datetype1.compareTo(datetypes1) == 0 || datetype1.compareTo(datetypes1) > 0  ) {
    if (datetype1.compareTo(datetypes2) == 0 || datetype1.compareTo(datetypes2) < 0){
        flagform=1;

    flag=flag+1;
                a = rs9.getString("track_num");
				b = rs9.getString("deli_charges");
				c = rs9.getString("trans_charges");
				d = rs9.getString("stat");
				e = rs9.getString("product_amt");
				f = rs9.getString("total_amt");
				g = rs9.getString("rcvr_name");
				h = rs9.getString("rcvr_phone");
				i = rs9.getString("rcvr_township");
				j = rs9.getString("rcvr_state");
				z= rs9.getString("id");
				if(b.equals("") || b.equals(" ")){b="0";}
				if(c.equals("") || c.equals(" ")){c="0";}
				String dtrim=d.trim();

				if(dtrim.equals("D")){delivered=delivered+1;}
				if(dtrim.equals("C")){reject=reject+1;}
				if(dtrim.equals("R")){redeliver=redeliver+1;}
				
				double deli=Double.parseDouble(b);
                double trans=Double.parseDouble(c);
                int deli2=(int)deli;
                int trans2=(int)trans;
                int totalresult=deli2+trans2;
                double pro=Double.parseDouble(e);
                int pro2=(int)pro;
                String stresu=""+totalresult;
                totaldelionly=totaldelionly+deli2;
                totalamountonly=totalamountonly+deli2+pro2;
                System.out.println("LEgitA"+deli2);
                System.out.println("LEgitB"+pro2);
                System.out.println("LEgitC"+totaldelionly);
                System.out.println("LEgitD"+totalamountonly);

                double alltotal=Double.parseDouble(f);
                int alltotal2=(int)alltotal;
                totalall=totalall+alltotal2;
                totaldeli=totaldeli+totalresult;
                y=y+"*"+z;
        data=a+"%"+stresu+"%"+d+"%"+e+"%"+f+"%"+g+"%"+h+"%"+i+"%"+j+"%"+cc;
        alldata=alldata+"$"+data;
    }else{    
    }
}else{                
}
}else{}
		}
	
		connection.close();
		pre.close();
		rs.close();
			pre2.close();
		rs2.close();
			pre3.close();
		rs3.close();
			pre4.close();
		rs4.close();
			pre5.close();
		rs5.close();
			pre6.close();
		rs6.close();
			pre7.close();
		rs7.close();
			pre8.close();
		rs8.close();
			pre9.close();
		rs9.close();
		transtotal=totalamountonly-totaldelionly;
if(flagform==0){out.print("NV");}else{
	out.print(flag+"$"+delivered+"$"+reject+"$"+redeliver+"$"+transtotal+"$"+y+"$"+alldata);}	}
	
	if(cond.equals("two")){
	String vnum="";
		String lid=request.getParameter("lid");
        		String pcode=request.getParameter("pcode");
        		String damt=request.getParameter("damt");

        	String lidd=lid.replace("*",":");

        	String[] arrOfStr = lidd.split(":"); 

	for (String aa : arrOfStr) {
String bbb=aa.trim();
	if(bbb==null || bbb.equals("null")){}else{
  
     PreparedStatement pre_ph = connection
		.prepareStatement("Select * from staff where company_code=? and parent_agent_code=? and staff_code=?");
pre_ph.setString(1, companyCode);
pre_ph.setString(2, agentCode);
pre_ph.setString(3, staffCode);
ResultSet rs_ph= pre_ph.executeQuery();
String sph="";
 String stresu2="";
while (rs_ph.next()) {
	
	sph = rs_ph.getString("staff_phone");
}
      rs_ph.close();
      pre_ph.close();

PreparedStatement pre_deli = connection
		.prepareStatement("Select track_num,deli_charges,trans_charges from registration where id=?");
pre_deli.setString(1, bbb);

ResultSet rs_deli = pre_deli.executeQuery();
String track_num="";
if (rs_deli.next()) {
	
	track_num = rs_deli.getString("track_num");
	String 	bbbc = rs_deli.getString("deli_charges");
	String	cccb = rs_deli.getString("trans_charges");
	if(bbbc.equals("") || bbbc.equals(" ")){bbbc="0";}
	if(cccb.equals("") || cccb.equals(" ")){cccb="0";}
	double deli=Double.parseDouble(bbbc);
  double trans=Double.parseDouble(cccb);
  int deli2=(int)deli;
 int trans2=(int)trans;
 int totalresult=deli2+trans2;
   stresu2=""+totalresult;
}      rs_deli.close();
      pre_deli.close();

    PreparedStatement pre_tra=connection.prepareStatement("insert into transaction(trans_date,company_code,agent_code,staff_username,staff_phone,track_num,track_stat,ref_type,delivery_charges,createdby, updatedby, createdate, modifydate,pay_code,staff_code)"+
	        "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

  
  pre_tra.setString(1,ldtString2);
  pre_tra.setString(2,companyCode);
  pre_tra.setString(3,agentCode);
	pre_tra.setString(4,staffName);

	pre_tra.setString(5,sph);
	pre_tra.setString(6,track_num);
	pre_tra.setString(7,"V");
	pre_tra.setString(8," ");

	pre_tra.setString(9,stresu2);
	pre_tra.setString(10,staffName);

	pre_tra.setString(11,"");
	pre_tra.setString(12,ldtString2);

	pre_tra.setString(13,"");
	pre_tra.setString(14,"0"+pcode);
	pre_tra.setString(15,staffCode);


	pre_tra.executeUpdate();
	      pre_tra.close();
  
	
	 } }
	 PreparedStatement pre = connection
			.prepareStatement("Select period from nextkey where company_code=? and agent_code=? and module=? ");
	pre.setString(1, companyCode);
	pre.setString(2, agentCode);
	pre.setString(3,"PCC");
	ResultSet rs = pre.executeQuery();
	String period="";
	while (rs.next()) {
		
		period = rs.getString("period");
}
pre.close();
rs.close();

if(period.equalsIgnoreCase("null")|| period.equalsIgnoreCase("")){
	
	PreparedStatement  pre_inser=null;

	pre_inser=connection.prepareStatement("insert into nextkey(company_code,agent_code,period,module,staff_code)"+
	        "values(?,?,?,?,?)");

	pre_inser.setString(1,companyCode);
	pre_inser.setString(2,agentCode);
	pre_inser.setString(3,"0000");
	pre_inser.setString(4,"PCC");
	pre_inser.setString(5,staffCode);
	pre_inser.executeUpdate();
	pre_inser.close();
	vnum="C"+companyCode+"-"+yearh+monthh+"0000";
}

else{

int add=Integer.parseInt(period);
int result=add+1;
int added=result;

int count = 0;
while(result != 0)
{
    // num = num/10
    result /= 10;
    ++count;
}

String addedstring="";
if(count==4){addedstring=""+added;}
if(count==3){addedstring="0"+added;}
if(count==2){addedstring="00"+added;}
if(count==1){addedstring="000"+added;}

	String query =
		    "update nextkey " +
		    "set period = ?" +
				    "where company_code = ? and " +
		    "agent_code=? and module=?";
		    	
  PreparedStatement preparedStmt = connection.prepareStatement(query);
  preparedStmt.setString(1,addedstring);
  preparedStmt.setString(2,companyCode);
  preparedStmt.setString(3,agentCode);
    preparedStmt.setString(4,"PCC");

  preparedStmt.executeUpdate();
	preparedStmt.close();
	vnum="C"+companyCode+"-"+yearh+monthh+addedstring;
}


     PreparedStatement pre_new=connection.prepareStatement("insert into paytrans(trans_date,document_ref,debit_amt,paycode,createdby,createdate)"+
		        "values(?,?,?,?,?,?)");

		pre_new.setString(1,ldtString2);
		pre_new.setString(2,vnum);
		pre_new.setString(3,damt);
		pre_new.setString(4,"0"+pcode);
		pre_new.setString(5,staffName);
		pre_new.setString(6,ldtString2);


		pre_new.executeUpdate();
	      	      pre_new.close();

out.print(vnum);	}
%>
