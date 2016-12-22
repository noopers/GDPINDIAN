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

@WebServlet("/CheckIfLogin")
public class CheckIfLogin extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//HttpSession session=request.getSession();
		//String username=(String)session.getAttribute("username");
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://mysql16670-gdpindia.cloud.cms500.com/WATAForAll","root","PRKakz31968");
		PreparedStatement st=con.prepareStatement("select * from  host_mcq_table ");
		
ResultSet rs=st.executeQuery();
		if(rs.next()){
		System.out.println(rs.getString(2))	;
		}
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			//response.sendRedirect("Home.jsp");
		}
		
	}
}
