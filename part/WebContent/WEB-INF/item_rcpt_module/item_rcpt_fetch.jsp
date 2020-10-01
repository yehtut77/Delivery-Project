<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@page import="java.sql.*" %>
         <%@ page import="java.time.format.DateTimeFormatter" %>
    <%@ page import="java.time.*" %>
<%
DateTimeFormatter FOMATTER = DateTimeFormatter.ofPattern("MM/dd/yyyy 'at' hh:mm a");
DateTimeFormatter FOMATTER1 = DateTimeFormatter.ofPattern("MM/dd/yy");
//Local date time instance
LocalDateTime localDateTime = LocalDateTime.now();
Connection conn = DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");

//Get formatted String
String ldtString = FOMATTER.format(localDateTime);
String ldtString1 = FOMATTER1.format(localDateTime);
String[] arr=ldtString1.split("/");
String type=request.getParameter("type");
PreparedStatement pre=null;
if(type.equalsIgnoreCase("fetch")){
	String ccode=request.getParameter("ccode");
	String user=request.getParameter("user");
	String trsf_num=request.getParameter("trsf_num");
	pre=conn.prepareStatement("Select reason,trsf_agent_code,trsf_staff_code,stat from trsf_hdr where trsf_num=? AND company_code=?");
	pre.setString(1, trsf_num);
	pre.setString(2, ccode);
	ResultSet rs=pre.executeQuery();
	String plus="";
	if(rs.next()){
		String reason=rs.getString("reason");
		pre=conn.prepareStatement("Select reason_description from reason where reason_code=?");
		pre.setString(1, reason);
		ResultSet r_reason=pre.executeQuery();
		if(r_reason.next()){
			reason=r_reason.getString("reason_description");
		}
		plus=reason+"$"+rs.getString("trsf_agent_code")+"$"+rs.getString("trsf_staff_code")+"$"+rs.getString("stat")+"#";
	}
	pre=conn.prepareStatement("Select tracking_num,trsf_seq from trsf_item where trsf_num=? AND company_code=?");
	pre.setString(1, trsf_num);
	pre.setString(2, ccode);
	ResultSet r=pre.executeQuery();
	while(r.next()){
		plus+="<tr><td>"+r.getString("trsf_seq")+"</td><td class='tracking_num'>"+r.getString("tracking_num")+"<i aria-hidden='true'></i></td></tr>";
	}
	pre.close();
	rs.close();
	r.close();
	conn.close();
	out.println(plus);
	
	
}
else if(type.equalsIgnoreCase("save")){
	System.out.println("Save");
	String ccode=request.getParameter("ccode");
	String trsf_num=request.getParameter("trsf_num");
	String agent_code=request.getParameter("agent_code");
	String staff_code=request.getParameter("staff_code");
	String user=request.getParameter("user");
	String[] tracking_num=request.getParameterValues("tracking_num[]");
	String staff_phone=null;
	if(trsf_num!=null){
		pre=conn.prepareStatement("Update trsf_hdr set stat=?,updatedby=?,modifydate=? where company_code=? AND trsf_num=?");
		pre.setString(1, "I");
		pre.setString(2, user);
		pre.setString(3, ldtString);
		pre.setString(4, ccode);
		pre.setString(5, trsf_num);
		pre.execute();
		pre=conn.prepareStatement("Update trsf_item set stat=?,updatedby=?,modifydate=? where company_code=? AND trsf_num=?");
		pre.setString(1, "I");
		pre.setString(2, user);
		pre.setString(3, ldtString);
		pre.setString(4, ccode);
		pre.setString(5, trsf_num);
		pre.execute();
		for(int i=0;i<tracking_num.length;i++){
			pre=conn.prepareStatement("Select staff_emergency_phone from staff where staff_code=? AND agent_code=? AND company_code=?");
			pre.setString(1, staff_code);
			pre.setString(2, agent_code);
			pre.setString(3, ccode);
			ResultSet r=pre.executeQuery();
			if(r.next()){
				staff_phone=r.getString("staff_emergency_phone");
				
						
			}
			pre=conn.prepareStatement("Select deli_charges,trans_charges from registration where company_code=? AND track_num=?");
			pre.setString(1, ccode);
			pre.setString(2, tracking_num[i]);
			ResultSet r1=pre.executeQuery();
			int total=0;
			if(r1.next()){
				int deli_charges=r1.getInt("deli_charges");
				int trans_charges=r1.getInt("trans_charges");
				 total=deli_charges+trans_charges;
			}
			pre=conn.prepareStatement("Insert into transaction(trans_date,company_code,agent_code,staff_username,staff_phone,track_num,track_stat,delivery_charges,createdby,createdate,staff_code) values(?,?,?,?,?,?,?,?,?,?,?)");
			pre.setString(1, ldtString);
			pre.setString(2, ccode);
			pre.setString(3, agent_code);
			pre.setString(4, user);
			pre.setString(5, staff_phone);
			pre.setString(6, tracking_num[i]);
			pre.setString(7, "I");
			pre.setString(8, Integer.toString(total));
			pre.setString(9, user);
			pre.setString(10, ldtString);
			pre.setString(11, staff_code);
			
			pre.execute();
		
			
			pre=conn.prepareStatement("Update registration set stat=?,updateby=?,modifydate=? where company_code=? AND track_num=?");
			pre.setString(1, "I");
			pre.setString(2, user);
			pre.setString(3, ldtString);
			pre.setString(4,ccode);
			pre.setString(5,tracking_num[i]);
			pre.execute();
		}
		
	}
	
	pre.close();

	conn.close();
}


%>