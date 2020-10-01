<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<%@ page import="java.util.Base64"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


	<%
		String  acode= request.getParameter("acode"); 
	    	String  scode= request.getParameter("scode"); 
	    	String  sname= request.getParameter("sname"); 
	    	String  date=request.getParameter("date");
	    	String  c_code= request.getParameter("c_code"); 
	    	String  a_code= request.getParameter("a_code"); 
	    	String  s_code= request.getParameter("s_code"); 
	    	String  reason= request.getParameter("reason");     	
	        String  arr1 = request.getParameter("t_num");
	        String[] items = arr1.split(",");
	  //    System.out.print(arr1+"arr1");
	     
	    	 try{
	    	 	 Connection con=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
	    		    	  //  Connection con=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_deliv?useTimezone=true&serverTimezone=UTC","teamrame_zaw","zawmyo");	  	
						//	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/delivery","root","root");
							Statement stmt = con.createStatement();								
							 Statement statement = null;
							
						//Creating   Transfer  Code   start
								PreparedStatement pre_ITcode=con.prepareStatement("Select type,period,month   from nextkey where company_code=? and module=?");
								pre_ITcode.setString(1, c_code); 
								pre_ITcode.setString(2, "IT");	 
								ResultSet rs_itcode=pre_ITcode.executeQuery();

								String  header=null;
								int header_code=0;
								String code;
							String   module="";
								int changecode = 0;
								String 	trsf_num="0T-00001";
								if(rs_itcode.next())
								{
												
									code = rs_itcode.getString("period");
									header=rs_itcode.getString("type");
								header_code=rs_itcode.getInt("month");
								//module=rs_itcode.getString("module");
									//code = code.substring(2);
									changecode = Integer.parseInt(code);
									if (changecode==99999) {changecode=0; header_code++;}
									
									changecode = changecode + 1;
									String trsf_no = String.format("%05d", changecode);
								    	trsf_num = header_code+header+ trsf_no;
								//	System.out.print(trsf_num); 
									
									  PreparedStatement preparedStmt = null;	  
									  preparedStmt=con.prepareStatement("Update nextkey set type=?,period=?,month=? where company_code=? and module=?");     
									  
									  preparedStmt.setString(1, header); 
									  preparedStmt.setString(2, String.valueOf(trsf_no)); 
									  preparedStmt.setInt(3, header_code); 
									  preparedStmt.setString(4, c_code); 
									  preparedStmt.setString(5, "IT"); 
									  preparedStmt.execute();
									  
												 
								}
								else {
									
									PreparedStatement pre_itcode=null;	 
									pre_itcode=con.prepareStatement("insert into nextkey(company_code,module,type,period,month)"
									  +  "values(?,?,?,?,?)");
									  
									pre_itcode.setString(1,c_code); 
									pre_itcode.setString(2,"IT"); 
									pre_itcode.setString(3,"T-");
									pre_itcode.setInt(4,00001);
									pre_itcode.setInt(5,0);
									pre_itcode.executeUpdate();
							
								}
								//Creating   Transfer  Code   end
							
								PreparedStatement pre1 = null;					
								pre1 = con.prepareStatement(
										"insert into trsf_hdr(company_code,agent_code,staff_code,trsf_date,trsf_num,reason,stat,trsf_agent_code,trsf_staff_code,createdby,updatedby,createdate,modifydate)"
												+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
					
								pre1.setString(1, c_code);
								pre1.setString(2, acode);
								pre1.setString(3, scode);
								pre1.setString(4, date);
								pre1.setString(5, trsf_num);
								pre1.setString(6, reason);
								pre1.setString(7, "T");
								pre1.setString(8, a_code);
								pre1.setString(9, s_code);
								pre1.setString(10, sname);
								pre1.setString(11, sname);
								pre1.setString(12, date);
								pre1.setString(13, date);
					
								pre1.executeUpdate();
							//	System.out.println("itsok");
					
								
								PreparedStatement pre = null;
								int trsf_seq = items.length;
								for (int loopIndex = 1; loopIndex < items.length; loopIndex++) {
									out.println(items[loopIndex] + "<BR>");
					
									pre = con.prepareStatement(
											"insert into trsf_item(company_code,trsf_num,trsf_seq,stat,tracking_num,createdby,updatedby,createdate,modifydate)"
													+ "values(?,?,?,?,?,?,?,?,?)");
					
									pre.setString(1, c_code);
									pre.setString(2, trsf_num);
									pre.setInt(3, trsf_seq);
									pre.setString(4, "T");
									pre.setString(5, items[loopIndex]);
									pre.setString(6, sname);
									pre.setString(7, sname);
									pre.setString(8, date);
									pre.setString(9, date);
									pre.executeUpdate();
								//	System.out.println("itsok");
					
								}
					
								
								PreparedStatement pre3 = null;
								pre3 = con.prepareStatement(
										"insert into agent_noti(company_code,agent_code,sender_code,sub)" + "values(?,?,?,?)");
								pre3.setString(1, c_code);
								pre3.setString(2, a_code);
								pre3.setString(3, acode);
								pre3.setString(4, "Item Transfer");
								pre3.executeUpdate();
							//	System.out.println("itsok3");
								
								PreparedStatement pre2 = null;
								for (int loopIndex = 1; loopIndex < items.length; loopIndex++) {
								//	System.out.println(items[loopIndex] + "<BR>");
									PreparedStatement pre11 = con
											.prepareStatement("select  trans_date,company_code,agent_code,rcvr_phone,track_num,deli_charges,createdby,createdate  from registration where track_num=" + items[loopIndex]);
					
									ResultSet rs = pre11.executeQuery();
									while (rs.next()) {
					
										pre2 = con.prepareStatement(
												"insert into transaction(trans_date,company_code,agent_code,staff_username,staff_phone,track_num,track_stat,ref_type,delivery_charges,createdby,updatedby,createdate,modifydate)"
														+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
										pre2.setString(1, rs.getString("trans_date"));
										pre2.setString(2, rs.getString("company_code"));
										pre2.setString(3, rs.getString("agent_code"));
										pre2.setString(4, sname);
										pre2.setString(5, rs.getString("rcvr_phone"));
										pre2.setString(6, rs.getString("track_num"));
										pre2.setString(7, "T");
										pre2.setString(8, "ITT");
										pre2.setString(9, rs.getString("deli_charges"));
										pre2.setString(10, rs.getString("createdby"));
										pre2.setString(11, sname);
										pre2.setString(12, rs.getString("createdate"));
										pre2.setString(13, date);
									//	System.out.println("itsok4");
										pre2.executeUpdate();
					
									}
								}
					
								for (int loopIndex = 1; loopIndex < items.length; loopIndex++) {
									PreparedStatement pre_r = con.prepareStatement(
											"Update  registration set stat=?,reason=?,updateby=?,modifydate=?    where  track_num=" + items[loopIndex]);
									pre_r.setString(1, "T");
									pre_r.setString(2,reason);
										pre_r.setString(3,sname);
											pre_r.setString(4,date);
											
								//	System.out.println("itsok5");
									pre_r.executeUpdate();
								}
					
								
								PreparedStatement pre_inbox = null;
								pre_inbox = con.prepareStatement(
										"insert into agent_inbox(module_code,trsf_num,company_code,agent_code,read_unread,trans_date,sender_code,sender_name)"
												+ "values(?,?,?,?,?,?,?,?)");
								pre_inbox.setString(1, "ITT");
								pre_inbox.setString(2, trsf_num);
								pre_inbox.setString(3, c_code);
								pre_inbox.setString(4, a_code);
								pre_inbox.setString(5, "ur");
								pre_inbox.setString(6, date);
								pre_inbox.setString(7, scode);
								pre_inbox.setString(8, sname);
								pre_inbox.executeUpdate();
							//	System.out.println("itsok6");
								response.sendRedirect("item_transfer.jsp");
					
								
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	%>



</body>
</html>