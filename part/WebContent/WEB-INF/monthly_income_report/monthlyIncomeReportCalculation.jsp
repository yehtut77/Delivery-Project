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
int m=0;

connection=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");

String eachamount="";
double totalamount=0;
	String date1=request.getParameter("month");
    String date2=request.getParameter("year");
String agentalldata="";
 
			PreparedStatement pre = connection.prepareStatement("Select stat,agent_code,trans_date,deli_charges,trans_charges from registration where company_code=?");
			pre.setString(1,companyCode);
			ResultSet rs = pre.executeQuery();
			while (rs.next()) {
			int flag=0;
				String tdate="",stat="";
			    tdate=rs.getString("trans_date");
			    stat=rs.getString("stat");
			    String month=tdate.substring(0,2);
			    String year=tdate.substring(6,10);


			    if(date1.equals(month) && date2.equals(year)){
			        if(stat.equals("D") || stat.equals("C") || stat.equals("V")){
			            String delicharges=rs.getString("deli_charges");
			            String transcharges=rs.getString("trans_charges");
			            if(delicharges.equals("") || delicharges.equals(" ") || delicharges.equals("null")){delicharges="0";}
			            if(transcharges.equals("") || transcharges.equals(" ") || transcharges.equals("null")){transcharges="0";}
			            double dch=Double.parseDouble(delicharges);
                        double tch=Double.parseDouble(transcharges);
                        int dct=(int)dch;
                        int tct=(int)tch;
                        int total=dct+tct;
                        String agcode=rs.getString("agent_code");
                        String comc="";
                        PreparedStatement pre_com = connection.prepareStatement("Select delivery_charges from company where company_code=?");
			            pre_com.setString(1,companyCode);
			            ResultSet rs_com = pre_com.executeQuery();
		            	if (rs_com.next()) {
		            	    comc=rs_com.getString("delivery_charges");
		            	}
		                 double tch2=Double.parseDouble(comc);
		                 double tchdiv=tch2/100;
                       double commission=dct*tchdiv;
                       double result=total-commission;
                       totalamount=totalamount+result;
                       if(agentalldata.equals("")){agentalldata=agcode;}else{
                        String[] dupag=agentalldata.split(":");
                        for(String dag:dupag){
                        if(dag==null || dag.equals("null") || dag.equals("") ||  dag.equals(" ")){flag=1;}
                        else{  
                        if(dag.equals(agcode) ){flag=1;}
			        }
			        
			    }
                            if(flag==0){
                        agentalldata=agentalldata+":"+agcode;}
                       }
			   
           }}  
	}
	                    int count=0;
	                   
    	              String[] eachagent=agentalldata.split(":");
                            for(String eag:eachagent){
                            
                        if(eag==null || eag.equals("null") || eag.equals("") ||  eag.equals(" ")){}
                        else{			        count=count+1;

                        String sname="";
                         double resultt=0;
                     	PreparedStatement pre_ag = connection.prepareStatement("Select stat,trans_date,deli_charges,trans_charges from registration where company_code=? and agent_code=?");
		            	pre_ag.setString(1,companyCode);
		            	pre_ag.setString(2,eag);
			            ResultSet rs_ag = pre_ag.executeQuery();
			            while (rs_ag.next()) {
                        	String tdate="",stat="";
			    tdate=rs_ag.getString("trans_date");
			    stat=rs_ag.getString("stat");
			    String month=tdate.substring(0,2);
			    String year=tdate.substring(6,10);


			    if(date1.equals(month) && date2.equals(year)){
			        if(stat.equals("D") || stat.equals("C") || stat.equals("V")){
			          System.out.println("RR"+eag);
			            String delicharges=rs_ag.getString("deli_charges");
			            String transcharges=rs_ag.getString("trans_charges");
			            if(delicharges.equals("") || delicharges.equals(" ") || delicharges.equals("null")){delicharges="0";}
			            if(transcharges.equals("") || transcharges.equals(" ") || transcharges.equals("null")){transcharges="0";}
			            double dch=Double.parseDouble(delicharges);
                        double tch=Double.parseDouble(transcharges);
                        int dct=(int)dch;
                        int tct=(int)tch;
                        int total=dct+tct;
                        String comc="";
                        PreparedStatement pre_com = connection.prepareStatement("Select delivery_charges from company where company_code=?");
			            pre_com.setString(1,companyCode);
			            ResultSet rs_com = pre_com.executeQuery();
		            	if (rs_com.next()) {
		            	    comc=rs_com.getString("delivery_charges");
		            	}
		            	 PreparedStatement pre_name = connection.prepareStatement("Select agent_name from agent where company_code=? and agent_code=?");
			            pre_name.setString(1,companyCode);
			            pre_name.setString(2,eag);

			            ResultSet rs_name = pre_name.executeQuery();
		            	if (rs_name.next()) {
		            	    sname=rs_name.getString("agent_name");
		            	}
		                 double tch2=Double.parseDouble(comc);
		                 double tchdiv=tch2/100;
                       double commission=dct*tchdiv;
                       double result=total-commission;
                      resultt=resultt+result;
			        }
			        }}
			         String each=eag+"$"+sname+"$"+resultt;
                       eachamount=eachamount+"^"+each;
			    }}
			      PreparedStatement pre_for = connection.prepareStatement("Select * from forecast_budget where company_code= ? and Year=?");
			            pre_for.setString(1,companyCode);
			            pre_for.setString(2,date2);
			            ResultSet rs_for = pre_for.executeQuery();
		            	if (rs_for.next()) {
		            	    int a=rs_for.getInt("Jan");
		            	    int b=rs_for.getInt("Feb");
		            	    int c=rs_for.getInt("Mar");
		            	    int d=rs_for.getInt("Apr");
		            	    int e=rs_for.getInt("May");
		            	    int f=rs_for.getInt("Jun");
		            	    int g=rs_for.getInt("Jul");
		            	    int h=rs_for.getInt("Aug");
		            	    int i=rs_for.getInt("Sep");
		            	    int j=rs_for.getInt("Oct");
		            	    int k=rs_for.getInt("Nov");
		            	    int l=rs_for.getInt("Dec");
		            	    m=a+b+c+d+e+f+g+h+i+j+k+l;

		            	}
	out.print(totalamount+"*"+count+"*"+eachamount+"*"+m);
	connection.close();
%>
