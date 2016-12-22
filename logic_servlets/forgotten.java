package logic_servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

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

@WebServlet("/forgotten")
public class forgotten extends HttpServlet {

	String senderemail="gdpindiapvtLtd.fp@gmail.com",passkey="gdpi_05_02_2016";
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		
		String email=request.getParameter("email");
		
		
		
		
		if(email!=null){
			
			try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://mysql16670-gdpindia.cloud.cms500.com/WATAForAll","root","PRKakz31968");
		
			
			PreparedStatement st=con.prepareStatement("select * from gdpindia_users where email=? ");

		st.setString(1,email);
		ResultSet rs=	st.executeQuery();
			if(rs.next()){
				
				
				String password=rs.getString(3);
			sendMail(email, password);
				

			HttpSession session = request.getSession();
			session.setAttribute("signupinfomodal", "Your new Password has been mailed to you.");
	//		response.sendRedirect("Home.jsp");
				
				
				
			}
			
			
			
			
			

			}
			
			
			
			catch(Exception e){
				//response.sendRedirect("Home.jsp");
			}
			
			
			
			
			response.sendRedirect("Home.jsp");
		}
		
		
		
	}

	
	public void sendMail(String email ,String password)
	{
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
	msg.setSubject("Forget Password");
	msg.setFrom(from);	
	msg.setContent("Your password is "+ password ,"text/html; charset=utf-8");
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

	
	
	
	
}
