<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
         <%@ page import="java.time.format.DateTimeFormatter" %>
    <%@ page import="java.time.*" %>
<%
Connection conn = DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
	PreparedStatement pre;
String type=request.getParameter("type");
DateTimeFormatter FOMATTER = DateTimeFormatter.ofPattern("MM/dd/yyyy 'at' hh:mm a");
DateTimeFormatter FOMATTER1 = DateTimeFormatter.ofPattern("MM/dd/yy");
//Local date time instance
LocalDateTime localDateTime = LocalDateTime.now();

//Get formatted String
String ldtString = FOMATTER.format(localDateTime);
String ldtString1 = FOMATTER1.format(localDateTime);
String[] arr=ldtString1.split("/");
System.out.println(type+"type");
if(type.equalsIgnoreCase("agent_staff")){
	String barcode=request.getParameter("barcode");
	String ccode=request.getParameter("ccode");
	String staff_code="";
	String agent_code="";
	if(!barcode.equals(null)){
		agent_code=barcode.substring(0,4);
		staff_code=barcode.substring(4,8);
	}
	pre=conn.prepareStatement("Select staff_code,agent_code from staff where company_code=? AND staff_code=? AND agent_code=?");
	pre.setString(1, ccode);
	pre.setString(2, staff_code);
	pre.setString(3, agent_code);
	ResultSet rs=pre.executeQuery();
	if(rs.next()==true){
		pre.close();
		rs.close();
		conn.close();
		out.println("ok"+"$"+staff_code+agent_code);
	}
	else{
		pre.close();
		rs.close();
		conn.close();
		out.println("not");
	}
	
	
	
}
else if(type.equalsIgnoreCase("reason")){
	String ccode=request.getParameter("ccode");
	pre=conn.prepareStatement("Select reason_code,reason_description from reason");
	ResultSet rs=pre.executeQuery();
	String plus="<option value='' selected>---Select---</option>";
	while(rs.next()){
		plus+="<option value="+rs.getString("reason_code")+">"+rs.getString("reason_description")+"</option>";
	}
	pre.close();
	rs.close();
	conn.close();
	out.println(plus);
}
else if(type.equalsIgnoreCase("track")){
	String ccode=request.getParameter("ccode");
	String barcode=request.getParameter("barcode");
	System.out.println(barcode);
	System.out.println(ccode);
	pre=conn.prepareStatement("Select track_num from registration where company_code=? AND stat=? AND track_num=?");
	pre.setString(1, ccode);
	pre.setString(2, "U");
	pre.setString(3, barcode);
	ResultSet rs=pre.executeQuery();
	String reply="";
	if(rs.next()==true){
		out.println("ok"+"$"+rs.getString("track_num"));
	}
	pre.close();
	rs.close();
	conn.close();
	
	}
else if(type.equalsIgnoreCase("select")){
	String ccode=request.getParameter("ccode");
	String agent_code=request.getParameter("agent_code");
	pre=conn.prepareStatement("Select staff_code,staff_name from staff where agent_code=? AND company_code=?");
	pre.setString(1, agent_code);
	pre.setString(2, ccode);
	ResultSet rs=pre.executeQuery();
	String plus="<option value='' selected>---Select---</option>";
while(rs.next()){
	plus+="<option value="+rs.getString("staff_code")+">"+rs.getString("staff_name")+"</option>";
}
pre.close();
rs.close();
conn.close();
out.println(plus);
}
else if(type.equalsIgnoreCase("submit")){
	String ccode=request.getParameter("ccode");
	String user=request.getParameter("user");
	String agent_code=request.getParameter("agent_code");
	String trans_agent_code=request.getParameter("trans_agent_code");
	String trans_staff_code=request.getParameter("trans_staff_code");
	String reason=request.getParameter("reason");
	String[] tracking_num=request.getParameterValues("track_num[]");
	String staff_code=request.getParameter("staff_code");
	String trans_staff_name=request.getParameter("trans_staff_name");
	/* System.out.println(ccode);
	System.out.println(user);
	System.out.println(agent_code);
	System.out.println(trans_agent_code);
	System.out.println(trans_staff_code);
	System.out.println(reason);
	System.out.println(tracking_num.length); */
	pre=conn.prepareStatement("Select period,month from nextkey where company_code=? AND module=?");
	pre.setString(1, ccode);
	pre.setString(2, "ITT");
	ResultSet r=pre.executeQuery();
	if(r.next()==false){
		pre=conn.prepareStatement("Insert into nextkey(company_code,period,month,module) values(?,?,?,?)");
		pre.setString(1, ccode);
		pre.setString(2, "00000");
		pre.setString(3, arr[0]);
		pre.setString(4, "ITT");
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
				//System.out.println("hello");
				PreparedStatement prepare=conn.prepareStatement("Update nextkey set month=?,period=? where company_code=? AND module=?");
				prepare.setString(1, arr[0]);
				prepare.setString(2, "00000");
				prepare.setString(3, ccode);
				
				prepare.setString(4, "ITT");
				prepare.execute();
			}
		
			
			
			
		
		
		
	}
	counter+=1;
	//System.out.println("Counter"+counter);
	String header="T"+String.format("%05d", counter);
	pre=conn.prepareStatement("Update nextkey set period=? where company_code=? AND module=?");
	pre.setString(1,String.format("%05d", counter));
	pre.setString(2, ccode);
	pre.setString(3, "ITT");
	pre.execute();
	pre=conn.prepareStatement("Insert into trsf_hdr(company_code,agent_code,trsf_date,trsf_num,reason,stat,staff_code,trsf_agent_code,trsf_staff_code,createdby,createdate) values(?,?,?,?,?,?,?,?,?,?,?)");
	pre.setString(1, ccode);
	pre.setString(2, agent_code);
	pre.setString(3, ldtString1);
	pre.setString(4, header);
	pre.setString(5, reason);
	pre.setString(6, "T");
	pre.setString(7, staff_code);
	pre.setString(8, trans_agent_code);
	pre.setString(9, trans_staff_code);
	pre.setString(10, user);
	pre.setString(11, ldtString);
	pre.execute();
	for(int i=0;i<tracking_num.length;i++){
		
		pre=conn.prepareStatement("Insert into trsf_item(company_code,trsf_num,trsf_seq,stat,tracking_num,createdby,createdate)values(?,?,?,?,?,?,?)");
		pre.setString(1, ccode);
		pre.setString(2, header);
		pre.setString(3, Integer.toString(i+1));
		pre.setString(4, "T");
		pre.setString(5, tracking_num[i]);
		pre.setString(6, user);
		pre.setString(7, ldtString);
		pre.execute();
		pre=conn.prepareStatement("Update registration set stat=?,updateby=?,modifydate=? where company_code=? AND track_num=?");
		pre.setString(1, "T");
		pre.setString(2,user);
		pre.setString(3,ldtString);
		pre.setString(4,ccode);
		pre.setString(5,tracking_num[i]);
		pre.execute();
		
		
	}
	pre=conn.prepareStatement("Insert into agent_noti(company_code,agent_code,sender_code,sub)values(?,?,?,?)");
	pre.setString(1, ccode);
	pre.setString(2, trans_agent_code);
	pre.setString(3, "ITT");
	pre.setString(4, "Item Transfer");
	pre.execute();
	pre=conn.prepareStatement("Insert into agent_inbox(trans_date,company_code,agent_code,sender_code,sender_name,body,read_unread,module_code,created_date,createdby,trsf_num)values(?,?,?,?,?,?,?,?,?,?,?)");
	pre.setString(1, ldtString);
	pre.setString(2, ccode);
	pre.setString(3, trans_agent_code);
	pre.setString(4, "ITT");
	pre.setString(5, user);
	pre.setString(6, "Dear "+trans_staff_name+" Item need to be received");
	pre.setString(7, "ur");
	pre.setString(8, "ITT");
	pre.setString(9, ldtString);
	pre.setString(10, user);
	pre.setString(11, header);
	pre.execute();
	
	pre.close();
	
	conn.close();
}




%>