<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
       <%@ page import="java.time.format.DateTimeFormatter" %>
    <%@ page import="java.time.*" %>
    
<%
Connection conn = DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
String type=request.getParameter("type");
PreparedStatement pre;
if(type.equalsIgnoreCase("staff")){
	String ccode=request.getParameter("ccode");
pre=conn.prepareStatement("Select tracking_num from do_item where staff_paid=? AND stat=? AND company_code=?");
pre.setString(1, "0");
pre.setString(2, "F");
pre.setString(3, ccode);
ResultSet rs=pre.executeQuery();
String list=null;
int total=0;
while(rs.next()){
	boolean flag=false;
	String tracking_num=rs.getString("tracking_num");
	pre=conn.prepareStatement("Select stat from registration where track_num=?");
	pre.setString(1, tracking_num);
	ResultSet r=pre.executeQuery();
	if(r.next()){
		String stat=r.getString("stat");
		if(stat.equalsIgnoreCase("D")){
			flag=true;
		}
	}
	
	if(flag==true){
		pre=conn.prepareStatement("Select deli_charges,trans_charges,product_amt,total_amt,rcvr_name,rcvr_phone,rcvr_township,rcvr_state,planned_deli_date from registration where company_code=? AND track_num=?");
		pre.setString(1, ccode);
		pre.setString(2, tracking_num);
		ResultSet result=pre.executeQuery();
		if(result.next()){
			int product_amt=result.getInt("product_amt");
			
			pre=conn.prepareStatement("Select staff_code,agent_code from transaction where track_stat=? AND track_num=? AND company_code=?");
			pre.setString(1, "D");
			pre.setString(2, tracking_num);
			pre.setString(3, ccode);
			ResultSet r1=pre.executeQuery();
			String staff_code=null;
			String agent=null;
			if(r1.next()){
				staff_code=r1.getString("staff_code");
				agent=r1.getString("agent_code");
			}
			pre=conn.prepareStatement("Select staff_name from staff where staff_code=? AND agent_code=? AND company_code=?");
			pre.setString(1, staff_code);
			pre.setString(2, agent);
			pre.setString(3, ccode);
			ResultSet r2=pre.executeQuery();
			String delivery_staff=null;
			if(r2.next()){
				delivery_staff=r2.getString("staff_name");
			}
			
			int deli_charges=result.getInt("deli_charges")+result.getInt("trans_charges");
			 total=product_amt+deli_charges;
			list="<tr><td>"+tracking_num+"</td><td>"+result.getString("total_amt")+"</td><td>"+deli_charges+"</td><td>"+product_amt+"</td><td>0</td><td>"+result.getString("rcvr_name")+"</td><td>"+result.getString("rcvr_phone")+"</td><td>"+result.getString("rcvr_township")+"</td><td>"+result.getString("rcvr_state")+"</td><td>"+result.getString("planned_deli_date")+"</td><td>"+delivery_staff+"</td></tr>";
		}
		
		
	}
	
	
}
conn.close();

	out.println(list+"$"+total);
	
	
}
else if(type.equalsIgnoreCase("agent")){
	String ccode=request.getParameter("ccode");
	pre=conn.prepareStatement("Select tracking_num from do_item where staff_paid=? AND agent_paid=? AND stat=? AND company_code=?");
	pre.setString(1, "1");
	pre.setString(2, "0");
	pre.setString(3, "F");
	pre.setString(4, ccode);
	ResultSet rs=pre.executeQuery();
	String list="";
	int total=0;
	while(rs.next()){
	System.out.println("count");
		boolean flag=false;
		String tracking_num=rs.getString("tracking_num");
		pre=conn.prepareStatement("Select stat from registration where track_num=?");
		pre.setString(1, tracking_num);
		ResultSet r=pre.executeQuery();
		if(r.next()){
			String stat=r.getString("stat");
			if(stat.equalsIgnoreCase("D")){
				flag=true;
			}
		}
		
		if(flag==true){
			pre=conn.prepareStatement("Select deli_charges,trans_charges,product_amt,total_amt,rcvr_name,rcvr_phone,rcvr_township,rcvr_state,planned_deli_date from registration where company_code=? AND track_num=?");
			pre.setString(1, ccode);
			pre.setString(2, tracking_num);
			ResultSet result=pre.executeQuery();
			if(result.next()){
				int product_amt=result.getInt("product_amt");
				
				pre=conn.prepareStatement("Select staff_code,agent_code from transaction where track_stat=? AND track_num=? AND company_code=?");
				pre.setString(1, "D");
				pre.setString(2, tracking_num);
				pre.setString(3, ccode);
				ResultSet r1=pre.executeQuery();
				String staff_code=null;
				String agent=null;
				if(r1.next()){
					staff_code=r1.getString("staff_code");
					agent=r1.getString("agent_code");
				}
				pre=conn.prepareStatement("Select staff_name from staff where staff_code=? AND agent_code=? AND company_code=?");
				pre.setString(1, staff_code);
				pre.setString(2, agent);
				pre.setString(3, ccode);
				ResultSet r2=pre.executeQuery();
				String delivery_staff=null;
				if(r2.next()){
					delivery_staff=r2.getString("staff_name");
				}
				pre=conn.prepareStatement("Select agent_commissionfees from agent where agent_code=? AND company_code=?");
				pre.setString(1, agent);
				pre.setString(2, ccode);
				ResultSet r3=pre.executeQuery();
				int comm_percent=0;
				if(r3.next()){
					out.println("hello");
					comm_percent=r3.getInt("agent_commissionfees");
				}
				int commision=result.getInt("deli_charges")*comm_percent/100;
				int deli_charges=result.getInt("deli_charges")+result.getInt("trans_charges");
				 total+=product_amt+deli_charges;
				list+="<tr><td>"+tracking_num+"</td><td>"+result.getString("total_amt")+"</td><td>"+deli_charges+"</td><td>"+product_amt+"</td><td>"+commision+"</td><td>"+result.getString("rcvr_name")+"</td><td>"+result.getString("rcvr_phone")+"</td><td>"+result.getString("rcvr_township")+"</td><td>"+result.getString("rcvr_state")+"</td><td>"+result.getString("planned_deli_date")+"</td><td>"+delivery_staff+"</td></tr>";
			}
			
			
		}
		
		
	}
	conn.close();

	out.println(list+"$"+total);
	
}
%>