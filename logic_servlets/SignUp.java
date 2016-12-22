package logic_servlets;

import java.awt.image.BufferedImage;
import java.awt.image.RenderedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

import javax.imageio.ImageIO;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
	
	String senderemail="",passkey="gdpi_05_02_2016";
	int total_users=0;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email,name,pno,clg,pass,uid,date,tempid;		
		email=request.getParameter("email");
		name=request.getParameter("name");
		pno=request.getParameter("pno");
		clg=request.getParameter("clg");
		pass=request.getParameter("pass");
		date=request.getParameter("date");
		tempid=getRandomString();
		uid=null;
		InputStream is=null;
		PrintWriter out=response.getWriter();
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection c=DriverManager.getConnection("jdbc:mysql://mysql16670-gdpindia.cloud.cms500.com/WATAForAll","root","PRKakz31968");
		 try
		 {
		 PreparedStatement st=c.prepareStatement("create table gdpindia_users(email varchar(50) ," +
		 		"name varchar(500)," +
		 		"password  varchar(50),dob varchar(15)," +
		 		"dp blob,userid varchar(500),pno varchar(20)," +
		 		"college varchar(100),tempid varchar(50)," +
		 		"verify varchar(1),PRIMARY KEY (email))");
		 st.execute();		 
		 }
		 catch(Exception e)
		 {
			 System.out.println(e);
		 }
		 finally
		 {
			 try
			 {
				 PreparedStatement st1=c.prepareStatement("create table total_users(counter int)");
				 st1.execute();
				 st1=c.prepareStatement("insert into total_users values(?)");
				 st1.setInt(1, 0);
				 st1.executeUpdate();
			 }
			 finally
			 {
				 
				 PreparedStatement st1=c.prepareStatement("select * from total_users");
				 ResultSet rs1=st1.executeQuery();
				 if(rs1.next())
				 {
					 total_users=rs1.getInt(1);
				 }
				 total_users++;
				 uid="User"+total_users+""+getRandomInt();
				 st1=c.prepareStatement("update total_users set counter=?");
				 st1.setInt(1, total_users);
				 st1.executeUpdate();
			 /*ByteArrayOutputStream os = new ByteArrayOutputStream();
			 BufferedImage image = null;
			 try {
				 String path=getServletContext().getRealPath("/");
			     image = ImageIO.read(new File(path+"imagesForGDPI/user1.png"));
			 } catch (IOException e) {
				 System.out.println(e);
			 }
			 //System.out.println("Hello");
			 ImageIO.write(image,"png", os);
			 //System.out.println("Hello");
			 is = new ByteArrayInputStream(os.toByteArray());
			 */
			 //System.out.println("Hello");
			 PreparedStatement st=c.prepareStatement("insert into gdpindia_users(email,name,password,dob,userid,pno,college,tempid,verify) values(?,?,?,?,?,?,?,?,?)");
			 st.setString(1, email);
			 st.setString(2, name);
			 st.setString(3, pass);
			 st.setString(4, date);
			 //st.setBlob(5,is);
			 st.setString(5, uid);
			 st.setString(6, pno);
			 st.setString(7, clg);
			 st.setString(8, tempid);
			 st.setString(9, "N");			 
			 st.executeUpdate();		 			 
			 /*st=c.prepareStatement("create table "+uid+"_past(srno int,gdid varchar(50),gd_time varchar(30),gd_date varchar(50),result varchar(50))");
			 st.executeUpdate();
			 System.out.println("Hello");*/
			 st=c.prepareStatement("create table "+uid+"_future(srno int,gdid varchar(50) ,gd_time varchar(30),gd_date varchar(50),result varchar(50),PRIMARY KEY (gdid))");
			 st.execute();
			 sendMail(email, name,tempid,clg,uid);
			 HttpSession ses=request.getSession();
			 //ses.setAttribute("email", email);
				//ses.setAttribute("name", name);
				//ses.setAttribute("uid", uid);
				ses.setAttribute("signupinfomodal", "You Have Been Successfully SignUp.Go To Your gmail Account and Verify Yourself");
				
			 }
			 
		 }
		}
		catch(Exception e)
		{
			//out.println(e.toString());
			//System.out.println(e);
			e.printStackTrace();
			//response.sendRedirect("Home.jsp");
		}
		response.sendRedirect("Home.jsp");
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
	public void sendMail(String email,String name,String temp,String clg,String uid)
	{
	getEmailId();
	String q="";
	Properties prop=new Properties();
	/*prop.put("mail.smtp.host","smtp.gmail.com");
	prop.put("mail.smtp.user",senderemail);
	prop.put("mail.smtp.password",passkey);
	prop.put("mail.smtp.port","465");
	prop.put("mail.smtp.auth",true);*/
	try
	{
	Session ss=Session.getDefaultInstance(prop,null);
	InternetAddress to=new InternetAddress(email);
	InternetAddress from=new InternetAddress(senderemail);
	MimeMessage msg=new MimeMessage(ss);
	msg.setSubject("Verification Mail");
	msg.setFrom(from);	
	msg.setContent("This is verification mail from gdpindia . Go to the below link and verify yourself or you can directly paste the link in the url . Link---->   http://www.gdpindian.com/VerifyMail?q="+temp+"&e="+email+"&n="+name+"&c="+clg+"&u="+uid,"text/html; charset=utf-8");
	msg.setRecipient(Message.RecipientType.TO,to);
	Transport trans=ss.getTransport("smtps");
	trans.connect("smtp.gmail.com",senderemail,passkey);
	trans.sendMessage(msg,msg.getAllRecipients());
	trans.close();
	}
	catch(Exception e)
	{
		System.out.print(e);
	}
	}

	private void getEmailId() {
		// TODO Auto-generated method stub
		senderemail="";	
		int c=total_users;
		int x=c/50;
		x=x%3;
		switch(x)
		{
		case 0:
			senderemail="gdpindiapvtLtd@gmail.com";
			break;
		case 1:
			senderemail="gdpindiapvtLtd.verify1@gmail.com";
			break;
		case 2:
			senderemail="gdpindiapvtLtd.verify2@gmail.com";
			break;
		}
	}
}
