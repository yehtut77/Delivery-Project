<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="java.sql.*"%>
       <%@ page import="java.time.format.DateTimeFormatter" %>
    <%@ page import="java.time.*" %>
<%

String type=request.getParameter("type");
Connection conn=null;
 conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
if(type.equalsIgnoreCase("agent")){
	String ccode=request.getParameter("ccode");
	String agent_code=request.getParameter("agent_code");
	PreparedStatement pre=conn.prepareStatement("Select agent_name,agent_addr1,agent_addr2,agent_addr3,agent_addr4,agent_postal,agent_township,agent_division,agent_emergency_phone from agent where company_code=? AND agent_code=?");
	pre.setString(1, ccode);
	pre.setString(2, agent_code);
	ResultSet rs=pre.executeQuery();
	String plus=null;
	if(rs.next()){
		String agent_addr=rs.getString("agent_addr1")+rs.getString("agent_addr2")+rs.getString("agent_addr3")+rs.getString("agent_addr4");
		 plus=rs.getString("agent_name")+"$"+agent_addr+"$"+rs.getString("agent_postal")+"$"+rs.getString("agent_township")+"$"+rs.getString("agent_division")+"$"+rs.getString("agent_emergency_phone");
		
	
	}
	conn.close();
	out.println(plus);
	

}
else if(type.equalsIgnoreCase("return_wb")){
	String ccode=request.getParameter("ccode");
	String agent_code=request.getParameter("agent_code");
	String track_num=request.getParameter("track_num");
	
	PreparedStatement p=conn.prepareStatement("Select sender_code,deli_charges,trans_charges,weight,size from registration where company_code=? AND track_num=? AND stat=?");
	p.setString(1, ccode);
	p.setString(2, track_num);
	p.setString(3,"C");
	ResultSet r=p.executeQuery();
	String sender_code=null;
	String deli_charges=null;
	String trans_charges=null;
	String weight=null;
	String size=null;
	String first="0";
	if(r.next()==true){
		sender_code=r.getString("sender_code");
		deli_charges=r.getString("deli_charges");
		trans_charges=r.getString("trans_charges");
		weight=r.getString("weight");
		size=r.getString("size");
		 first=sender_code.substring(0,1);
	}
	String cust_code1=null;
	String cust_code2=null;
	
	if(!first.equalsIgnoreCase("9") && sender_code!=null ){
		System.out.println("Inside");
	 cust_code1=sender_code.substring(0,8);
	 cust_code2=sender_code.substring(sender_code.length()-1);
	}
	p=conn.prepareStatement("Select cust_name,cust_addr1,cust_addr2,cust_addr3,cust_addr4,cust_state,cust_township,cust_postal,cust_phone,cust_ward,cust_street from credit_cust where company_code=? AND cust_code1=? AND cust_code2=?");
	p.setString(1, ccode);
	p.setString(2, cust_code1);
	p.setString(3, cust_code2);
	ResultSet r1=p.executeQuery();
	if(r1.next()==true){
				String plus=sender_code+"%"+r1.getString("cust_name")+"%"+r1.getString("cust_addr1")+"%"+r1.getString("cust_addr2")+"%"+r1.getString("cust_addr3")+"%"+r1.getString("cust_addr4")+"%"+r1.getString("cust_state")+"%"+r1.getString("cust_township")+"%"+r1.getString("cust_postal")+"%"+r1.getString("cust_phone")+"%"+deli_charges+"%"+trans_charges+"%"+weight+"%"+size+"%"+r1.getString("cust_ward")+"%"+r1.getString("cust_street");
				conn.close();
				out.println(plus);
				conn.close();
	}
	else{
		conn.close();
		out.println("not");
	}
	
	
}
else if(type.equalsIgnoreCase("generate")){
	
	HttpSession ssss=request.getSession(false);  
	 
	String staff_name=(String)ssss.getAttribute("staffName");
	String ccode=(String)ssss.getAttribute("companyCode");
	String agent_code=(String)ssss.getAttribute("parent_agent_code");
	String staff_code=(String)ssss.getAttribute("staffCode");
 
   
   String companytype=(String)ssss.getAttribute("companyType");
   DateTimeFormatter FOMATTER = DateTimeFormatter.ofPattern("MM/dd/yyyy 'at' hh:mm a");
	 DateTimeFormatter FOMATTER1 = DateTimeFormatter.ofPattern("MM/dd/yy");
	 DateTimeFormatter FOMATTER2 = DateTimeFormatter.ofPattern("d MMMM yyyy");
	//Local date time instance
	LocalDateTime localDateTime = LocalDateTime.now();

	//Get formatted String
	String ldtString = FOMATTER.format(localDateTime);
	String ldtString1=FOMATTER1.format(localDateTime);
	String ldtString2=FOMATTER2.format(localDateTime);
   

														//agent info start
	String agent_name=request.getParameter("agent_name");
	String agent_postal=request.getParameter("agent_postal");
	String agent_phone=request.getParameter("agent_phone");//end
	String agent_township=request.getParameter("agent_township");
	String agent_state=request.getParameter("agent_state");
	
	String receiver_name=request.getParameter("receiver_name");//receiver info start
	String receiver_addr1=request.getParameter("receiver_addr1");
	String receiver_addr2=request.getParameter("receiver_addr2");
	String receiver_addr3=request.getParameter("receiver_addr3");
	String receiver_addr4=request.getParameter("receiver_addr4");
	String receiver_state=request.getParameter("receiver_state");
	String receiver_township=request.getParameter("receiver_township");
	String receiver_ward=request.getParameter("receiver_ward");
	String receiver_street=request.getParameter("receiver_street");
	String receiver_postal=request.getParameter("receiver_postal");
	String receiver_phone=request.getParameter("receiver_phone");//end
	String old_track_num=request.getParameter("old_track_num");
	
	
	String product_amt="0";//item info
	String deli_charges=request.getParameter("deli_charges");
	String total_amt=request.getParameter("total_amt");
	String weight=request.getParameter("weight");
	String size=request.getParameter("size");
	String prefix="11";
	String tracking_num=null;
	
	 String[] arr=ldtString1.split("/");
	
	
	
	
	PreparedStatement p=conn.prepareStatement("Select period,month from nextkey where type=? AND company_code=?");
	p.setString(1, prefix);
	p.setString(2, ccode);
	ResultSet rs=p.executeQuery();
	if(rs.next()==false){
		p=conn.prepareStatement("Insert into nextkey(company_code,period,type,month,module) values(?,?,?,?,?)");	
		p.setString(1, ccode);
		p.setString(2,"00000");
		p.setString(3, prefix);
		p.setString(4,arr[0]);
		p.setString(5,"RET");
		
		p.execute();
		
	}
	rs.previous();
	int counter=0;
	if(rs.next()){
		
			String month=rs.getString("month");
			if(arr[0].equalsIgnoreCase(month))
			{			
				counter=Integer.parseInt(rs.getString("period"));}
			else {
				PreparedStatement prepare=conn.prepareStatement("Update nextkey set month=?,period=? where company_code=? AND type=?");
				prepare.setString(1, arr[0]);
				prepare.setString(2, "00000");
				prepare.setString(3, ccode);
				
				prepare.setString(4, prefix);
				prepare.execute();
			}
			
		
		
		
	}
	counter+=1;

	String date=arr[2]+arr[0];


	String last_num;
	last_num=date+String.format("%05d", counter);
	tracking_num=prefix+agent_code+last_num;
	PreparedStatement p11=conn.prepareStatement("Update nextkey set period=? where company_code=? AND type=?");
	p11.setString(1, String.format("%05d", counter));
	p11.setString(2, ccode);

	p11.setString(3, prefix);
	p11.execute();		
	
	
	p=conn.prepareStatement("Insert into registration(company_code,agent_code,staff_code,trans_date,track_num,sender_code,rcvr_name,rcvr_addr1,rcvr_addr2,rcvr_addr3,rcvr_addr4,rcvr_state,rcvr_township,rcvr_ward,rcvr_street,rcvr_postal,rcvr_phone,payment_code,rcvd_code,weight,size,deli_charges,trans_charges,product_amt,cur_charges,total_amt,stat,planned_deli_date,createdby,createdate,item_desc,drop_point_code)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
	
	p.setString(1, ccode);
	p.setString(2, agent_code);
	p.setString(3, staff_code);
	p.setString(4, ldtString);
	p.setString(5, tracking_num);
	p.setString(6, agent_code);
	p.setString(7, receiver_name);
	p.setString(8, receiver_addr1);
	p.setString(9, receiver_addr2);
	p.setString(10, receiver_addr3);
	p.setString(11, receiver_addr4);
	p.setString(12, receiver_state);
	p.setString(13, receiver_township);
	p.setString(14, receiver_ward);
	p.setString(15, receiver_street);
	p.setString(16, receiver_postal);
	p.setString(17, receiver_phone);
	p.setString(18, prefix);
	p.setString(19, " ");
	p.setString(20, weight);
	p.setString(21, size);
	p.setString(22, deli_charges);
	
	p.setString(23, "0");
	p.setString(24, "0");
	p.setString(25, "0");
	p.setString(26, total_amt);
	p.setString(27, "S");
	p.setString(28, ldtString1);
	p.setString(29, staff_name);
	p.setString(30, ldtString);
	p.setString(31, " ");
	p.setString(32, " ");
	
	p.execute();
	
	
	p=conn.prepareStatement("Insert into transaction(trans_date,company_code,agent_code,staff_username,staff_phone,track_num,track_stat,ref_type,delivery_charges,createdby,createdate,staff_code) values(?,?,?,?,?,?,?,?,?,?,?,?)");
	p.setString(1, ldtString);
	p.setString(2, ccode);
	p.setString(3, agent_code);
	p.setString(4, staff_name);
	p.setString(5, agent_phone);
	p.setString(6, tracking_num);
	p.setString(7, "S");
	p.setString(8, "RET");
	p.setString(9, deli_charges);
	p.setString(10, staff_name);
	p.setString(11, ldtString);
	p.setString(12, staff_code);
	p.execute();
	p=conn.prepareStatement("Update registration set stat=? where company_code=? AND track_num=?");
	p.setString(1, "S");
	p.setString(2,ccode);
	p.setString(3,old_track_num);
	p.execute();
	conn.close();
	out.println(tracking_num);
	
	
}


conn.close();
%>