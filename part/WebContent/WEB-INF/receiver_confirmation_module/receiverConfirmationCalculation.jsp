<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
  <%@page import="java.text.SimpleDateFormat,java.util.Date"%>
            <%@ page import="java.time.format.DateTimeFormatter" %>
    <%@ page import="java.time.*" %>
     

<%@page import=" java.io.File"%>
<%@page import=" java.io.FileOutputStream"%>
<%@page import=" java.io.FileInputStream"%>

<%@page import=" java.util.Base64"%>
<%@page import=" java.awt.image.*"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.*"%>

<%@page import="java.util.*"%>
 
<%@page import="java.io.*"%>

<%
String pcode=request.getParameter("pcode");

DateTimeFormatter dat = DateTimeFormatter.ofPattern("dd/MM/yyyy hh:mm a");
LocalDateTime localDateTime = LocalDateTime.now();
String ldtString2 = dat.format(localDateTime);

String addedstring=null;
HttpSession ssss=request.getSession(false);  
	String staff_name=(String)ssss.getAttribute("staffName");
String ccode=(String)ssss.getAttribute("companyCode");

	String agent_code=(String)ssss.getAttribute("agentCode");
	String staff_code=(String)ssss.getAttribute("staffCode");
	
String trackno=request.getParameter("typenext");
String conff=request.getParameter("condition");


Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
connection=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");

if(conff.equals("conf1")){

PreparedStatement pree_track = connection
.prepareStatement("Select * from registration where track_num=? and company_code=? and agent_code=?");
pree_track.setString(1,trackno);
pree_track.setString(2,ccode);
pree_track.setString(3,agent_code);

ResultSet rss_track = pree_track.executeQuery();
String a="",b="",c="",d="",e="",c1="",c2="",c3="",f="",g="",h="",i="",flagg="0";
if (rss_track.next()) {

a = rss_track.getString("rcvr_name");
b = rss_track.getString("rcvr_phone");
c1 = rss_track.getString("rcvr_addr1");
c2 = rss_track.getString("rcvr_addr2");
c3 = rss_track.getString("rcvr_addr3");
c=c1+" "+c2+" "+c3;
d = rss_track.getString("rcvr_township");
e = rss_track.getString("rcvr_state");
f = rss_track.getString("payment_code");
g = rss_track.getString("deli_charges");
h = rss_track.getString("product_amt");
i = rss_track.getString("stat");
flagg="1";
}
rss_track.close();
pree_track.close();

if(flagg.equals("1")){
if(i.equals("D") || i.equals("C")){ out.print("InvalidTN");}
else{


PreparedStatement pree_payment = connection
.prepareStatement("Select payment_description from paymentmode where payment_code=? and company_code=?");
pree_payment.setString(1,f);
pree_payment.setString(2,ccode);

ResultSet rss_payment = pree_payment.executeQuery();
String paydes="";
if (rss_payment.next()) {
paydes=rss_payment.getString("payment_description");

}
rss_payment.close();
pree_payment.close();

if(h==null || h==" "){h="0";}
if(g==null || g==" "){g="0";}
int total=0,dc=0,pa=0;
	 System.out.println("total"+"="+g+"+"+h+".");

double dcd=Double.parseDouble(g);
double pad=Double.parseDouble(h);
 System.out.println("total2"+"="+dcd+"+"+pad+".");
 dc=(int)dcd;
 pa=(int)pad;
  System.out.println("total3"+"="+dc+"+"+pa+".");

if(paydes.equals("Cash On Delivery")){
	
	 total=dc+pa;
	 System.out.println("total"+"="+total);
}
if(paydes.equals("Charge to Receiver")){
	 total=dc;
	 System.out.println("total"+"="+total);

}
if(paydes.equals("Prepaid")){
	 total=0;
	 System.out.println("total"+"="+total);

}


out.print(a+"$"+b+"$"+c+"$"+d+"$"+e+"$"+paydes+"$"+total+"$"+dc+"$"+pa+"$");}}
    else
    out.print("InvalidTN");
}

if(conff.equals("conf2")){
Random rand = new Random(); 
        int rand_int1 = rand.nextInt(10000000);
         int rand_int2 = rand.nextInt(10000000);
     int rand_int3 = rand.nextInt(10000000);
String imgtext=rand_int1+".png";
String sigtext=rand_int2+".png";
String imgtext2=rand_int3+".png";


	String img=request.getParameter("img");
	if(img.equals("op")){String query =
		    "update registration " +
		    "set stat = ?, " +
		    "updateby = ?," +
		    "modifydate=?"+
		    "where track_num = ? and company_code=? and agent_code=? "; 
  PreparedStatement preparedStmt = connection.prepareStatement(query);
  preparedStmt.setString(1,"D");
  preparedStmt.setString(2,staff_name);
  preparedStmt.setString(3,ldtString2);
  preparedStmt.setString(4,trackno);
preparedStmt.setString(5,ccode);
preparedStmt.setString(6,agent_code);
  preparedStmt.executeUpdate();
  preparedStmt.close();
	    
PreparedStatement pre_doitem = connection
.prepareStatement("Select do_num from do_item where company_code=? and tracking_num=? ");
pre_doitem.setString(1, ccode);
pre_doitem.setString(2,trackno);
ResultSet rs_item = pre_doitem.executeQuery();
String dono="";
if (rs_item.next()) {

	dono = rs_item.getString("do_num");
}
  rs_item.close();
  pre_doitem.close();


String query_doitem =
		    "update do_item " +
		    "set stat = ?, " +
		    "updatedby = ?," +
		    "modifydate = ?" +
				    
		    "where do_num = ? and company_code=? and tracking_num=?"; 
  PreparedStatement preparedStmt_do_item = connection.prepareStatement(query_doitem);
  preparedStmt_do_item.setString(1,"F");
  preparedStmt_do_item.setString(2,staff_name);
  preparedStmt_do_item.setString(3,ldtString2);
  preparedStmt_do_item.setString(4,dono);
  preparedStmt_do_item.setString(5,ccode);
  preparedStmt_do_item.setString(6,trackno);
  preparedStmt_do_item.executeUpdate();
    preparedStmt_do_item.close();

PreparedStatement pre_stat = connection
.prepareStatement("Select stat from do_item where company_code=? and do_num=? ");
pre_stat.setString(1, ccode);
pre_stat.setString(2,dono);
ResultSet rs_stat = pre_stat.executeQuery();
int numdono=0;
while (rs_stat.next()) {
String existorn =rs_stat.getString("stat");
if(existorn.equals("O")){numdono++;}
}
    rs_stat.close();
    pre_stat.close();


  if(numdono>0){}else{
String query_do =
		    "update do_hdr " +
		    "set stat = ?, " +
		    "updatedby = ?," +
		    "modifydate = ?" + 
		    "where do_num = ? and company_code=? and agent_code=? "; 
  PreparedStatement preparedStmt_do = connection.prepareStatement(query_do);
  preparedStmt_do.setString(1,"F");
  preparedStmt_do.setString(2,staff_name);
  preparedStmt_do.setString(3,ldtString2);
  preparedStmt_do.setString(4,dono);
  preparedStmt_do.setString(5,ccode);
  preparedStmt_do.setString(6,agent_code);
preparedStmt_do.executeUpdate();
      preparedStmt_do.close();

System.out.println("UYB"+numdono);
}

PreparedStatement pre_ph = connection
		.prepareStatement("Select * from staff where company_code=? and parent_agent_code=? and staff_code=?");
pre_ph.setString(1, ccode);
pre_ph.setString(2, agent_code);
pre_ph.setString(3, staff_code);
ResultSet rs_ph= pre_ph.executeQuery();
String sph="";
while (rs_ph.next()) {
	
	sph = rs_ph.getString("staff_phone");
}
      rs_ph.close();
      pre_ph.close();

PreparedStatement pre_deli = connection
		.prepareStatement("Select deli_charges from registration where track_num=? and company_code=? and agent_code=?");
pre_deli.setString(1, trackno);
pre_deli.setString(2, ccode);
pre_deli.setString(3, agent_code);

ResultSet rs_deli = pre_deli.executeQuery();
String delichar="";

String totalamt=request.getParameter("tam");
if (rs_deli.next()) {
	
	delichar = rs_deli.getString("deli_charges");
}      rs_deli.close();
      pre_deli.close();

if(addedstring==null){addedstring="0000";}
  PreparedStatement pre_tra=connection.prepareStatement("insert into transaction(trans_date,company_code,agent_code,staff_username,staff_phone,track_num,track_stat,ref_type,delivery_charges,createdby, updatedby, createdate, modifydate,pay_code,staff_code)"+
	        "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

  
  pre_tra.setString(1,ldtString2);
  pre_tra.setString(2,ccode);
  pre_tra.setString(3,agent_code);
	pre_tra.setString(4,staff_name);

	pre_tra.setString(5,sph);
	pre_tra.setString(6,trackno);
	pre_tra.setString(7,"D");
	pre_tra.setString(8," ");

	pre_tra.setString(9,delichar);
	pre_tra.setString(10,staff_name);

	pre_tra.setString(11,"");
	pre_tra.setString(12,ldtString2);

	pre_tra.setString(13,"");
	pre_tra.setString(14,"0"+pcode);
	pre_tra.setString(15,staff_code);


	pre_tra.executeUpdate();
	      pre_tra.close();

	 String pcodetrim=pcode.trim();
	  if(pcodetrim.equals("4")){}else{
	  
		PreparedStatement pre_new=connection.prepareStatement("insert into paytrans(trans_date,document_ref,credit_amt,paycode,createdby,createdate)"+
		        "values(?,?,?,?,?,?)");

		pre_new.setString(1,ldtString2);
		pre_new.setString(2,trackno);
		pre_new.setString(3,totalamt);
		pre_new.setString(4,"0"+pcode);
		pre_new.setString(5,staff_name);
		pre_new.setString(6,ldtString2);


		pre_new.executeUpdate();
	      	      pre_new.close();

	  }
	
	}else{
	String sig=request.getParameter("sig");
String img22=img.split(",")[1];
	byte[] imagedata =Base64.getDecoder().decode(img22);
	BufferedImage bufferedImage = ImageIO.read(new ByteArrayInputStream(imagedata));
	
		FileOutputStream aaaa = new FileOutputStream(new File("/home/teamrame/jvm/apache-tomcat-9.0.12/domains/delivery.teamramen.net/ROOT/"+imgtext));
	FileOutputStream bbbb = new FileOutputStream(new File("/home/teamrame/jvm/apache-tomcat-9.0.12/domains/delivery.teamramen.net/ROOT/"+sigtext));
    FileOutputStream cccc = new FileOutputStream(new File("/home/teamrame/jvm/apache-tomcat-9.0.12/domains/delivery.teamramen.net/ROOT/"+imgtext2));
    aaaa.close();
bbbb.close();
cccc.close();
	File imgfile=new File("/home/teamrame/jvm/apache-tomcat-9.0.12/domains/delivery.teamramen.net/ROOT/"+imgtext);
	if(imgfile.exists()){System.out.println("GOODSTST");}
	File sigfile=new File("/home/teamrame/jvm/apache-tomcat-9.0.12/domains/delivery.teamramen.net/ROOT/"+sigtext);
	
	ImageIO.write(bufferedImage, "png",imgfile);

String sig22=sig.split(",")[1];
	byte[] imagedata_s =Base64.getDecoder().decode(sig22);
	BufferedImage bufferedImage_s = ImageIO.read(new ByteArrayInputStream(imagedata_s));
	ImageIO.write(bufferedImage_s, "png",sigfile);



	InputStream inputStream = new FileInputStream(imgfile);
	InputStream inputStream_s = new FileInputStream(sigfile);
String query =
		    "update registration " +
		    "set stat = ?, " +
		    "updateby = ?," +
		    "modifydate=?,"+
		     "attachmentImg=?,"+
		     "receiverSignature=?"+
		    "where track_num = ? and company_code=? and agent_code=? "; 
  PreparedStatement preparedStmt = connection.prepareStatement(query);
  preparedStmt.setString(1,"D");
  preparedStmt.setString(2,staff_name);
  preparedStmt.setString(3,ldtString2);
  preparedStmt.setBlob(4,inputStream); 
  preparedStmt.setBlob(5,inputStream_s); 
  preparedStmt.setString(6,trackno);
preparedStmt.setString(7,ccode);
preparedStmt.setString(8,agent_code);
  preparedStmt.executeUpdate();
  preparedStmt.close();

  
PreparedStatement pre_doitem = connection
.prepareStatement("Select do_num from do_item where company_code=? and tracking_num=? ");
pre_doitem.setString(1, ccode);
pre_doitem.setString(2,trackno);
ResultSet rs_item = pre_doitem.executeQuery();
String dono="";
if (rs_item.next()) {

	dono = rs_item.getString("do_num");
}
  rs_item.close();
  pre_doitem.close();


String query_doitem =
		    "update do_item " +
		    "set stat = ?, " +
		    "updatedby = ?," +
		    "modifydate = ?" +
				    
		    "where do_num = ? and company_code=? and tracking_num=?"; 
  PreparedStatement preparedStmt_do_item = connection.prepareStatement(query_doitem);
  preparedStmt_do_item.setString(1,"F");
  preparedStmt_do_item.setString(2,staff_name);
  preparedStmt_do_item.setString(3,ldtString2);
  preparedStmt_do_item.setString(4,dono);
  preparedStmt_do_item.setString(5,ccode);
  preparedStmt_do_item.setString(6,trackno);
  preparedStmt_do_item.executeUpdate();
    preparedStmt_do_item.close();

PreparedStatement pre_stat = connection
.prepareStatement("Select stat from do_item where company_code=? and do_num=? ");
pre_stat.setString(1, ccode);
pre_stat.setString(2,dono);
ResultSet rs_stat = pre_stat.executeQuery();
int numdono=0;
while (rs_stat.next()) {
String existorn =rs_stat.getString("stat");
System.out.println("RRR"+existorn);
if(existorn.equals("O")){numdono++;}
}
    rs_stat.close();
    pre_stat.close();


  if(numdono>0){}else{
String query_do =
		    "update do_hdr " +
		    "set stat = ?, " +
		    "updatedby = ?," +
		    "modifydate = ?" + 
		    "where do_num = ? and company_code=? and agent_code=? "; 
  PreparedStatement preparedStmt_do = connection.prepareStatement(query_do);
  preparedStmt_do.setString(1,"F");
  preparedStmt_do.setString(2,staff_name);
  preparedStmt_do.setString(3,ldtString2);
  preparedStmt_do.setString(4,dono);
  preparedStmt_do.setString(5,ccode);
  preparedStmt_do.setString(6,agent_code);
preparedStmt_do.executeUpdate();
      preparedStmt_do.close();

System.out.println("UYB"+numdono);
}

PreparedStatement pre_ph = connection
		.prepareStatement("Select * from staff where company_code=? and parent_agent_code=? and staff_code=?");
pre_ph.setString(1, ccode);
pre_ph.setString(2, agent_code);
pre_ph.setString(3, staff_code);
ResultSet rs_ph= pre_ph.executeQuery();
String sph="";
while (rs_ph.next()) {
	
	sph = rs_ph.getString("staff_phone");
}
      rs_ph.close();
      pre_ph.close();

PreparedStatement pre_deli = connection
		.prepareStatement("Select deli_charges from registration where track_num=? and company_code=? and agent_code=?");
pre_deli.setString(1, trackno);
pre_deli.setString(2, ccode);
pre_deli.setString(3, agent_code);

ResultSet rs_deli = pre_deli.executeQuery();
String delichar="";

String totalamt=request.getParameter("tam");
if (rs_deli.next()) {
	
	delichar = rs_deli.getString("deli_charges");
}      rs_deli.close();
      pre_deli.close();

if(addedstring==null){addedstring="0000";}
  PreparedStatement pre_tra=connection.prepareStatement("insert into transaction(trans_date,company_code,agent_code,staff_username,staff_phone,track_num,track_stat,ref_type,delivery_charges,createdby, updatedby, createdate, modifydate,pay_code,staff_code)"+
	        "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

  
  pre_tra.setString(1,ldtString2);
  pre_tra.setString(2,ccode);
  pre_tra.setString(3,agent_code);
	pre_tra.setString(4,staff_name);

	pre_tra.setString(5,sph);
	pre_tra.setString(6,trackno);
	pre_tra.setString(7,"D");
	pre_tra.setString(8," ");

	pre_tra.setString(9,delichar);
	pre_tra.setString(10,staff_name);

	pre_tra.setString(11,"");
	pre_tra.setString(12,ldtString2);

	pre_tra.setString(13,"");
	pre_tra.setString(14,"0"+pcode);
	pre_tra.setString(15,staff_code);


	pre_tra.executeUpdate();
	      pre_tra.close();

	File imgfile2=new File("/home/teamrame/jvm/apache-tomcat-9.0.12/domains/delivery.teamramen.net/ROOT/"+imgtext2);

	
	InputStream inputStream2=null;
	String img2=request.getParameter("img");
	String sig2=request.getParameter("sig");
String img222=img2.split(",")[1];
	byte[] imagedata222 =Base64.getDecoder().decode(img222);
	BufferedImage bufferedImage2 = ImageIO.read(new ByteArrayInputStream(imagedata222));
	ImageIO.write(bufferedImage2, "png",imgfile2);
	 String pcodetrim=pcode.trim();
	  if(pcodetrim.equals("4")){}else{
	  	 inputStream2 = new FileInputStream(imgfile2);
		PreparedStatement pre_new=connection.prepareStatement("insert into paytrans(trans_date,document_ref,Ref_File,credit_amt,paycode,createdby,createdate)"+
		        "values(?,?,?,?,?,?,?)");

		pre_new.setString(1,ldtString2);
		pre_new.setString(2,trackno);
		pre_new.setBlob(3,inputStream2);
		pre_new.setString(4,totalamt);
		pre_new.setString(5,"0"+pcode);
		pre_new.setString(6,staff_name);
		pre_new.setString(7,ldtString2);


		pre_new.executeUpdate();
	      	      pre_new.close();

	  }
		  inputStream.close();
	  inputStream_s.close();
	  inputStream2.close();
	  if(imgfile.delete()){}
	  if(imgfile2.delete()){}
	  if(sigfile.delete()){}
}
}
if(conff.equals("conf3")){

	String reason=request.getParameter("reason");
	String query_reason =
		    "update registration " +
		    "set reason = ?, " +
		    "stat = ?, " +
		    "updateby = ?," +
		    "modifydate = ?" +
            "where agent_code = ? and company_code=? and track_num=?"; 
  PreparedStatement pre_reason = connection.prepareStatement(query_reason);
  pre_reason.setString(1,reason);
  pre_reason.setString(2,"C");
  pre_reason.setString(3,staff_name);
  pre_reason.setString(4,ldtString2);
  pre_reason.setString(5,agent_code);
  pre_reason.setString(6,ccode);
  pre_reason.setString(7,trackno);
  pre_reason.executeUpdate();
  	      	      pre_reason.close();


PreparedStatement pre_doitem = connection
.prepareStatement("Select do_num from do_item where company_code=? and tracking_num=? ");
pre_doitem.setString(1, ccode);
pre_doitem.setString(2,trackno);
ResultSet rs_item = pre_doitem.executeQuery();
String dono="";
if (rs_item.next()) {

	dono = rs_item.getString("do_num");
}
  	      	      rs_item.close();
  	      	      pre_doitem.close();


String query_doitem =
		    "update do_item " +
		    "set stat = ?, " +
		    "updatedby = ?," +
		    "modifydate = ?" +
				    
		    "where do_num = ? and company_code=? and tracking_num=?"; 
  PreparedStatement preparedStmt_do_item = connection.prepareStatement(query_doitem);
  preparedStmt_do_item.setString(1,"F");
  preparedStmt_do_item.setString(2,staff_name);
  preparedStmt_do_item.setString(3,ldtString2);
  preparedStmt_do_item.setString(4,dono);
  preparedStmt_do_item.setString(5,ccode);
  preparedStmt_do_item.setString(6,trackno);
  preparedStmt_do_item.executeUpdate();
    	      	      preparedStmt_do_item.close();

PreparedStatement pre_stat = connection
.prepareStatement("Select stat from do_item where company_code=? and do_num=? ");
pre_stat.setString(1, ccode);
pre_stat.setString(2,dono);
ResultSet rs_stat = pre_stat.executeQuery();
int numdono=0;
while (rs_stat.next()) {
String existorn =rs_stat.getString("stat");
System.out.println("RRR"+existorn);
if(existorn.equals("O")){numdono++;}
}
    	      	      rs_stat.close();
    	      	      pre_stat.close();


  if(numdono>0){}else{
String query_do =
		    "update do_hdr " +
		    "set stat = ?, " +
		    "updatedby = ?," +
		    "modifydate = ?" + 
		    "where do_num = ? and company_code=? and agent_code=? "; 
  PreparedStatement preparedStmt_do = connection.prepareStatement(query_do);
  preparedStmt_do.setString(1,"F");
  preparedStmt_do.setString(2,staff_name);
  preparedStmt_do.setString(3,ldtString2);
  preparedStmt_do.setString(4,dono);
  preparedStmt_do.setString(5,ccode);
  preparedStmt_do.setString(6,agent_code);
preparedStmt_do.executeUpdate();
preparedStmt_do.close();
  }

PreparedStatement pre_ph = connection
		.prepareStatement("Select * from staff where company_code=? and parent_agent_code=? and staff_code=?");
pre_ph.setString(1, ccode);
pre_ph.setString(2, agent_code);
pre_ph.setString(3, staff_code);
ResultSet rs_ph= pre_ph.executeQuery();
String sph="";
while (rs_ph.next()) {
	
	sph = rs_ph.getString("staff_phone");
}
rs_ph.close();
pre_ph.close();

PreparedStatement pre_deli = connection
.prepareStatement("Select deli_charges from registration where track_num=? and company_code=? and agent_code=?");
pre_deli.setString(1, trackno);
pre_deli.setString(2, ccode);
pre_deli.setString(3, agent_code);

ResultSet rs_deli = pre_deli.executeQuery();
String delichar="";
if (rs_deli.next()) {

delichar = rs_deli.getString("deli_charges");
}
rs_deli.close();
pre_deli.close();

String totalamt=request.getParameter("tam");

if(addedstring==null){addedstring="0000";}
PreparedStatement pre_tra=connection.prepareStatement("insert into transaction(staff_code,trans_date,company_code,agent_code,staff_username,staff_phone,track_num,track_stat,ref_type,delivery_charges,createdby, updatedby, createdate, modifydate,pay_code)"+
	        "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

pre_tra.setString(1,staff_code);
pre_tra.setString(2,ldtString2);
pre_tra.setString(3,ccode);
pre_tra.setString(4,agent_code);
	pre_tra.setString(5,staff_name);

	pre_tra.setString(6,sph);
	pre_tra.setString(7,trackno);
	pre_tra.setString(8,"C");
	pre_tra.setString(9," ");

	pre_tra.setString(10,delichar);
	pre_tra.setString(11,staff_name);

	pre_tra.setString(12,"");
	pre_tra.setString(13,ldtString2);

	pre_tra.setString(14,"");
	pre_tra.setString(15," ");



	pre_tra.executeUpdate();
pre_tra.close();

}

if(conff.equals("conf4")){

PreparedStatement pree_track = connection
.prepareStatement("Select * from registration where track_num=? and company_code=? and agent_code=?");
pree_track.setString(1,trackno);
pree_track.setString(2,ccode);
pree_track.setString(3,agent_code);

ResultSet rss_track = pree_track.executeQuery();
String redlicount="";
if (rss_track.next()) {
	redlicount=rss_track.getString("redeliver_count");
}
rss_track.close();
pree_track.close();

	if(redlicount==null || redlicount==" "){redlicount="0";}
	double rcount=Double.parseDouble(redlicount);
	 int rdcount=(int)rcount;
	 int finalcount=rdcount+1;
	 String finalc=""+finalcount;
String rea=request.getParameter("reason");	 
	String query_reason =
		    "update registration " +
		    "set redeliver_count = ?, " +
		    "stat = ?, " +
		    "updateby = ?," +
		     "reason = ?," +
		    "modifydate = ?" +
		    "where agent_code = ? and company_code=? and track_num=?"; 
  PreparedStatement pre_redeli = connection.prepareStatement(query_reason);
  pre_redeli.setString(1,finalc);
  pre_redeli.setString(2,"R");
  pre_redeli.setString(3,staff_name);
  pre_redeli.setString(4,rea);
  pre_redeli.setString(5,ldtString2);
  pre_redeli.setString(6,agent_code);
  pre_redeli.setString(7,ccode);
  pre_redeli.setString(8,trackno);
  pre_redeli.executeUpdate();
  pre_redeli.close();

PreparedStatement pre_ph = connection
		.prepareStatement("Select * from staff where company_code=? and parent_agent_code=? and staff_code=?");
pre_ph.setString(1, ccode);
pre_ph.setString(2, agent_code);
pre_ph.setString(3, staff_code);
ResultSet rs_ph= pre_ph.executeQuery();
String sph="";
while (rs_ph.next()) {
	
	sph = rs_ph.getString("staff_phone");
}
  rs_ph.close();
  pre_ph.close();

PreparedStatement pre_deli = connection
.prepareStatement("Select deli_charges from registration where track_num=? and company_code=? and agent_code=?");
pre_deli.setString(1, trackno);
pre_deli.setString(2, ccode);
pre_deli.setString(3, agent_code);

ResultSet rs_deli = pre_deli.executeQuery();
String delichar="";
if (rs_deli.next()) {

delichar = rs_deli.getString("deli_charges");
}
  rs_deli.close();
  pre_deli.close();

String totalamt=request.getParameter("tam");

if(addedstring==null){addedstring="0000";}
  PreparedStatement pre_tra=connection.prepareStatement("insert into transaction(staff_code,trans_date,company_code,agent_code,staff_username,staff_phone,track_num,track_stat,ref_type,delivery_charges,createdby, updatedby, createdate, modifydate,pay_code)"+
	        "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

  pre_tra.setString(1,staff_code);
  pre_tra.setString(2,ldtString2);
  pre_tra.setString(3,ccode);
  pre_tra.setString(4,agent_code);
	pre_tra.setString(5,staff_name);

	pre_tra.setString(6,sph);
	pre_tra.setString(7,trackno);
	pre_tra.setString(8,"R");
	pre_tra.setString(9," ");

	pre_tra.setString(10,delichar);
	pre_tra.setString(11,staff_name);

	pre_tra.setString(12,"");
	pre_tra.setString(13,ldtString2);

	pre_tra.setString(14,"");
	pre_tra.setString(15," ");


	pre_tra.executeUpdate();
	  pre_tra.close();


}
 connection.close();

%>