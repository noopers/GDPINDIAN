package logic_servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/VerifyMail")
public class VerifyMail extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection c=DriverManager.getConnection("jdbc:mysql://mysql16670-gdpindia.cloud.cms500.com/WATAForAll","root","PRKakz31968");
			PreparedStatement st=c.prepareStatement("update gdpindia_users set verify='Y' where tempid=?");
			st.setString(1, request.getParameter("q"));
			st.executeUpdate();
			HttpSession ses=request.getSession();
			String email,name,uid,college;
			email=request.getParameter("e");
			name=request.getParameter("n");
			uid=request.getParameter("u");
			college=request.getParameter("c");
			ses.setAttribute("email", email);
			ses.setAttribute("name", name);
			ses.setAttribute("uid", uid);
			ses.setAttribute("college", college);
			response.sendRedirect("Home.jsp");
		}
		catch (Exception e) {
			// TODO: handle exception
			//response.sendRedirect("Home.jsp");
		}
	}

}
