package logic_servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DailyGDStats")
public class DailyGDStats extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		String date="",time="";		
		
		
		try{
			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			dateFormat.setTimeZone(TimeZone.getTimeZone("IST"));
			Date dat = new Date();
			String da=dateFormat.format(dat);
			Calendar cal = Calendar.getInstance(); 
			cal.setTime(dat); 
			cal.add(Calendar.DATE, 1);
			dat = cal.getTime();
			String nda=dateFormat.format(dat);
			Class.forName("com.mysql.jdbc.Driver");
			Connection c=DriverManager.getConnection("jdbc:mysql://mysql16670-gdpindia.cloud.cms500.com/WATAForAll","root","PRKakz31968");	
			String d[]=da.split(" ");
			String date1=d[0];
			String time1=d[1];
			for(int i=0;i<date1.length();i++)
			{
				if(date1.charAt(i)=='/')
				{
					date+="_";
				}
				else
				{
					date+=date1.charAt(i);
				}
			}
			
			for(int i=0;i<time1.length();i++)
			{
				if(time1.charAt(i)==':')
				{
					time+="_";
				}
				else
				{
					time+=time1.charAt(i);
				}
			}
			
			d=nda.split(" ");
			date1=d[0];
			time1=d[1];
			String nextdate="";
			for(int i=0;i<date1.length();i++)
			{
				if(date1.charAt(i)=='/')
				{
					nextdate+="_";
				}
				else
				{
					nextdate+=date1.charAt(i);
				}
			}
			
			PreparedStatement st=null;
			try
			{				
				st=c.prepareStatement("create table upcoming_"+nextdate+" (gdid varchar(50),randomkey varchar(50),counter int,gd_time varchar(20))");
				st.execute();				
				for(int i=1;i<=10;i++)
				{
					String r=getRandomString();
					st=c.prepareStatement("insert into upcoming_"+nextdate+" values(?,?,?,?)");
					st.setString(1, nextdate+i);
					st.setString(2, r);
					st.setInt(3, 0);
					if(i==10)
					{
						st.setString(4, i+":00");	
					}
					else
					{
						st.setString(4, "0"+i+":00");
					}
					
					st.executeUpdate();
				}
				
				st=c.prepareStatement("create table upcoming_"+date+" (gdid varchar(50),randomkey varchar(50),counter int,gd_time varchar(20))");
				st.execute();								
				for(int i=1;i<=10;i++)
				{
					String r=getRandomString();
					st=c.prepareStatement("insert into upcoming_"+date+" values(?,?,?,?)");
					st.setString(1, date+i);
					st.setString(2, r);
					st.setInt(3, 0);
					if(i==10)
					{
						st.setString(4, i+":00");	
					}
					else
					{
						st.setString(4, "0"+i+":00");
					}
					
					st.executeUpdate();
				}											
			}
			finally
			{
				dateFormat = new SimpleDateFormat("yyyy/MM/dd");
				dateFormat.setTimeZone(TimeZone.getTimeZone("IST"));
				dat = new Date();
				da=dateFormat.format(dat);
				cal = Calendar.getInstance(); 
				cal.setTime(dat); 
				cal.add(Calendar.DATE, -1);
				dat = cal.getTime();				
				String prev=dateFormat.format(dat),prevdate="";
				//out.println(prev+"hrllo");
				d=prev.split(" ");
				date1=d[0];
				for(int i=0;i<date1.length();i++)
				{
					if(date1.charAt(i)=='/')
					{
						prevdate+="_";
					}
					else
					{
						prevdate+=date1.charAt(i);
					}
				}
				//out.println(prevdate);
				try{
				st=c.prepareStatement("drop table upcoming_"+prevdate);
				st.execute();
				}
				catch(Exception e){
					//out.println(e.toString());
					e.printStackTrace();
					//response.sendRedirect("Home.jsp");
					}
			
			}
		}
		catch(Exception e)
		{
			//System.out.println(e.toString());
			e.printStackTrace();
			//response.sendRedirect("Home.jsp");
		}
	}
	public String getRandomString()
	{
		String req="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnoprstuvwxyz01234576789",c="";
		int len=req.length();
		for(int i=1;i<=40;i++)
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
}
