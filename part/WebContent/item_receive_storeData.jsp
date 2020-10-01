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
        String arr=null;
        String t_num=null;
        String  acode= request.getParameter("acode"); 
    	String  scode= request.getParameter("scode"); 
    	String  sname= request.getParameter("sname"); 
    	String  date=request.getParameter("date")+request.getParameter("ck");
         String  trsf_num = request.getParameter("trsf_num");
         String  arr1 = request.getParameter("t_num");
         String[] items = arr1.split(",");
         
         System.out.print("aaaaaaaaaa"+arr1);
         
    	 try{
  	Connection con=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234"); 
						//		Connection con=DriverManager.getConnection("jdbc:mysql://localhost/delivery","root","root");
							
								PreparedStatement  pre3 = con.prepareStatement("Select id  from trsf_hdr where trsf_num=?");
								pre3.setString(1, trsf_num);
						        ResultSet rs2 = pre3.executeQuery();
						        						        
							      while (rs2.next()) { 
							    	  t_num=rs2.getString("id");
						
							    	  PreparedStatement  pre1=null;
							 pre1=con.prepareStatement("Update  trsf_hdr set stat=?,updatedby=?,modifydate=? where id="+t_num);       
										        
										pre1.setString(1,"I");
										pre1.setString(2,sname);
										pre1.setString(3,date);					
										pre1.executeUpdate();
							      }
									 System.out.println("ITEM LENGTH"+items.length);
									 for(int loopIndex = 1; loopIndex < items.length; loopIndex++){
								        System.out.println("itsokMMM");
							            System.out.println(items[loopIndex] + "<BR>");
									PreparedStatement 	pre11=con.prepareStatement("select  trans_date,company_code,agent_code,rcvr_phone,track_num,deli_charges,createdby,createdate   from registration where track_num="+items[loopIndex]);    
								PreparedStatement  pre2=null;
								ResultSet rs11=pre11.executeQuery();
							      
							
								while(rs11.next()){
									
								
								 pre2=con.prepareStatement("insert into transaction(trans_date,company_code,agent_code,staff_username,staff_phone,track_num,track_stat,ref_type,delivery_charges,createdby,updatedby,createdate,modifydate)"
										  + "values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
								 pre2.setString(1, rs11.getString("trans_date"));
								 pre2.setString(2, rs11.getString("company_code"));
								 pre2.setString(3, rs11.getString("agent_code"));
								 pre2.setString(4, sname);
								 pre2.setString(5, rs11.getString("rcvr_phone"));
								 pre2.setString(6, rs11.getString("track_num"));
								 pre2.setString(7, "I");
								 pre2.setString(8, "ITR");
								 pre2.setString(9, rs11.getString("deli_charges"));
								 pre2.setString(10, rs11.getString("createdby"));
								 pre2.setString(11, sname);
								 pre2.setString(12, rs11.getString("createdate"));
								 pre2.setString(13,date);
							
								 pre2.executeUpdate();
							
							 			}
								
								
								 }
									
										
							      //     System.out.println("itsok");
								PreparedStatement  pre_item=null;		
									PreparedStatement pre_T=null;		
								PreparedStatement pre_r=null;
								PreparedStatement  pre = con.prepareStatement("Select tracking_num  from trsf_item where trsf_num=?");
								pre.setString(1, trsf_num);
						        ResultSet rs = pre.executeQuery();
						        
						        
							      while (rs.next()) { 
							    	  arr=rs.getString("tracking_num");
							    	  
						    	  pre_item=con.prepareStatement("Update  trsf_item set stat=?,updatedby=?,modifydate=? where tracking_num="+arr);
							    	  
								 pre_item.setString(1,"I");
									pre_item.setString(2,sname);
									pre_item.setString(3,date);
							pre_item.executeUpdate();       
							
							 pre_r = con.prepareStatement(
										"Update  registration set stat=?    where  track_num=" + arr);
								pre_r.setString(1, "I");										
								pre_r.executeUpdate();
								System.out.println("itsok5");
					            
					            	pre_T = con.prepareStatement(
										"Update  transaction set track_stat=?,ref_type=?,updatedby=?,modifydate=?   where  track_num=" + arr);
								pre_T.setString(1, "I");
								 pre_T.setString(2, "ITR");
								pre_T.setString(3, sname);
								pre_T.setString(4,date);
								pre_T.executeUpdate();
							//	System.out.println("itsok5");
					            
							      }
					            
							      
							  //    System.out.println("itsok");
							      
							  
							
								 PreparedStatement  pre_inbox_id = con.prepareStatement("Select idagent_inbox_id  from agent_inbox where trsf_num=?");
								 pre_inbox_id.setString(1, trsf_num);
							        ResultSet rs_inbox = pre_inbox_id.executeQuery();							        
							        String inbox_id=null;
								      while (rs_inbox.next()) { 
								    	  inbox_id=rs_inbox.getString("idagent_inbox_id");
								      }								      								      
								 PreparedStatement  pre_inbox=null;
								 pre_inbox=con.prepareStatement("Update  agent_inbox set read_unread=?,module_code=? where  idagent_inbox_id="+inbox_id);									      
								 pre_inbox.setString(1,"r");
								 pre_inbox.setString(2,"ITR");
								pre_inbox.executeUpdate();
					
								      
								 response.sendRedirect("item_transfer.jsp");
								 
   			 	}
    	 
    	catch (SQLException e) {
			e.printStackTrace();
		}
         
        %>


</body>
</html>