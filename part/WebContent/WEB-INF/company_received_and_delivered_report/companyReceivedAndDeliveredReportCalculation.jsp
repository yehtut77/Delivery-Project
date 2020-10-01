<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.SimpleDateFormat"%>
  <%@page import="java.text.SimpleDateFormat"%>
  <%@page import="java.util.Date"%>
  <%@ page import="java.time.format.DateTimeFormatter" %>
    <%@ page import="java.time.*" %>
<%
	 HttpSession ssss=request.getSession(false);  
	String staffName=(String)ssss.getAttribute("staffName");
	String companyCode=(String)ssss.getAttribute("companyCode");
	String agentCode=(String)ssss.getAttribute("agentCode");
	String staffCode=(String)ssss.getAttribute("staffCode");
	DateTimeFormatter dat = DateTimeFormatter.ofPattern("dd/MM/yyyy hh:mm a");
LocalDateTime localDateTime = LocalDateTime.now();
String ldtString2 = dat.format(localDateTime);

Connection connection = null;

String cc=null;
String a=null;
String b=null;
String c=null;
String d=null;
String e=null;
String f=null;
String g=null;
String h=null;
String i=null;
String j=null;
String k=null;
String l=null;
String m=null;
String n=null;
String o=null;
String p=null;
String q=null;
String r=null;
String s=null;
String t=null;
String u=null;
String v=null;
String w=null;
String x=null;
String y=null;
String z=null;
 String cond=request.getParameter("cond");

connection=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");

	if(cond.equals("one")){
int flag=0,flag2=0;
	String date1=request.getParameter("d1");
    String date2=request.getParameter("d2");
String datedata="",datealldata="";
String agentdata="",agentalldata="";
			PreparedStatement pre = connection.prepareStatement("Select createdate,agent_code,track_stat from transaction where company_code=? ");
			pre.setString(1,companyCode);
			ResultSet rs = pre.executeQuery();
			while (rs.next()) {
				flag=0;flag2=0;
				String dbcdate="",tstat="";
			    dbcdate=rs.getString("createdate");
			    tstat=rs.getString("track_stat");
			    String day=dbcdate.substring(0,2);
			    String month=dbcdate.substring(3,5);
			    String year=dbcdate.substring(6,10);
			    
                SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        Date datetype1 = sdf.parse(day+"-"+month+"-"+year);
                String days=date1.substring(8,10);
                String months=date1.substring(5,7);
                String years=date1.substring(0,4); 
               String days2=date2.substring(8,10);
                String months2=date2.substring(5,7);
                String years2=date2.substring(0,4); 
        Date datetypes1 = sdf.parse(days+"-"+months+"-"+years);
        Date datetypes2 = sdf.parse(days2+"-"+months2+"-"+years2);
       
if (datetype1.compareTo(datetypes1) == 0 || datetype1.compareTo(datetypes1) > 0 ) {
    if (datetype1.compareTo(datetypes2) == 0 || datetype1.compareTo(datetypes2) < 0){
        if(tstat.equals("W") || tstat.equals("D") || tstat.equals("C") ){
            String agcode="";
            String crdate="";
            agcode=rs.getString("agent_code");
            String agtrim=agcode.trim();
            crdate=rs.getString("createdate");
            String crdateonly=crdate.substring(0,10);
            String crdatetrim=crdateonly.trim();
            if(agentalldata.equals("")){
            agentalldata=agtrim;
            }
            String[] dupag=agentalldata.split(":");
            for(String dag:dupag){

if(dag.equals(agtrim) || dag==null || dag.equals("null")){flag2=1;}
            else{
              }}
            if(datealldata.equals("")){
            	datealldata=crdatetrim;
                }
            String[] dupcd=datealldata.split(":");
               for(String dcd:dupcd){
            	 
            if(dcd.equals(crdatetrim) || dcd==null || dcd.equals("null")){flag=1;}
            else{
            }}
            if(flag==1){}else{ datealldata=datealldata+":"+crdatetrim;}
            if(flag2==1){}else{ agentalldata=agentalldata+":"+agtrim;}
        }else{}
    }else{  
    }
}else{                
}

		}String rere="",tst="",uptab="";

	
int count=0,totalW=0,totalD=0,utc=0,addedw=0,addedd=0;
		String allcol="",totalcol="";
			  String[] edate=datealldata.split(":");
	            for(String edt:edate){
	            	String agentcheck="";
	            	agentcheck="";
	            	 String[] eag=agentalldata.split(":");
	 	            for(String eagent:eag){
	 	           	addedw=0;addedd=0;
	 	           	PreparedStatement pre_ed = connection.prepareStatement("Select agent_code,track_num,createdate,staff_username,track_stat from transaction where company_code=?");
	 				pre_ed.setString(1,companyCode);
	 				ResultSet rs_e = pre_ed.executeQuery();
	 				
	 				while (rs_e.next()) {
	 					rere=rs_e.getString("track_stat");
	 					tst=rs_e.getString("createdate");
	 					String agcd=rs_e.getString("agent_code");

	 					String tstsb=tst.substring(0,10);
	 					if(tstsb.equals(edt)){
	 						if(agcd.equals(eagent)){
	 						if(rere.equals("W") || rere.equals("D") || rere.equals("C")){

	 							if(agentcheck.equals("")){
		 							agentcheck=eagent;
	 			 				 String pair2=edt+"^"+eagent+"^"+staffName+"^"+addedw+"^"+addedd;
	 				 				uptab=uptab+"*"+pair2;
	 				 				utc=utc+1;}else
	 			 				 {
	 			 					 if(agentcheck.equals(eagent)){
	 			 					 }else{
	 			 						agentcheck=eagent;
	 			 						 String pair=edt+"^"+eagent+"^"+staffName+"^"+addedw+"^"+addedd;
	 			 				uptab=uptab+"*"+pair;
	 			 				utc=utc+1;}
	 			 				 }
	 			 				 
	 							count=count+1;
	 						String col1=tstsb;
	 						String col2=eagent;
	 						String col3=rs_e.getString("staff_username");
	 						String col4=rs_e.getString("track_num");
	 						String col5="";
	 						String col6="";
	 						if(rere.equals("W")){col5="&#10003;";totalW=totalW+1;}
 							if(rere.equals("D")){col6="&#10003;";totalD=totalD+1;}
 							if(rere.equals("C")){col6="&#10003;";totalD=totalD+1;}
	 						 allcol=col1+":"+col2+":"+col3+":"+col4+":"+col5+":"+col6;
	 						totalcol=totalcol+"$"+allcol;
	 						}else{}}else{}}
								}
	 				 
	 				 }
		}
		out.print(totalW+"|"+totalD+"|"+count+"|"+totalcol+"|"+uptab+"|"+utc);
		
		pre.close();
		rs.close();
}
	if(cond.equals("two")){
		int t1=0,t2=0;
		String date=request.getParameter("dated");
		String agent=request.getParameter("agentd");

		String staff_username="";
		PreparedStatement pre_ed = connection.prepareStatement("Select agent_code,staff_username,track_stat,createdate from transaction where company_code=? and agent_code=?");
			pre_ed.setString(1,companyCode);
			pre_ed.setString(2,agent);

			ResultSet rs_e = pre_ed.executeQuery();
			
			while (rs_e.next()) {	
				String creda=rs_e.getString("createdate");
				 staff_username=rs_e.getString("staff_username");
				String credat=creda.substring(0,10);
				if(credat.equals(date)){
				String stat=rs_e.getString("track_stat");
				if(stat.equals("W")){t1=t1+1;}
					if(stat.equals("D")){t2=t2+1;}
					if(stat.equals("C")){t2=t2+1;}
			}}
			pre_ed.close();
			rs_e.close();
		//	System.out.println("P2"+date);

		out.print(date+"^"+agent+"^"+staff_username+"^"+t1+"^"+t2);
	}
	
	connection.close();
%>
