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


@WebServlet("/Delete")
public class Delete extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession ses=request.getSession();
		//System.out.print(request.getParameter("sr"));
		ses.setAttribute("sr",request.getParameter("sr"));
		String sr="",t="";
		sr=request.getParameter("sr");
		t=request.getParameter("t");
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://mysql16670-gdpindia.cloud.cms500.com/WATAForAll","root","PRKakz31968");	
		PreparedStatement st=con.prepareStatement("delete   from "+t+" where srno=?");
		st.setString(1, sr);
		st.executeUpdate();
		
		
		}
		catch(Exception e){
			
			e.printStackTrace();
			//response.sendRedirect("Home.jsp");
		}
	}

}
