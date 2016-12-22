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

@WebServlet("/HostMCQDb")
public class HostMCQDb extends HttpServlet {
	


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String contest_title=request.getParameter("contest_title");
		String contest_desc=request.getParameter("contest_desc");
		String date=request.getParameter("contest_date");
		String start_time=request.getParameter("contest_time");
		String duration=request.getParameter("contest_duration");	
		String by=request.getParameter("contest_by");
		String date_str=getDateStr(date);
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://mysql16670-gdpindia.cloud.cms500.com/WATAForAll","root","PRKakz31968");
			PreparedStatement st=null;
			ResultSet rs=null;
			st=con.prepareStatement("select * from total_hosted_mcq");
			rs=st.executeQuery();
			rs.next();
			int counter=rs.getInt(1);
			counter++;
			st=con.prepareStatement("update total_hosted_mcq set counter=?");
			st.setInt(1, counter);
			st.executeUpdate();
			String mcqid="hosted_mcq_"+counter+""+getRandomInt();
			String key=getRandomString();
			key=counter+key;
			st=con.prepareStatement("insert into host_mcq_table values(?,?,?,?,?,?,?,?,?)");			
			st.setString(1, mcqid);
			st.setString(2, contest_title);
			st.setString(3, contest_desc);
			st.setString(4, date);
			st.setString(5, start_time);
			st.setString(6, key);
			st.setString(7, by);
			st.setString(8, duration);
			st.setString(9, date_str);						
			st.executeUpdate();
			HttpSession ses=request.getSession();
			String uid=(String)ses.getAttribute("uid");
			try {
				
				st=con.prepareStatement("create table "+uid+"_hosted_mcq (mcqid varchar(4000),title varchar(4000),key1 varchar(10))");
				st.execute();
			}
			finally{
				st=con.prepareStatement("insert into "+uid+"_hosted_mcq values(?,?,?)");
				st.setString(1, mcqid);
				st.setString(2, contest_title);
				st.setString(3, key);
				st.executeUpdate();
			
			
			
			ses.setAttribute("tablename", mcqid);
			st=con.prepareStatement("create table "+mcqid+" (srno int ,ques  varchar(4000),a varchar(100),b varchar(100),c varchar(100),d varchar(100),ac varchar(100),marks varchar(5))");
			st.execute();
			st=con.prepareStatement("create table "+mcqid+"_ranklist (srno int ,id  varchar(4000),name varchar(100),score varchar(100),answer_record varchar(4000),college varchar(4000))");
			st.execute();
			response.sendRedirect("HostMCQ.jsp?key="+key+"&c_title="+contest_title);
			}
		}
		catch(Exception e)
		{			
			//System.out.println(e);
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
	public String getRandomInt()
	{
		String req="01234576789",c="";
		int len=req.length();
		for(int i=1;i<=2;i++)
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
