package logic_servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class HostedMCQRankUpdate
 */
@WebServlet("/HostedMCQRankUpdate")
public class HostedMCQRankUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session=request.getSession();
		 String message="";
		String type=request.getParameter("type");
		String cnt=request.getParameter("count");
		int coun=Integer.parseInt(cnt);
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://mysql16670-gdpindia.cloud.cms500.com/WATAForAll","root","PRKakz31968");	
		PreparedStatement st=null;
		ResultSet  rs=null;
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		dateFormat.setTimeZone(TimeZone.getTimeZone("IST"));
		Date dat = new Date();
		String cdate=dateFormat.format(dat);
		long cms=dat.getTime();	
		String ddate="";long dms=0,dur=0,ddur=0;
		 st=con.prepareStatement("select * from  host_mcq_table where contest_no=?");
			st.setString(1, type);
			rs=st.executeQuery();
			boolean b=false;
			if(rs.next()){
				b=true;
				ddate=rs.getString(4)+" "+rs.getString(5)+":00";
				dat=dateFormat.parse(ddate);
				dms=dat.getTime();			
				dur=cms-dms;	
				String durrrr=rs.getString(8);
				if(durrrr.equals("0:30"))
				{
					ddur=30*60*1000;
				}
				if(durrrr.equals("1:00"))
				{
					ddur=60*60*1000;
				}
				if(durrrr.equals("1:30"))
				{
					ddur=90*60*1000;
				}
				if(durrrr.equals("2:00"))
				{
					ddur=120*60*1000;
				}
				if(durrrr.equals("2:30"))
				{
					ddur=150*60*1000;
				}
				if(durrrr.equals("3:00"))
				{
					ddur=180*60*1000;
				}						
			}
		
			if(dur>=0 && (dur-ddur)<=0)
			{
		st=con.prepareStatement("select * from "+type);
		
		rs=st.executeQuery();
		String record="K";
		String str[]=new String[coun+1];
		for(int i=1;i<=coun;i++)
		{
		str[i]=request.getParameter(i+"");	
		}
		int count=0;
		int srno=0;
		while(rs.next())
		{srno++;
			String ans=str[srno];	
			if(ans!="" && ans !=null&& ans.equals(rs.getString("ac"))){
				count=count+Integer.parseInt(rs.getString("marks"));
				record=record+ans;
			}
			if(ans=="" || ans ==null){
				record=record+"U";
			}
			if(ans!="" && ans !=null&& !ans.equals(rs.getString("ac"))){
				
				record+=ans;
			}
		}
		
		
		st=con.prepareStatement("select * from "+type+"_ranklist where id=?");
		st.setString(1,(String)session.getAttribute("uid") );
		 rs=st.executeQuery();
		
		if(rs.next()){
			
			if(rs.getString("score").equals("na")){
				message="first";
				
				st=con.prepareStatement("update "+type+"_ranklist set score=?,answer_record=? where id=?");
				st.setString(1,""+count );
				st.setString(2, record);
				st.setString(3, (String)session.getAttribute("uid"));
				st.executeUpdate();
				
			}else{
				message="notfirst";
				
			}
			
		}
		else{
			message="na";
		}
		
			}
			else{
				message="timeexpired";
			}
		response.sendRedirect("HostedMCQQuestionRanking.jsp?type="+type+"&message="+message);
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
			//response.sendRedirect("Home.jsp");
		}	
	}

}
