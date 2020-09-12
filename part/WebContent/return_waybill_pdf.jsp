<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="java.io.IOException,java.io.InputStream,java.sql.*,java.text.NumberFormat,java.text.SimpleDateFormat,java.time.LocalDateTime,java.time.format.DateTimeFormatter,java.util.Date,java.util.Date,com.itextpdf.text.Document,com.itextpdf.text.Element,com.itextpdf.text.Font,com.itextpdf.text.Paragraph,com.itextpdf.text.Phrase,com.itextpdf.text.Rectangle,com.itextpdf.text.pdf.Barcode128,com.itextpdf.text.pdf.ColumnText,com.itextpdf.text.pdf.PdfContentByte,com.itextpdf.text.pdf.PdfPCell,com.itextpdf.text.pdf.PdfPTable,com.itextpdf.text.pdf.PdfWriter" %>
<%@page import="com.itextpdf.text.BaseColor" %>



   <%
   response.setContentType("application/pdf");
   HttpSession ssss=request.getSession(false);  
	 
	String staff_name=(String)ssss.getAttribute("staffName");
	String ccode=(String)ssss.getAttribute("companyCode");
	String agent_code=(String)ssss.getAttribute("parent_agent_code");
	String staff_code=(String)ssss.getAttribute("staffCode");
 
   
   String companytype=(String)ssss.getAttribute("companyType");
   DateTimeFormatter FOMATTER = DateTimeFormatter.ofPattern("MM/dd/yyyy 'at' hh:mm a");
	 DateTimeFormatter FOMATTER1 = DateTimeFormatter.ofPattern("MM/dd/yy");
	 DateTimeFormatter FOMATTER2 = DateTimeFormatter.ofPattern("d MMMM yyyy");
	//Local date time instance
	LocalDateTime localDateTime = LocalDateTime.now();

	//Get formatted String
	String ldtString = FOMATTER.format(localDateTime);
	String ldtString1=FOMATTER1.format(localDateTime);
	String ldtString2=FOMATTER2.format(localDateTime);
   

														//agent info start
	String agent_name=request.getParameter("agent_name");
	String agent_postal=request.getParameter("agent_postal");
	String agent_phone=request.getParameter("agent_phone");//end
	String agent_township=request.getParameter("agent_township");
	String agent_state=request.getParameter("agent_state");
	
	String receiver_name=request.getParameter("receiver_name");//receiver info start
	String receiver_addr1=request.getParameter("receiver_addr1");
	String receiver_addr2=request.getParameter("receiver_addr2");
	String receiver_addr3=request.getParameter("receiver_addr3");
	String receiver_addr4=request.getParameter("receiver_addr4");
	String receiver_state=request.getParameter("receiver_state");
	String receiver_township=request.getParameter("receiver_township");
	String receiver_ward=request.getParameter("receiver_ward");
	String receiver_street=request.getParameter("receiver_street");
	String receiver_postal=request.getParameter("receiver_postal");
	String receiver_phone=request.getParameter("receiver_phone");//end
	
	
	
	String product_amt="0";//item info
	String deli_charges=request.getParameter("deli_charges");
	String total_amt=request.getParameter("total_amt");
	String weight=request.getParameter("weight");
	String size=request.getParameter("size");
	String prefix="11";
	String tracking_num=request.getParameter("tracking_num");
	
	 String[] arr=ldtString1.split("/");
	
	
	Connection conn = DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
	
	
	String uom=null;
	PreparedStatement p=conn.prepareStatement("Select u_m from uom where isvalid_um=?");
	p.setNString(1, "1");
	ResultSet u=p.executeQuery();
	while(u.next()) {
		uom=u.getNString("u_m");
	}
	
	p.close();
	conn.close();
	
	  Document document = new Document(); try { 
		  PdfWriter pdf=
	  PdfWriter.getInstance(document, response.getOutputStream()); document.open();
	  Rectangle rect1= new Rectangle(577,503,18,15); // you can resize rectangle
	  rect1.enableBorderSide(1); rect1.enableBorderSide(2);
	  rect1.enableBorderSide(4); rect1.enableBorderSide(8);
	  rect1.setBorderColor(BaseColor.BLACK); rect1.setBorderWidth(1);
	  document.add(rect1);
	  
	  
		Font ff = new Font();
		Rectangle rect = new Rectangle(577, 830, 18, 15); // you canresize rectangle
		rect.enableBorderSide(1);
		rect.enableBorderSide(2);
		rect.enableBorderSide(4);
		rect.enableBorderSide(8);
		rect.setBorderColor(BaseColor.BLACK);
		rect.setBorderWidth(1);
		Font without_bold = new Font(Font.FontFamily.TIMES_ROMAN, 18);
		Font f = new Font(Font.FontFamily.TIMES_ROMAN, 18, Font.BOLD);
		Font for_agent=new Font(Font.FontFamily.TIMES_ROMAN, 16, Font.BOLD);
		Font address=new Font(Font.FontFamily.TIMES_ROMAN, 15, Font.BOLD);
		Font small = new Font(Font.FontFamily.TIMES_ROMAN, 11, Font.BOLD);
		Font fo = new Font(Font.FontFamily.TIMES_ROMAN, 20, Font.BOLD);
		Font fo1 = new Font(Font.FontFamily.TIMES_ROMAN, 25, Font.BOLD);
		Font big = new Font(Font.FontFamily.TIMES_ROMAN, 35, Font.BOLD);
		document.add(rect);
		float[] colsWidth1 = { 1f, 1f, 1f, 1f, 1f };
		PdfPTable table = new PdfPTable(colsWidth1);

	  float[] colsWidth_main = {1f, 1f, 1f}; // Code 1 String s="Thiri"; String
		
		String addr1 = receiver_addr1;
		String addr2 = receiver_addr2;
		String addr3 = receiver_addr3;

		String addr4 = receiver_addr4;
		String phone =receiver_state+" "+receiver_township+", "+receiver_phone;
	
		String product_amt1 = "Product Amt: " + product_amt;
		int plus=Integer.parseInt(deli_charges);
		String deli_charges1 = "Delivery Chgs: " + plus;
		 total_amt = "Total Amt:\t" + total_amt;
	  
		String township = agent_township + "("+agent_postal+")";
		String state = agent_state+"\t";
		String sender = "From:\t\t\t" + agent_name;
		
		

Date da = new Date();
SimpleDateFormat DateFor = new SimpleDateFormat("d MMMM yyyy");

		String date1= DateFor.format(da);
		String size1 = "S:\t" + size + "sqft";
		
		String weight1 = "W:\t" +weight+ uom;
		Paragraph p_agent=null;
		String add=addr3+addr4;
		Paragraph p4=null;
	  if(agent_code.equalsIgnoreCase("9000")) {
		  agent_code=staff_code;
		   p_agent = new Paragraph(agent_code, for_agent);
	  }
	  else {
		   p_agent = new Paragraph(agent_code, fo1);
	  }
	  
		Paragraph pp = new Paragraph("To:\t\t" + receiver_name, fo1);
		Paragraph p1 = new Paragraph(tracking_num, fo);
		Paragraph p2;
		Paragraph p3;
		Paragraph p_up;
		if(addr1.length()>=40) {
			p2 = new Paragraph(addr1, address);
			p3 = new Paragraph(addr2, address);
			p4 = new Paragraph(addr3 + " " + addr4, address);
			 p_up = new Paragraph(phone, address);
		}
		else {
			p2 = new Paragraph(addr1, f);
			p3 = new Paragraph(addr2, f);
			p4 = new Paragraph(addr3 + " " + addr4, f);
			 p_up = new Paragraph(phone, f);
		}
		if(addr2.length()>=40) {
			p2 = new Paragraph(addr1, address);
			p3 = new Paragraph(addr2, address);
			p4 = new Paragraph(addr3 + " " + addr4, address);
			 p_up = new Paragraph(phone, address);
		}
		else {
			p2 = new Paragraph(addr1, f);
			p3 = new Paragraph(addr2, f);
			p4 = new Paragraph(addr3 + " " + addr4, f);
			 p_up = new Paragraph(phone, f);
		}
		 
		 
	
		if(add.length()>=40) {
			p2 = new Paragraph(addr1, address);
			p3 = new Paragraph(addr2, address);
			 p4 = new Paragraph(addr3 + " " + addr4, address);
			 p_up = new Paragraph(phone, address);
		}
		else {
			
				p2 = new Paragraph(addr1, f);
				p3 = new Paragraph(addr2, f);
				p4 = new Paragraph(addr3 + " " + addr4, f);
				 p_up = new Paragraph(phone, f);
		}
		Paragraph p_phone ;
		if(phone.length()>=40) {
			p2 = new Paragraph(addr1, address);
			p3 = new Paragraph(addr2, address);
			 p4 = new Paragraph(addr3 + " " + addr4, address);
			 p_up = new Paragraph(phone, address);
			p_phone = new Paragraph(phone, address);
		}
		else {
			p2 = new Paragraph(addr1, f);
			p3 = new Paragraph(addr2, f);
			 p4 = new Paragraph(addr3 + " " + addr4, f);
			 p_up = new Paragraph(phone, f);
			p_phone = new Paragraph(phone, f);
		}
		
		
		Paragraph p5 = new Paragraph(addr4, f);
		Paragraph p6 = new Paragraph(product_amt1, f);
		Paragraph p7 = new Paragraph(deli_charges1, f);
		Paragraph p8 = new Paragraph(total_amt, f);
		
		Paragraph p_sender = new Paragraph(sender, f);

		Paragraph p_state = new Paragraph(state + township, f);
		
		Paragraph re = new Paragraph(receiver_phone, f);
		Paragraph recevier_postal1 = new Paragraph(receiver_postal.substring(0,4), big);
		Paragraph wb = new Paragraph("Rrturn", for_agent);
		Paragraph d = new Paragraph(ldtString2, for_agent);
		Paragraph si = new Paragraph( weight1 + "\t\t\t\t" + size1, f);
		Paragraph desc = new Paragraph(" ", small);
		
	  
	  
	  
	  
	  
		table = new PdfPTable(colsWidth_main);
		table.getDefaultCell().setBorder(0);
		table.setWidthPercentage(105); // Code 2
		table.setHorizontalAlignment(Element.ALIGN_CENTER);// Code 3 
		PdfPCell receiver_cell = new PdfPCell(pp);
		receiver_cell.setBorder(0);
		receiver_cell.setColspan(2);
		table.addCell(receiver_cell);
		
		table.addCell(p1);
		table.addCell(" ");
		table.addCell(" ");
		table.addCell(" ");
		table.addCell(" ");
		table.addCell(" ");
		table.addCell(" ");
		PdfPCell cd = new PdfPCell(p2);
		cd.setBorder(0);
		cd.setColspan(2);
		table.addCell(cd);
		
		table.addCell(new Phrase("Product Amt:"+product_amt, without_bold));
		PdfPCell ccol = new PdfPCell(p3);
		ccol.setColspan(2);
		ccol.setBorder(0);
		table.addCell(ccol);
		
		table.addCell(new Phrase("Delivery Chgs:"+plus, without_bold));
		PdfPCell cco = new PdfPCell(p4);
		cco.setColspan(2);
		cco.setBorder(0);
		table.addCell(cco);
		
		table.addCell(new Phrase(total_amt, without_bold));
		PdfPCell u1 = new PdfPCell(p_up);
		u1.setColspan(2);
		u1.setBorder(0);
		table.addCell(u1);
		
		PdfPCell c = new PdfPCell(new Phrase("Managed By:", small));
		c.setColspan(3);
		c.setHorizontalAlignment(Element.ALIGN_CENTER);
		c.setVerticalAlignment(Element.ALIGN_CENTER);
		PdfPCell c1 = new PdfPCell(
				new Phrase("Partner Pacific Group Co., Ltd\n MK Express Delivery\n 09753 000 509", small));
		c1.setColspan(3);
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		PdfPTable table1 = new PdfPTable(colsWidth_main);
		table1.setWidthPercentage(100); // Code 2
		table1.setHorizontalAlignment(Element.ALIGN_MIDDLE);// Code 3
		table1.addCell(c);
		table1.addCell(c1);
	  
	  
	  
		table.addCell(table1);
		table.addCell(" ");
		table.addCell(" ");
		table.addCell(" ");
		PdfPCell s = new PdfPCell(p_sender);
		s.setBorder(0);
		s.setColspan(2);
		table.addCell(s);
		
		PdfPCell phrs = new PdfPCell(new Phrase("Customer/Agent Code"));
		phrs.setHorizontalAlignment(Element.ALIGN_CENTER);
		phrs.setBorder(0);
		table.addCell(phrs);
		PdfPCell cc = new PdfPCell(p_state);
		cc.setColspan(2);
		cc.setBorder(0);
		table.addCell(cc);
		PdfPCell agent_cell = new PdfPCell(p_agent);
		agent_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		agent_cell.setBorder(0);
		table.addCell(agent_cell);
		PdfPCell cl = new PdfPCell(new Phrase(agent_phone,f));
		cl.setVerticalAlignment(Element.ALIGN_CENTER);
		cl.setBorder(0);
		table.addCell(cl);
		table.addCell(" ");
		table.addCell(" ");

		table.addCell(" ");
		table.addCell(" ");
		table.addCell(" ");

		table.addCell(" ");
		table.addCell(" ");
		table.addCell(" ");

		table.addCell(" ");
		table.addCell(" ");
		table.addCell(" ");
	  
	  
		PdfPCell ss = new PdfPCell(si);
		ss.setBorder(0);
		ss.setColspan(2);
	  
		Barcode128 b = new Barcode128();
		b.setCode(tracking_num);
		b.setBarHeight(50f);
		// great! but what about width??? 
		b.setX(1.2f);
		PdfPCell c3 = new PdfPCell(b.createImageWithBarcode(pdf.getDirectContent(), null, null));
		c3.setColspan(2);

		c3.setBorder(0);
		table.addCell(recevier_postal1);
		table.addCell("");
		table.addCell(c3);

		table.addCell(receiver_cell);
		

		table.addCell(p1);

		table.addCell(cd);
		
		PdfPCell c4 = new PdfPCell(d);
		
		c4.setBorder(0);

		table.addCell(wb);
		table.addCell(ccol);
		

		table.addCell(c4);

		PdfPCell c5 = new PdfPCell(new Phrase(" "));
		c5.setHorizontalAlignment(Element.ALIGN_LEFT);
		c5.setColspan(1);
		c5.setBorder(0);
		table.addCell(cco);
		table.addCell(new Phrase(weight1,f));
		PdfPCell ppp= new PdfPCell(p_phone);
		ppp.setColspan(2);
		ppp.setBorder(0);
		
		table.addCell(ppp);
		table.addCell(new Phrase(size1,f));
		PdfPCell i = new PdfPCell(new Phrase("\tItem Description:"));
		i.setBorder(0);
		i.setVerticalAlignment(Element.ALIGN_BOTTOM);
		table.addCell("");
		table.addCell("");
		
		table.addCell(" ");

		table.addCell("");
		table.addCell("");
		
		table.addCell(" "); 
		
		table.addCell("");
		table.addCell("");
		
		table.addCell("");
		
		
		table.addCell(p6);
		table.addCell("");
		table.addCell(i);

		table.addCell(p7);
		table.addCell(" ");
		table.addCell(desc);

		table.addCell(p8);
		table.addCell(" ");
		table.addCell(" ");

	

		table.addCell(" ");
		table.addCell(" ");
		table.addCell(" ");

		table.addCell(s);
		
		table.addCell(" ");
		PdfPCell ii = new PdfPCell(p_state);
		ii.setColspan(2);
		ii.setBorder(0);
		table.addCell(ii);
		table.addCell("");
		
		c5.setRotation(90);
		PdfPCell c6 = new PdfPCell();
		c6.addElement(new Phrase(receiver_postal.substring(0,4), fo1));
		c6.addElement(new Phrase("Customer/\nAgent Code"));
		c6.addElement(p_agent);
		c6.setVerticalAlignment(Element.ALIGN_CENTER);
		c6.setHorizontalAlignment(Element.ALIGN_CENTER);

		c6.setBorder(0);
		c6.setRotation(-90);
		table.addCell(cl);
		table.addCell(" ");
		table.addCell(c6);

		PdfContentByte cb = pdf.getDirectContent();
		ColumnText.showTextAligned(cb, Element.ALIGN_RIGHT, new Phrase("MK Express Delivery", fo), 550, 200, -90);
		cb.setLineWidth(2.0f); // Make a bit thicker than 1.0 default
		cb.setGrayStroke(0f); // 1 = black, 0 = white 
		

		

		float r = 72f * 5 + 20;// horizontal bottom line(rectangle) 
		float r1=200f;
		cb.moveTo(r, r1);
		cb.lineTo(r + 72f * 2, r1);

		float n = 72f * 5 + 20;// vertical line(left) 
		float m=280; 
		cb.moveTo(n,m);
		cb.lineTo(n, 200);

		float j = 72f * 7 + 20;// vertical line(right) 
		float k=280; 
		cb.moveTo(j,k);
		cb.lineTo(j, 200);

		float q = 72f * 5 + 20;// horizontal line(upward) 
		float w=280; cb.moveTo(q,w);
		cb.lineTo(q + 72f * 2, w);
		
		float a = 17f;
		float z = 200f;
		cb.moveTo(a, z);// two horizontal line 
		cb.lineTo(a + 72f*5, z); 
		
		float x = 17f; 
		float y = 280f;
		cb.moveTo(x,y);
		cb.lineTo(x + 72f * 5, y);
		cb.stroke();

		table.addCell(" ");
		table.addCell(" ");
		table.addCell("");
		document.add(table);

	

		// document.add(Image.getInstance("C:\\Users\ \Casper\\Pictures\\SVT1.jpg"));
		pdf.close();
		document.close();
		response.setContentType("application/pdf");
	} catch (Exception e) {
		e.printStackTrace();
	}
	
		
		
		
		
		
		 %>
	