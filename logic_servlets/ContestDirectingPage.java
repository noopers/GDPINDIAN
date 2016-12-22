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
 * Servlet implementation class ContestDirectingPage
 */
@WebServlet("/ContestDirectingPage")
public class ContestDirectingPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String contestname=request.getParameter("contestname");
		String contestkey=request.getParameter("contestkey");
		HttpSession session =request.getSession();
		String start="";
		String end="";
		String uid=(String)session.getAttribute("uid");
		if(uid==null){
			session.setAttribute("login", "f");
			response.sendRedirect("Home.jsp?");
		}
		else{
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			dateFormat.setTimeZone(TimeZone.getTimeZone("IST"));
			Date dat = new Date();
			String cdate=dateFormat.format(dat);
			long cms=dat.getTime();	
			String ddate="";long dms=0,dur=0,ddur=0;
			
			
		try{
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://mysql16670-gdpindia.cloud.cms500.com/WATAForAll","root","PRKakz31968");
			PreparedStatement st=con.prepareStatement("select * from  host_mcq_table where contest_no=? and contest_key=?");
			st.setString(1, contestname);
			st.setString(2, contestkey);
			boolean b=false;
			ResultSet rs=st.executeQuery();
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
			//System.out.print(contestname+"_ranking");
			if(b==true){
				//System.out.print(contestname+"_ranking");
				st=con.prepareStatement("select * from "+contestname+"_ranklist where id=?");
				st.setString(1, uid);
				rs=st.executeQuery();
				
				if(rs.next()){
					
				}
				else{
					
					st=con.prepareStatement("insert into "+contestname+"_ranklist values(?,?,?,?,?,?)");
					st.setInt(1, 1);
					st.setString(2, uid);
					st.setString(3, (String)session.getAttribute("name"));
					st.setString(4, "na");
					st.setString(5, "na");
					st.setString(6, (String)session.getAttribute("college"));
					st.executeUpdate();
					
				}
				if(dur<0)
				{
					//before
					response.sendRedirect("HostedMCQQuestionRanking.jsp?type="+contestname+"&message=You are before time.Please enter the details after the start time.");
				}
				else if(dur>=0 && (dur-ddur)<=0)
				{
					session.setAttribute("hascomefrommodal", "t");
					response.sendRedirect("HostedMCQQuestion.jsp?type="+contestname);
				}
				else
				{					
					response.sendRedirect("HostedMCQQuestionRanking.jsp?type="+contestname);
				}
			}
			else{
				//session.setAttribute("login", "f");
				response.sendRedirect("Home.jsp?");
				
			}
			
			
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			//response.sendRedirect("Home.jsp");
		}}
	}

}
