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


@WebServlet("/CreateTables")
public class CreateTables extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://mysql16670-gdpindia.cloud.cms500.com/WATAForAll","root","PRKakz31968");
		PreparedStatement st=null;
		ResultSet rs=null;
		try{
		st=con.prepareStatement("create table host_programming_table (contest_no varchar(100),contest_title varchar(4000),contest_desc varchar(4000),contest_date varchar(50),contest_time varchar(50),contest_key varchar(10),contest_by varchar(4000),duration varchar(10),date_str varchar(100),user_email varchar(4000))");
		st.execute();
		}
		finally{
			
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			//response.sendRedirect("Home.jsp");
		}
	}

}
