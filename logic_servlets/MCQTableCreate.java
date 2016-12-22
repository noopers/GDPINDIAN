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

@WebServlet("/MCQTableCreate")
public class MCQTableCreate extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://mysql16670-gdpindia.cloud.cms500.com/WATAForAll","root","PRKakz31968");	
		PreparedStatement st=null;
		ResultSet rs=null;
		st=con.prepareStatement("create table java (srno int,question varchar(4000),a varchar(100),b varchar(100),c varchar(100),d varchar(100),ans varchar(1),hint varchar(4000))");
		st.execute();
		st=con.prepareStatement("create table c (srno int,question varchar(4000),a varchar(100),b varchar(100),c varchar(100),d varchar(100),ans varchar(1),hint varchar(4000))");
		st.execute();
		st=con.prepareStatement("create table c__ (srno int,question varchar(4000),a varchar(100),b varchar(100),c varchar(100),d varchar(100),ans varchar(1),hint varchar(4000))");
		st.execute();
		st=con.prepareStatement("create table gk (srno int,question varchar(4000),a varchar(100),b varchar(100),c varchar(100),d varchar(100),ans varchar(1),hint varchar(4000))");
		st.execute();
		st=con.prepareStatement("create table reasoning (srno int,question varchar(4000),a varchar(100),b varchar(100),c varchar(100),d varchar(100),ans varchar(1),hint varchar(4000))");
		st.execute();
		st=con.prepareStatement("create table english (srno int,question varchar(4000),a varchar(100),b varchar(100),c varchar(100),d varchar(100),ans varchar(1),hint varchar(4000))");
		st.execute();		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
