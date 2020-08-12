package delivery;

import java.io.IOException;
import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class update_weight
 */
@WebServlet("/update_weight")
public class update_weight extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public update_weight() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn;
		try {
			//conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/delivery1","root","root");
			 //conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_pkyoedb","teamrame_pkyoe","arkar");
			conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
			
			
			
			String s=request.getParameter("sess");
			String id=request.getParameter("id");
			String fstate=request.getParameter("fstate");
			String ftownship=request.getParameter("ftownship");
			String tstate=request.getParameter("tstate");
			String ttownship=request.getParameter("ttownship");
			String fweight=request.getParameter("fweight");
			String tweight=request.getParameter("tweight");
			String max_weight=request.getParameter("max_weight");
			String max_size=request.getParameter("max_size");
			String tcharges=request.getParameter("tcharges");
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MMM-yyyy");
			LocalDateTime now = LocalDateTime.now();

			String date=dtf.format(now);
			String query = "update transportation_charges set from_state_desc= ?,from_township_desc=?,to_state_desc=?,to_township_desc=?,from_weight=?,to_weight=?,max_weight=?,max_size=?,transportation_charges=?,updatedby=?,modifydate=? where id = ?";
		    PreparedStatement pre = conn.prepareStatement(query);
		    pre.setString(1, fstate);
		    pre.setString(2, ftownship);
		    pre.setString(3, tstate);
		    pre.setString(4, ttownship);
		    pre.setString(5, fweight);
		    pre.setString(6, tweight);
		    pre.setString(7, max_weight);
		    pre.setString(8, max_size);
		    pre.setString(9, tcharges);
		    pre.setString(10, s);
		    pre.setString(11, date);
		    pre.setString(12, id);
		    // execute the java preparedstatement
		    pre.executeUpdate();
		    
		    conn.close();
		    response.sendRedirect("weight1.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
