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
 * Servlet implementation class CheckEmailIdInDB
 */
@WebServlet("/CheckEmailIdInDB")
public class CheckEmailIdInDB extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email;
		email=request.getParameter("email");		
		PrintWriter out=response.getWriter();
		try{
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://mysql16670-gdpindia.cloud.cms500.com/WATAForAll","root","PRKakz31968");
		PreparedStatement st=con.prepareStatement("select * from gdpindia_users where email=?");		
		st.setString(1, email);
		ResultSet rs=st.executeQuery();
		if(rs.next())
		{
			out.println(0);
		}
		else
		{
			out.println(1);
		}
		}
		catch(Exception e)
		{
			//out.println(e.toString());
			e.printStackTrace();
			//response.sendRedirect("Home.jsp");
			
		}

	}
}
