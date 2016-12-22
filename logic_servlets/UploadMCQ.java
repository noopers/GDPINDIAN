package logic_servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

@WebServlet("/UploadMCQ")
public class UploadMCQ extends HttpServlet {
	
	private static final String DATA_DIRECTORY = "data";
    private static final int MAX_MEMORY_SIZE = 1024 * 1024 * 2;
    private static final int MAX_REQUEST_SIZE = 1024 * 1024;
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fileName,path;
		path=getServletContext().getRealPath("/")+"uploadedQues";
		System.out.print(path);
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);

        if (!isMultipart) {
            return;
        }

        // Create a factory for disk-based file items
        DiskFileItemFactory factory = new DiskFileItemFactory();

        // Sets the size threshold beyond which files are written directly to
        // disk.
        factory.setSizeThreshold(MAX_MEMORY_SIZE);

        // Sets the directory used to temporarily store files that are larger
        // than the configured size threshold. We use temporary directory for
        // java
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

        // constructs the folder where uploaded file will be stored
        String uploadFolder;
        /*uploadFolder= getServletContext().getRealPath("")
                + File.separator + DATA_DIRECTORY;*/
        uploadFolder=path;

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);

        // Set overall request size constraint
        upload.setSizeMax(MAX_REQUEST_SIZE);

        try {
            // Parse the request
            List items = upload.parseRequest(request);
            Iterator iter = items.iterator();
            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();

                if (!item.isFormField()) {
                    fileName = new File(item.getName()).getName();
                    String filePath = uploadFolder + File.separator + fileName;
                    
                    //out.println(filePath);
                    // saves the file to upload directory
                    
    						    					
    					File uploadedFile = new File(filePath);
    					item.write(uploadedFile);    					    					
    					getServletContext().getRequestDispatcher("/HostMCQ.jsp").forward(
    		                    request, response);
    				
                }
            }
            // displays done.jsp page after upload finished
            

        } catch (FileUploadException ex) {
            //throw new ServletException(ex);   
        	System.out.println(ex.toString());
        } catch (Exception ex) {
            //throw new ServletException(ex);
        	System.out.println(ex.toString());
        }

	}

}
