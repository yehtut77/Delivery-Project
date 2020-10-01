<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
       <%@ page import="java.time.format.DateTimeFormatter" %>
    <%@ page import="java.time.*" %>
    
<%
Connection conn = DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
String type=request.getParameter("type");
PreparedStatement pre;
DateTimeFormatter FOMATTER = DateTimeFormatter.ofPattern("MM/dd/yyyy 'at' hh:mm a");
DateTimeFormatter FOMATTER1 = DateTimeFormatter.ofPattern("MM/dd/yy");
//Local date time instance
LocalDateTime localDateTime = LocalDateTime.now();

//Get formatted String
String ldtString = FOMATTER.format(localDateTime);
String ldtString1 = FOMATTER1.format(localDateTime);
String[] arr=ldtString1.split("/");
if(type.equalsIgnoreCase("staff")){
	String ccode=request.getParameter("ccode");
pre=conn.prepareStatement("Select tracking_num,do_num,do_seq from do_item where staff_paid=? AND stat=? AND company_code=?");
pre.setString(1, "0");
pre.setString(2, "F");
pre.setString(3, ccode);
ResultSet rs=pre.executeQuery();
String list=null;
int total=0;
String do_num="";
String do_seq="";
String trans_charges="";
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
		do_num+="!"+rs.getString("do_num");
		do_seq+="!"+rs.getString("do_seq");
		
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
			trans_charges+="!"+result.getInt("trans_charges");
			 total+=product_amt+deli_charges;
			list+="<tr><td class=tracking_num>"+tracking_num+"</td><td class=total_amt>"+result.getString("total_amt")+"</td><td class=deli_charges>"+deli_charges+"</td><td class=product_amt>"+product_amt+"</td><td>0</td><td class=rcvr_name>"+result.getString("rcvr_name")+"</td><td class=rcvr_phone>"+result.getString("rcvr_phone")+"</td><td class=rcvr_township>"+result.getString("rcvr_township")+"</td><td class=rcvr_state>"+result.getString("rcvr_state")+"</td><td class=deli_date>"+result.getString("planned_deli_date")+"</td><td class=deli_staff>"+delivery_staff+"</td></tr>";
		}
		
		
	}
	
	
}
conn.close();

	out.println(list+"$"+total+"$"+do_num+"$"+do_seq+"$"+trans_charges);
	
	
}
else if(type.equalsIgnoreCase("agent")){
	System.out.println("In agent");
	String ccode=request.getParameter("ccode");
	pre=conn.prepareStatement("Select tracking_num from do_item where staff_paid=? AND agent_paid=? AND stat=? AND company_code=?");
	pre.setString(1, "1");
	pre.setString(2, "0");
	pre.setString(3, "F");
	pre.setString(4, ccode);
	ResultSet rs=pre.executeQuery();
	String list="";
	int total=0;
	int total_commi=0;
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
				 total_commi+=commision;
				int deli_charges=result.getInt("deli_charges")+result.getInt("trans_charges");
				 total+=product_amt+deli_charges+commision;
				list+="<tr><td>"+tracking_num+"</td><td>"+result.getString("total_amt")+"</td><td>"+deli_charges+"</td><td>"+product_amt+"</td><td>"+commision+"</td><td>"+result.getString("rcvr_name")+"</td><td>"+result.getString("rcvr_phone")+"</td><td>"+result.getString("rcvr_township")+"</td><td>"+result.getString("rcvr_state")+"</td><td>"+result.getString("planned_deli_date")+"</td><td>"+delivery_staff+"</td></tr>";
			}
			
			
		}
		
		
	}
	conn.close();

	out.println(list+"$"+total+"$"+total_commi);
	
}
else if(type.equalsIgnoreCase("agent_staff")){
	String ccode=request.getParameter("ccode");
	String agent_code=request.getParameter("agent_code");
	pre=conn.prepareStatement("Select staff_name,staff_code from staff where agent_code=? AND company_code=?");
	pre.setString(1, agent_code);
	pre.setString(2, ccode);
	ResultSet rs=pre.executeQuery();
	String list="<option value='' selected>---Select</option>";
	while(rs.next()){
		list+="<option value="+rs.getString("staff_code")+">"+rs.getString("staff_name")+"</option>";
	}
	out.println(list);
	conn.close();
	rs.close();
	pre.close();
}
else if(type.equalsIgnoreCase("save")){
	String ccode=request.getParameter("ccode");
	String agent_code=request.getParameter("agent_code");
	String[] tracking_num=request.getParameterValues("tracking_num[]");
	String[] do_num=request.getParameterValues("do_num[]");
	String pay_code=request.getParameter("pay_code");
	String rcpt_staff=request.getParameter("rcpt_staff");
	String[] do_seq=request.getParameterValues("do_seq[]");
	String[] trans_charges=request.getParameterValues("trans_charges[]");
	String[] total_amt=request.getParameterValues("total_amt[]");
	String[] deli_charges=request.getParameterValues("deli_charges[]");
	String[] product_amt=request.getParameterValues("product_amt[]");
	pre=conn.prepareStatement("Select period,month from nextkey where company_code=? AND module=?");
	pre.setString(1, ccode);
	pre.setString(2, "SPT");
	ResultSet r=pre.executeQuery();
	if(r.next()==false){
		pre=conn.prepareStatement("Insert into nextkey(company_code,period,month,module) values(?,?,?,?)");
		pre.setString(1, ccode);
		pre.setString(2, "0");
		pre.setString(3, arr[0]);
		pre.setString(4, "SPT");
		pre.execute();
	}
	r.previous();
	int counter=0;
	if(r.next()){
		
			String month=r.getString("month");
			if(arr[0].equalsIgnoreCase(month))
			{		System.out.println("hi");	
				counter=Integer.parseInt(r.getString("period"));}
			else {
				System.out.println("hello");
				PreparedStatement prepare=conn.prepareStatement("Update nextkey set month=?,period=? where company_code=? AND module=?");
				prepare.setString(1, arr[0]);
				prepare.setString(2, "0");
				prepare.setString(3, ccode);
				
				prepare.setString(4, "SPT");
				prepare.execute();
			}
		
			
			
			
		
		
		
	}
	System.out.println("Counter"+counter);
	counter+=1;
	System.out.println("Counter"+counter);
	pre=conn.prepareStatement("Update nextkey set period=? where company_code=? AND module=?");
	pre.setString(1,Integer.toString(counter));
	pre.setString(2, ccode);
	pre.setString(3, "SPT");
	pre.execute();
	
	 for(int i=0;i<do_num.length;i++){
		
		 System.out.println(trans_charges[i]);
		 
	pre=conn.prepareStatement("Update do_item set staff_paid=?,staff_paid_date=?,staff_pay_code=?,rcpt_staff_code=? where company_code=? AND tracking_num=? AND do_num=?");
	pre.setString(1, "1");
	pre.setString(2, ldtString);
	pre.setString(3, pay_code);
	pre.setString(4, rcpt_staff);
	pre.setString(5, ccode);
	pre.setString(6, tracking_num[i]);
	pre.setString(7, do_num[i]);
	pre.execute();
	
	pre=conn.prepareStatement("Insert into agent_ard(artrans_num,trans_date,company_code,agent_code,do_num,do_seq,tracking_num,total_charges,transportation_charges,delivery_charges,product_amt)values(?,?,?,?,?,?,?,?,?,?,?)");
	pre.setInt(1, counter);
	pre.setString(2, ldtString);
	pre.setString(3, ccode);
	pre.setString(4, agent_code);
	pre.setString(5, do_num[i]);
	pre.setString(6, do_seq[i]);
	pre.setString(7, tracking_num[i]);
	pre.setString(8, total_amt[i]);
	pre.setString(9, trans_charges[i]);
	pre.setString(10, deli_charges[i]);
	pre.setString(11, product_amt[i]);
	pre.execute();
	
	
	
	} 
}
%>