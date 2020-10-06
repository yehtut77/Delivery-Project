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

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.Barcode128;
import com.itextpdf.text.pdf.ColumnText;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
/**
 * Servlet implementation class wb_pdf
 */
@WebServlet("/wb_pdf")
public class wb_pdf extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public wb_pdf() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		Connection conn;
		try {
			conn = DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
			/* String tracking_num=request.getAttribute("tracking_num").toString();
			String ccode=request.getAttribute("company_code").toString(); */
			 String tracking_num=request.getParameter("tracking_num");
			String ccode=request.getParameter("company_code");
			String receiver_name=null;
			String receiver_addr1=null;
			String receiver_addr2=null;
			String receiver_addr3=null;
			String receiver_addr4=null;
			String r_location=null;
			String receiver_phone=null;
			String product_amt=null;
			int deli_charges=0;
			int transport_charges=0;
			String total=null;
			String agent_code=null;
			String receiver_postal=null;
			String item_description=null;
			String size=null;
			String weight=null;
			String uom=null;
			String way_bill=null;
			String sender_code=null;
			String cust_code1=null;
			String cust_code2=null;

			String sender_name=null;
			String sender_phone=null;
			String sender_postal=null;
			String sender_state=null;
			String sender_township=null; 

			PreparedStatement pre=conn.prepareStatement("Select agent_code,sender_code,rcvr_name,rcvr_addr1,rcvr_addr2,rcvr_addr3,rcvr_addr4,rcvr_state,rcvr_township,rcvr_ward,rcvr_street,rcvr_postal,rcvr_phone,payment_code,rcvd_code,weight,size,deli_charges,trans_charges,product_amt,total_amt,item_desc from registration where track_num=? AND stat=? AND company_code=?");
			pre.setString(1, tracking_num);
			pre.setString(2, "P");
			pre.setString(3, ccode);
			ResultSet rs=pre.executeQuery();
			if(rs.next()){
				sender_code=rs.getString("sender_code");
				cust_code1=sender_code.substring(0,8);
				cust_code2=sender_code.substring(sender_code.length() - 1);
				receiver_name=rs.getString("rcvr_name");
				receiver_addr1=rs.getString("rcvr_addr1");
				receiver_addr2=rs.getString("rcvr_addr2");
				receiver_addr3=rs.getString("rcvr_addr3");
				receiver_addr4=rs.getString("rcvr_addr4");
				r_location=rs.getString("rcvr_state")+" "+rs.getString("rcvr_township");
				receiver_phone=rs.getString("rcvr_phone");
				product_amt=rs.getString("product_amt");
				deli_charges=rs.getInt("deli_charges");
				transport_charges=rs.getInt("trans_charges");
				total=rs.getString("total_amt");
				agent_code=rs.getString("agent_code");
				receiver_postal=rs.getString("rcvr_postal");
				item_description=rs.getString("item_desc");
				size=rs.getString("size");
				weight=rs.getString("weight");
				way_bill=rs.getString("payment_code");
				
				
			}
			pre=conn.prepareStatement("Select u_m from uom where isvalid_um=?");
			pre.setString(1, "1");
			ResultSet rs1=pre.executeQuery();
			if(rs1.next()){
				uom=rs1.getString("u_m");
			}
			pre=conn.prepareStatement("Select payment_description from paymentmode where payment_code=? AND company_code=?");
			pre.setString(1, way_bill);
			pre.setString(2, ccode);
			ResultSet rs2=pre.executeQuery();
			if(rs2.next()){
				way_bill=rs2.getString("payment_description");
			}


			pre=conn.prepareStatement("Select cust_name,cust_phone,cust_state,cust_township,cust_postal from credit_cust where company_code=? AND cust_code1=? AND cust_code2=?");
			pre.setString(1, ccode);
			pre.setString(2, cust_code1);
			pre.setString(3, cust_code2);
			ResultSet rs3=pre.executeQuery();
			while(rs3.next()){
				sender_name=rs3.getString("cust_name");
				sender_phone=rs3.getString("cust_phone");
				sender_state=rs3.getString("cust_state");
				sender_township=rs3.getString("cust_township");
				sender_postal=rs3.getString("cust_postal");
						
			} 
			response.setContentType("application/pdf");
			 Document document = new Document(); 
			  try {
				 
					
			        String FILE_NAME = "C:\\Users\\Admin\\Desktop\\pdf\\test.pdf";
			        PdfWriter writer = PdfWriter.getInstance(document, response.getOutputStream());
			         document.open();
			         document.add(new Paragraph("A Hello World PDF document."));
			         for(int i=0;i<70;i++) {
			        	 document.add(new Paragraph("A Hello World PDF document."));
			         }
			         document.close();
			         writer.close();
					
			} catch (DocumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			/*
			 * Document document = new Document(); try { PdfWriter
			 * pdf=PdfWriter.getInstance(document, response.getOutputStream());
			 * 
			 * document.open(); Rectangle rect1= new Rectangle(577,503,18,15); // you can
			 * resize rectangle rect1.enableBorderSide(1); rect1.enableBorderSide(2);
			 * rect1.enableBorderSide(4); rect1.enableBorderSide(8);
			 * rect1.setBorderColor(BaseColor.BLACK); rect1.setBorderWidth(1);
			 * document.add(rect1);
			 * 
			 * 
			 * Font ff = new Font(); Rectangle rect = new Rectangle(577, 830, 18, 15); //
			 * you canresize rectangle rect.enableBorderSide(1); rect.enableBorderSide(2);
			 * rect.enableBorderSide(4); rect.enableBorderSide(8);
			 * rect.setBorderColor(BaseColor.BLACK); rect.setBorderWidth(1); Font
			 * without_bold = new Font(Font.FontFamily.TIMES_ROMAN, 18); Font f = new
			 * Font(Font.FontFamily.TIMES_ROMAN, 18, Font.BOLD); Font for_agent=new
			 * Font(Font.FontFamily.TIMES_ROMAN, 16, Font.BOLD); Font address=new
			 * Font(Font.FontFamily.TIMES_ROMAN, 15, Font.BOLD); Font small = new
			 * Font(Font.FontFamily.TIMES_ROMAN, 11, Font.BOLD); Font fo = new
			 * Font(Font.FontFamily.TIMES_ROMAN, 20, Font.BOLD); Font fo1 = new
			 * Font(Font.FontFamily.TIMES_ROMAN, 25, Font.BOLD); Font big = new
			 * Font(Font.FontFamily.TIMES_ROMAN, 35, Font.BOLD); document.add(rect); float[]
			 * colsWidth1 = { 1f, 1f, 1f, 1f, 1f }; PdfPTable table = new
			 * PdfPTable(colsWidth1);
			 * 
			 * float[] colsWidth_main = {1f, 1f, 1f}; // Code 1 String s="Thiri"; String
			 * 
			 * String addr1 = receiver_addr1; String addr2 = receiver_addr2; String addr3 =
			 * receiver_addr3;
			 * 
			 * String addr4 = receiver_addr4; String phone =r_location+", "+receiver_phone;
			 * 
			 * String product_amt1 = "Product Amt: " + product_amt; int
			 * plus=deli_charges+transport_charges; String deli_charges1 = "Delivery Chgs: "
			 * + plus; String total_amt = "Total Amt:\t" + total;
			 * 
			 * String township = sender_township + "("+sender_postal+")"; String state =
			 * sender_state+"\t"; String sender = "From:\t\t\t" + sender_name;
			 * 
			 * 
			 * 
			 * LocalDateTime da = LocalDateTime.now(); DateTimeFormatter FOMATTER1 =
			 * DateTimeFormatter.ofPattern("d MMMM yyyy"); //SimpleDateFormat DateFor = new
			 * SimpleDateFormat("d MMMM yyyy");
			 * 
			 * String date = FOMATTER1.format(da); String size1 = "S:\t" + size + "sqft";
			 * 
			 * String weight1 = "W:\t" +weight+ uom; Paragraph p_agent=null; String
			 * add=addr3+addr4; Paragraph p4=null; if(agent_code.equalsIgnoreCase("9000")) {
			 * 
			 * p_agent = new Paragraph(agent_code, for_agent); } else { p_agent = new
			 * Paragraph(agent_code, fo1); }
			 * 
			 * Paragraph pp = new Paragraph("To:\t\t" + receiver_name, fo1); Paragraph p1 =
			 * new Paragraph(tracking_num, fo); Paragraph p2; Paragraph p3; Paragraph p_up;
			 * if(addr1.length()>=40) { p2 = new Paragraph(addr1, address); p3 = new
			 * Paragraph(addr2, address); p4 = new Paragraph(addr3 + " " + addr4, address);
			 * p_up = new Paragraph(phone, address); } else { p2 = new Paragraph(addr1, f);
			 * p3 = new Paragraph(addr2, f); p4 = new Paragraph(addr3 + " " + addr4, f);
			 * p_up = new Paragraph(phone, f); } if(addr2.length()>=40) { p2 = new
			 * Paragraph(addr1, address); p3 = new Paragraph(addr2, address); p4 = new
			 * Paragraph(addr3 + " " + addr4, address); p_up = new Paragraph(phone,
			 * address); } else { p2 = new Paragraph(addr1, f); p3 = new Paragraph(addr2,
			 * f); p4 = new Paragraph(addr3 + " " + addr4, f); p_up = new Paragraph(phone,
			 * f); }
			 * 
			 * 
			 * 
			 * if(add.length()>=40) { p2 = new Paragraph(addr1, address); p3 = new
			 * Paragraph(addr2, address); p4 = new Paragraph(addr3 + " " + addr4, address);
			 * p_up = new Paragraph(phone, address); } else {
			 * 
			 * p2 = new Paragraph(addr1, f); p3 = new Paragraph(addr2, f); p4 = new
			 * Paragraph(addr3 + " " + addr4, f); p_up = new Paragraph(phone, f); }
			 * Paragraph p_phone ; if(phone.length()>=40) { p2 = new Paragraph(addr1,
			 * address); p3 = new Paragraph(addr2, address); p4 = new Paragraph(addr3 + " "
			 * + addr4, address); p_up = new Paragraph(phone, address); p_phone = new
			 * Paragraph(phone, address); } else { p2 = new Paragraph(addr1, f); p3 = new
			 * Paragraph(addr2, f); p4 = new Paragraph(addr3 + " " + addr4, f); p_up = new
			 * Paragraph(phone, f); p_phone = new Paragraph(phone, f); }
			 * 
			 * 
			 * Paragraph p5 = new Paragraph(addr4, f); Paragraph p6 = new
			 * Paragraph(product_amt1, f); Paragraph p7 = new Paragraph(deli_charges1, f);
			 * Paragraph p8 = new Paragraph(total_amt, f);
			 * 
			 * Paragraph p_sender = new Paragraph(sender, f);
			 * 
			 * Paragraph p_state = new Paragraph(state + township, f);
			 * 
			 * Paragraph re = new Paragraph(receiver_phone, f); Paragraph recevier_postal1 =
			 * new Paragraph(receiver_postal.substring(0,4), big); Paragraph wb = new
			 * Paragraph(way_bill, for_agent); Paragraph d = new Paragraph(date, for_agent);
			 * Paragraph si = new Paragraph( weight1 + "\t\t\t\t" + size1, f); Paragraph
			 * desc = new Paragraph(item_description, small);
			 * 
			 * 
			 * 
			 * 
			 * 
			 * 
			 * table = new PdfPTable(colsWidth_main); table.getDefaultCell().setBorder(0);
			 * table.setWidthPercentage(105); // Code 2
			 * table.setHorizontalAlignment(Element.ALIGN_CENTER);// Code 3 PdfPCell
			 * receiver_cell = new PdfPCell(pp); receiver_cell.setBorder(0);
			 * receiver_cell.setColspan(2); table.addCell(receiver_cell);
			 * 
			 * table.addCell(p1); table.addCell(" "); table.addCell(" ");
			 * table.addCell(" "); table.addCell(" "); table.addCell(" ");
			 * table.addCell(" "); PdfPCell cd = new PdfPCell(p2); cd.setBorder(0);
			 * cd.setColspan(2); table.addCell(cd);
			 * 
			 * table.addCell(new Phrase("Product Amt:"+product_amt, without_bold)); PdfPCell
			 * ccol = new PdfPCell(p3); ccol.setColspan(2); ccol.setBorder(0);
			 * table.addCell(ccol);
			 * 
			 * table.addCell(new Phrase("Delivery Chgs:"+plus, without_bold)); PdfPCell cco
			 * = new PdfPCell(p4); cco.setColspan(2); cco.setBorder(0); table.addCell(cco);
			 * 
			 * table.addCell(new Phrase("Total Amt:"+total, without_bold)); PdfPCell u = new
			 * PdfPCell(p_up); u.setColspan(2); u.setBorder(0); table.addCell(u);
			 * 
			 * PdfPCell c = new PdfPCell(new Phrase("Managed By:", small)); c.setColspan(3);
			 * c.setHorizontalAlignment(Element.ALIGN_CENTER);
			 * c.setVerticalAlignment(Element.ALIGN_CENTER); PdfPCell c1 = new PdfPCell( new
			 * Phrase("Partner Pacific Group Co., Ltd\n MK Express Delivery\n 09753 000 509"
			 * , small)); c1.setColspan(3); c1.setHorizontalAlignment(Element.ALIGN_CENTER);
			 * PdfPTable table1 = new PdfPTable(colsWidth_main);
			 * table1.setWidthPercentage(100); // Code 2
			 * table1.setHorizontalAlignment(Element.ALIGN_MIDDLE);// Code 3
			 * table1.addCell(c); table1.addCell(c1);
			 * 
			 * 
			 * 
			 * table.addCell(table1); table.addCell(" "); table.addCell(" ");
			 * table.addCell(" "); table.addCell(p_sender); table.addCell(" "); PdfPCell
			 * phrs = new PdfPCell(new Phrase("Customer/Agent Code"));
			 * phrs.setHorizontalAlignment(Element.ALIGN_CENTER); phrs.setBorder(0);
			 * table.addCell(phrs); PdfPCell cc = new PdfPCell(p_state); cc.setColspan(2);
			 * cc.setBorder(0); table.addCell(cc); PdfPCell agent_cell = new
			 * PdfPCell(p_agent); agent_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			 * agent_cell.setBorder(0); table.addCell(agent_cell); PdfPCell cl = new
			 * PdfPCell(new Phrase(sender_phone,f));
			 * cl.setVerticalAlignment(Element.ALIGN_CENTER); cl.setBorder(0);
			 * table.addCell(cl); table.addCell(" "); table.addCell(" ");
			 * 
			 * table.addCell(" "); table.addCell(" "); table.addCell(" ");
			 * 
			 * table.addCell(" "); table.addCell(" "); table.addCell(" ");
			 * 
			 * table.addCell(" "); table.addCell(" "); table.addCell(" ");
			 * 
			 * 
			 * PdfPCell ss = new PdfPCell(si); ss.setBorder(0); ss.setColspan(2);
			 * 
			 * Barcode128 b = new Barcode128(); b.setCode(tracking_num);
			 * b.setBarHeight(50f); // great! but what about width??? b.setX(1.2f); PdfPCell
			 * c3 = new PdfPCell(b.createImageWithBarcode(pdf.getDirectContent(), null,
			 * null)); c3.setColspan(2);
			 * 
			 * c3.setBorder(0); table.addCell(recevier_postal1); table.addCell("");
			 * table.addCell(c3);
			 * 
			 * table.addCell(receiver_cell);
			 * 
			 * 
			 * table.addCell(p1);
			 * 
			 * table.addCell(cd);
			 * 
			 * PdfPCell c4 = new PdfPCell(d);
			 * 
			 * c4.setBorder(0);
			 * 
			 * table.addCell(wb); table.addCell(ccol);
			 * 
			 * 
			 * table.addCell(c4);
			 * 
			 * PdfPCell c5 = new PdfPCell(new Phrase(" "));
			 * c5.setHorizontalAlignment(Element.ALIGN_LEFT); c5.setColspan(1);
			 * c5.setBorder(0); table.addCell(cco); table.addCell(new Phrase(weight1,f));
			 * PdfPCell ppp= new PdfPCell(p_phone); ppp.setColspan(2); ppp.setBorder(0);
			 * 
			 * table.addCell(ppp); table.addCell(new Phrase(size1,f)); PdfPCell i = new
			 * PdfPCell(new Phrase("\tItem Description:")); i.setBorder(0);
			 * i.setVerticalAlignment(Element.ALIGN_BOTTOM); table.addCell("");
			 * table.addCell("");
			 * 
			 * table.addCell(" ");
			 * 
			 * table.addCell(""); table.addCell("");
			 * 
			 * table.addCell(" ");
			 * 
			 * table.addCell(""); table.addCell("");
			 * 
			 * table.addCell("");
			 * 
			 * 
			 * table.addCell(p6); table.addCell(""); table.addCell(i);
			 * 
			 * table.addCell(p7); table.addCell(" "); table.addCell(desc);
			 * 
			 * table.addCell(p8); table.addCell(" "); table.addCell(" ");
			 * 
			 * 
			 * 
			 * table.addCell(" "); table.addCell(" "); table.addCell(" ");
			 * 
			 * table.addCell(p_sender); table.addCell(" "); table.addCell(" "); PdfPCell ii
			 * = new PdfPCell(p_state); ii.setColspan(2); ii.setBorder(0);
			 * table.addCell(ii); table.addCell("");
			 * 
			 * c5.setRotation(90); PdfPCell c6 = new PdfPCell(); c6.addElement(new
			 * Phrase(receiver_postal.substring(0,4), fo1)); c6.addElement(new
			 * Phrase("Customer/\nAgent Code")); c6.addElement(p_agent);
			 * c6.setVerticalAlignment(Element.ALIGN_CENTER);
			 * c6.setHorizontalAlignment(Element.ALIGN_CENTER);
			 * 
			 * c6.setBorder(0); c6.setRotation(-90); table.addCell(cl); table.addCell(" ");
			 * table.addCell(c6);
			 * 
			 * PdfContentByte cb = pdf.getDirectContent(); ColumnText.showTextAligned(cb,
			 * Element.ALIGN_RIGHT, new Phrase("MK Express Delivery", fo), 550, 200, -90);
			 * cb.setLineWidth(2.0f); // Make a bit thicker than 1.0 default
			 * cb.setGrayStroke(0f); // 1 = black, 0 = white
			 * 
			 * 
			 * 
			 * 
			 * float r = 72f * 5 + 20;// horizontal bottom line(rectangle) float r1=200f;
			 * cb.moveTo(r, r1); cb.lineTo(r + 72f * 2, r1);
			 * 
			 * float n = 72f * 5 + 20;// vertical line(left) float m=280; cb.moveTo(n,m);
			 * cb.lineTo(n, 200);
			 * 
			 * float j = 72f * 7 + 20;// vertical line(right) float k=280; cb.moveTo(j,k);
			 * cb.lineTo(j, 200);
			 * 
			 * float q = 72f * 5 + 20;// horizontal line(upward) float w=280;
			 * cb.moveTo(q,w); cb.lineTo(q + 72f * 2, w);
			 * 
			 * float a = 17f; float z = 200f; cb.moveTo(a, z);// two horizontal line
			 * cb.lineTo(a + 72f*5, z);
			 * 
			 * float x = 17f; float y = 280f; cb.moveTo(x,y); cb.lineTo(x + 72f * 5, y);
			 * cb.stroke();
			 * 
			 * table.addCell(" "); table.addCell(" "); table.addCell("");
			 * document.add(table);
			 * 
			 * response.getOutputStream().flush(); response.getOutputStream().close();
			 * 
			 * // document.add(Image.getInstance("C:\\Users\ \Casper\\Pictures\\SVT1.jpg"));
			 * pdf.close(); document.close();
			 * 
			 * 
			 * } catch (Exception e) { e.printStackTrace(); }
			 */
			
		
		
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
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
