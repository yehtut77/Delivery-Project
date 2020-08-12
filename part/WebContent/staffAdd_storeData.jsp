<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page  import="java.sql.Connection"%>
        <%@ page  import="java.sql.PreparedStatement" %>
       	<%@ page import="java.sql.*"%>
		<%@ page import="java.io.*"%>
		<%@ page import="java.time.LocalDateTime" %>
		<%@ page import="java.time.format.DateTimeFormatter"%>
		<%@ page import="java.text.SimpleDateFormat" %>	
		<%@ page import="java.util.Date"%>
		<%@ page import="java.nio.charset.StandardCharsets" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		<%				
		
		HttpSession ssss=request.getSession(false); 
		String staff_name=(String)ssss.getAttribute("staff_name");
		//HttpSession newSession=request.getSession();
		//newSession.setAttribute("staff_name",staff_name);
		
		
							String n=(String)session.getAttribute("amname"); 
	                       	String s_code=request.getParameter("s_code");
							String p_agent=request.getParameter("p_agent");
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
							
							//System.out.println("address1="+address1);
							
								
							String phno=request.getParameter("phno");	
							String posit=request.getParameter("posit");	
							String dept=request.getParameter("dept");	
							
							String country=request.getParameter("country");	
							String state=request.getParameter("state");	
							String township=request.getParameter("township");	
							String ward=request.getParameter("ward");	
							String street=request.getParameter("street");	
							String zip=request.getParameter("zip");	
							String edu=request.getParameter("edu");	
							String auth=request.getParameter("auth");
							String acctype=request.getParameter("acctype");	
							
							String salary=request.getParameter("salary");	
							String currency=request.getParameter("currency");	
							String cert=request.getParameter("cert");	
							String skill=request.getParameter("skill");	
							String e_c=request.getParameter("e_c");	
							String  e_p=request.getParameter("e_p");	
							
							String remark=request.getParameter("remark");	
							String bname=request.getParameter("bname");	
							String busername=request.getParameter("busername");	
							String bcard=request.getParameter("bcard");	
							String ano=request.getParameter("ano");	
							String emonth=request.getParameter("emonth");
							String eyear=request.getParameter("eyear");
							String  edate=emonth+"/"+eyear;	
							String  cdate=request.getParameter("cdate");
							String arr1 = request.getParameter("val");
							//String exp_month = request.getParameter("exp_month");
							System.out.println(arr1);	
							
							
							DateTimeFormatter FOMATTER = DateTimeFormatter.ofPattern("MM/dd/yyyy 'at' hh:mm a");
							   
							 //Local date time instance
							 LocalDateTime localDateTime = LocalDateTime.now();
							  
							 //Get formatted String
							 String ldtString = FOMATTER.format(localDateTime);
							  
							 System.out.println("Local Time:"+ldtString); 
							
								
								//Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/delivery1","root","root");
								Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
								
									
								System.out.println("      *** Connection  is  successful ***");
								PreparedStatement  pre=null;
								
								
								
/*********************************************** Inserting into staff_exp_info Table***************************************************** */
								
								
								String[] a = arr1.split(",");
																				
										int length=a.length;
										System.out.println("length="+a[0]);
										float total_exp=0;
						if(a[0]!=null)
						{
										int no_row=(length/8);
										int inner_loop=0;
										int i=1;
										int no_cell=8;
										int num=0;
										
										// DateTimeFormatter dtf = DateTimeFormatter.ofPattern("mm/dd/yyyy");  
										// LocalDateTime now = LocalDateTime.now();  
										// System.out.println(dtf.format(now)); 
										
										//SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
										//Date date = new Date();										
										//System.out.println(formatter.format(date)); 
										
										
										int count=0;
										int flag=6;
										for(int x=1; x<=no_row; x++){
																			
										pre=conn.prepareStatement("insert into staff_exp_info(staff_code,companyname,from_month,from_year,to_month,to_year,experience,exp_details,createdate,createdby)"+
                                                "values(?,?,?,?,?,?,?,?,?,?)");
										
											
											int index=1;
											
											
												float  exp=Float.parseFloat(a[flag]);												
												 total_exp+=exp;
												 System.out.println("total_exp="+a[flag]);
												 flag+=8;
												
											
										for(inner_loop=num;inner_loop<(no_cell*x);inner_loop++)
										{
													
											 pre.setString(index,a[inner_loop]);											
											 index++;
											 
												 
											 
											 
										}
										 		pre.setString(9, ldtString);
										 		pre.setString(10,staff_name);
												pre.executeUpdate();
												
												 
												num=inner_loop;
									}	
										
										//System.out.println("total_exp"+total_exp);
						}//end of if	
						
										
	/*************************************** Inserting into Staff *************************************** */
	
								
									pre=conn.prepareStatement("insert into staff(staff_code,parent_agent_code,company_code,staff_name,staff_username,staff_password,staff_dob,staff_maritalstatus,staff_gender,staff_addr1,staff_phone,staff_position,staff_dept,staff_country,staff_division,staff_township,staff_ward,staff_street,staff_postal,staff_highedu,staff_authorizationcode,staff_accounttype,staff_salary,staff_currency,staff_otherscert,staff_skills,staff_emergency_contact,staff_emergency_phone,remark,staff_bankname,staff_bankusername,staff_bankcardtype,staff_bankacctno,staff_bankexprdate,createdate,staff_addr2,staff_addr3,staff_addr4,createdby,staff_totalexp)"+                                                              //
									                                                 "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
									
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
									 pre.setString(11,phno);
									 pre.setString(12,posit);
									 pre.setString(13,dept);
									 pre.setString(14,country);
									 pre.setString(15,state);
									 pre.setString(16,township);
									 pre.setString(17,ward);
									 pre.setString(18,street);
									 pre.setString(19,zip);
									 pre.setString(20,edu);
									 pre.setString(21,auth);
									 pre.setString(22,acctype);
									 pre.setString(23,salary);
									 pre.setString(24,currency);
									 pre.setString(25,cert);
									 pre.setString(26,skill);
									 pre.setString(27,e_c);
									 pre.setString(28,e_p);
									 pre.setString(29,remark);
									 pre.setString(30,bname);
									 pre.setString(31,busername);
									 pre.setString(32,bcard);
									 pre.setString(33,ano);
									 pre.setString(34,edate);
									 pre.setString(35,ldtString);
									 pre.setString(36,address2);
									 pre.setString(37,address3);
									 pre.setString(38,address4);
									 pre.setString(39,staff_name);
									 pre.setString(40,String.valueOf(total_exp));
									 
									 
										pre.executeUpdate(); 
									
										
										
			conn.close();
			response.sendRedirect("staffList.jsp"); 
	
		%>
	</body>
</html>