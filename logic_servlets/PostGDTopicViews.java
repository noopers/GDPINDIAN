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

@WebServlet("/PostGDTopicViews")
public class PostGDTopicViews extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection c=DriverManager.getConnection("jdbc:mysql://mysql16670-gdpindia.cloud.cms500.com/WATAForAll","root","PRKakz31968");
			 PreparedStatement st=null;
			 ResultSet rs=null;
			 HttpSession session=request.getSession();
			 String gdid="",gd_ans="",email="",name="",time="",date="";
			 gdid=request.getParameter("gdid");
			 email=request.getParameter("email");
			 name=request.getParameter("name");
			 time=request.getParameter("time");
			 date=request.getParameter("date");
			 gd_ans=request.getParameter("gd_answer");
			 String gd_heading=request.getParameter("gd_heading");
			 String gd_topic=request.getParameter("gd_topic");
			 String posted_by_name=request.getParameter("posted_by_name");
			 String posted_date=request.getParameter("posted_date");
			 st=c.prepareStatement("insert into "+gdid+" values(?,?,?,?,?,?,?)");
			 st.setString(1, email);
			 st.setString(2, name);
			 st.setString(3, gd_ans);
			 st.setString(4, time);
			 st.setString(5, date);
			 st.setString(6, "0");
			 st.setString(7, "0");
			 st.executeUpdate();
			 response.sendRedirect("ForumDiscussion.jsp?gdid="+gdid+"&gd_heading="+gd_heading+"&gd_topic="+gd_topic+"&posted_by_name="+posted_by_name+"&posted_date="+posted_date);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			//response.sendRedirect("Home.jsp");
		}
	}
}
