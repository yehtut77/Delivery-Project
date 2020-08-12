package  delivery;
import java.sql.*;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "receiveUpd", urlPatterns = {"/receiveUpd"})
@MultipartConfig(maxFileSize = 169999999)   // upload file's size up to 16MB
public class receiveUpd extends HttpServlet 
{ 
private static final long serialVersionUID = 1L;
PrintWriter out;
InputStream inputStream = null; 
int allField = 0;
@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
response.setContentType("text/html;charset=UTF-8");

try 
{HttpSession ssss=request.getSession(false);
String	r_code=(String)ssss.getAttribute("r_code");
String updateby=request.getParameter("updateby");
String modifydate=request.getParameter("modifydate" );

String rcvd_code=request.getParameter("rcvd_code");
String rcvd_desc=request.getParameter("rcvd_description");
String valid=request.getParameter("rcvd_validcode");


System.out.println(updateby);
System.out.println(modifydate);
System.out.println(rcvd_code);
System.out.println(rcvd_desc);
System.out.println(valid);




//Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/delivery1","root","root");
//Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_pkyoedb","teamrame_pkyoe","arkar");
Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");


PreparedStatement  pre=null;

pre=conn.prepareStatement("Update rcvdmode set rcvd_code=?,rcvd_description=?,valid_code=?,updatedby=?,modifydate=? where rcvd_code="+r_code);                            

pre.setString(1,rcvd_code);
pre.setString(2,rcvd_desc);
pre.setString(3,valid);

pre.setString(4,updateby);
pre.setString(5,modifydate);
pre.executeUpdate();





conn.close();

response.sendRedirect("rcvdList.jsp"); 

}
catch(Exception e)
{
out.println(e);
}   
}
}