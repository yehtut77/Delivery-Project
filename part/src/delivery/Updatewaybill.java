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


@WebServlet(name = "Updatewaybill", urlPatterns = {"/Updatewaybill"})
@MultipartConfig(maxFileSize = 169999999)   // upload file's size up to 16MB
public class Updatewaybill extends HttpServlet 
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
String	p_code=(String)ssss.getAttribute("p_code");
String updateby=request.getParameter("updateby");
String modifydate=request.getParameter("modifydate" );

String pay_code=request.getParameter("payment_code");
String pay_desc=request.getParameter("payment_description");
String valid=request.getParameter("payment_validcode");
String pay_com=request.getParameter("payment_companycode");





//Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/delivery1","root","root");
//Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_pkyoedb","teamrame_pkyoe","arkar");
Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");


PreparedStatement  pre=null;

pre=conn.prepareStatement("Update paymentmode set payment_code=?,payment_description=?,valid_code=?,updatedby=?,modifydate=? where payment_code="+p_code);                            

pre.setString(1,pay_code);
pre.setString(2,pay_desc);
pre.setString(3,valid);

pre.setString(4,updateby);
pre.setString(5,modifydate);
pre.executeUpdate();




conn.close();

response.sendRedirect("waybillList.jsp"); 

}
catch(Exception e)
{
out.println(e);
}   
}
}