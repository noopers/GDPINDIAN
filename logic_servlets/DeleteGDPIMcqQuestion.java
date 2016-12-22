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

@WebServlet("/DeleteGDPIMcqQuestion")
public class DeleteGDPIMcqQuestion extends HttpServlet {
	
protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		
		try{			
			String t=request.getParameter("type");	
			System.out.println(t);
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://mysql16670-gdpindia.cloud.cms500.com/WATAForAll","root","PRKakz31968");
			PreparedStatement st=null;
			st=con.prepareStatement("delete from"+t);
			st.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			//response.sendRedirect("Home.jsp");
		}
	}
}
