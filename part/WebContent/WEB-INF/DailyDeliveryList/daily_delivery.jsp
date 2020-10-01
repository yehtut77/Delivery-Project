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
 	
	//Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/delivery", "root", "root");
	  Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");

	 
 	HttpSession ssss=request.getSession(false);
    String comapny_code=(String)ssss.getAttribute("companyCode");
   	String agent_code=(String)session.getAttribute("agentCode");
	String task=request.getParameter("task");
	
	if(task.equalsIgnoreCase("staffphone")){
		String staff_phone=null;
		String selected_staff=request.getParameter("selected_staff");
		PreparedStatement pre_staff=conn.prepareStatement("Select  staff_phone from staff where company_code=? and parent_agent_code=? and staff_name=? ");
	 	pre_staff.setString(1, comapny_code);
	 	pre_staff.setString(2, agent_code); 
	 	pre_staff.setString(3, selected_staff); 
	 	ResultSet rs_staff=pre_staff.executeQuery();
	 	if(rs_staff.next()){
	 		staff_phone=rs_staff.getString("staff_phone");
	 		out.print(staff_phone);
	 	}
	 	else{		
	 		out.print("no");
	 		}
	}
	else if(task.equalsIgnoreCase("checkingTrackingNumber")){
		
		%>
		
		  <table id="basic-datatables" class="display table table-striped table-hover"    style="text-align: center; width:100%; cellspacing:0">
						 <hr>
						      <thead >
												<tr>
												    <th>No.</th>
												    <th>Trans_date</th>
												    <th>Tracking number</th>
												    <th><span style="writing-mode: vertical-lr; -ms-writing-mode: tb-rl; transform: rotate(180deg)">Delivered</span></th>
												    <th><span style="writing-mode: vertical-lr; -ms-writing-mode: tb-rl; transform: rotate(180deg)">Cancelled</span></th>
												    <th><span style="writing-mode: vertical-lr; -ms-writing-mode: tb-rl; transform: rotate(180deg)">Re_Deliver</span></th>
												    <th>Amount</th>
												    <th>Receiver Name</th>
												    <th>Receiver Township</th>
											 	</tr>
								 </thead> 	 
						         <tbody id="rowsoftb">
		
		<% 
	 
		 	String printType=request.getParameter("printType");
			String f_date=request.getParameter("f_date");
			
			DateTimeFormatter dat = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		  	LocalDateTime localDateTime = LocalDateTime.now();
		  	String dt = dat.format(localDateTime);
		  	
		 	double amount=0.0;
		 	double total_amount=0.0;
		 	String track_num="";
		 	String toUp="";
		 	String product_amt=null;
		 	String deli_charges=null;
		 	String product_charges=null;
		 	String trans_date=null;
		 	String stat=null; 
		 	String do_num=null;
		 	String tran_d="";
		 	boolean flag=false; 
		 	int no=1;
		 	int loop_count=1;
		 	int sh_amt=0;
		 	int ifwhile=1;
		    PreparedStatement	pre=conn.prepareStatement("Select * from registration where company_code=? and agent_code=? and stat=? or company_code=? and agent_code=? and stat=? or company_code=? and agent_code=? and stat=?");
			pre.setString(1, comapny_code);
			pre.setString(2, agent_code);  
			pre.setString(3, "D"); 
			pre.setString(4, comapny_code);
			pre.setString(5, agent_code);  
			pre.setString(6, "C");  
			pre.setString(7, comapny_code);
			pre.setString(8, agent_code);  
			pre.setString(9, "R");  
			
			ResultSet rs=pre.executeQuery();  
			while(rs.next())
			    {
				   
				    track_num=rs.getString("track_num"); 
		            trans_date=rs.getString("trans_date"); 
		            tran_d=trans_date.substring(0, 10);
		            int day=Integer.parseInt(trans_date.substring(0, 2));
		    		int mon=Integer.parseInt(trans_date.substring(3,5));
		    	    int yr=Integer.parseInt(trans_date.substring(6,10));
		    		trans_date=day+"/"+mon+"/"+yr; 
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
						System.out.println("if"+flag);
						flag=false;
					stat=rs.getString("stat");
					if(stat.equalsIgnoreCase("D")){
					  	      
			       			 PreparedStatement pre_item=conn.prepareStatement("Select do_num from do_item where company_code=? and tracking_num=? ");
							 pre_item.setString(1, comapny_code);
							 pre_item.setString(2, track_num);  
							 ResultSet rs_item=pre_item.executeQuery();
						 
			
							 if(rs_item.next())
							  { 
								    	 do_num=rs_item.getString("do_num"); 
										 PreparedStatement pre_do=conn.prepareStatement("Select stat from do_hdr where  do_num=? and stat=? and company_code=? ");
										 pre_do.setString(1, do_num);
											if(printType.equalsIgnoreCase("print")) 
											{
										      pre_do.setString(2, "unprinted");
											}else if(printType.equalsIgnoreCase("reprint")){
											  pre_do.setString(2, "printed");
											}
										 pre_do.setString(3, comapny_code); 
										 ResultSet rs_do=pre_do.executeQuery();
										 //End  do item 
										 if(rs_do.next())
										  {
											 product_amt=rs.getString("product_amt");
											  deli_charges=rs.getString("deli_charges");
											  product_charges=rs.getString("cur_charges");
											  if(product_amt==null)product_amt="0.0";
											  if(deli_charges==null)deli_charges="0.0";
											  if(product_charges==null)product_charges="0.0"; 
							       			  amount=Double.parseDouble(product_amt)+Double.parseDouble(deli_charges)+Double.parseDouble(product_charges); 
							       			  total_amount +=amount;
							       			  sh_amt=(int)amount;
							       			  ifwhile=2;
										// do_num=rs_do.getString("do_num");
								   %> 
								          <tr>
								               <td><%=no %></td>
								               <td><%=trans_date%></td>
								               <td><%=rs.getString("track_num")%></td>
								               <td>&#x25CF;</td>
								               <td></td>
								               <td></td>
								               <td><%=sh_amt %></td>
								               <td><%=rs.getString("rcvr_name")%></td>
								               <td><%=rs.getString("rcvr_township")%> </td>
								               
								          </tr>        
									 											   
								 <% 
									 if(loop_count==1)  {
										 	toUp +=do_num;
									   }else { 	
										   toUp +="!"+do_num; 
									   }
								     no++;
		   							  }
										 rs_do.close();
				   						    pre_do.close();
				   							  
				   						  }  
				   					rs_item.close();
		   						    pre_item.close();
			         }
			         else if(stat.equalsIgnoreCase("C")){
			        	         sh_amt=0;
				                 PreparedStatement pre_item=conn.prepareStatement("Select do_num from do_item where company_code=? and tracking_num=? ");
								 pre_item.setString(1, comapny_code);
								 pre_item.setString(2, track_num);  
								 ResultSet rs_item=pre_item.executeQuery();
							 
				
								 if(rs_item.next())
								  { 
									    	 do_num=rs_item.getString("do_num"); 
											 PreparedStatement pre_do=conn.prepareStatement("Select stat from do_hdr where  do_num=? and stat=? and company_code=? ");
											 pre_do.setString(1, do_num);
												if(printType.equalsIgnoreCase("print")) 
												{
											      pre_do.setString(2, "unprinted");
												}else if(printType.equalsIgnoreCase("reprint")){
												  pre_do.setString(2, "printed");
												}
											 pre_do.setString(3, comapny_code); 
											 ResultSet rs_do=pre_do.executeQuery();
											 //End  do item 
											 if(rs_do.next())
											  {
												 ifwhile=2;
											// do_num=rs_do.getString("do_num");
									   %> 
									          <tr>
									               <td><%=no %></td>
									               <td><%=trans_date%></td>
									               <td><%=rs.getString("track_num")%></td>
									               <td></td>
									               <td>&#x25CF;</td>
									               <td></td>
									               <td><%=sh_amt%></td>
									               <td><%=rs.getString("rcvr_name")%></td>
									               <td><%=rs.getString("rcvr_township")%> </td>
									               
									          </tr>        
										 											   
									 <%  
									 if(loop_count==1)  {
										 	toUp +=do_num;
									   }else { 	
										   toUp +="!"+do_num; 
									   }
									 no++;
		   							  }
											 rs_do.close();
					   						    pre_do.close();
					   							  
					   						  }  
					   					rs_item.close();
			   						    pre_item.close();
			           }
			         else if(stat.equalsIgnoreCase("R")){
			        	 System.out.println(">>"+printType);
			        	     sh_amt=0;
		                     PreparedStatement pre_item=conn.prepareStatement("Select do_num from do_item where company_code=? and tracking_num=? ");
		   					 pre_item.setString(1, comapny_code);
		   					 pre_item.setString(2, track_num);  
		   					 ResultSet rs_item=pre_item.executeQuery();
		   				
		   	
		   					 if(rs_item.next())
		   					  { 
		   						    	 do_num=rs_item.getString("do_num"); 
		   								 PreparedStatement pre_do=conn.prepareStatement("Select stat from do_hdr where  do_num=? and stat=? and company_code=? ");
		   								 pre_do.setString(1, do_num);
		   									if(printType.equalsIgnoreCase("print")) 
		   									{
		   								      pre_do.setString(2, "unprinted");
		   									}else if(printType.equalsIgnoreCase("reprint")){
		   									  pre_do.setString(2, "printed");
		   									}
		   								 pre_do.setString(3, comapny_code); 
		   								 ResultSet rs_do=pre_do.executeQuery();
		   								 //End  do item 
		   								 if(rs_do.next())
		   								  {
		   									 ifwhile=2;
		   								// do_num=rs_do.getString("do_num");
		   						   %> 
		   						          <tr>
		   						               <td><%=no %></td>
		   						               <td><%=trans_date%></td>
		   						               <td><%=rs.getString("track_num")%></td>
		   						               <td></td>
		   						               <td></td>
		   						               <td>&#x25CF;</td>
		   						               <td><%=sh_amt%></td>
		   						               <td><%=rs.getString("rcvr_name")%></td>
		   						               <td><%=rs.getString("rcvr_township")%> </td>
		   						               
		   						          </tr>        
		   							 											   
				   						 <%  
				   						if(loop_count==1)  {
										 	toUp +=do_num;
									   }else { 	
										   toUp +="!"+do_num; 
									   }
		   						     no++;
		   							  }
		   							rs_do.close();
		   						    pre_do.close();
		   							  
		   						  }  
		   					rs_item.close();
   						    pre_item.close();
			           } 
					   loop_count=2;
					    } 
		    }
			if(ifwhile==1){
		         out.print("$No$");
		     }
			 %>
			</tbody></table>$<%=toUp%>$<%=total_amount %>$
						         <%
			} 
           else if(task.equalsIgnoreCase("comfirm")){
						 String do_number=request.getParameter("do_number").trim(); 
						 String[] array = do_number.split(" ", -1); 
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
	 
	
	
	 
    
 
		

 



 