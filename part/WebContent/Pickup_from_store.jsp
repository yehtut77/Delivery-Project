<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@ page  import="java.sql.Connection"%>
        <%@ page  import="java.sql.PreparedStatement" %>
       	<%@ page import="java.sql.*"%>
		<%@ page import="java.io.*"%>
		<%@ page import="java.time.LocalDateTime" %>
		<%@ page import="java.time.format.DateTimeFormatter"%>
		<%@ page import="java.text.SimpleDateFormat" %>	
		<%@ page import="java.util.Date"%>
 <%--  <%@ page import="myandeli.org.MySQLAccess" %> --%>
 
 	<%				
 	 try{
// Connection con=MySQLAccess.InitializeDatabase();
 	
//	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/delivery", "root", "root");
 Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
  
	 
 	HttpSession ssss=request.getSession(false);  
    String comapny_code=(String)ssss.getAttribute("companyCode");
    if (comapny_code==null)comapny_code="0001";
   	String username=(String)session.getAttribute("staffName"); 
   	String agent_code=(String)session.getAttribute("agentCode"); 
    if (agent_code==null)agent_code="9001";
   	String staff_code=(String)session.getAttribute("staffCode"); 
    if (staff_code==null)staff_code="0001";
   	
   	String task=request.getParameter("task");
   	String track_number=request.getParameter("track_number");
   	
	if(task.equalsIgnoreCase("pickupSection"))
	{
		 PreparedStatement pre=conn.prepareStatement("Select company_code,agent_code,track_num from registration where company_code=? and agent_code=? and track_num=? and stat=?");
		 pre.setString(1, comapny_code);
		 pre.setString(2, agent_code); 
		 pre.setString(3, track_number); 
		 pre.setString(4, "P"); 

		 ResultSet rs=pre.executeQuery();


		if(rs.next())
		  {
					
			out.println("ok");		
		 
		}else{
			 PreparedStatement pre_stat=conn.prepareStatement("Select stat from registration where company_code=? and agent_code=? and track_num=?");
			 pre_stat.setString(1, comapny_code);
			 pre_stat.setString(2, agent_code); 
			 pre_stat.setString(3, track_number); 
			 

			 ResultSet rs_stat=pre_stat.executeQuery();
			 if(rs_stat.next()){

				 PreparedStatement pre_er=conn.prepareStatement("Select description from stat where stat_code=? ");
				 pre_er.setString(1, rs_stat.getString("stat").trim());
			 
		 
				 ResultSet rs_er=pre_er.executeQuery();
				 if(rs_er.next()){
					 System.out.println(rs_er.getString("description"));
					 out.println(rs_er.getString("description"));		
				 }

				 
			 }
			
		}
		
	}
	else if(task.equalsIgnoreCase("normalCustomer")) 
	{
 

		 PreparedStatement pre=conn.prepareStatement("Select company_code,agent_code,track_num from registration where company_code=? and agent_code=? and track_num=?");
		 pre.setString(1, comapny_code);
		 pre.setString(2, agent_code); 
		 pre.setString(3, track_number); 

		 ResultSet rs=pre.executeQuery();


		if(rs.next())
		  {
					
			out.println("ok");		
		 
		}
		
		
	}//End of checking Normal Customer
	
	else if(task.equalsIgnoreCase("creditCustomer"))
	{
 
		String credit_code=request.getParameter("credit").trim();
		
		PreparedStatement pre=conn.prepareStatement("Select company_code,track_num,sender_code from registration where company_code=? and track_num=? and sender_code=?");
		 pre.setString(1, comapny_code);
		 pre.setString(2, track_number); 
		 pre.setString(3, credit_code);

		 ResultSet rs1=pre.executeQuery();


		if(rs1.next())
		  {
	 
			out.println("ok");			
		}else{	}
	 
	}// End of checking CreditCustomer
	
	else if(task.equalsIgnoreCase("creditCustomer_code"))
	{
 
	 
		 if(track_number.length()==9){
		String track1=track_number.substring(0, 8);
		String track2=track_number.substring(8);
 
		
		PreparedStatement pre=conn.prepareStatement("Select company_code,cust_code1,cust_code2 from credit_cust where company_code=? and cust_code1=? and cust_code2=?");
		 pre.setString(1, comapny_code);
		 pre.setString(2, track1); 
		 pre.setString(3, track2); 

		 ResultSet rs=pre.executeQuery();


		if(rs.next())
		  {
					
			out.println("ok");			
		}
		}else{	out.println(track_number.length());	}
		
	}// End of checking creditCustomer_code
	
    else if(task.equalsIgnoreCase("storePickupCustomer"))
    {
    String customer=request.getParameter("customer"); 
    String credit_c_code="";
 	 credit_c_code=request.getParameter("credit_customer"); 
 
 


	 DateTimeFormatter FOMATTER = DateTimeFormatter.ofPattern("MM/dd/yyyy 'at' hh:mm a");
	 LocalDateTime localDateTime = LocalDateTime.now();
	 String ldtString = FOMATTER.format(localDateTime);
 
	 String[] track = request.getParameterValues("track"); 	 
	 
 			
						  	 for(int i=0;i<track.length;i++){
						  	 
							 	PreparedStatement  pre=null;
							 	PreparedStatement  pre1=null;
							
						 

							 
							  	pre=conn.prepareStatement("Update registration set stat=? where company_code=? and agent_code=? and track_num=?");                            
							 	pre.setString(1, "U");
								pre.setString(2, comapny_code);
								pre.setString(3, agent_code);
								pre.setString(4,track[i] );
							  
							 	pre.executeUpdate();
										
							 
					    	   pre1=conn.prepareStatement("select trans_date,rcvr_phone,stat,deli_charges,sender_code from registration where company_code=? and agent_code=? and track_num=?");    
					    	   pre1.setString(1, comapny_code);
					       	   pre1.setString(2, agent_code);
						       pre1.setString(3,track[i] );
							   ResultSet rs=pre1.executeQuery();
										if(rs.next()){
											
					 
										
												
										 PreparedStatement  pre2=null;
											 pre2=conn.prepareStatement("insert into transaction(trans_date,company_code,agent_code,staff_username,staff_phone,track_num,track_stat,ref_type,delivery_charges,createdby,updatedby,createdate,modifydate,pay_code,staff_code)"
											 		  + "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
											 pre2.setString(1, rs.getString("trans_date"));
											 pre2.setString(2, comapny_code);
											 pre2.setString(3, agent_code);
											 pre2.setString(4, username);
											 pre2.setString(5, rs.getString("rcvr_phone"));
											 pre2.setString(6, track[i] );
											 pre2.setString(7, rs.getString("stat"));
											 pre2.setString(8, "PUC");
											 pre2.setString(9, rs.getString("deli_charges"));
											 pre2.setString(10, username);
											 pre2.setString(11,   " ");
											 pre2.setString(12, ldtString );
											 pre2.setString(13,  " " );
											 pre2.setString(14,  " " );
											 pre2.setString(15,  staff_code);
											 
											 pre2.executeUpdate();
											 
											  PreparedStatement  pre3=null;
											 pre3=conn.prepareStatement("insert into pickup(pickup_date,company_code,agent_code,staff_code,track_num,sender_code,createdby,updatedby,createdate,updatedate)"
													  + "values(?,?,?,?,?,?,?,?,?,?)");
											 pre3.setString(1, ldtString);
											 pre3.setString(2, comapny_code);
											 pre3.setString(3, agent_code);
											 pre3.setString(4, staff_code);
											 pre3.setString(5, track[i]);
											 
											  if(customer.equalsIgnoreCase("normal")){
												 pre3.setString(6, rs.getString("sender_code"));
											 }else{
											 	 pre3.setString(6, credit_c_code);
										 	 }
											 
											 pre3.setString(7, username);
											 pre3.setString(8, " ");
											 pre3.setString(9, ldtString);
											 pre3.setString(10, " ");
											 pre3.executeUpdate();  
									 
										
										}    
										
					 }	conn.close();	
					  response.sendRedirect("register.jsp");
					 // response.sendRedirect(request.getContextPath() + "register.jsp");
										
										
			 			
	
    }// End of Storing Customer Information	
 
	
	} 
 
			 catch(Exception e)
			 {
				 e.printStackTrace();
				 e.getMessage();
			
				 }	
				 %>

 



 