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

@WebServlet("/HostGDTableMaking")
public class HostGDTableMaking extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		PrintWriter pr=response.getWriter();
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://mysql16670-gdpindia.cloud.cms500.com/WATAForAll","root","PRKakz31968");
			PreparedStatement st=null;
			ResultSet rs=null;
			pr.print(0);
			st=con.prepareStatement("create table host_gd_table(gdid varchar(50),gd_heading varchar(100),gd_desc varchar(4000),hosted_by_email varchar(500),hosted_by_name varchar(500),key1 varchar(50) ,counter int,gd_date varchar(500),gd_date_str varchar(500),gd_start_time varchar(500),duration varchar(500),PRIMARY KEY (key1))");
			st.execute();
			pr.print(0);
			st=con.prepareStatement("create table total_hosted_gd(counter int)");
			st.execute();
			pr.print(0);
			st=con.prepareStatement("insert into total_hosted_gd values(?)");
			st.setInt(1, 0);
			st.executeUpdate();
			pr.print(0);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			//response.sendRedirect("Home.jsp");
		//pr.print(e);
		}
	}

}
