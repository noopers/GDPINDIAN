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

@WebServlet("/Login")
public class Login extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email,pass;
		email=request.getParameter("email");
		pass=request.getParameter("password");
		PrintWriter out=response.getWriter();
		HttpSession ses=request.getSession();
		try{
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://mysql16670-gdpindia.cloud.cms500.com/WATAForAll","root","PRKakz31968");	
		PreparedStatement st=con.prepareStatement("select * from gdpindia_users where email=? and password=?");
		st.setString(1, email);
		st.setString(2, pass);
		ResultSet rs=st.executeQuery();
		if(rs.next())
		{
			String v=rs.getString("verify");
			if(v.equals("Y"))
			{
			
			
			ses.setAttribute("email", email);
			ses.setAttribute("name", rs.getString(2));
			ses.setAttribute("uid", rs.getString("userid"));
			ses.setAttribute("college", rs.getString(8));
		//	ses.setAttribute("name", rs.getString(2));
		//	ses.setAttribute("name", rs.getString(2));
			}
			else
			{
				ses.setAttribute("signupinfomodal","You are not verified yet.Go to your email id and verify yourself");
			}
					
			
		}
		else
		{
			ses.setAttribute("signupinfomodal", "You are Not A Valid User");
		}
		response.sendRedirect("Home.jsp");	
		}
		catch(Exception e)
		{
			//out.println(e.toString());
		}

	}

}
