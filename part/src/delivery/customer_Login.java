package delivery;

import java.io.IOException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

 
@WebServlet("/customer_Login")
public class customer_Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public customer_Login() {
        super();
       
    }

 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 
		
		 	String passcode=request.getParameter("passcode");
			String username=request.getParameter("username");
			String password=request.getParameter("password");
			
		
		String company_code=null;
		 boolean flag=false;
		
		 String staff_code=null;
		 String parent_agent_code=null;
		 String company_name=null;
		 String company_type=null;
		 String staff_name=null;
		
			
			try {
				//Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/delivery1", "root", "root");
				Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
				 HttpSession ssss=request.getSession();
PreparedStatement pre=conn.prepareStatement("Select company_code,company_name,company_type from company where nick_name=?");
pre.setString(1, passcode);
ResultSet r=pre.executeQuery();
while(r.next()) {
	company_code=r.getString("company_code");
	 company_name=r.getString("company_name");
	 company_type=r.getString("company_type");
}
				
		pre=conn.prepareStatement("Select cust_name,cust_code1,cust_code2,password from credit_cust where username=? AND company_code=?");
		pre.setNString(1, username);
		pre.setNString(2, company_code);
		ResultSet r1=pre.executeQuery();
		while(r1.next()) {
			if(r1.getNString("password").equalsIgnoreCase(password)) {
				flag=true;
				staff_code=r1.getString("cust_code1")+r1.getNString("cust_code2");
				staff_name=r1.getNString("cust_name");
				parent_agent_code="9000";
				break;
			}
		}
		if(flag==true) {
			ssss.setAttribute("staffCode", staff_code);
			ssss.setAttribute("parent_agent_code", parent_agent_code);
		
			ssss.setAttribute("companyCode", company_code);
			ssss.setAttribute("companyName", company_name);
			ssss.setAttribute("staffName", staff_name);
			ssss.setAttribute("companyType", company_type);
			ssss.setAttribute("agentCode", parent_agent_code);
			//request.getRequestDispatcher("customer_waybill.jsp").forward(request, response); 
			response.sendRedirect("customer_waybill.jsp");
			conn.close();	
		}
		else {
			response.sendRedirect("customer_Login.jsp");
			conn.close();	
		}
					 
			
			  
			 
		 
			 
			  conn.close();	} 
			catch (SQLException e) {
			 
				e.printStackTrace();
			}
				
			
	}

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 
		doGet(request, response);
	}

}
