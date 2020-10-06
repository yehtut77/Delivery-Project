package delivery;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.concurrent.Exchanger;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


/**
 * Servlet implementation class way_bill_pdf
 */
@MultipartConfig(maxFileSize = 169999999)
@WebServlet("/way_bill_pdf")
public class way_bill_pdf extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public way_bill_pdf() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		NumberFormat myFormat = NumberFormat.getInstance();
        myFormat.setGroupingUsed(true); 
		Part file_path=request.getPart("file_path");
		InputStream inputStream=null;
		if (file_path.getSize() != 0) 
		{
			inputStream = file_path.getInputStream();

			
		}
		String company_code=request.getParameter("company_code");
		String staff_code=request.getParameter("staff_code");
		String agent_code=request.getParameter("agent_code");
		String sender_currency = request.getParameter("sender_currency");
		String staff_name=request.getParameter("staff_name");
		
		String sender_name = request.getParameter("sender_name");
		String sender_code = request.getParameter("sender_code");
		String sender_code1=sender_code.substring(0,1);
		String last_index=sender_code.substring(sender_code.length()-1);
		
		String sender_phone = request.getParameter("sender_phone");
		String sender_addr1 = request.getParameter("sender_address1");
		String sender_addr2 = request.getParameter("sender_address2");
		String sender_addr3 = request.getParameter("sender_address3");
		String sender_addr4 = request.getParameter("sender_address4");
		String sender_state=request.getParameter("select1");
		String sender_township=request.getParameter("select2");
		String  sender_ward=request.getParameter("select3");
		String sender_street=request.getParameter("select4");
		String sender_email=request.getParameter("sender_email");
		String last_char=null;
		 DateTimeFormatter FOMATTER = DateTimeFormatter.ofPattern("MM/dd/yyyy 'at' hh:mm a");
		 DateTimeFormatter FOMATTER1 = DateTimeFormatter.ofPattern("MM/dd/yy");
		//Local date time instance
		LocalDateTime localDateTime = LocalDateTime.now();

		//Get formatted String
		String ldtString = FOMATTER.format(localDateTime);
		String ldtString1=FOMATTER1.format(localDateTime);
		System.out.println("company_code="+company_code);
		if(sender_ward==null) {
			sender_ward=" ";
		}
		if(sender_street==null) {
			sender_street=" ";
		}
		if (sender_addr3 == null) {
			sender_addr3 = " ";
		}
		if (sender_addr4 == null) {
			sender_addr4 = " ";
		}
		String sender_country=request.getParameter("sender_country");
	
		String sender_postal = request.getParameter("sender_postal");
		String receiver_name = request.getParameter("receiver_name");
		String receiver_phone = request.getParameter("receiver_phone");
		String receiver_addr1 = request.getParameter("r_addr1");
		String receiver_addr2 = request.getParameter("r_addr2");
		String receiver_addr3 = request.getParameter("r_addr3");
		String receiver_addr4 = request.getParameter("r_addr4");
		String receiver_country = request.getParameter("receiver_country");
		String receiver_state=request.getParameter("select11");
		String receiver_township=request.getParameter("select22");
		String receiver_ward=request.getParameter("select33");
		String receiver_street=request.getParameter("select44");
		String drop_point=request.getParameter("drop_point");
		String r_location=receiver_state+" "+receiver_township;
		
		if(receiver_ward==null) {
			receiver_ward=" ";
		}
		if(receiver_street==null) {
			receiver_street=" ";
		}
		
		
		if (receiver_addr3 == null) {
			receiver_addr3 = " ";

		}
		if (receiver_addr4 == null) {
			receiver_addr4 = null;
		}
		String receiver_currency=request.getParameter("receiver_currency");
		String receiver_postal = request.getParameter("receiver_postal");
		String waybill_type = request.getParameter("waybill_type");
		String receiving_type = request.getParameter("receiving_type");
		
		String item_description = request.getParameter("item_description");
		String planned_deli_date = request.getParameter("planned_deli_date");
		String weight = request.getParameter("weight");
		String size = request.getParameter("size");
		String deli_charges = request.getParameter("deli_charges");
		String transport_charges = request.getParameter("transport_charges");
		String product_amt = request.getParameter("product_amt");
		String exchage_rate = request.getParameter("exchange_rate");
		String total = request.getParameter("total");
		PreparedStatement p=null;
		
		 String prefix=waybill_type;
		 String tracking_num=null;
		 String way_bill =null;
		 String uom=null;
		 try {
			 Connection con;
				response.setContentType("application/pdf");
				 //con=DriverManager.getConnection("jdbc:mysql://localhost/delivery1","root","root"); 
					con = DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
					
					PreparedStatement pw=con.prepareStatement("Select u_m from uom where isvalid_um=?");
					pw.setNString(1, "1");
					ResultSet u=pw.executeQuery();
					while(u.next()) {
						uom=u.getNString("u_m");
					}
		 String[] arr=ldtString1.split("/");
		
		 int counter=0;
		 p=con.prepareStatement("Select description from curr_desc where curr_code=?");
			

			p.setString(1, sender_currency);
			ResultSet r1=p.executeQuery();
			while(r1.next()) {
				sender_currency=r1.getString("description");
				
			}
			p=con.prepareStatement("Select type from nextkey where company_code=? AND type=?");
			p.setNString(1, company_code);
			p.setNString(2, "n_cust");
			ResultSet rt=p.executeQuery();
			if(rt.next()==false) {
				p=con.prepareStatement("Insert into nextkey(company_code,type,period)values(?,?,?)");
				p.setString(1, company_code);
				p.setNString(2, "n_cust");
				p.setNString(3, "00000");
				p.execute();
			}
			p=con.prepareStatement("Select payment_description from paymentmode where payment_code=? AND company_code=?");
			p.setNString(1, waybill_type);
			p.setString(2, company_code);
			ResultSet rq=p.executeQuery();
			while(rq.next()) {
				way_bill=rq.getNString("payment_description");
			}
			
			PreparedStatement pp=con.prepareStatement("Select * from nextkey where company_code=? AND type=?");
			pp.setString(1, company_code);
			
			pp.setString(2, prefix);
			ResultSet rr=pp.executeQuery();
			if(rr.next()==false){
				PreparedStatement pre1=con.prepareStatement("Insert into nextkey(company_code,period,type,month) values(?,?,?,?)");	
				pre1.setString(1, company_code);
				pre1.setString(2,"00000");
				pre1.setString(3, prefix);
				pre1.setString(4,arr[0]);
				
				pre1.execute();
				
				/* 
				
				
				
				out.println(conso_code);
				pre.close(); */
				
			}
			rr.previous();
			if(rr.next()) {
				System.out.println("Inside if");
				String month=rr.getString("month");
				if(arr[0].equalsIgnoreCase(month))
				{	System.out.println("Inside counter");		
					counter=Integer.parseInt(rr.getString("period"));}
				else {
					PreparedStatement prepare=con.prepareStatement("Update nextkey set month=?,period=? where company_code=? AND type=?");
					prepare.setString(1, arr[0]);
					prepare.setString(2, "00000");
					prepare.setString(3, company_code);
					
					prepare.setString(4, prefix);
					prepare.execute();
				}
				
			}
			counter+=1;

			String date=arr[2]+arr[0];


			String last_num;
			last_num=date+String.format("%05d", counter);
			tracking_num=prefix+agent_code+last_num;
			PreparedStatement p1=con.prepareStatement("Update nextkey set period=? where company_code=? AND type=?");
			p1.setString(1, String.format("%05d", counter));
			p1.setString(2, company_code);
		
			p1.setString(3, prefix);
			p1.execute();			

		
		String rcvr_code=request.getParameter("rcvr_code");
p=con.prepareStatement("Select rcvr_code from rcvr where rcvr_code=?");
p.setString(1, rcvr_code);
ResultSet result=p.executeQuery();
boolean flag=false;

int count=0;
while(result.next()) {
flag=true;	
rcvr_code=result.getString("rcvr_code");
}
if(flag==false) {
	
	p=con.prepareStatement("Select period from nextkey where type=?");

	
	p.setString(1, "rcvr");
	ResultSet re=p.executeQuery();
	while(re.next()) {
		count=Integer.parseInt(re.getString("period"))+1;
		rcvr_code=String.format("%05d", count);
	}
	p=con.prepareStatement("Insert into rcvr(rcvr_code,rcvr_name,rcvr_addr1,rcvr_addr2,rcvr_addr3,rcvr_addr4,rcvr_state,rcvr_township,rcvr_ward,rcvr_street,rcvr_postal,rcvr_country,rcvr_phone,currency,createdby,createdate)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
	p.setString(1, rcvr_code);
	p.setString(2, receiver_name);
	p.setString(3, receiver_addr1);
	p.setString(4, receiver_addr2);
	p.setString(5, receiver_addr3);
	p.setString(6, receiver_addr4);
	p.setString(7, receiver_state);
	p.setString(8, receiver_township);
	p.setString(9, receiver_ward);
	p.setString(10, receiver_street);
	p.setString(11, receiver_postal);
	p.setString(12, receiver_country);
	p.setString(13, receiver_phone);
	p.setString(14, receiver_currency);
	p.setString(15, staff_name);
	p.setString(16, ldtString);
	p.execute();
	p=con.prepareStatement("Update nextkey set period=? where type=?");
	p.setNString(1, rcvr_code);
	p.setNString(2, "rcvr");
	p.execute();
	
}
else if(flag==true) {
	System.out.println("Outside");
	p=con.prepareStatement("Update rcvr set rcvr_name=?,rcvr_addr1=?,rcvr_addr2=?,rcvr_addr3=?,rcvr_addr4=?,rcvr_state=?,rcvr_township=?,rcvr_ward=?,rcvr_street=?,rcvr_postal=?,rcvr_country=?,rcvr_phone=?,currency=?,updatedby=?,modifydate=? where rcvr_code=?");
	p.setString(1, receiver_name);
	p.setString(2, receiver_addr1);
	p.setString(3, receiver_addr2);
	p.setString(4, receiver_addr3);
	p.setString(5, receiver_addr4);
	p.setString(6, receiver_state);
	p.setString(7, receiver_township);
	p.setString(8, receiver_ward);
	p.setString(9, receiver_street);
	p.setString(10, receiver_postal);
	p.setString(11, receiver_country);
	p.setString(12, receiver_phone);
	p.setString(13, receiver_currency);
	p.setString(14, staff_name);
	p.setString(15, ldtString);
	p.setString(16, rcvr_code);
	p.execute();
}
		
		
		
			
			if (sender_code1.equalsIgnoreCase("N") && sender_code.substring(sender_code.length()-1).equalsIgnoreCase("#")) {
				
				 p = con.prepareStatement("Select period from nextkey where type=? AND company_code=?");
				p.setString(1, "n_cust");
				p.setString(2, company_code);
				ResultSet r = p.executeQuery();
				
				int s = 0;
				while (r.next()) {
					s = Integer.parseInt(r.getString("period"));
					s += 1;
					p=con.prepareStatement("Update nextkey set period=? where type=?");
					p.setString(1, String.format("%05d", s));
					p.setString(2, "n_cust");
					p.execute();
					sender_code ="0N-"+String.format("%05d", s);
					last_index =sender_currency.substring(0,1);
				}
				 p=con.prepareStatement("Insert into credit_cust(company_code,cust_name,cust_addr1,cust_addr2,cust_addr3,cust_addr4,cust_state,cust_township,cust_ward,cust_street,cust_postal,cust_country,cust_phone,cust_email,currency,cust_code1,cust_code2,createdby,createdate)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
				p.setString(1, company_code);
				p.setString(2, sender_name);
				p.setString(3, sender_addr1);
				p.setString(4, sender_addr2);
				p.setString(5, sender_addr3);
				p.setString(6, sender_addr4);
				p.setString(7, sender_state);
				p.setString(8, sender_township);
				p.setString(9, sender_ward);
				p.setString(10, sender_street);
				p.setString(11, sender_postal);
				p.setString(12, sender_country);
				p.setString(13, sender_phone);
				p.setString(14, sender_email);
				p.setString(15, sender_currency);
				p.setString(16, sender_code);
				p.setString(17, last_index);
				p.setString(18, staff_code);
				p.setString(19, ldtString);
				p.execute();
			  
			  }
		
			else if(sender_code.substring(1,2).equalsIgnoreCase("N")) {
				
				
				
				PreparedStatement pre=con.prepareStatement("Update credit_cust set company_code=?,cust_name=?,cust_addr1=?,cust_addr2=?,cust_addr3=?,cust_addr4=?,cust_state=?,cust_township=?,cust_ward=?,cust_street=?,cust_postal=?,cust_country=?,cust_phone=?,cust_email=?,currency=?,cust_code1=?,cust_code2=?,updatedby=?,modifydate=? where company_code=? AND cust_code1=? AND cust_code2=?");
					pre.setString(1, company_code);
					pre.setString(2, sender_name);
					pre.setString(3, sender_addr1);
					pre.setString(4, sender_addr2);
					pre.setString(5, sender_addr3);
					pre.setString(6, sender_addr4);
					pre.setString(7, sender_state);
					pre.setString(8, sender_township);
					pre.setString(9, sender_ward);
					pre.setString(10, sender_street);
					pre.setString(11, sender_postal);
					pre.setString(12, sender_country);
					pre.setString(13, sender_phone);
					pre.setString(14, sender_email);
					pre.setString(15, sender_currency);
					pre.setString(16, sender_code.substring(0,8));
					pre.setString(17, last_index);
					pre.setString(18, staff_code);
					pre.setString(19, ldtString);
					pre.setString(20, company_code);
					pre.setString(21, sender_code.substring(0,8));
					pre.setString(22, sender_currency.substring(0,1));
					pre.execute();
					/*
					 * System.out.println(sender_code.substring(0,8)+"/");
					 * System.out.println(sender_currency.substring(0,1)+"/");
					 */
				
			}
			
			p=con.prepareStatement("Insert into registration(company_code,agent_code,staff_code,trans_date,track_num,sender_code,rcvr_name,rcvr_addr1,rcvr_addr2,rcvr_addr3,rcvr_addr4,rcvr_state,rcvr_township,rcvr_ward,rcvr_street,rcvr_postal,rcvr_phone,payment_code,rcvd_code,weight,size,deli_charges,trans_charges,product_amt,cur_charges,total_amt,stat,planned_deli_date,createdby,createdate,item_desc,drop_point_code,picture)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			System.out.println("sender_code"+sender_code);
		p.setString(1, company_code);
		p.setString(2, agent_code);
		p.setString(3, staff_code);
		p.setString(4, ldtString);
		p.setString(5, tracking_num);
		p.setString(6, sender_code.substring(0,8)+sender_currency.substring(0,1));
		p.setString(7, receiver_name);
		p.setString(8, receiver_addr1);
		p.setString(9, receiver_addr2);
		p.setString(10, receiver_addr3);
		p.setString(11, receiver_addr4);
		p.setString(12, receiver_state);
		p.setString(13, receiver_township);
		p.setString(14, receiver_ward);
		p.setString(15, receiver_street);
		p.setString(16, receiver_postal);
		p.setString(17, receiver_phone);
		p.setString(18, waybill_type);
		p.setString(19, receiving_type);
		p.setString(20, weight);
		p.setString(21, size);
		p.setString(22, deli_charges);
		
		p.setString(23, transport_charges);
		p.setString(24, product_amt);
		p.setString(25, exchage_rate);
		p.setString(26, total);
		p.setString(27, "P");
		p.setString(28, planned_deli_date);
		p.setString(29, staff_name);
		p.setString(30, ldtString);
		p.setString(31, item_description);
		p.setString(32, drop_point);
		p.setBlob(33, inputStream);
		p.execute();
		
		p.close();
		con.close();
			
		/*
		 * request.setAttribute("tracking_num",tracking_num);
		 * request.setAttribute("company_code",company_code); RequestDispatcher rd =
		 * request.getRequestDispatcher("p"); rd.forward(request,response);
		 */
		response.sendRedirect("p?tracking_num="+tracking_num+"&company_code="+company_code);
		
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		

		 if(product_amt==null) {
			  product_amt="0";
		  }
		 
		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
