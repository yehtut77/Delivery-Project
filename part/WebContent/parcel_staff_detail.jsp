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
    		String agent_code=(String)ssss.getAttribute("parent_agent_code");
    		String staff_code=(String)ssss.getAttribute("staffCode");
    	    
    


String code=request.getParameter("code");
String name=request.getParameter("name");
String type=request.getParameter("type");

System.out.println("your type is = "+type);
System.out.println("your name is = "+name);
System.out.println("your code is = "+code);
 try{  
	 
	//Connection con=DriverManager.getConnection("jdbc:mysql://localhost/delivery1","root","root");
	 Connection con=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
	if(type.equalsIgnoreCase("name")){
	
    PreparedStatement pre =con.prepareStatement("Select track_num,deli_charges,product_amt,total_amt,rcvr_name,rcvr_phone,rcvr_state,rcvr_township,trans_date,trans_charges from registration where staff_code=? and stat=?");
	pre.setString(1,name);
	pre.setString(2,"G");
	
    ResultSet r1=pre.executeQuery();
    
    PreparedStatement pre1 =con.prepareStatement("Select track_num,deli_charges,product_amt,total_amt,rcvr_name,rcvr_phone,rcvr_state,rcvr_township,trans_date,trans_charges from registration where staff_code=? and stat=?");
	pre1.setString(1,name);
	pre1.setString(2,"G");
	
    ResultSet r2=pre1.executeQuery();
    
    if(r2.next()){
   %>
    	<div style="overflow-x: auto;">
    <table id="basic-datatables" class="display table table-striped table-hover">
		<thead>

									<tr>
										<th>Tracking Number</th>

										<th>Delivery Charges</th>

										<th>Product Amount</th>
										
										<th>Total Charges</th>
															
			  							<th>Receiver Name</th>
			  														
										<th>Receiver Phone</th>												
																							
										<th>Receiver State</th>
										
										<th>Receiver Township</th>
										
										<th>Delivery Date</th>
									</tr>
								</thead>	
								<tbody>
	    <%
	 while(r1.next()){
    	    
		    String trckno=r1.getString("track_num");
		    
		    String donum=null;
		    String dodate=null;
	   
		    //do_num.................
    	    PreparedStatement c_pre=con.prepareStatement("Select do_num from do_item where tracking_num=?");
    		c_pre.setString(1,trckno);
    		ResultSet c_rs=c_pre.executeQuery();
    		while(c_rs.next()){
    		
    		donum=c_rs.getString("do_num");
    		 
    		}
    		if(donum==null){
    			
    			dodate="";
    			
    		}
    	
 		    
    		else{
    			 PreparedStatement c_pre1=con.prepareStatement("Select do_date from do_hdr where do_num=?");
        		 c_pre1.setString(1,donum);
        		 ResultSet c_rs1=c_pre1.executeQuery();
        		
        	    while(c_rs1.next()){
        		dodate=c_rs1.getString("do_date");
        		}
        	   
        	   
        	    c_pre1.close();
        	    c_rs1.close();
        	    
    		}
    		//do_date................
    		
    		
		
		  String delichg=r1.getString("deli_charges");
		  String tranchg=r1.getString("trans_charges");
		  
		  double delisum=Double.parseDouble(delichg);
		  double transum=Double.parseDouble(tranchg);
		  double sumchrg=delisum+transum;
          
		  String  delicharg=Double.toString(sumchrg);
		 
		  //covert delivery
		  String[] convert3 = delicharg.split("\\.");
	      int delichg1=Integer.parseInt(convert3[0]);
		  String delivercharg=Integer.toString(delichg1);
			
		  //convert product
		     
		  String prd=r1.getString("product_amt");
		  String prdamout=null;
		  if(prd==null){
			 prdamout="";
		  }
		  
		  else{
			
		  String[] convert = prd.split("\\.");
	      int prdamt=Integer.parseInt(convert[0]);
	      prdamout=Integer.toString(prdamt);
	             
		  }
			
             
		  //covert totalamt
		  String tot=r1.getString("total_amt");
		  String[] convert1 = tot.split("\\.");
		  
		  int totamt=Integer.parseInt(convert1[0]);
		  String totamout=Integer.toString(totamt);
		
		    
		%>
		
		<tr>
		<td><%=r1.getString("track_num")%></td>
		<td><%=delivercharg%></td>
		<td><%=prdamout%></td>
		<td><%=totamout%></td>
		<td><%=r1.getString("rcvr_name")%></td>
		<td><%=r1.getString("rcvr_phone")%></td>
		<td><%=r1.getString("rcvr_state")%></td>
		<td><%=r1.getString("rcvr_township")%></td>
		<td><%=dodate%>
		
		</tr>
		
	<%
	 c_pre.close();
     c_rs.close();
	}
	pre.close();
	r1.close();
    
	

	%>
	</tbody>			
	
	</table>
							
		</div>
	<%	
   
    }
	else{
			out.print("no");
	}							

}//type if end
	

else if(type.equalsIgnoreCase("code")){
	    
	 PreparedStatement pre =con.prepareStatement("Select track_num,deli_charges,product_amt,total_amt,rcvr_name,rcvr_phone,rcvr_state,rcvr_township,trans_date,trans_charges from registration where staff_code=? and stat=?");
		pre.setString(1,code);
		pre.setString(2,"G");
		
	    ResultSet r1=pre.executeQuery();
	    
	    PreparedStatement pre1 =con.prepareStatement("Select track_num,deli_charges,product_amt,total_amt,rcvr_name,rcvr_phone,rcvr_state,rcvr_township,trans_date,trans_charges from registration where staff_code=? and stat=?");
		pre1.setString(1,code);
		pre1.setString(2,"G");
		
	    ResultSet r2=pre1.executeQuery();
	    
	    if(r2.next()){
	   %>
	    	<div style="overflow-x: auto;">
	    <table id="basic-datatables" class="display table table-striped table-hover">
			<thead>

										<tr>
											<th>Tracking Number</th>

											<th>Delivery Charges</th>

											<th>Product Amount</th>
											
											<th>Total Charges</th>
																
				  							<th>Receiver Name</th>
				  														
											<th>Receiver Phone</th>												
																								
											<th>Receiver State</th>
											
											<th>Receiver Township</th>
											
											<th>Delivery Date</th>
										</tr>
									</thead>	
									<tbody>
		    <%
		 while(r1.next()){
	    	    
			    String trckno=r1.getString("track_num");
			    
			    String donum=null;
			    String dodate=null;
		   
			    //do_num.................
	    	    PreparedStatement c_pre=con.prepareStatement("Select do_num from do_item where tracking_num=?");
	    		c_pre.setString(1,trckno);
	    		ResultSet c_rs=c_pre.executeQuery();
	    		while(c_rs.next()){
	    		
	    		donum=c_rs.getString("do_num");
	    		 
	    		}
	    		if(donum==null){
	    			
	    			dodate="";
	    			
	    		}
	    	
	 		    
	    		else{
	    			 PreparedStatement c_pre1=con.prepareStatement("Select do_date from do_hdr where do_num=?");
	        		 c_pre1.setString(1,donum);
	        		 ResultSet c_rs1=c_pre1.executeQuery();
	        		
	        	    while(c_rs1.next()){
	        		dodate=c_rs1.getString("do_date");
	        		}
	        	   
	        	   
	        	    c_pre1.close();
	        	    c_rs1.close();
	        	    
	    		}
	    		//do_date................
	    		
	    		
			
			  String delichg=r1.getString("deli_charges");
			  String tranchg=r1.getString("trans_charges");
			  
			  double delisum=Double.parseDouble(delichg);
			  double transum=Double.parseDouble(tranchg);
			  double sumchrg=delisum+transum;
	          
			  String  delicharg=Double.toString(sumchrg);
			 
			  //covert delivery
			  String[] convert3 = delicharg.split("\\.");
		      int delichg1=Integer.parseInt(convert3[0]);
			  String delivercharg=Integer.toString(delichg1);
				
			  //convert product
			     
			  String prd=r1.getString("product_amt");
			  String prdamout=null;
			  if(prd==null){
				 prdamout="";
			  }
			  
			  else{
				
			  String[] convert = prd.split("\\.");
		      int prdamt=Integer.parseInt(convert[0]);
		      prdamout=Integer.toString(prdamt);
		             
			  }
				
	             
			  //covert totalamt
			  String tot=r1.getString("total_amt");
			  String[] convert1 = tot.split("\\.");
			  
			  int totamt=Integer.parseInt(convert1[0]);
			  String totamout=Integer.toString(totamt);
			
			    
			%>
			
			<tr>
			<td><%=r1.getString("track_num")%></td>
			<td><%=delivercharg%></td>
			<td><%=prdamout%></td>
			<td><%=totamout%></td>
			<td><%=r1.getString("rcvr_name")%></td>
			<td><%=r1.getString("rcvr_phone")%></td>
			<td><%=r1.getString("rcvr_state")%></td>
			<td><%=r1.getString("rcvr_township")%></td>
			<td><%=dodate%>
			
			</tr>
			
		<%
		 c_pre.close();
	     c_rs.close();
		}
		pre.close();
		r1.close();
	    
		

		%>
		</tbody>			
		
		</table>
								
			</div>
		<%	
	   
	    }
		else{
				out.print("no");
		}	
}//type else if end
         con.close();  
}
catch(Exception e){out.print(e);}   
%>
