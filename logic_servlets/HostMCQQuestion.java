package logic_servlets;

import java.io.IOException;
import java.io.PrintWriter;
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

/**
 * Servlet implementation class HostMCQQuestion
 */
@WebServlet("/HostMCQQuestion")
public class HostMCQQuestion extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String t=request.getParameter("t");
		String a=request.getParameter("a");
		String b=request.getParameter("b");
		String c=request.getParameter("c");
		String d=request.getParameter("d");
		String ques=request.getParameter("ques");
		String ac=request.getParameter("ac");
		String marks=request.getParameter("marks");
		PrintWriter pw=response.getWriter();
	//	pw.println(t+a+b+c+d+ques+ac);
		HttpSession ses=request.getSession();
		String tablename=(String)ses.getAttribute("tablename");
		
		PrintWriter out=response.getWriter();
				
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://mysql16670-gdpindia.cloud.cms500.com/WATAForAll","root","PRKakz31968");	
			PreparedStatement st;
			ResultSet rs=null;	
			
			String uid=(String)ses.getAttribute("uid");
			st=con.prepareStatement("select * from "+uid+"_hosted_mcq where mcqid=?");
			st.setString(1, tablename);
			rs=st.executeQuery();
			if(rs.next())
			{
							
			
			
			st=con.prepareStatement("select * from  "+tablename);
			rs=st.executeQuery();
			int count=0;
			while(rs.next()){
				count=rs.getInt(1);
			}
			
			st=con.prepareStatement("insert into "+tablename+ " values (?,?,?,?,?,?,?,?)");
			st.setInt(1, count+1);
			st.setString(2, ques);
			st.setString(3, a);
			st.setString(4, b);
			st.setString(5, c);
			st.setString(6, d);
			st.setString(7, ac);
			st.setString(8, marks);
			st.executeUpdate();
			pw.println("Question Added Successfully");
			}
			else
			{
				out.println("Seems like you have unauthorized acces to this web page.Check if you are login and then try.If the problem persists then contact us or refresh the page.");				
			}
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
			//out.println(e.toString());
		}
	}

}
