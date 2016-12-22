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

@WebServlet("/MCQQuestionUploadGDPI")
public class MCQQuestionUploadGDPI extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		
		try{
			String q=request.getParameter("ques");
			String a=request.getParameter("a");
			String b=request.getParameter("b");
			String c=request.getParameter("c");
			String d=request.getParameter("d");
			String ac=request.getParameter("ac");
			String hint=request.getParameter("hint");
			String t=request.getParameter("t");
			int sr=0;
			System.out.println(t);
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://mysql16670-gdpindia.cloud.cms500.com/WATAForAll","root","PRKakz31968");
			PreparedStatement st=null;
			st=con.prepareStatement("select srno from "+t);
			ResultSet rs=st.executeQuery();
			while(rs.next())
			{
				sr++;
			}
			sr++;
			st=con.prepareStatement("insert into "+t+ " values(?,?,?,?,?,?,?,?)");
			st.setInt(1,sr);
			st.setString(2, q);
			st.setString(3, a);
			st.setString(4, b);
			st.setString(5, c);
			st.setString(6, d);
			st.setString(7, ac);
			st.setString(8, hint);
			st.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			//response.sendRedirect("Home.jsp");
		}
	}

}
