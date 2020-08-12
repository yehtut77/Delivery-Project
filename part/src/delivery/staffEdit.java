package  delivery;
import java.sql.*;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet(name = "insertAgent", urlPatterns = {"/insertAgent"})
@MultipartConfig(maxFileSize = 169999999)   // upload file's size up to 16MB
public class staffEdit extends HttpServlet 
{ 
private static final long serialVersionUID = 1L;
PrintWriter out;
InputStream inputStream = null; 
int allField = 0;
@Override
protected void doPost(HttpServletRequest request, HttpServletResponse      response)
throws ServletException, IOException {
response.setContentType("text/html;charset=UTF-8");

	out = response.getWriter();
	
	DateTimeFormatter FOMATTER = DateTimeFormatter.ofPattern("MM/dd/yyyy 'at' hh:mm a");
	//Local date time instance
	LocalDateTime localDateTime = LocalDateTime.now(); 
	//Get formatted String
	String ldtString = FOMATTER.format(localDateTime);
	
	HttpSession ssss=request.getSession(false); 
	String companyCode=(String)ssss.getAttribute("companyCode");
	String staffName=(String)ssss.getAttribute("staffName");
	String agentCode=(String)ssss.getAttribute("agentCode");
	
	String staff_code=request.getParameter("s_code");
	String agent_code=request.getParameter("agent_code");
	String company_code=request.getParameter("company_code");
	System.out.println("company_code="+company_code);
	String staff_dob=request.getParameter("staff_dob");
	String staff_name=request.getParameter("name");
	String staff_username=request.getParameter("username");
	String staff_dept=request.getParameter("dept");
	String staff_posit=request.getParameter("position");
	String staff_password=request.getParameter("staff_password");
	String staff_marital=request.getParameter("marital");
	String staff_gender=request.getParameter("gender");
	String staff_phno=request.getParameter("phno");
	String staff_address1=request.getParameter("address1");
	String staff_address2=request.getParameter("address2");
	if(staff_address2==null)staff_address2=" ";
	String staff_address3=request.getParameter("address3");
	if(staff_address3==null)staff_address3=" ";
	String staff_address4=request.getParameter("address3");
	if(staff_address4==null)staff_address4=" ";
	String staff_country=request.getParameter("country");
	String staff_state=request.getParameter("select1");
	String staff_township=request.getParameter("select2");
	String staff_ward=request.getParameter("select3");
	String staff_street=request.getParameter("select4");
	String staff_postalcode=request.getParameter("s_pcode");
	String staff_edu=request.getParameter("edu");
	String staff_auth=request.getParameter("auth");
	String staff_acctype=request.getParameter("acctype");
	String staff_salary=request.getParameter("salary");
	String staff_currency=request.getParameter("currency");
	String staff_cert=request.getParameter("cert");
	if(staff_cert==null)staff_cert="";
	String staff_skill=request.getParameter("skill");
	if(staff_skill==null)staff_skill="";
	String staff_e_c=request.getParameter("e_c");
	String staff_e_p=request.getParameter("e_p");
	String staff_bname=request.getParameter("bname");
	String staff_ano=request.getParameter("ano");
	String staff_bcard=request.getParameter("bcard");
	String staff_busername=request.getParameter("busername");
	String staff_emonth=request.getParameter("emonth");
	String staff_year=request.getParameter("eyear");
	String staff_bankexprdate=staff_emonth+"/"+staff_year;
	
	
	
try 
{

		
		//Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/delivery","root","root");
		Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");

		
			
	
/************************************Update staff_exp_info ******************************************************************************************/	
	
	String arr1=request.getParameter("records");
	
	String[] a = arr1.split(",");
	
	int length=a.length;
	System.out.println("Record ="+arr1);
	PreparedStatement pre_staff_exp=null;
	int total_exp=0;
	int f_index=6;
if(a.length>0)
{
	

	/***** Delete from staff_exp_info ********/
	String query = "select count(*) from staff_exp_info WHERE staff_code="+staff_code;   
    Statement stmt=conn.createStatement();
    ResultSet rs = stmt.executeQuery(query);
    rs.next();
	    int c = rs.getInt(1);
	    //System.out.println("Row count="+c);
	    for(int ii=0;ii<c;ii++)
	    {
	    	Statement stmt1=conn.createStatement();	
			String sql = "DELETE FROM staff_exp_info WHERE staff_code="+staff_code;		
	      	stmt1.executeUpdate(sql);
	      	System.out.println("Delted");
	    }
	
	
			int no_row=(length/8);
			int inner_loop=0;
			int i=1;
			int no_cell=8;
			int num=0;
			 DateTimeFormatter dtf = DateTimeFormatter.ofPattern("mm/dd/yyyy");  
			 LocalDateTime now = LocalDateTime.now();  
			 System.out.println(dtf.format(now)); 
			
			for(int x=1; x<=no_row; x++){
			  										
				pre_staff_exp=conn.prepareStatement("insert into staff_exp_info(staff_code,company_name,from_month,from_year,to_month,to_year,experience,exp_details,modifydate,agent_code,company_code,updatedby)"+
		            "values(?,?,?,?,?,?,?,?,?,?,?,?)");
			
				
				int index=1;
				
			for(inner_loop=num;inner_loop<(no_cell*x);inner_loop++)
			{
				if(index==1)pre_staff_exp.setString(index,staff_code);		
				else pre_staff_exp.setString(index,a[inner_loop]);
				
				 index++;
				 
				 
			}
			pre_staff_exp.setString(9, dtf.format(now));
			pre_staff_exp.setString(10, agent_code);
			pre_staff_exp.setString(11, company_code);
			pre_staff_exp.setString(12,staffName );
			pre_staff_exp.executeUpdate();
			total_exp=total_exp+Integer.valueOf(a[f_index]);		
			f_index=f_index+8;		 
			num=inner_loop;
			}		
}//end of if		
	
	
					
/****************************************************End of Updating staff_exp_info****************************************/


/****************************************************End of storing into staff_exp_info****************************************/

PreparedStatement  pre_staffAdd=conn.prepareStatement("Update staff  set staff_code=?,agent_code=?,company_code=?,staff_dob=?,staff_name=?,staff_username=?,staff_dept=?,staff_position=?,staff_password=?,staff_maritalstatus=?,"
					  +"staff_gender=?,staff_phone=?,staff_addr1=?,staff_addr2=?,staff_addr3=?,staff_addr4=?,staff_country=?,staff_division=?,staff_township=?,staff_ward=?,staff_street=?,staff_postal=?,"
					  +"staff_highedu=?,staff_authorizationcode=?,staff_accounttype=?,staff_salary=?,staff_currency=?,staff_otherscert=?,staff_skills=?,staff_emergency_contact=?,staff_emergency_phone=?,"
					  +"staff_bankname=?,staff_bankusername=?,staff_bankacctno=?,staff_bankcardtype=?,staff_bankexprdate=?,updatedby=?,modifydate=?,parent_agent_code=?,remark=?,staff_totalexp=? where staff_code=?");
					 
				

pre_staffAdd.setString(1,staff_code);
pre_staffAdd.setString(2,agent_code);
pre_staffAdd.setString(3,company_code);
pre_staffAdd.setString(4,staff_dob);
pre_staffAdd.setString(5,staff_name);
pre_staffAdd.setString(6,staff_username);
pre_staffAdd.setString(7,staff_dept);
pre_staffAdd.setString(8,staff_posit);
pre_staffAdd.setString(9,staff_password);
pre_staffAdd.setString(10,staff_marital);
	
	  pre_staffAdd.setString(11,staff_gender);
	  pre_staffAdd.setString(12,staff_phno);
	  pre_staffAdd.setString(13,staff_address1);
	  pre_staffAdd.setString(14,staff_address2);
	  pre_staffAdd.setString(15,staff_address3);
	  pre_staffAdd.setString(16,staff_address4);
	  pre_staffAdd.setString(17,staff_country);
	  pre_staffAdd.setString(18, staff_state);
	  pre_staffAdd.setString(19, staff_township);
	  pre_staffAdd.setString(20, staff_ward); 
	  pre_staffAdd.setString(21, staff_street);
	  pre_staffAdd.setString(22, staff_postalcode); 
	  pre_staffAdd.setString(23, staff_edu); 
	  pre_staffAdd.setString(24,staff_auth);
	  pre_staffAdd.setString(25,staff_acctype); 
	  pre_staffAdd.setString(26, staff_salary); 
	  pre_staffAdd.setString(27,staff_currency);
	  pre_staffAdd.setString(28, staff_cert);
	  pre_staffAdd.setString(29, staff_skill); 
	  pre_staffAdd.setString(30,staff_e_c);
	  pre_staffAdd.setString(31,staff_e_p);
	  pre_staffAdd.setString(32,staff_bname);
	  pre_staffAdd.setString(33,staff_busername);
	  pre_staffAdd.setString(34,staff_ano); 
	  pre_staffAdd.setString(35,staff_bcard);
	  pre_staffAdd.setString(36,staff_bankexprdate);
	  pre_staffAdd.setString(37,staffName);
	  pre_staffAdd.setString(38,ldtString);
	  pre_staffAdd.setString(39,agent_code);
	  pre_staffAdd.setString(40,request.getParameter("remark"));
	  pre_staffAdd.setInt(41,total_exp);
	  pre_staffAdd.setString(42,staff_code);
	 
pre_staffAdd.executeUpdate(); 


conn.close();

} catch(Exception e) { out.println(e); }

	
	response.sendRedirect("LLL"); 	 

	}
}