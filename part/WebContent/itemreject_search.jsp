<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
            <%@ page import="java.sql.*"%>  
            <%@page import="java.text.SimpleDateFormat,java.util.Date"%>
            <%@ page import="java.time.format.DateTimeFormatter" %>
            <%@ page import="java.util.Calendar" %>
            <%@ page import="java.time.*" %>
            <%@ page import="java.io.*"%>
    	    <%@ page import="java.util.Base64"%>
<%
	
HttpSession ssss=request.getSession(false);  
 
String username=(String)session.getAttribute("username"); 
String staff_name=(String)ssss.getAttribute("staffName");
String ccode=(String)ssss.getAttribute("companyCode");
String agent_code=(String)ssss.getAttribute("agentCode");
String staff_code=(String)ssss.getAttribute("staffCode");
String tracknum=(String)ssss.getAttribute("tracknum");

 
 String itemupdate=request.getParameter("itemupdate");
 if(itemupdate==null)
 {itemupdate=" ";}

 String track_number=null;
 String stats=null;
try{
//	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/delivery1","root","root");  
	 Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
	//  Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_deliv?useTimezone=true&serverTimezone=UTC","teamrame_zaw","zawmyo");
	
	if(itemupdate.equalsIgnoreCase("itemsearch")){
	
		track_number=request.getParameter("trckno").trim();
		
		 PreparedStatement pre1=conn.prepareStatement("Select track_num from registration where track_num=?");
	     pre1.setString(1,track_number);
	     ResultSet rs1=pre1.executeQuery();
	     
	     PreparedStatement pre2=conn.prepareStatement("Select stat from registration where stat=? and track_num=? or stat=? and track_num=?");
	     pre2.setString(1,"P");
	     pre2.setString(2,track_number);
	     pre2.setString(3,"W");
	     pre2.setString(4,track_number);
	     ResultSet rs2=pre2.executeQuery();
		
	    if(rs1.next()){
	    	
	   if(rs2.next()){
		   
		   
		 PreparedStatement pre=conn.prepareStatement("Select trans_date,track_num,stat,sender_code,rcvr_name,rcvr_addr1,rcvr_addr2,rcvr_addr3,rcvr_addr4,rcvr_state,rcvr_township,rcvr_ward,rcvr_street,rcvr_postal,rcvr_phone,drop_point_code,weight,size,deli_charges,trans_charges,product_amt,cur_charges,total_amt,item_desc,planned_deli_date,picture from registration where company_code=? and agent_code=? and track_num=? and stat=? or company_code=? and agent_code=? and track_num=? and stat=?");
		 pre.setString(1, ccode); 
		 pre.setString(2, agent_code); 
		 pre.setString(3, track_number);
		 pre.setString(4, "P");	
		 pre.setString(5, ccode);
		 pre.setString(6, agent_code);
		 pre.setString(7, track_number);
		 pre.setString(8, "W");

		 ResultSet rs=pre.executeQuery();
		
		if(rs.next())
		  {
		 String track=rs.getString("track_num");
             String stat=rs.getString("stat");
             ssss.setAttribute("tracknum",track);
						    
			  Blob  image = null;
			  byte[] imgData = null;
			  String base64Image=null;
						   
			               Blob blob=rs.getBlob("picture");
							if(blob==null){
								
								
							}
							
							
							else{
			               InputStream inputStream=blob.getBinaryStream();
							
							ByteArrayOutputStream outputStream=new ByteArrayOutputStream();
							byte[] buffer=new byte[4096];
							
							int bytesRead= -1;
							
							while ((bytesRead=inputStream.read	(buffer)) != -1) {
								outputStream.write(buffer,0,bytesRead);
							}
							byte[] imageBytes=outputStream.toByteArray();
							base64Image=Base64.getEncoder().encodeToString(imageBytes); 
						}
						%>

							<div class="card">
						<div class="card-header">
							<div class="card-title">Item Rejected Detail </div>

						</div>
						<div class="card-body">


							<!--  start   first row -->

							<div class=" row">

								<div class="col-12 col-lg-6">

									<div class=" row">
                                    
										<div class="col-6 col-lg-3">
											<img width="100px" src="data:img/jpg;base64, <%=base64Image%>" />
						                 
										</div>
									</div>

								</div>

								<div class="col-12 col-lg-6">

									<div class=" row">
										<div class="col-6 col-lg-3">
											<label>Tracking Number</label>
										</div>
										<div class="col-6 col-lg-5">
											<h4>
												<%=rs.getString("track_num")%></h4>
												
										</div>
									</div>


									<div class=" row">
										<div class="col-6 col-lg-3">
											<label>Status</label>
										</div>
										<div class="col-6 col-lg-3"> 
										 
											<h4> <%=rs.getString("stat")%></h4>
											
										</div>
									</div>


									<div class=" row">
										<div class="col-6 col-lg-3">
											<label>Sender Code</label>
										</div>
										<div class="col-6 col-lg-3">
											<h4><%=rs.getString("sender_code")%></h4>
											
										</div>
									</div>

									<div class=" row">
										<div class="col-6 col-lg-3">
											<label>Receiver Name</label>
										</div>
									<div class="col-6 col-lg-3">
											<h4><%=rs.getString("rcvr_name")%></h4>
										</div>
									</div>

								</div>

							</div>
						</div>
					</div>		
						
						
									
								
					<div class="card">
						<div class="card-header">
							<div class="card-title">Personal Information Details</div>

						</div>
						<div class="card-body">


							<div class="row">
								<div class="col-12 col-lg-6">

									<div class="row">
										<div class="col-4">
											<label>Address1</label>
										</div>
										<div class="col-6">
											<h4><%=rs.getString("rcvr_addr1")%></h4>
										</div>

									</div>

									<div class="row">
										<div class="col-4">
											<label>Address2</label>
										</div>
										<div class="col-6">
											<h4><%=rs.getString("rcvr_addr2")%></h4>
										</div>

									</div>

									<div class="row">
										<div class="col-4">
											<label>Address3</label>
										</div>
										<div class="col-6">
											<h4><%=rs.getString("rcvr_addr3")%></h4>
										</div>

									</div>
									
									<div class="row">
										<div class="col-4">
											<label>Address4</label>
										</div>
										<div class="col-6">
											<h4><%=rs.getString("rcvr_addr4")%></h4>
										</div>

									</div>
									
									<div class="row">
										<div class="col-4">
											<label>Drop Point</label>
										</div>
										<div class="col-6">
											<h4><%=rs.getString("drop_point_code")%></h4>
										</div>

									</div>


								</div>
								
								
								
								<div class="col-12 col-lg-6">

									<div class="row">
										<div class="col-4">
											<label>State</label>
										</div>
										<div class="col-6">
											<h4><%=rs.getString("rcvr_state")%></h4>
										</div>

									</div>

									<div class="row">
										<div class="col-4">
											<label>Township</label>
										</div>
										<div class="col-6">
											<h4><%=rs.getString("rcvr_township")%></h4>
										</div>

									</div>

									<div class="row">
										<div class="col-4">
											<label>Ward</label>
										</div>
										<div class="col-6">
											<h4><%=rs.getString("rcvr_ward")%></h4>
										</div>

									</div>
									
									<div class="row">
										<div class="col-4">
											<label>Street</label>
										</div>
										<div class="col-6">
											<h4><%=rs.getString("rcvr_street")%></h4>
										</div>

									</div>
									
									<div class="row">
										<div class="col-4">
											<label>Postal</label>
										</div>
										<div class="col-6">
											<h4><%=rs.getString("rcvr_postal")%></h4>
										</div>

									</div>


								</div>
								



							</div>



						</div>
					</div>			
					
					<div class="card">
						<div class="card-header">
							<div class="card-title">Item Information Details</div>

						</div>
						<div class="card-body">


							<div class="row">
								<div class="col-12 col-lg-6">

									<div class="row">
										<div class="col-4">
											<label>Weight</label>
										</div>
										<div class="col-6">
											<h4><%=rs.getString("weight")%></h4>
										</div>

									</div>

									<div class="row">
										<div class="col-4">
											<label>Size</label>
										</div>
										<div class="col-6">
											<h4><%=rs.getString("size")%></h4>
										</div>

									</div>

									<div class="row">
										<div class="col-4">
											<label>Delivery Charges</label>
										</div>
										<div class="col-6">
											<%
														String deli=rs.getString("deli_charges");
														String[] convert = deli.split("\\.");
														 // -034556
														String[] parts =deli.split(".");
														int a=Integer.parseInt(convert[0]);
														
														
														String delichg=Integer.toString(a);
														
														%>
															<h4><%=delichg%></h4>
										</div>

									</div>
									
									<div class="row">
										<div class="col-4">
											<label>Transaction Charges</label>
										</div>
										<div class="col-6">
											<%
														String trans=rs.getString("trans_charges");
														String[] convert1 = trans.split("\\.");
														 // -034556
														
														int a1=Integer.parseInt(convert1[0]);
														
														
														String tranchg=Integer.toString(a1);
														
														%>
															<h4><%=tranchg%></h4>
										</div>

									</div>
									
										<div class="row">
										<div class="col-4">
											<label>Transaction Date</label>
										</div>
										<div class="col-6">
											
															<h4><%=rs.getString("trans_date")%></h4>
										</div>

									</div>
									
							


								</div>
								
								
								
								<div class="col-12 col-lg-6">

									<div class="row">
										<div class="col-4">
											<label>Product Amount</label>
										</div>
										<div class="col-6">
											<%
														String prd=rs.getString("product_amt");
											if(prd==null){
												
												
											%>
											<h4></h4>
											<% }
											else{
														String[] convert3 = prd.split("\\.");
														 // -034556
														
														int a3=Integer.parseInt(convert3[0]);
														
														
														String prdamt=Integer.toString(a3);
														
														%>
															<h4><%=prdamt%></h4>
														<%}%>
										</div>

									</div>

									<div class="row">
										<div class="col-4">
											<label>Currency Charges</label>
										</div>
										<div class="col-6">
											<%
														String cur=rs.getString("cur_charges");
														String[] convert2 = cur.split("\\.");
														 // -034556
														
														int a2=Integer.parseInt(convert2[0]);
														
														
														String curchg=Integer.toString(a2);
														
														%>
															<h4><%=curchg %></h4>
										</div>

									</div>

									<div class="row">
										<div class="col-4">
											<label>Total Amount</label>
										</div>
										<div class="col-6">
											<%
														String tot=rs.getString("total_amt");
														String[] convert4 = tot.split("\\.");
														 // -034556
														
														int a4=Integer.parseInt(convert4[0]);
														
														
														String totamt1=Integer.toString(a4);
														
														%>
															<h4><%=totamt1%></h4>
										</div>

									</div>
									
									<div class="row">
										<div class="col-4">
											<label>Item Description</label>
										</div>
										<div class="col-6">
											<h4><%=rs.getString("item_desc")%></h4>
										</div>

									</div>
									
									<div class="row">
										<div class="col-4">
											<label>Planned Delivery Date</label>
										</div>
										<div class="col-6">
											<h4><%=rs.getString("planned_deli_date")%></h4>
										</div>

									</div>


								</div>
								



							</div>



						</div>
					</div>	
			
			
			
			   <%
					
	              
		         }//first if
		
		else{
			out.print("ok");
		}
		 
	   
	   }//secong if
			
			else{
				out.print("stat");
			}
		}
		else{
			out.print("track");
		}
			
					 
		
       
	
}
	
	// end if
 	 
	
	else{
		       
		  
		  
		     DateTimeFormatter FOMATTER = DateTimeFormatter.ofPattern("MM/dd/yyyy 'at' hh:mm a");
		 	 LocalDateTime localDateTime = LocalDateTime.now();
		 	 String ldtString = FOMATTER.format(localDateTime);
		     System.out.println(" update successfull");
		
		 //Update stat to R     
		 PreparedStatement  pre=conn.prepareStatement("Update registration set stat=?,updateby=?,modifydate=? where track_num="+tracknum);  
		 pre.setString(1,"C");
		 pre.setString(2,staff_name);
		 pre.setString(3,ldtString);
	     pre.executeUpdate();


		
		 //regi declare
		 String staffph=null;
		 String trackno=null;
		 String compcode=null;
		 String agentcode=null;
		 String delicharges=null;
		 String createdby=null;
		 String createdate=null;
		 String staff_username=null;
      
		 //staff_phone
		 PreparedStatement pre1=conn.prepareStatement("select staff_phone,staff_username from staff where staff_name=?");
		 pre1.setString(1,staff_name);
		 ResultSet staff=pre1.executeQuery(); 
		 
		 if(staff.next()){
		 	    staffph=staff.getString("staff_phone");
		 		staff_username=staff.getString("staff_username");
		 	}
		 
		//track num
		 PreparedStatement pre2=conn.prepareStatement("select company_code,agent_code,track_num,deli_charges,createdby,createdate from registration where track_num=?");
		 pre2.setString(1,tracknum);
		 ResultSet regi=pre2.executeQuery(); 
		
		 if(regi.next()){
			     trackno=regi.getString("track_num");
			     compcode=regi.getString("company_code");
		 		 agentcode=regi.getString("agent_code");
		 		 delicharges=regi.getString("deli_charges");
		 		 createdby=regi.getString("createdby");
		 		 createdate=regi.getString("createdate");
		}
		 
		 //update to transcation table
		 PreparedStatement  upd=null;
		 upd=conn.prepareStatement("insert into transaction(trans_date,company_code,agent_code,staff_username,staff_phone,track_num,track_stat,ref_type,delivery_charges,createdby,createdate,staff_code)"+"values(?,?,?,?,?,?,?,?,?,?,?,?)");

		 
		 upd.setString(1,ldtString);
		 upd.setString(2,compcode);
		 upd.setString(3,agentcode);
		 upd.setString(4,staff_username);
		 upd.setString(5,staffph);
		 upd.setString(6,trackno);
		 upd.setString(7,"C");
		 upd.setString(8," ");
		 upd.setString(9,delicharges);
		 upd.setString(10,createdby);
		 upd.setString(11,createdate);
		 upd.setString(12,staff_code);
         upd.executeUpdate();


		 System.out.println("Data is successfully inserted!");
		 response.sendRedirect("itemreject_main.jsp"); 
		 
	
	 }//end else
	 conn.close();
	
}//try end
catch(Exception e)
{
out.println(e);
}  
%>