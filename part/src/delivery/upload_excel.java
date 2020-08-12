package delivery;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.itextpdf.text.Font;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.Barcode128;
import com.itextpdf.text.pdf.ColumnText;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.IOException;
import java.io.*;
import java.sql.*;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.Date;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.*;

/**
 * Servlet implementation class upload_excel
 */
@WebServlet("/upload_excel")
@MultipartConfig(maxFileSize = 169999999)
public class upload_excel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public upload_excel() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String company_code=request.getParameter("ccode");
			String staff_code=request.getParameter("staff_code");
			String agent_code=request.getParameter("agent_code");
			Part file_path=request.getPart("file_path");
			String staff_name=request.getParameter("staff_name");

			
			
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/delivery1", "root", "root");
			//Connection conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");

		InputStream file =file_path.getInputStream();
		        
		    XSSFWorkbook workbook = new XSSFWorkbook(file);
		    XSSFSheet sheet = workbook.getSheetAt(0);
		    Iterator<Row> rowIterator = sheet.iterator();
		    Row row;
		    Row ro;
		  
		    String cust_code=null;
		   float weight=0;
		   String receving_type=null;
		   String waybill_type=null;
		   String rcvr_township=null;
		   String rcvr_state=null;
		   String addr4=null;
		   String addr3=null;
		   String addr2=null;
		   String addr1=null;
		   String receiver=null;
		   String r_phone=null;
		   int product_amt=0;
		   int size=0;
		   
		  
		    
		    ro=sheet.getRow(0);
		    if(ro!=null) {
		    	if(ro.getCell(0)!=null) {
		    		cust_code=ro.getCell(1).getStringCellValue();
		    	}
		    	
		    }
		    String cust_code2=cust_code.substring(cust_code.length()-1);
		    String cust_code1=cust_code.substring(0,8);
		    String cust_postal=null;
		    String s_postcode=null;
		    PreparedStatement p2=conn.prepareStatement("Select cust_name,cust_code1,cust_code2,cust_postal,cust_addr1,cust_addr2,cust_addr3,cust_addr4,cust_phone from credit_cust where company_code=? AND cust_code1=? AND cust_code2=?");
		    p2.setString(1, company_code);
		    p2.setString(2, cust_code1);
		    p2.setString(3, cust_code2);
		    String sender_name=null;
		    String sender_phone=null;
		    ResultSet r1=p2.executeQuery();
		    while(r1.next()) {
		    	s_postcode=r1.getString("cust_postal");
		    	sender_name=r1.getString("cust_name");
		    	cust_postal=r1.getString("cust_postal").substring(0,4);
		    	sender_phone=r1.getString("cust_phone");
		    }
		    String cust_postcode1=cust_postal.substring(0,2);
		    String cust_postalcode2=cust_postal.substring(2,4);
		    Integer startFrom = 5; // start from 3rd row change as needed
		    System.out.println(cust_code1);
		    for(int i=startFrom - 1; i<=sheet.getLastRowNum(); i++){
		    	
		        row = sheet.getRow(i);
		if(row!=null) {
					/*
					 * String id = row.getCell(0).getStringCellValue(); String nama =
					 * row.getCell(1).getStringCellValue(); String rm =
					 * row.getCell(2).getStringCellValue(); String nama_ro =
					 * row.getCell(3).getStringCellValue(); String no_pks =
					 * row.getCell(4).getStringCellValue(); String ket =
					 * row.getCell(5).getStringCellValue(); String lob =
					 * row.getCell(6).getStringCellValue();
					 */
		receiver=row.getCell(0).getStringCellValue();
		addr1=row.getCell(1).getStringCellValue();
		addr2=row.getCell(2).getStringCellValue();
		String prefix=null;
		addr3="";
		addr4="";
		rcvr_state=row.getCell(5).getStringCellValue();
		rcvr_township=row.getCell(6).getStringCellValue();
		String r_postcode1=null;
		String r_postcode2=null;
		weight=(float) row.getCell(9).getNumericCellValue();
		size = (int) row.getCell(10).getNumericCellValue();
		String transportation_charges=null;
		String delivery_charges=null;
		String stat="P";
		PreparedStatement p3=conn.prepareStatement("Select state_name,state_code from state where state_name=?");
		p3.setString(1, rcvr_state);
		ResultSet r2=p3.executeQuery();
		if(row.getCell(11)!=null) {
		 product_amt = (int) row.getCell(11).getNumericCellValue();
		}
		else if(row.getCell(11)==null){
		 product_amt=0;
		}
		if(r2.next()) {
		 r_postcode1=r2.getString("state_code");
		}
		PreparedStatement p4=conn.prepareStatement("Select township_name,township_code from township where state_code=? AND township_name=?");
		p4.setString(1, r_postcode1);
		p4.setString(2, rcvr_township);
		ResultSet r3=p4.executeQuery();
		if(r3.next()) {
		 r_postcode2=r3.getString("township_code");
		}
		PreparedStatement p=conn.prepareStatement("Select delivery_charges,transportation_charges,from_weight,to_weight,size from charges where from_state_code=? And from_township_code=? And to_state_code=? And to_township_code=? order by size ASC");
		p.setString(1,cust_postcode1);
		p.setString(2, cust_postalcode2);
		p.setString(3, r_postcode1);
		p.setString(4, r_postcode2);
		ResultSet rr=p.executeQuery();
		while(rr.next()){
			
		if(weight>=rr.getFloat("from_weight") && weight<=rr.getFloat("to_weight")){
				if(size<=rr.getFloat("size")){
				transportation_charges=rr.getString("transportation_charges");
						delivery_charges=rr.getString("delivery_charges");break;
				}
				else if(size>=rr.getFloat("size")){
					rr.next();
					transportation_charges=rr.getString("transportation_charges");
							delivery_charges=rr.getString("delivery_charges");break;
				}
			}  
		}
		System.out.println(transportation_charges+delivery_charges);
		int total=Integer.parseInt(transportation_charges)+Integer.parseInt(delivery_charges)+product_amt;

		waybill_type=row.getCell(7).getStringCellValue();
		String wb1=null;
		if(waybill_type.equalsIgnoreCase("COD")) {
		 prefix="13";
		 wb1="Cash On Delivery";
		 
		}
		else if(waybill_type.equalsIgnoreCase("CTR"))
		{
			wb1="Charge to Receiver";
		 prefix="21";
		 
		}
		else if(waybill_type.equalsIgnoreCase("Prepaid")) {
			wb1="Prepaid";
		 prefix="15";
		}
		receving_type="02";

		String tracking_num=null;
		DateTimeFormatter FOMATTER = DateTimeFormatter.ofPattern("MM/yy");

		//Local date time instance
		LocalDateTime localDateTime = LocalDateTime.now();
		 
		//Get formatted String
		String ldtString = FOMATTER.format(localDateTime);
		String[] arr=ldtString.split("/");

		int counter=0;
		PreparedStatement pp=conn.prepareStatement("Select * from nextkey where company_code=? AND agent_code=? AND type=?");
		pp.setString(1, company_code);
		pp.setString(2, agent_code);
		pp.setString(3, prefix);
		ResultSet r=pp.executeQuery();
		//String cut=ldtString.substring(2,4);
		System.out.println(arr[0]);
		if(r.next()) {
			String month=r.getString("month");
			if(arr[0].equalsIgnoreCase(month))
			{			counter=Integer.parseInt(r.getString("period"));}
			else {
				PreparedStatement prepare=conn.prepareStatement("Update nextkey set month=? where company_code=? AND agent_code=? AND type=?");
				prepare.setString(1, month);
				prepare.setString(2, company_code);
				prepare.setString(3, agent_code);
				prepare.setString(4, prefix);
			}
			
		}
		counter+=1;

		String date=arr[1]+arr[0];


		String last_num;
		last_num=date+String.format("%05d", counter);
		tracking_num=prefix+" "+agent_code+" "+last_num;

		System.out.println(tracking_num);

		PreparedStatement p1=conn.prepareStatement("Update nextkey set period=? where company_code=? AND agent_code=? AND type=?");
		p1.setString(1, String.format("%05d", counter));
		p1.setString(2, company_code);
		p1.setString(3, agent_code);
		p1.setString(4, prefix);
		p1.execute();					
					
					 
					
					 
		if(row.getCell(4)!=null){

		addr4=row.getCell(4).getStringCellValue();
			}
		if(row.getCell(3)!=null){

		addr3=row.getCell(3).getStringCellValue();
		}
		System.out.println(receiver+addr1+addr2+addr3+addr4+rcvr_state+rcvr_township+waybill_type+receving_type+" "+weight+size+product_amt);
		DateTimeFormatter FOMATTER2 = DateTimeFormatter.ofPattern("MM/dd/yyyy");

		//Local date time instance
		Date dt=new Date();

		LocalDateTime localDateTime1 = LocalDateTime.from(dt.toInstant().atZone(ZoneId.of("UTC"))).plusDays(1);

		//Get formatted String
		String ldtString1 = FOMATTER2.format(localDateTime1);



		DateTimeFormatter FOMATTER1 = DateTimeFormatter.ofPattern("MM/dd/yyyy 'at' hh:mm a");

		//Local date time instance
		LocalDateTime localDateTime2= LocalDateTime.now();
		System.out.println("hello");
		//Get formatted String
		String ldtString2 = FOMATTER1.format(localDateTime2);
		String rcvr_ward="";
		String rcvr_street="";
		String r_postcode=r_postcode1+r_postcode2+"0000";
		String rcvr_phone=row.getCell(12).getStringCellValue();
		PreparedStatement pre=conn.prepareStatement("Insert into registration(company_code,agent_code,staff_code,trans_date,track_num,sender_code,rcvr_name,rcvr_addr1,rcvr_addr2,rcvr_addr3,rcvr_addr4,rcvr_state,rcvr_township,rcvr_ward,rcvr_street,rcvr_postal,rcvr_phone,payment_code,rcvd_code,weight,size,deli_charges,trans_charges,product_amt,cur_charges,total_amt,stat,planned_deli_date,createdby,createdate)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		        pre.setString(1, company_code);
		        pre.setString(2, agent_code);
		        
		        pre.setString(3, staff_code);
		        
		        pre.setString(4, ldtString1);
		        pre.setString(5, tracking_num);
		        pre.setString(6, cust_code);
		        pre.setString(7, receiver);
		        pre.setString(8, addr1);
		        pre.setString(9, addr2);
		        pre.setString(10, addr3);
		        pre.setString(11, addr4);
		        pre.setString(12, rcvr_state);
		        
		        pre.setString(13, rcvr_township);
		        pre.setString(14, rcvr_ward);
		        pre.setString(15, rcvr_street);
		        pre.setString(16, r_postcode);
		        pre.setString(17, rcvr_phone);
		        pre.setString(18, prefix);
		        pre.setString(19, receving_type);
		        pre.setFloat(20,weight);
		        pre.setInt(21, size);
		        pre.setString(22,delivery_charges);
		        pre.setString(23, transportation_charges);
		        pre.setInt(24, product_amt);
		        pre.setString(25, "0");
		        pre.setInt(26, total);
		        pre.setString(27, stat);
		        pre.setString(28, ldtString1);
		        pre.setString(29, staff_name);
		        pre.setString(30, ldtString2);
		        pre.execute();
		        
		        String file1="test"+i+".pdf";
		        String FILE_NAME = "C:\\Users\\Casper\\Desktop\\pdf\\"+file1;
		        Document document = new Document();
		        try {
		           PdfWriter pdf= PdfWriter.getInstance(document, new FileOutputStream(new File(FILE_NAME)));
		            document.open();
		            Rectangle rect1= new Rectangle(577,503,18,15); // you can resize rectangle 
		            rect1.enableBorderSide(1);
		            rect1.enableBorderSide(2);
		            rect1.enableBorderSide(4);
		            rect1.enableBorderSide(8);
		            rect1.setBorderColor(BaseColor.BLACK);
		            rect1.setBorderWidth(1);
		            document.add(rect1);
		            
		            
		            
		            Rectangle rect= new Rectangle(577,830,18,15); // you can resize rectangle 
		            rect.enableBorderSide(1);
		            rect.enableBorderSide(2);
		            rect.enableBorderSide(4);
		            rect.enableBorderSide(8);
		            rect.setBorderColor(BaseColor.BLACK);
		            rect.setBorderWidth(1);
		            Font f= new Font(Font.FontFamily.TIMES_ROMAN, 18,Font.BOLD);
		            Font small= new Font(Font.FontFamily.TIMES_ROMAN, 11,Font.BOLD);
		            Font fo = new Font(Font.FontFamily.TIMES_ROMAN, 20,Font.BOLD);
		            Font fo1 = new Font(Font.FontFamily.TIMES_ROMAN, 25,Font.BOLD);
		            Font big = new Font(Font.FontFamily.TIMES_ROMAN, 35,Font.BOLD);
		            document.add(rect);
		            float[] colsWidth1 = {1f, 1f, 1f,1f,1f};
		            PdfPTable table = new PdfPTable(colsWidth1);
		            
		            float[] colsWidth_main = {1f, 1f, 1f}; // Code 1
		            String s=receiver;
		            
		           
		           
		            String receiver_phone=rcvr_phone;
		            String phone=receiver_phone;
		           
		            String product_amt1="Product Amt: "+product_amt;
		            String deli_charges="Delivery Chgs: "+delivery_charges;
		            String total_amt="Total Amt:\t"+total;
		            
		            
		            String township=rcvr_township+"("+s_postcode+")";
		            String state=rcvr_state+"\t";
		            String sender="From:\t\t\t"+sender_name;
		            
		          
		            String receiver_postal=r_postcode;
		            String way_bill=wb1;
		            
		            String size1="Weight:"+weight+"Size:\t"+size+"sqft";
		            String description="";
		          
		            
		            Paragraph p11 = new Paragraph("To:\t\t"+s, fo1);
		            Paragraph p12 = new Paragraph(tracking_num, fo);
		            Paragraph p13= new Paragraph(addr1+addr2, f);
		          
		            Paragraph p15 = new Paragraph(addr3+" "+addr4, f);
		            Paragraph p5 = new Paragraph(addr4, f);
		            Paragraph p6 = new Paragraph(product_amt1, f);
		            Paragraph p7= new Paragraph(deli_charges, f);
		            Paragraph p8 = new Paragraph(total_amt, f);
		            Paragraph p_phone = new Paragraph(phone, f);
		            Paragraph p_sender = new Paragraph(sender, f);

		            Paragraph p_state = new Paragraph(state+township, f);
		            Paragraph p_agent = new Paragraph(agent_code, fo1);
		            Paragraph re = new Paragraph(sender_phone, f);
		            Paragraph recevier_postal1 = new Paragraph(receiver_postal, big);
		            Paragraph wb = new Paragraph(way_bill, f);
		            Paragraph d = new Paragraph(ldtString1, f);
		            Paragraph si = new Paragraph(size1, f);
		            Paragraph desc = new Paragraph(description, small);
		            
		            
		          
		            
		            
		            
		            table = new PdfPTable(colsWidth_main);
		            table.getDefaultCell().setBorder(0);
		            table.setWidthPercentage(105); // Code 2
		            table.setHorizontalAlignment(Element.ALIGN_CENTER);//Code 3
		            PdfPCell receiver1=new PdfPCell(p11);
		            receiver1.setColspan(2);
		            receiver1.setBorder(0);
		            table.addCell(receiver1);
		            
		            table.addCell(p12);
		            table.addCell(" ");
		            table.addCell(" ");
		            table.addCell(" ");
		            table.addCell(" ");
		            table.addCell(" ");
		            table.addCell(" ");

		            
		            PdfPCell address=new PdfPCell(p13);
		            address.setColspan(2);
		            address.setBorder(0);
		            table.addCell(address);
		           
		            table.addCell(p6);
		            PdfPCell address_3=new PdfPCell(new Phrase(addr3,f));
		            address_3.setColspan(2);
		            address_3.setBorder(0);
		            table.addCell(address_3);
		            
		            table.addCell(p7);
		            PdfPCell address_i=new PdfPCell(new Phrase(addr4,f));
		            address_i.setColspan(2);
		            address_i.setBorder(0);
		            table.addCell(address_i);
		           
		            table.addCell(p8);
		            table.addCell(new Phrase(phone,f));
		            table.addCell(" ");
		            PdfPCell c=new PdfPCell(new Phrase("Managed By:",small));
		            c.setColspan(3);
		            c.setHorizontalAlignment(Element.ALIGN_CENTER);
		            c.setVerticalAlignment(Element.ALIGN_CENTER);
		            PdfPCell c1=new PdfPCell(new Phrase("Partner Pacific Group Co., Ltd\n MK Express Delivery\n 09753 000 509",small));
		            c1.setColspan(3);
		            c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		            PdfPTable table1 = new PdfPTable(colsWidth_main);
		            table1.setWidthPercentage(100); // Code 2
		            table1.setHorizontalAlignment(Element.ALIGN_MIDDLE);//Code 3
		            table1.addCell(c);
		            table1.addCell(c1);
		            
		            
		            
		            table.addCell(table1);
		            table.addCell(" ");
		            table.addCell(" ");
		            table.addCell(" ");
		            table.addCell(p_sender);
		            table.addCell(" ");
		            PdfPCell phrs=new PdfPCell(new Phrase("Customer/Agent Code"));
		            phrs.setHorizontalAlignment(Element.ALIGN_CENTER);
		            phrs.setBorder(0);
		            table.addCell(phrs);
		            PdfPCell cc=new PdfPCell(p_state);
		            cc.setColspan(2);
		            cc.setBorder(0);
		            table.addCell(cc);
		            PdfPCell agent_cell=new PdfPCell(p_agent);
		            agent_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		            agent_cell.setBorder(0);
		            table.addCell(agent_cell);
		            PdfPCell cl=new PdfPCell(re);
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
		            
		            
		          
		            
		            Barcode128 b=new Barcode128();
		            b.setCode(tracking_num);
		            b.setBarHeight(50f); // great! but what about width???
		            b.setX(1.5f);
		            PdfPCell c3=new PdfPCell(b.createImageWithBarcode(pdf.getDirectContent(), null, null));
		            c3.setColspan(3);
		            c3.setHorizontalAlignment(Element.ALIGN_RIGHT);
		            c3.setBorder(0);
		            table.addCell(new Phrase(r_postcode1+" "+r_postcode2,big));
		            table.addCell(c3);
		            
		            table.addCell(receiver1);
		           
		          
		            table.addCell(p12);
		            
		            table.addCell(p13);
		            table.addCell("");
		            PdfPCell c4=new PdfPCell(d);
		            c4.setHorizontalAlignment(Element.ALIGN_CENTER);
		            c4.setBorder(0);

		            table.addCell(wb);
		 PdfPCell ci=new PdfPCell(new Phrase(addr3,f));
		            
		            ci.setBorder(0);
		            ci.setColspan(2);
		            table.addCell(ci);
		            
		          
		            table.addCell(c4);
		             
		            PdfPCell c5=new PdfPCell(si);
		            c5.setHorizontalAlignment(Element.ALIGN_CENTER);
		            c5.setBorder(0);
		            c5.setColspan(2);
		           
		            
		            table.addCell(new Phrase(addr4,f));
		            table.addCell(c5);
		           
		          
		           
		           
		           table.addCell(p_phone);
		           table.addCell("");
		           PdfPCell ii=new PdfPCell(new Phrase("\tItem Description:"));
		           ii.setBorder(0);
		           ii.setVerticalAlignment(Element.ALIGN_BOTTOM);
		          table.addCell(ii);
		          
		          table.addCell(" ");
		          table.addCell(" ");
		         table.addCell(" ");
		         
		         table.addCell(p6);
		         table.addCell("");
		        table.addCell(desc);

		        table.addCell(p7);
		        table.addCell(" ");
		        table.addCell(" ");

		        table.addCell(p8);
		        table.addCell(" ");
		        table.addCell(" ");

		        table.addCell(" ");
		        table.addCell(" ");
		        table.addCell(" ");

		        table.addCell(" ");
		        table.addCell(" ");
		        table.addCell(" ");

		        table.addCell(p_sender);
		        table.addCell(" ");
		        table.addCell(" ");

		        table.addCell(p_state);
		        table.addCell(" ");
		        table.addCell(" ");
		        //c5.setRotation(90);
		        PdfPCell c6=new PdfPCell();
		        c6.addElement(new Phrase(r_postcode1+" "+r_postcode2,fo1));
		        c6.addElement(new Phrase("Customer/\nAgent Code"));
		        c6.addElement(p_agent);
		        c6.setVerticalAlignment(Element.ALIGN_CENTER);
		        c6.setHorizontalAlignment(Element.ALIGN_CENTER);

		        c6.setBorder(0);
		        c6.setRotation(-90);
		        table.addCell(re);
		        table.addCell(" ");
		        table.addCell(c6);
		           
		           

		           PdfContentByte cb = pdf.getDirectContent();
		           ColumnText.showTextAligned(cb, Element.ALIGN_RIGHT,new Phrase("MK Express Delivery",fo), 550,200,-90);
		           cb.setLineWidth(2.0f); // Make a bit thicker than 1.0 default
		           cb.setGrayStroke(0f); // 1 = black, 0 = white
		           float x = 17f;
		           float y = 300f;
		           
		           float a = 17f;
		           float z = 200f;
		           
		           float ra=72f*5+20;//horizontal bottom line(rectangle)
		           float rb=180f;
		           cb.moveTo(ra,rb);
		           cb.lineTo(ra+ 72f*2, rb);
		           
		           float n=72f*5+20;//vertical line(left)
		           float m=323;
		           cb.moveTo(n,m);
		           cb.lineTo(n,180);
		           
		           float j=72f*7+20;//vertical line(right)
		           float k=323;
		           cb.moveTo(j,k);
		           cb.lineTo(j,180);
		           
		           
		           
		           float q=72f*5+20;//horizontal line(upward)
		           float w=323;
		           cb.moveTo(q,w);
		           cb.lineTo(q+ 72f*2,w);
		          
		           
		           
		           cb.moveTo(a,z);//two horizontal line
		           cb.lineTo(a + 72f*5, z);
		           cb.moveTo(x,y);
		           cb.lineTo(x + 72f*5, y);
		           cb.stroke();

		           
		           table.addCell(" ");
		           table.addCell(" ");
		            table.addCell("");
		            document.add(table);
		            
		            
		          
		            
		        	
		        	/*
		        	 * Paragraph p = new Paragraph("To:",fo1); p.setAlignment(Element.ALIGN_LEFT);
		        	 * 
		        	 * document.add(p);
		        	 * 
		        	 * Paragraph p2 = new Paragraph(); p2.add("Text 2"); // no alignment
		        	 * document.add(p2); Font f = new Font(); f.setStyle(Font.BOLD); f.setSize(8);
		        	 * document.add(new Paragraph("This is my paragraph 3", f));
		        	 */

		            //document.add(Image.getInstance("C:\\Users\ \Casper\\Pictures\\SVT1.jpg"));
		            document.close();
		            conn.close();
		            System.out.println("Done");
		        } catch (Exception e) {
		            e.printStackTrace();
		        } 
		        
		        
		    	}
		    
		    }
		    workbook.close();

			/*
			 * while (rowIterator.hasNext()) {
			 * 
			 * Row row = rowIterator.next();
			 * 
			 * Cell cell0 = row.getCell(0); if (cell0 != null) {
			 * 
			 * System.out.println("YE HTUT KHAUNG 1: "+cell0.getStringCellValue());
			 * 
			 * 
			 * PreparedStatement
			 * pre=conn.prepareStatement("Insert into department(name,state)values(?,?)");
			 * pre.setString(1, cell0.getStringCellValue()); pre.setString(2, "Hello");
			 * pre.execute(); file.close(); workbook.close();
			 * 
			 * }
			 * 
			 * 
			 * }
			 */
		    } 
		catch(NullPointerException e) {
			System.out.println(e);
		}
		catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		response.sendRedirect("batch_waybill.jsp");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
