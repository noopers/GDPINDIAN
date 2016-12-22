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

/**
 * Servlet implementation class HostGD
 */
@WebServlet("/HostGD")
public class HostGD extends HttpServlet {
	
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String gd_heading=request.getParameter("gd_heading");
		String gd_desc=request.getParameter("gd_desc");
		String date=request.getParameter("gd_date");
		String start_time=request.getParameter("gd_start_time");
		String end_time=request.getParameter("duration");
		String gdid="",email="",name="",key="",date_str="",sendkey="";
		int counter=0;
		HttpSession session=request.getSession();
		email=(String)session.getAttribute("email");
		name=(String)session.getAttribute("name");
		key=getRandomString();
		date_str=getDateStr(date);
		PrintWriter out=response.getWriter();
		out.println(date);
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://mysql16670-gdpindia.cloud.cms500.com/WATAForAll","root","PRKakz31968");
			PreparedStatement st=null;
			ResultSet rs=null;
			st=con.prepareStatement("select * from total_hosted_gd");
			rs=st.executeQuery();
			rs.next();
			counter=rs.getInt(1);
			counter++;
			st=con.prepareStatement("update total_hosted_gd set counter=?");
			st.setInt(1, counter);
			st.executeUpdate();
			gdid="hosted_gd_"+counter;
			key=counter+key;
			st=con.prepareStatement("insert into host_gd_table values(?,?,?,?,?,?,?,?,?,?,?)");			
			st.setString(1, gdid);
			st.setString(2, gd_heading);
			st.setString(3, gd_desc);
			st.setString(4, email);
			st.setString(5, name);
			st.setString(6, key);
			st.setInt(7, counter);
			st.setString(8, date);
			st.setString(9, date_str);
			st.setString(10, start_time);
			st.setString(11, end_time);
			st.executeUpdate();			
			response.sendRedirect("Host_Invite.jsp?key="+key);
		}
		catch(Exception e)
		{	
			e.printStackTrace();
			//response.sendRedirect("Home.jsp");
		}
	}
	public String getRandomString()
	{
		String req="01234576789",c="";
		int len=req.length();
		for(int i=1;i<=6;i++)
		{
			int index=(int)(len*Math.random());
			char ch=req.charAt(index);
			if(c.indexOf(ch)!=-1)
			{
				i--;
				continue;
			}
			c+=ch;
		}
		return c;
	}
	public String getDateStr(String date)
	{
		String m="",s="";
		int x=Integer.parseInt(date.substring(5,7));
		switch(x)
		{
		case 1:
			m="January";
			break;
		case 2:
			m="February";
			break;
		case 3:
			m="March";
			break;
		case 4:
			m="April";
			break;
		case 5:
			m="May";
			break;
		case 6:
			m="June";
			break;
		case 7:
			m="July";
			break;
		case 8:
			m="August";
			break;
		case 9:
			m="September";
			break;
		case 10:
			m="October";
			break;
		case 11:
			m="November";
			break;
		case 12:
			m="December";
			break;
		}
		s=m+" "+date.substring(8)+" ,"+date.substring(0,4);
		return s;
	}
}
