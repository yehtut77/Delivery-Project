<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
	<%@ page import="java.io.*"%>
	<%@ page import="javax.xml.bind.DatatypeConverter"%>
	<%@ page import="java.util.Base64"%>
	<%@ page import="java.time.LocalDateTime" %>
	<%@ page import="java.time.format.DateTimeFormatter"%>
	<%@ page import="java.text.SimpleDateFormat" %>	
	<%@ page import="java.util.Date"%>

<%
 
try 
{
	HttpSession ssss=request.getSession(false); 
	String urname=(String)ssss.getAttribute("username");
	
	
	String staff_name=(String)ssss.getAttribute("staff_name");
	HttpSession newsession=request.getSession();
	newsession.setAttribute("staff_name",staff_name);
	

	 	String s_code=request.getParameter("s_code");
	 	System.out.println("s_code="+s_code);
		String p_agent=request.getParameter("p_agent");
		System.out.println("p_agent="+p_agent);
		String company=request.getParameter("company");	
		String name=request.getParameter("name");
		String username=request.getParameter("username");	
		String password=request.getParameter("password");	
		String dob=request.getParameter("dob");	
		String marital=request.getParameter("marital");	
		String gender=request.getParameter("gender");	
		
		String add1=request.getParameter("address1");
		String add2=request.getParameter("address2");	
		String add3=request.getParameter("address3");	
		String add4=request.getParameter("address4");
		
		String address1="";
		String address2=""; 
		String address3="";
		String address4="";
		
		try {
			address1= java.net.URLDecoder.decode(add1, "UTF-8");
			address2= java.net.URLDecoder.decode(add2, "UTF-8");
			address3= java.net.URLDecoder.decode(add3, "UTF-8");
			address4= java.net.URLDecoder.decode(add4, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		
		
		
		String phno=request.getParameter("phno");	
		String posit=request.getParameter("posit");	
		String dept=request.getParameter("dept");		
		String country=request.getParameter("country");	
		String state=request.getParameter("state");			
		String township=request.getParameter("township");	
		String ward=request.getParameter("ward");	
		String street=request.getParameter("street");	
		String zip=request.getParameter("zip");	
		//System.out.println("zip="+staff_postal);
		String edu=request.getParameter("edu");	
		String auth=request.getParameter("auth");
		String acctype=request.getParameter("acctype");	
		
		
		String salary=request.getParameter("salary");	
		String currency=request.getParameter("currency");	
		String cert=request.getParameter("cert");	
		String skill=request.getParameter("skill");	
		String e_c=request.getParameter("e_c");	
		String  e_p=request.getParameter("e_p");
		String updatedby=request.getParameter("updatedby");
		
		
		
		String remark=request.getParameter("remark");	
		String bname=request.getParameter("bname");	
		String busername=request.getParameter("busername");	
		String bcard=request.getParameter("bcard");	
		String ano=request.getParameter("ano");	
		//String  edate=request.getParameter("edate");	
		String  cdate=request.getParameter("cdate");
		String  mdate=request.getParameter("mdate");
		String arr1 = request.getParameter("val");
		String emonth=request.getParameter("emonth");
		String eyear=request.getParameter("eyear");
		String  edate=emonth+"/"+eyear;	
		System.out.println("edate="+edate);
		String createdby=request.getParameter("createdby");
		//String updatedby=request.getParameter("updatedby");
		
		System.out.println("createdby="+createdby);
		System.out.println("updatedby="+staff_name);
		System.out.println("Info="+remark);
		System.out.println("Info="+bname);
		System.out.println("Info="+busername);
		System.out.println("Info="+bcard);
		System.out.println("Info="+ano);
		System.out.println("Info="+cdate);
		System.out.println("Info="+mdate);		
		System.out.println("Info="+arr1);
		System.out.println("Info="+edate);
		
		
		DateTimeFormatter FOMATTER = DateTimeFormatter.ofPattern("MM/dd/yyyy 'at' hh:mm a");
		   
		//Local date time instance
	LocalDateTime localDateTime = LocalDateTime.now();										  
		 //Get formatted String
	String ldtString = FOMATTER.format(localDateTime);										  
	System.out.println("Local Time:"+ldtString); 
		

//Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/delivery1","root","root");
Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");


PreparedStatement  pre=null;
/* 
pre=conn.prepareStatement("Update staff  set  staff_code=?,parent_agent_code=?,company_code=?,staff_name=?,staff_username=?,staff_password=?,staff_dob=?,staff_maritalstatus=?,staff_gender=?,staff_addr1=?,staff_phone=?,staff_position=?,staff_dept=?,staff_country=?,staff_division=?,staff_township=?,staff_ward=?,staff_street=?,staff_postal=?,staff_highedu=?,staff_authorizationcode=?,staff_accounttype=?,staff_salary=?,staff_currency=?,staff_otherscert=?,staff_skills=?,staff_emergency_contact=?,staff_emergency_phone=?,remark=?,staff_bankname=?,staff_bankusername=?,staff_bankcardtype=?,staff_bankacctno=?,staff_bankexprdate=?,createdate=?,modifydate=?,staff_addr2=?,staff_addr3=?,staff_addr4=?,createdby=?,updatedby=?  where staff_code="+s_code);
   
 */ 
 
 
//pre=conn.prepareStatement("Update staff  set  staff_code=?,parent_agent_code=?,company_code=?,staff_name=?,staff_username=?,staff_password=?,staff_dob=?,staff_maritalstatus=?,staff_gender=?,staff_addr1=?,staff_addr2=?,staff_addr3=?,staff_addr4=?,staff_country=?,staff_division=?,staff_township=?,staff_ward=?,staff_street=?,staff_postal=?,staff_phone=?,staff_position=?,staff_dept=?,staff_highedu=?,staff_authorizationcode=?,staff_accounttype=?,staff_salary=?,staff_currency=?,staff_otherscert=?,staff_skills=?,staff_emergency_contact=?,staff_emergency_phone=?,remark=?,staff_bankname=?,staff_bankusername=?,staff_bankcardtype=?,staff_bankacctno=?,staff_bankexprdate=?,createdate=?,modifydate=?,createdby=?,updatedby=? where staff_code="+s_code);

   
   




//int  no[]={1,2,3,4,5,6,7,8,9,10};//pre.setString(1,2,3,....)
//int    y=9;//break  statement (  break for  database rows   )

	//Statement st=conn.createStatement();
	//int statement=st.executeUpdate(" DELETE FROM staff_exp_info WHERE   staff_code="+s_code);                                      
		

	String[] a = arr1.split(",");
	
	int length=a.length;
	float total_exp=0;
	System.out.println("Length="+arr1);
	
if(a[0]!=null)
{
		int no_row=(length/8);
		int inner_loop=0;
		int i=1;
		int no_cell=8;
		int num=0;
		
		/***** Delete from staff_exp_info ********/
		String query = "select count(*) from staff_exp_info WHERE staff_code="+s_code;   
	    Statement stmt=conn.createStatement();
	    ResultSet rs = stmt.executeQuery(query);
	    rs.next();
		    int c = rs.getInt(1);
		    //System.out.println("Row count="+c);
		    for(int ii=0;ii<c;ii++)
		    {
		    	Statement stmt1=conn.createStatement();	
				String sql = "DELETE FROM staff_exp_info WHERE staff_code="+s_code;		
		      	stmt1.executeUpdate(sql);
		      	System.out.println("Delted");
		    }
		
		// DateTimeFormatter dtf = DateTimeFormatter.ofPattern("mm/dd/yyyy");  
		// LocalDateTime now = LocalDateTime.now();  
		// System.out.println(dtf.format(now)); 
		
		//SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
		//Date date = new Date();
		
		//System.out.println(formatter.format(date)); 
	
	
		int count=0;
		int flag=6;
	 for(int x=1; x<=no_row; x++){
	  										
		pre=conn.prepareStatement("insert into staff_exp_info(staff_code,companyname,from_month,from_year,to_month,to_year,experience,exp_details,createdate,modifydate,createdby,updatedby)"+
            "values(?,?,?,?,?,?,?,?,?,?,?,?)");
	
		
			int index=1;
			
			float exp=Float.parseFloat(a[flag]);											
			 total_exp+=exp;
			 System.out.println("total_exp="+a[flag]);
			 flag+=8;
			
		for(inner_loop=num;inner_loop<(no_cell*x);inner_loop++)
		{
					
			 pre.setString(index,a[inner_loop]);
			
			 index++;
			 
		}
		 		
				pre.setString(9, cdate);
				pre.setString(10, ldtString);
				pre.setString(11,createdby);
				pre.setString(12,staff_name);
				pre.executeUpdate();
				
				 
				num=inner_loop;
	}	System.out.println("Data is successfully inserted into staff table!");	 
}//end of if

System.out.println("total_exp="+total_exp);

/**************************************************** Inserting into Staff Table**********************************************************/

pre=conn.prepareStatement("Update staff  set  staff_code=?,parent_agent_code=?,company_code=?,staff_name=?,staff_username=?,staff_password=?,staff_dob=?,staff_maritalstatus=?,staff_gender=?,staff_addr1=?,staff_addr2=?,staff_addr3=?,staff_addr4=?,staff_country=?,staff_division=?,staff_township=?,staff_ward=?,staff_street=?,staff_postal=?,staff_phone=?,staff_position=?,staff_dept=?,staff_highedu=?,staff_authorizationcode=?,staff_accounttype=?,staff_salary=?,staff_currency=?,staff_otherscert=?,staff_skills=?,staff_emergency_contact=?,staff_emergency_phone=?, remark=?,staff_bankname=?,staff_bankusername=?,staff_bankcardtype=?,staff_bankacctno=?,staff_bankexprdate=?,createdate=?,modifydate=?,createdby=?,updatedby=?,staff_totalexp=? where staff_code="+s_code);

pre.setString(1,s_code);
pre.setString(2,p_agent);
pre.setString(3,company);
pre.setString(4,name);
pre.setString(5,username);
pre.setString(6,password);
pre.setString(7,dob);
pre.setString(8,marital);
pre.setString(9,gender);
pre.setString(10,address1);
pre.setString(11,address2);
pre.setString(12,address3);
pre.setString(13,address4);
pre.setString(14,country);
pre.setString(15,state);
pre.setString(16,township);
pre.setString(17,ward);
pre.setString(18,street);
pre.setString(19,zip);
pre.setString(20,phno);
pre.setString(21,posit);
pre.setString(22,dept);
pre.setString(23,edu);
pre.setString(24,auth);
pre.setString(25,acctype);
pre.setString(26,salary);
pre.setString(27,currency);
pre.setString(28,cert);
pre.setString(29,skill);
pre.setString(30,e_c);
pre.setString(31,e_p);
pre.setString(32,remark);
pre.setString(33,bname);
pre.setString(34,busername);
pre.setString(35,bcard);
pre.setString(36,ano);
pre.setString(37,edate);
pre.setString(38,cdate);
pre.setString(39,ldtString);
 pre.setString(40,createdby);
pre.setString(41,staff_name); 
pre.setString(42,String.valueOf(total_exp));

pre.executeUpdate();
System.out.println("Data is successfully inserted into staff table!");

conn.close();
//conn.clearWarnings();

//response.sendRedirect("staffList.jsp"); 


}
catch(Exception e)
{
out.println(e);
}   

%>
