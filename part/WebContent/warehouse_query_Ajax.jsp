<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%
System.out.print("a");
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
	HttpSession ssss=request.getSession(false);  
	String n=(String)session.getAttribute("staffName"); 
	String staff_name=(String)ssss.getAttribute("staffName");
	String companyCode=(String)ssss.getAttribute("companyCode");
	String agentCode=(String)ssss.getAttribute("parent_agent_code");
	String staff_code=(String)ssss.getAttribute("staffCode");
	
		String 	s_code=null;
	
		
			String 	r_name=null;
			String 	r_phone=null;
			String 	r_state=null;
			String 	r_township=null;
			String  r_postal=null;
			String r_address=null;
			String d_point=null;
			String d_point_code=null;
			
				
				String item_desc=null;
				String  status=null;
				String  p_date=null;
				String p_person_code=null;
				String p_person=null;
				String  deli_charges=null;
				String  cod=null;
				String  prepaid=null;
				String  total=null;
				String t_charges=null;
				String p_amt=null;
				String currency=null;
				String p_person_agentCode=null;
				String p_person_companyCode=null;
				String agent_code=null;
				String company_code=null;
		
try{
	 //connection=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_deliv?useTimezone=true&serverTimezone=UTC","teamrame_zaw","zawmyo");
	  // connection=DriverManager.getConnection("jdbc:mysql://localhost/delivery","root","root");  
	   connection=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
	
	
									String track_num = request.getParameter("track_num");
									//	System.out.println("tack_num=" + track_num);
										PreparedStatement pre = connection.prepareStatement("Select * from registration where agent_code=? and company_code=?  and track_num=?");
										
										pre.setString(1, agentCode);
										pre.setString(2, companyCode);
										pre.setString(3, track_num);
										
										System.out.println("agentCode"+agentCode);
											System.out.println("companyCode"+companyCode);
											System.out.println("track_num"+track_num);
							
										ResultSet rs = pre.executeQuery();
										 System.out.println("Ok");
										while (rs.next()) {
											
										
											s_code = rs.getString("sender_code");//2
										
											r_name = rs.getString("rcvr_name");//8
											r_phone = rs.getString("rcvr_phone");//9
											r_state = rs.getString("rcvr_state");//10
											r_township = rs.getString("rcvr_township");//11
											r_postal = rs.getString("rcvr_postal");//12
											r_address= rs.getString("rcvr_addr1")+"  "+rs.getString("rcvr_addr2")+"  "+rs.getString("rcvr_addr3")+"  "+rs.getString("rcvr_addr4");//13
						                 	agent_code = rs.getString("agent_code");
						                 	company_code=rs.getString("company_code");
										//15----------------------------------------something wrong-----------------------------
											
											item_desc=rs.getString("item_desc");//16
											status=rs.getString("stat");//17
											deli_charges=rs.getString("deli_charges");//18
											total=rs.getString("total_amt");//19
											
											t_charges=rs.getString("trans_charges");//22
											p_amt=rs.getString("product_amt");//23
											currency=rs.getString("cur_charges");//24

											}
							
										PreparedStatement pre1 = connection.prepareStatement("Select agent_name from agent where agent_code=? and company_code=?");
										pre1.setString(1, agent_code);
										pre1.setString(2, company_code);
										ResultSet rs1 = pre1.executeQuery();
										
										while (rs1.next()) {
											d_point = rs1.getString("agent_name");//14
											}
										System.out.print("Agent_name="+d_point);
										
										PreparedStatement pre2 = connection.prepareStatement("Select pickup_date,staff_code,agent_code,company_code from pickup  where track_num=?");
										pre2.setString(1, track_num);
										ResultSet rs2 = pre2.executeQuery();
										
										if(rs2.next()) {
											p_date= rs2.getString("pickup_date");//20
											p_person_code=rs2.getString("staff_code");
											p_person_agentCode=rs2.getString("agent_code");
											p_person_companyCode=rs2.getString("company_code");
         								}
										
										PreparedStatement pre3 = connection.prepareStatement("Select staff_name from staff  where company_code=? and agent_code=? and staff_code=?");
										pre3.setString(1, p_person_companyCode);
										pre3.setString(2, p_person_agentCode);
										pre3.setString(3, p_person_code);
										ResultSet rs3 = pre3.executeQuery();
										
									if (rs3.next()) {
											p_person= rs3.getString("staff_name");//21
										}
								System.out.print("p_person="+p_person);
											out.println(track_num+"$"+ s_code +"$"+r_name+ "$"+r_phone + "$"+ r_state + "$"	+  r_township + "$"	+  r_postal+ "$"	+r_address+"$"+d_point
												                 	+"$"+item_desc+"$"+status+"$"+deli_charges+"$"+total+"$"+p_date+"$"+p_person+"$"+t_charges+"$"+p_amt+"$"+currency);
								
								connection.close();
			
					} catch (Exception e) {
						e.printStackTrace();
					}
%>