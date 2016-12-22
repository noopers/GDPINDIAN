package logic_servlets;

import java.awt.AWTException;
import java.awt.Rectangle;
import java.awt.Robot;
import java.awt.Toolkit;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sun.misc.BASE64Decoder;

@WebServlet("/TakeScreenshot")
public class TakeScreenshot extends HttpServlet {

	static { /* works fine! ! */
	      System.setProperty("java.awt.headless", "true");
	      
	      /* ---> prints true */
	    }
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		/*Rectangle screenRect = new Rectangle(Toolkit.getDefaultToolkit().getScreenSize());
		BufferedImage capture = null;		
		try {
			capture = new Robot().createScreenCapture(screenRect);
		
		HttpSession ses=request.getSession();
		
		String uid=(String)ses.getAttribute("uid");
		String c=request.getParameter("c");
		String c_name="dfd";
		String path=getServletContext().getRealPath("/")+"total_hosted_mcq_contest";
		PrintWriter out=response.getWriter();
		out.println(path);
		File f=new File(path);
		if(!f.exists())
		{
			f.mkdir();
		}
		path+="/"+c_name;
		f=new File(path);
		if(!f.exists())
		{
			f.mkdir();
		}
		path+="/"+uid;
		f=new File(path);
		if(!f.exists())
		{
			f.mkdir();
		}
		path+="/image"+c+".bmp";
		System.out.println(path);
		ImageIO.write(capture, "bmp", new File(path));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//response.sendRedirect("Home.jsp");
		}*/
		
	/*	try { 
			StringBuffer buffer = new StringBuffer(); 
			Reader reader = request.getReader(); 
			int current; 
			while((current = reader.read()) >= 0) 
				buffer.append((char) current); 
			String data = new String(buffer); 
			data = data.substring(data.indexOf(",") + 1); 
			System.out.println("PNG image data on Base64: " + data); 
			FileOutputStream output = new FileOutputStream(new File("E:/qwerty" + ".png")); 
			output.write(new BASE64Decoder().decodeBuffer(data)); 
			output.flush(); 
			output.close(); 
			} 
		catch (Exception e) {
			e.printStackTrace(); 
			}

		*/
	}

}
