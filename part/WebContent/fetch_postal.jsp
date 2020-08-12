<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement" %>

<%
try {
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}


		Connection conn = null;		
		
try{
		
	//conn=DriverManager.getConnection("jdbc:mysql://localhost/delivery","root","root"); 
	conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");

	String module=request.getParameter("module");
	int flag=0;
	String list="";
	
		if(module.equalsIgnoreCase("select1"))	
		{
				String state_code=request.getParameter("state_code");
				String township_code="";
				String township_name="";
				
				String townshipListStart="`<option value=";
				
				String townshipListStartSelected="`<option selected value=";
				
				String townshipListMiddle1=" about=";
				String townshipListMiddle2=">";
				String townshipListEnd="</option>`";
				String firstOption="`<option  value="+""+">"+"--Select Township--"+"</option>`";
								
				PreparedStatement pre_township=conn.prepareStatement("Select township_code,township_name from township where state_code=?");						 
				pre_township.setString(1, state_code);
				ResultSet rs_township=pre_township.executeQuery();
				list=firstOption;		
				while(rs_township.next())
				  {
					flag=1;
					township_code=rs_township.getString("township_code");
					township_name=rs_township.getString("township_name");
					list=list+townshipListStart+township_name+townshipListMiddle1+township_code+townshipListMiddle2+township_name+townshipListEnd;	
					//out.println("ok");	
					
				}
				if(flag==0)list="`<option selected value="+"0"+">"+"No Township"+"</option>`";	
			}
		
		else if(module.equalsIgnoreCase("select2"))	
		{
				String state_code=request.getParameter("state_code");
				String township_code=request.getParameter("township_code");
				String ward_code="";
				String ward_name="";
				
				String wardListStart="`<option value=";
				
				String wardListStartSelected="`<option selected value=";
				String wardListMiddle1=" about=";
				String wardListMiddle2=">";
				String wardListMiddle=">";
				String wardListEnd="</option>`"; 
				String firstOption="`<option  value="+""+">"+"--Select Ward--"+"</option>`";
								
				PreparedStatement pre_ward=conn.prepareStatement("Select ward_code,ward_name from ward where state_code=? and township_code=?");						 
				pre_ward.setString(1, state_code);
				pre_ward.setString(2, township_code);
				ResultSet rs_ward=pre_ward.executeQuery();
				list=firstOption;		
				while(rs_ward.next())
				  {
					flag=1;
					ward_code=rs_ward.getString("ward_code");
					ward_name=rs_ward.getString("ward_name");
					list=list+wardListStart+ward_name+wardListMiddle1+ward_code+wardListMiddle2+ward_name+wardListEnd;
					//out.println("ok");	
					
				}
				if(flag==0)list="`<option selected value="+"0"+">"+"No Ward"+"</option>`";	
			}	
				
		else if(module.equalsIgnoreCase("select3"))	
		{
				String state_code=request.getParameter("state_code");
				String township_code=request.getParameter("township_code");
				String ward_code=request.getParameter("ward_code");
				String street_code="";
				String street_name="";
				
				String streetListStart="`<option value=";
				
				String streetListStartSelected="`<option selected value=";
				String streetListMiddle1="about=";
				String streetListMiddle2=">";
				String streetListMiddle=">";
				String streetListEnd="</option>`"; 
				String firstOption="`<option selected value="+"0"+">"+"--Select Street--"+"</option>`";
								
				PreparedStatement pre_street=conn.prepareStatement("Select street_code,street_name from street where state_code=? and township_code=? and ward_code=?");						 
				pre_street.setString(1, state_code);
				pre_street.setString(2, township_code);
				pre_street.setString(3, ward_code);
				ResultSet rs_street=pre_street.executeQuery();
				list=firstOption;		
				while(rs_street.next())
				  {
					flag=1;
					street_code=rs_street.getString("street_code");
					street_name=rs_street.getString("street_name");
					list=list+streetListStart+street_name+streetListMiddle1+street_code+streetListMiddle2+street_name+streetListEnd;	
					//out.println("ok");	
					
				}
				if(flag==0)list="`<option selected value="+"0"+">"+"No Street"+"</option>`";	
			}	
				
		else if(module.equalsIgnoreCase("postalcode"))	
		{
				String post_code=request.getParameter("post_code");
				String state_code;
				String state_name;
				String township_code;				
				String ward_code;				
				String street_code;
				
				
				String ListStart="`<option value=";					
				String ListStartSelected="`<option selected value=";					
				String ListMiddle=">";
				String ListMiddle1=" about=";
				String ListMiddle2=">";
				String ListEnd="</option>`"; 
				//String firstOption="`<option  value="+""+">"+"--Select Ward--"+"</option>`";
				
				if(post_code.length()<3 && post_code.length()>1)
				{
					list="";
					PreparedStatement pre_state=conn.prepareStatement("Select state_code,state_name from state"); 
					ResultSet rs_state=pre_state.executeQuery();
					int f=0;
					if(!(post_code.equalsIgnoreCase("00")))
					{
						while(rs_state.next())
						{
							state_code=rs_state.getString("state_code");
							state_name=rs_state.getString("state_name");
							
							if(rs_state.getString("state_code").equalsIgnoreCase(post_code))
							{
								list=list+ListStartSelected+state_name+ListMiddle1+state_code+ListMiddle2+state_name+ListEnd;
							}
							else{
								list=list+ListStart+state_name+ListMiddle1+state_code+ListMiddle2+state_name+ListEnd;
							}
							f=1;
						}
				
					}
					if(f==1)list=list+"$AAAA";
					else list="`<option selected value="+"0"+">"+"No State/Division"+"</option>`"+"$AAAA";
					
				}
				else if(post_code.length()<5 && post_code.length()>3)
				{
					list="";
					state_code=post_code.substring(0, 2);
					township_code=post_code.substring(2);
					
					PreparedStatement pre_township=conn.prepareStatement("Select township_code,township_name from township where state_code=?");
					pre_township.setString(1, state_code);
					ResultSet rs_township=pre_township.executeQuery();
					
					String t_code;
					String t_name;
					int f=0;
					if(!(township_code.equalsIgnoreCase("00")))
					{
						while(rs_township.next())
						{
							t_code=rs_township.getString("township_code");
							t_name=rs_township.getString("township_name");
							
							if(rs_township.getString("township_code").equalsIgnoreCase(township_code))
							{
								list=list+ListStartSelected+t_name+ListMiddle1+t_code+ListMiddle2+t_name+ListEnd;
							}
							else{
								list=list+ListStart+t_name+ListMiddle1+t_code+ListMiddle2+t_name+ListEnd;
							}
							f=1;
						}
					}
					
					if(f==1)list=list+"$BBBB";
					else list="`<option selected value="+"0"+">"+"No Township"+"</option>`"+"$BBBB";
					
				}
				else if(post_code.length()<7&& post_code.length()>5)
				{
					list="";
					state_code=post_code.substring(0, 2);
					township_code=post_code.substring(2,4);
					ward_code=post_code.substring(4);
					
					PreparedStatement pre_ward=conn.prepareStatement("Select ward_code,ward_name from ward where state_code=? and township_code=?");
					pre_ward.setString(1, state_code);
					pre_ward.setString(2, township_code);
					ResultSet rs_ward=pre_ward.executeQuery();
					
					String w_code;
					String w_name;
					int f=0;
					
					if(!(ward_code.equalsIgnoreCase("00")))
					{
						while(rs_ward.next())
						{
							w_code=rs_ward.getString("ward_code");
							w_name=rs_ward.getString("ward_name");
							
							if(w_code.equalsIgnoreCase(ward_code))
							{
								list=list+ListStartSelected+w_name+ListMiddle1+w_code+ListMiddle2+w_name+ListEnd;
							}
							else{
								list=list+ListStartSelected+w_name+ListMiddle1+w_code+ListMiddle2+w_name+ListEnd;
							}
							f=1;
						}
					}
					if(f==1)list=list+"$CCCC";
					else list="`<option selected value="+"0"+">"+"No Ward"+"</option>`"+"$CCCC";
					
				}

				else if(post_code.length()<9&& post_code.length()>7)
				{
					list="";
					state_code=post_code.substring(0, 2);
					township_code=post_code.substring(2,4);
					ward_code=post_code.substring(4,6);
					street_code=post_code.substring(6);
					
					PreparedStatement pre_street=conn.prepareStatement("Select street_code,street_name from street where state_code=? and township_code=? and ward_code=?");
					pre_street.setString(1, state_code);
					pre_street.setString(2, township_code);
					pre_street.setString(3, ward_code);
					ResultSet rs_street=pre_street.executeQuery();
					
					String st_code;
					String st_name;
					int f=0;
					if(!(street_code.equalsIgnoreCase("00")))
					{
						while(rs_street.next())
						{
							st_code=rs_street.getString("street_code");
							st_name=rs_street.getString("street_name");
							
							if(st_code.equalsIgnoreCase(street_code))
							{
								list=list+ListStartSelected+st_name+ListMiddle1+st_code+ListMiddle2+st_name+ListEnd;
							}
							else{
								list=list+ListStart+st_name+ListMiddle1+st_code+ListMiddle2+st_name+ListEnd;
							}
							f=1;
						}
					}
					
					if(f==1)list=list+"$DDDD";
					else list="`<option selected value="+"0"+">"+"No Ward"+"</option>`"+"$DDDD";
					
				}
				else if(post_code.length()<1)
				{
					list="`<option selected value="+"0"+">"+"--Select--"+"</option>`"+"$EEEE";	
				}
		}	
				
		
		
			out.println(list);
		
		list="";
		conn.close();
	} catch (Exception e) {
e.printStackTrace();
} 
%>