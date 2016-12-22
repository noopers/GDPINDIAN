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

@WebServlet("/ContactUs")
public class ContactUs extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		String uid=(String)session.getAttribute("uid");
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://mysql16670-gdpindia.cloud.cms500.com/WATAForAll","root","PRKakz31968");
			PreparedStatement st=con.prepareStatement("insert into contact_us values(?,?)");
			st.setString(1, uid);
			st.setString(2, request.getParameter("feed"));
			st.executeUpdate();
			response.sendRedirect("ContactUs.jsp");

		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			//response.sendRedirect("Home.jsp");
		}
		
	}
}
