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
@WebServlet("/UpdateQuesByHoster")
public class UpdateQuesByHoster extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String t=request.getParameter("t");
		String a=request.getParameter("a");
		String b=request.getParameter("b");
		String c=request.getParameter("c");
		String d=request.getParameter("d");
		String ques=request.getParameter("ques");
		String ac=request.getParameter("ac");
		String marks=request.getParameter("marks");
		String sno=request.getParameter("sno");
		System.out.println("sfs"+sno+"hgjhgfh");
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://mysql16670-gdpindia.cloud.cms500.com/WATAForAll","root","PRKakz31968");	
		PreparedStatement st=con.prepareStatement("update "+t+" set srno=?,ques=?,a=?,b=?,c=?,d=?,ac=?,marks=? where srno=?");
		st.setInt(1, Integer.parseInt(sno));
		st.setString(2, ques);
		st.setString(3, a);
		st.setString(4, b);
		st.setString(5, c);
		st.setString(6, d);
		st.setString(7, ac);
		st.setString(8, marks);
		st.setInt(9, Integer.parseInt(sno));
		st.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
