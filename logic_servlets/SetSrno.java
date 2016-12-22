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


@WebServlet("/SetSrno")
public class SetSrno extends HttpServlet {
	
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
		PreparedStatement st=con.prepareStatement("select * from "+t+" where srno=?");
		st.setString(1, sr);
		ResultSet rs=st.executeQuery();
		PrintWriter out=response.getWriter();
		response.setContentType("text/xml");
		if(rs.next())
		{
			
			out.println("<data><srno>"+sr+"</srno><ques>"+rs.getString(2)+"</ques>"+
					"<a>"+rs.getString(3)+"</a><b>"+rs.getString(4)+
					"</b><c>"+rs.getString(5)+"</c><d>"+rs.getString(6)+
					"</d><ac>"+rs.getString(7)+"</ac><m>"+rs.getString(8)+
					"</m></data>");
		}
		}
		catch(Exception e){
			e.printStackTrace();
			//response.sendRedirect("Home.jsp");
		}
	}

}
