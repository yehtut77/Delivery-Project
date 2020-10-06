
    <%@ page import="java.time.format.DateTimeFormatter" %>
    <%@ page import="java.time.*" %>
    <%@page import="java.text.DecimalFormat,java.text.NumberFormat,java.time.LocalDateTime,java.text.SimpleDateFormat,java.sql.*,com.itextpdf.text.BaseColor,com.itextpdf.text.Document,com.itextpdf.text.Element,com.itextpdf.text.Font,com.itextpdf.text.Paragraph,com.itextpdf.text.Phrase,com.itextpdf.text.Rectangle,com.itextpdf.text.pdf.Barcode128,com.itextpdf.text.pdf.ColumnText,com.itextpdf.text.pdf.PdfContentByte,com.itextpdf.text.pdf.PdfPCell,com.itextpdf.text.pdf.PdfPTable,com.itextpdf.text.pdf.PdfWriter" %>
<%

//System.out.println(request.getAttribute("tracking_num"));
Connection conn = DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
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
int product_amt=0;
int deli_charges=0;
int transport_charges=0;
int total=0;
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
	product_amt=rs.getInt("product_amt");
	deli_charges=(int)rs.getInt("deli_charges");
	transport_charges=(int)rs.getInt("trans_charges");
	total=rs.getInt("total_amt");
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
	 
		
     
     PdfWriter writer = PdfWriter.getInstance(document, response.getOutputStream());
      document.open();
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
  	Font without_bold = new Font(Font.FontFamily.HELVETICA, 18);
  	Font f = new Font(Font.FontFamily.HELVETICA, 18);
  	Font for_agent=new Font(Font.FontFamily.HELVETICA, 16);
  	Font address=new Font(Font.FontFamily.HELVETICA, 16);
  	Font small = new Font(Font.FontFamily.HELVETICA, 11);
  	Font fo = new Font(Font.FontFamily.HELVETICA, 20);
  	Font fo1 = new Font(Font.FontFamily.HELVETICA, 25);
  	Font big = new Font(Font.FontFamily.HELVETICA, 35);
  	document.add(rect);
  	float[] colsWidth1 = { 1f, 1f, 1f, 1f, 1f };
  	PdfPTable table = new PdfPTable(colsWidth1);

  float[] colsWidth_main = {1f, 1f, 1f}; // Code 1 String s="Thiri"; String
  	
  	String addr1 = receiver_addr1;
  	String addr2 = receiver_addr2;
  	String addr3 = receiver_addr3;

  	String addr4 = receiver_addr4;
  	String phone =r_location;
  	
  	DecimalFormat formatter1 = new DecimalFormat("#,###");
  	String product_amt1 = "Product Amt:        " + formatter1.format(product_amt);
  	int plus=deli_charges+transport_charges;
	NumberFormat formatter = NumberFormat.getCurrencyInstance();
	//String a=formatter.format(plus);
	
  	String deli_charges1 = "Delivery Chgs:     " + formatter1.format(plus);
  	String total_amt = "Total Amt:            " + formatter1.format(total);

  	String township = sender_township + "("+sender_postal+")";
  	String state = sender_state+"\t";
  	String sender = "From:\t\t\t" + sender_name;
  	
  	

  	LocalDateTime da = LocalDateTime.now();
  	DateTimeFormatter FOMATTER1 = DateTimeFormatter.ofPattern("d MMMM yyyy");
  //SimpleDateFormat DateFor = new SimpleDateFormat("d MMMM yyyy");

  	String date = FOMATTER1.format(da);
  	String size1 = "S:\t" + size + "sqin";
  	
  	String weight1 = "W:\t" +weight+ uom;
  	Paragraph p_agent=null;
  	String add=addr3;
  	Paragraph p4=null;
  if(agent_code.equalsIgnoreCase("9000")) {
  	  agent_code=sender_code;
  	   p_agent = new Paragraph(agent_code, small);
  }
  else {
  	   p_agent = new Paragraph(agent_code, address);
  }

  	Paragraph pp = new Paragraph("To:\t\t" + receiver_name, fo1);
  	Paragraph p1 = new Paragraph(tracking_num, fo);
  	Paragraph p2;
  	Paragraph p3;
  	Paragraph p_up;
  	Paragraph p_r;
  	Paragraph d;
  	Paragraph wb;
  	Paragraph p_phone=null ;
  	Paragraph address_4=null;
  	
  	
  	if(addr1.length()>=34) {
  		p2 = new Paragraph(addr1, address);
  		p3 = new Paragraph(addr2, address);
  		p4 = new Paragraph(addr3 , address);
  		 p_up = new Paragraph(phone, address);
  		 p_r=new Paragraph(receiver_phone, address);
  		 d = new Paragraph(date, address);
  		 wb = new Paragraph(way_bill, address);
  		address_4=new Paragraph(addr4, address);
  	}
  	
  	else if(addr2.length()>=34) {
  		p2 = new Paragraph(addr1, address);
  		p3 = new Paragraph(addr2, address);
  		p4 = new Paragraph(addr3 , address);
  		 p_up = new Paragraph(phone, address);
  		p_r=new Paragraph(receiver_phone, address);
  		 d = new Paragraph(date, address);
  		wb = new Paragraph(way_bill, address);
  		address_4=new Paragraph(addr4, address);
  	}
  	
  	 

  	else if(add.length()>=34) {
  		
  		p2 = new Paragraph(addr1, address);
  		p3 = new Paragraph(addr2, address);
  		 p4 = new Paragraph(addr3, address);
  		 p_up = new Paragraph(phone, address);
  		 p_r=new Paragraph(receiver_phone, address);
  		 d = new Paragraph(date, address);
  		 wb = new Paragraph(way_bill, address);
  		address_4=new Paragraph(addr4, address);
  	}
  
  	
  	else if(phone.length()>=34) {
  		p2 = new Paragraph(addr1, address);
  		p3 = new Paragraph(addr2, address);
  		 p4 = new Paragraph(addr3, address);
  		 p_up = new Paragraph(phone, address);
  		 p_r=new Paragraph(receiver_phone, address);
	  		 d = new Paragraph(date, address);
	  		 wb = new Paragraph(way_bill, address);
  		p_phone = new Paragraph(phone, address);
  		address_4=new Paragraph(addr4, address);
  	}
  	else {
  		p2 = new Paragraph(addr1, f);
  		p3 = new Paragraph(addr2, f);
  		 p4 = new Paragraph(addr3 , f);
  		 p_up = new Paragraph(phone, f);
  		 p_r=new Paragraph(receiver_phone, f);
  		 d = new Paragraph(date, f);
  		 wb = new Paragraph(way_bill, f);
  		p_phone = new Paragraph(phone, f);
  		address_4=new Paragraph(addr4, address);
  	}
  	
  	
  	Paragraph p5 = new Paragraph(addr4, f);
  	Paragraph p6 = new Paragraph(product_amt1, f);
  	Paragraph p7 = new Paragraph(deli_charges1, f);
  	Paragraph p8 = new Paragraph(total_amt, f);
  	
  	Paragraph p_sender = new Paragraph(sender, f);

  	Paragraph p_state = new Paragraph(state + township, f);
  	
  	Paragraph re = new Paragraph(receiver_phone, f);
  	Paragraph recevier_postal1 = new Paragraph(receiver_postal.substring(0,4), big);
  	
  
  	Paragraph si = new Paragraph( weight1 + "\t\t\t\t" + size1, f);
  	Paragraph desc = new Paragraph(item_description, small);
  	





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
  	
  	
  	PdfPCell cd = new PdfPCell(p2);
  	cd.setBorder(0);
  	cd.setColspan(2);
  	table.addCell(cd);

  	table.addCell(new Phrase("Prod Amt: "+formatter1.format(product_amt), without_bold));
  	PdfPCell ccol = new PdfPCell(p3);
  	ccol.setColspan(2);
  	ccol.setBorder(0);
  	table.addCell(ccol);
  	
  	table.addCell(new Phrase("Deli Chgs: "+formatter1.format(plus), without_bold));
  	PdfPCell cco = new PdfPCell(p4);
  	cco.setColspan(2);
  	cco.setBorder(0);
  	table.addCell(cco);
	PdfPCell u = new PdfPCell(p_up);
  	u.setColspan(2);
  	u.setBorder(0);
  	
  	table.addCell(new Phrase("Total Amt: "+formatter1.format(total), without_bold));
  	PdfPCell ye = new PdfPCell(address_4);
  	ye.setBorder(0);
  	ye.setColspan(2);
  	table.addCell(ye);
  	table.addCell(" ");
	table.addCell(u);
  	table.addCell("");
  	
  	
  	
  	PdfPCell hi = new PdfPCell(p_r);
  	hi.setBorder(0);
  	hi.setColspan(2);
  	table.addCell(hi);
  	
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
  
  	PdfPCell gg = new PdfPCell(p_sender);
  	gg.setColspan(2);
  	gg.setBorder(0);
  	table.addCell(gg);
  	
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
  	PdfPCell cl = new PdfPCell(new Phrase(sender_phone,f));
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
  	b.setBarHeight(60f);
  	// great! but what about width??? 
  	b.setX(2.3f);
  	PdfPCell c3 = new PdfPCell(b.createImageWithBarcode(writer.getDirectContent(), null, null));
  	c3.setColspan(2);

  	c3.setBorder(0);
  	table.addCell(recevier_postal1);
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
	table.addCell(ye);
	table.addCell(new Phrase(size1,f));
  	PdfPCell ppp= new PdfPCell(p_phone);
  	ppp.setColspan(2);
  	ppp.setBorder(0);
  	
  	table.addCell(u);
  	table.addCell("");
  	PdfPCell i = new PdfPCell(new Phrase("\tItem Description:"));
  	i.setBorder(0);
  	i.setVerticalAlignment(Element.ALIGN_BOTTOM);
  	table.addCell(hi);
  	table.addCell("");
  	
  	table.addCell("");
  	table.addCell("");
  	
  	table.addCell("");

  	table.addCell(" ");
  	table.addCell(" ");
  	
  	table.addCell(" "); 
  	
  	
  	
 
	PdfPCell dog = new PdfPCell(p6);
	dog.setHorizontalAlignment(Element.ALIGN_LEFT);
	dog.setColspan(2);
	dog.setBorder(0);
	
	
	PdfPCell cat = new PdfPCell(p7);
	cat.setHorizontalAlignment(Element.ALIGN_LEFT);
	cat.setColspan(2);
	cat.setBorder(0);
	
	PdfPCell pussy = new PdfPCell(p8);
	pussy.setHorizontalAlignment(Element.ALIGN_LEFT);
	pussy.setColspan(2);
	pussy.setBorder(0);
	
  	table.addCell(dog);
  
  	table.addCell(new Phrase("\tItem Description:"));

  	table.addCell(cat);
  
  	table.addCell(desc);

  	table.addCell(pussy);
  	
  	table.addCell(" ");



  	table.addCell(" ");
  	table.addCell(" ");
  	table.addCell(" ");
	PdfPCell c6 = new PdfPCell();
  	c6.addElement(new Phrase(receiver_postal.substring(0,4), fo1));
  	c6.addElement(new Phrase("Customer/\nAgent Code"));
  	c6.addElement(p_agent);
  	c6.setVerticalAlignment(Element.ALIGN_CENTER);
  	c6.setHorizontalAlignment(Element.ALIGN_CENTER);

  	c6.setBorder(0);
  	c6.setRotation(-90);
  	c6.setRowspan(2);
  	
  	table.addCell(gg);
  	
  	table.addCell(" ");
  	PdfPCell ii = new PdfPCell(p_state);
  	ii.setColspan(2);
  	ii.setBorder(0);
  	table.addCell(ii);
  	table.addCell(c6);
  	
  	c5.setRotation(90);
  
  	
  	
  	table.addCell(cl);
  	table.addCell(" ");
  	table.addCell("");

  	PdfContentByte cb = writer.getDirectContent();
  	ColumnText.showTextAligned(cb, Element.ALIGN_RIGHT, new Phrase("MK Express Delivery", fo), 550, 200, -90);
  	cb.setLineWidth(2.0f); // Make a bit thicker than 1.0 default
  	cb.setGrayStroke(0f); // 1 = black, 0 = white 
  	

  	

  	float r = 72f * 4 + 20;// horizontal bottom line(rectangle) 
  	float r1=160f;
  	cb.moveTo(r, r1);
  	cb.lineTo(r + 75f * 3, r1);

  	float n = 72f * 4 + 20;// vertical line(left) 
  	float m=240; 
  	cb.moveTo(n,m);
  	cb.lineTo(n, 160);

  	float j = 72f * 7 + 30;// vertical line(right) 
  	float k=240; 
  	cb.moveTo(j,k);
  	cb.lineTo(j, 160);

  	float q = 72f * 4 + 20;// horizontal line(upward) 
  	float w=240f; 
  	cb.moveTo(q,w);
  	cb.lineTo(q + 75f * 3, w);
  	
  	float a = 17f;
  	float z = 160f;
  	cb.moveTo(a, z);// two horizontal line 
  	cb.lineTo(a + 72f*4, z); 
  	
  	float x = 17f; 
  	float y = 240f;
  	cb.moveTo(x,y);
  	cb.lineTo(x + 72f * 4, y);
  	cb.stroke();

  	table.addCell(" ");
  	table.addCell(" ");
  	table.addCell("");
  	document.add(table);
      
  
      
      
      
      document.close();
      writer.close();
		
} catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
} 

%>