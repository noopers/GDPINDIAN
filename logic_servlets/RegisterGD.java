package logic_servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/RegisterGD/*")
public class RegisterGD extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession ses=request.getSession();
		PrintWriter out=response.getWriter();		
		String email=(String) ses.getAttribute("email");
		String gid=request.getPathInfo().substring(1);
		//String gid=request.getParameter("gdid");
		String date=request.getParameter("date");
		String time=request.getParameter("time");
		String nextdate=request.getParameter("nextdate");
		String uid="";
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection c=DriverManager.getConnection("jdbc:mysql://mysql16670-gdpindia.cloud.cms500.com/WATAForAll","root","PRKakz31968");
			uid=(String) ses.getAttribute("uid");
			out.print(uid+gid+nextdate+email);
			PreparedStatement  st=null;//=c.prepareStatement("select srno from "+uid+"_past");
			ResultSet rs=null;//=st.executeQuery();
			int noOfGdRegistered=0;
			/*while(rs.next())
			{
				noOfGdRegistered++;
			}*/
			st=c.prepareStatement("select srno from "+uid+"_future");
			rs=st.executeQuery();			
			while(rs.next())
			{
				noOfGdRegistered++;
			}
			out.println(gid+" "+date+" "+nextdate+" "+uid);
			st=c.prepareStatement("insert into "+uid+"_future values(?,?,?,?,?)");
			st.setInt(1, noOfGdRegistered+1);
			st.setString(2, gid);
			st.setString(3, time);			
			st.setString(4, "");
			st.setString(5, "NA");
			try
			{
			st.executeUpdate();
			//out.println(gid+" "+date+" "+nextdate+" "+uid);
			
			
			st=c.prepareStatement("select * from upcoming_"+date+" where gdid=?");
			st.setString(1, gid);
			rs=st.executeQuery();
			//out.println(gid+" "+date+" "+nextdate+" "+uid);
			int flag=1;
			if(rs.next())
			{
				st=c.prepareStatement("update upcoming_"+date+" set counter=counter+? where gdid=?");
				st.setInt(1, 1);
				st.setString(2, gid);				
				flag=0;
			}
			else
			{
				st=c.prepareStatement("update upcoming_"+nextdate+" set counter=counter+? where gdid=?");
				st.setInt(1, 1);
				st.setString(2, gid);					
			}
			st.executeUpdate();
			st=c.prepareStatement("update "+uid+"_future set gd_date=? where gdid=?");
			st.setString(2, gid);
			if(flag==1)
			{				
				st.setString(1, nextdate);				
			}
			else
			{
				st.setString(1, date);
			}
			st.executeUpdate();
			ses=request.getSession();
			ses.setAttribute("status", "success");
			response.sendRedirect("http://www.gdpindian.com/RegisteredGD.jsp");
			//request.getRequestDispatcher("RegisteredGD.jsp").forward(request, response);
			}
			catch(Exception e)
			{
				
				out.println(e.toString());
				e.printStackTrace();
			}
		}
		catch(Exception e)
		{
			//out.println(email+" "+date+" "+nextdate+" "+uid);
			//out.println(e);
			e.printStackTrace();
			//System.out.println(email+" "+date+" "+nextdate+" "+uid);
			//response.sendRedirect("Home.jsp");
		}
	}

}
