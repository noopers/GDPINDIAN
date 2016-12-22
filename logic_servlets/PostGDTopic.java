package logic_servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/PostGDTopic")
public class PostGDTopic extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection c=DriverManager.getConnection("jdbc:mysql://mysql16670-gdpindia.cloud.cms500.com/WATAForAll","root","PRKakz31968");
			 PreparedStatement st=null;
			 ResultSet rs=null;
			 HttpSession session=request.getSession();
			 try
			 {
				 st=c.prepareStatement("create table gd_topics (gdid varchar(50),gd_heading varchar(4000),gd_topic varchar(4000),posted_by_email varchar(500),posted_by_name varchar(500),posted_date varchar(500))");
				 st.execute();
			 }
			 catch(Exception e)
			 {
				 e.printStackTrace();				 
			 }
			 finally{
				 int total_gd_topic_count=0;
				 String gd_heading=request.getParameter("gd_heading");
				 String gd_topic=request.getParameter("gd_topic");
				 String email=(String)session.getAttribute("email");
				 String name=(String)session.getAttribute("name");
				 String date=request.getParameter("date");
				 st=c.prepareStatement("select * from total_gd_topics");
				 rs=st.executeQuery();
				 rs.next();
				 total_gd_topic_count=rs.getInt(1);
				 total_gd_topic_count++;
				 st=c.prepareStatement("update total_gd_topics set topics=?");
				 st.setInt(1, total_gd_topic_count);
				 st.executeUpdate();
				 st=c.prepareStatement("insert into gd_topics values(?,?,?,?,?,?)");
				 st.setString(1, "gd_topic_"+total_gd_topic_count);
				 st.setString(3, gd_topic);
				 st.setString(2, gd_heading);	
				 st.setString(4, email);
				 st.setString(5, name);
				 st.setString(6, date);
				 st.executeUpdate();
				 try{
					 
					 st=c.prepareStatement("create table gd_topic_"+total_gd_topic_count+" (posted_by_email varchar(500),posted_by_name varchar(500),gd_answer varchar(4000),posted_time varchar(500),posted_date varchar(500),posted_like varchar(500),posted_dislike varchar(500))");
					 st.execute();
				 }
				 catch(Exception e)
				 {
					 e.printStackTrace();
				 }
				 finally{
					 response.sendRedirect("ForumDiscussion.jsp?gdid=gd_topic_"+total_gd_topic_count+"&gd_topic="+gd_topic+"&gd_heading="+gd_heading+"&posted_date="+date+"&posted_by_name="+name);
				 }
			 }
		}
		catch(Exception e)
		 {
			 e.printStackTrace();
			 //response.sendRedirect("Home.jsp");
		 }
		
	}
}
