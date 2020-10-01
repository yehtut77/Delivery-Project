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
 
 	<%				
 	try{
// Connection con=MySQLAccess.InitializeDatabase();
 	    	
	 //Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/delivery", "root", "root");
	 Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");

	 
 	HttpSession ssss=request.getSession(false);  
    String comapny_code=(String)ssss.getAttribute("companyCode");
   	String agent_code=(String)session.getAttribute("agentCode"); 
	String task=request.getParameter("task").trim();
	String searchKey=request.getParameter("searchKey");
    
	
	if(task.equalsIgnoreCase("search")){
		 int first_loop=1;
		 String customer_code="";//<>!#@$
		if(searchKey !="" && searchKey.length()<=40){
		 
		String key="";
		String selected_staff=request.getParameter("selected_staff");
		PreparedStatement pre_tran=conn.prepareStatement("Select  cust_name,cust_code1,cust_code2 from credit_cust where company_code=?");
		pre_tran.setString(1, comapny_code);
		 
		
	 
		 ResultSet rs_tran=pre_tran.executeQuery();
		 
		PreparedStatement pre_code=conn.prepareStatement("Select  cust_name,cust_code1,cust_code2 from credit_cust where company_code=?");
		pre_code.setString(1, comapny_code);
		 
	    
	  ResultSet rs_code=pre_code.executeQuery();
	 
	 		 
	 	while(rs_tran.next()){
	 		 customer_code=rs_tran.getString("cust_name");
	 		  if(customer_code.contains(searchKey)){
	   
	 	if(first_loop==1){
	 		key +=rs_tran.getString("cust_name")+"  "+rs_tran.getString("cust_code1")+""+rs_tran.getString("cust_code2");
	 		first_loop=2;
	 	}
	 	else{
	 		key +="/"+rs_tran.getString("cust_name")+"  "+rs_tran.getString("cust_code1")+""+rs_tran.getString("cust_code2");
	 	}
	 	}
	 		
	 		}
	 
	 	
	 	while(rs_code.next()){
	 		  customer_code=rs_code.getString("cust_code1")+""+rs_code.getString("cust_code2");
	 		  if(customer_code.contains(searchKey)){ 
 
	 	 	if(first_loop==1){
	 	 		key +=rs_code.getString("cust_code1")+""+rs_code.getString("cust_code2")+"  "+rs_code.getString("cust_name");
	 	 		first_loop=2;
	 		}
		 	else{
		 		key +="/"+rs_code.getString("cust_code1")+""+rs_code.getString("cust_code2")+"  "+rs_code.getString("cust_name");
	 	 	}
	 		
	 		  }
	 		}
	 	
	 	pre_tran.close();
		rs_tran.close();
	 	pre_code.close();
	 	rs_code.close();
	 		
	 	out.print(key.trim());
	 
	 	 
	 
		}else{
			out.print("No_data");
		}
	  
	 
}else if(task.equalsIgnoreCase("retrieveData")){
		
		
		%>
		
		
		 <table style="width:100%; text-align: center;">
						
						<thead >
												<tr>
												  
												    <th>Tracking Number</th>
												    <th> Product Amt</th>
												    <th>Delivery Charges</th>
												   <th>Receiver name</th>
												   <th>Receiver phone</th>
												    <th>Receiver Township</th>
												    <th>Receiver Region</th>
												     
											 	</tr></thead>  
		<tbody>
		
		
		<%
		
		String customer_code=request.getParameter("code1").trim();
		String customer_code1=request.getParameter("code2").trim();
		String printType=request.getParameter("printType").trim();
		String f_date=request.getParameter("f_date").trim();
	
		String trans_date="";
		double deli_char=0.0;
		String tran_d="";
		boolean flag=false;
		String do_num="";
		String track_num="";
		String toUp="";
		int loop_count=1;
		String stat="";
		int ifwhile=1;

		PreparedStatement pre_regis=conn.prepareStatement("Select stat,trans_date,track_num,deli_charges,trans_charges,product_amt,rcvr_name,rcvr_phone,rcvr_township,rcvr_state  from registration where company_code=? and sender_code=? or  company_code=? and sender_code=?");
		pre_regis.setString(1, comapny_code);
		pre_regis.setString(2, customer_code);
		pre_regis.setString(3, comapny_code);
		pre_regis.setString(4, customer_code1);
	    ResultSet rs_regis=pre_regis.executeQuery();
	     
	    DateTimeFormatter dat = DateTimeFormatter.ofPattern("dd/MM/yyyy");
  	    LocalDateTime localDateTime = LocalDateTime.now();
  	    String dt = dat.format(localDateTime);
  	  
  	     
	    while(rs_regis.next()){
	                     ifwhile=2;
	    				 stat=rs_regis.getString("stat");
	    	             if(stat.equalsIgnoreCase("W")){
						             trans_date=rs_regis.getString("trans_date");
						             int day=Integer.parseInt(trans_date.substring(0, 2));
						    		 int mon=Integer.parseInt(trans_date.substring(3,5));
						    	     int yr=Integer.parseInt(trans_date.substring(6,10)); 
						    	     tran_d=trans_date.substring(0, 10);
						      	  	 if(printType.equalsIgnoreCase("reprint")) {
								      			int f_yr=Integer.parseInt(f_date.substring(0,4));
								      			int f_mon=Integer.parseInt(f_date.substring(5,7));
								      			int f_day=Integer.parseInt(f_date.substring(8, 10));
						      					if(f_day==day){
						      						if( f_mon==mon){ 
						      							if( f_yr==yr){
						      								flag=true;
						      							}
						      						}
						      					}
						      			 
						      	    	}else if(printType.equalsIgnoreCase("print")) {
						      	    			if(dt.equalsIgnoreCase(tran_d)){
						      	    				flag=true;
						      	    			}
						      	    	}
						    		   if(flag==true){ 
									    		   track_num=rs_regis.getString("track_num");
									   			   PreparedStatement pre_item=conn.prepareStatement("Select do_num from do_item where company_code=? and tracking_num=? ");
									   			   pre_item.setString(1, comapny_code);
									   			   pre_item.setString(2, track_num); 
									    
									   			   ResultSet rs_item=pre_item.executeQuery();
									   			   if(rs_item.next()){
									   		    	   do_num=rs_item.getString("do_num");
									   				   PreparedStatement pre_do=conn.prepareStatement("Select stat from do_hdr where  do_num=? and stat=? and company_code=? ");
									   				   pre_do.setString(1, do_num);
									   				   if(printType.equalsIgnoreCase("print")){
									   				        pre_do.setString(2, "unprinted");
									   					}else if(printType.equalsIgnoreCase("reprint")){	
									   					    pre_do.setString(2, "printed");
									   					}
									   				   pre_do.setString(3, comapny_code);
									   				 
									   				   ResultSet rs_do=pre_do.executeQuery();
									   				   if(rs_do.next()){
									   					deli_char=Double.parseDouble(rs_regis.getString("deli_charges"))+Double.parseDouble(rs_regis.getString("trans_charges"));
									   		    		%>
									   		    			<tr>
									   		    				<td><%=rs_regis.getString("track_num")%></td>
									   		    				<td><%=rs_regis.getString("product_amt")%></td>
									   		    				<td><%=deli_char %></td>
									   		    				<td><%=rs_regis.getString("rcvr_name")%></td>
									   		    				<td><%=rs_regis.getString("rcvr_phone")%> </td>
									   		    				<td><%=rs_regis.getString("rcvr_township")%></td>
									   		    				<td><%=rs_regis.getString("rcvr_state")%></td> 
									   		    			</tr>	
														   	<% 
														   if(loop_count==1)  {
															 	toUp +=do_num;
														   }else { 	
															   toUp +="!"+do_num; 
														   }
														   rs_do.close();
													       pre_do.close();
														   }else{
														   			out.print("&print_er&");
														   	}
														 pre_item.close();
														 rs_item.close();
													   				
									   			     }else{
									   			         out.print("&not_trans&");
									   			     }
						    		  }  else{
						    		     out.print("&date_er&");
						    		     }
						         loop_count=2;
	    	      }else{
	    	    	  out.print("&stat_er&");
	    	      }
	     }
	     if(ifwhile==1){
	         out.print("&not_found&");
	     }
	     %>

	     </tbody></table>&<%=toUp%>&
	     <% 
  
	     rs_regis.close();
	     pre_regis.close();
	     
	}else if(task.equalsIgnoreCase("retrieveCustInfo")){  
		String cust_code="";
	 
		String outdata="";
		boolean flag=false;
		
	String customer_code=request.getParameter("code1").trim();
	String customer_code1=request.getParameter("code2").trim();
 
	PreparedStatement pre_code1=conn.prepareStatement("Select  cust_name,cust_code1,cust_code2,cust_phone from credit_cust where company_code=?");
	pre_code1.setString(1, comapny_code);
	 
    ResultSet rs_code1=pre_code1.executeQuery();

    while(rs_code1.next()){
     
	 		  cust_code=rs_code1.getString("cust_code1")+""+rs_code1.getString("cust_code2");
	 		  if( customer_code.equalsIgnoreCase(cust_code) || customer_code1.equalsIgnoreCase(cust_code)){
	 		 
	 			 outdata=rs_code1.getString("cust_name")+","+rs_code1.getString("cust_phone");
	 			 flag=true;
	 			 
	 		  } 
    }
	
    rs_code1.close();    
    pre_code1.close();
    
 if(flag=true){
	 out.print(outdata);
 }
 else{
	 
		  out.print("no");
	  }
 } else if(task.equalsIgnoreCase("comfirm")){
	 
			String do_number=request.getParameter("do_number");
			 
			String[] array = do_number.split(" ", -1);
		 
			// String[] do_number1 = request.getParameterValues("do_number"); 	 	
		  	 for(int i=0;i<array.length;i++){
			  PreparedStatement	pre_dostat=conn.prepareStatement("Update do_hdr set stat=? where do_num=? and company_code=? and  stat=? ");                            
			 pre_dostat.setString(1, "printed");
			 pre_dostat.setString(2, array[i].trim());
			 pre_dostat.setString(3, comapny_code);
			 pre_dostat.setString(4, "unprinted");
			 pre_dostat.executeUpdate();
		 
			 pre_dostat.close();
			 
		  	 }
		  	out.print("ok");	
		} 
	
	conn.close();
} 

catch(Exception e)
{
	 e.printStackTrace();
	 e.getMessage();

	 }				

		%>
