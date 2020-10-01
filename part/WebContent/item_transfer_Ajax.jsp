<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%

		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
	String   c_code="";
	String  a_code="";
	String  decision="no";
		
try{
	 connection=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
		statement=connection.createStatement();
	
									String track_num = request.getParameter("track_num");
									String ccode = request.getParameter("c_code");
									String acode = request.getParameter("a_code");
									System.out.print(ccode);
									System.out.print(acode);
									System.out.print(track_num);
										PreparedStatement pre = connection.prepareStatement("Select company_code,agent_code from registration where track_num=?");
										pre.setString(1, track_num);
							
										ResultSet rs = pre.executeQuery();
										 System.out.println("Ok baby");
									while (rs.next()) {
											
											c_code = rs.getString("company_code");//1
											a_code = rs.getString("agent_code");//2
										
											}							
									System.out.println(c_code);
									System.out.print(a_code);
										if(ccode.equalsIgnoreCase(c_code)  &&  acode.equalsIgnoreCase(a_code) ){
											decision="yes";
										}
																													
							out.println(decision);
								
								connection.close();
								
					} catch (Exception e) {
						e.printStackTrace();
					}
%>