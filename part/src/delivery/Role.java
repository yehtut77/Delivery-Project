package delivery;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

 
@WebServlet("/Role")
public class Role extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public Role() {
        super();
       
    }

	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 
	 
	 
		
		  
	 
		 	String passcode=request.getParameter("passcode");
			String username=request.getParameter("username");
			String password=request.getParameter("password");
			
			
			
			try {
			// Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/delivery", "root", "root");
				 
	 //Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_deliv?useTimezone=true&serverTimezone=UTC","teamrame_zaw","zawmyo");
		Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
		 HttpSession ssss=request.getSession();
		 
		
		 String company_code=null;
		 String company_sql="Select company_code,company_name,company_type from company where nick_name=?";
		 PreparedStatement pre=conn.prepareStatement(company_sql);
		 pre.setString(1, passcode);
		 boolean flag=false;
		 String authorization=null;
		 String staff_code=null;
		 String parent_agent_code=null;
		 String company_name=null;
		 String company_type=null;
		 String staff_name=null;
		
		 ResultSet r= pre.executeQuery();
		 while(r.next())

		 {
			 company_code=r.getString("company_code");
			 company_name=r.getString("company_name");
			 company_type=r.getString("company_type");
		 }
		 String staff_sql="Select staff_code,staff_name,parent_agent_code,company_code,staff_authorizationcode,staff_password from staff where staff_username=? AND company_code=? ";
			pre=conn.prepareStatement(staff_sql);
			pre.setString(1, username);
			pre.setNString(2, company_code);
			ResultSet rs=pre.executeQuery();
			while(rs.next()) {
				if(rs.getString("staff_password").equalsIgnoreCase(password)) {
				
					flag=true;
					authorization=rs.getString("staff_authorizationcode");
					staff_code=rs.getString("staff_code");
					staff_name=rs.getString("staff_name");
					parent_agent_code=rs.getString("parent_agent_code");
					
					break;
				}
			}
			if(flag==true && authorization.equalsIgnoreCase("Admin")) {
				ssss.setAttribute("staffCode", staff_code);
				ssss.setAttribute("parent_agent_code", parent_agent_code);
				ssss.setAttribute("role", authorization);
				ssss.setAttribute("companyCode", company_code);
				ssss.setAttribute("companyName", company_name);
				ssss.setAttribute("staffName", staff_name);
				ssss.setAttribute("companyType", company_type);
				ssss.setAttribute("agentCode", parent_agent_code);
				
				conn.close();
				response.sendRedirect("adminHome.jsp");
			}
			else if(flag==true && authorization.equalsIgnoreCase("Staff")) {
				ssss.setAttribute("staffCode", staff_code);
				ssss.setAttribute("parent_agent_code", parent_agent_code);
				ssss.setAttribute("role", authorization);
				ssss.setAttribute("companyCode", company_code);
				ssss.setAttribute("companyName", company_name);
				ssss.setAttribute("staffName", staff_name);
				ssss.setAttribute("companyType", company_type);
				ssss.setAttribute("agentCode", parent_agent_code);
				conn.close();
				response.sendRedirect("rc");
			}
			else {
				conn.close();
				response.sendRedirect("Login.jsp");
			}
			
			
			  
			   
				
			
				 
		  
		   
		       
		       
			 conn.close();
			} catch (SQLException e) {
	 
				e.printStackTrace();
			}
				
			
	}

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 
		doGet(request, response);
	}

}
