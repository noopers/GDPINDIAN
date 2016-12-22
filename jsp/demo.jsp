<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="java.awt.*" %>
    <%@ page import="java.awt.image.BufferedImage" %>
    <%@ page import="java.awt.Robot.*" %>
    <%@ page import="java.io.File" %>
    <%@ page import="javax.imageio.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>
/*$(document).ready(function(){
	c_name=document.getElementById("contest_name");
	c=0;
	var y=	setInterval(function () {
		c++;
		if (window.XMLHttpRequest)
		  {
		  xmlhttp=new XMLHttpRequest();
		  }
		else
		  {
		  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");

		  }
		xmlhttp.onreadystatechange=function() {				
		  if (xmlhttp.readyState==4 && xmlhttp.status==200)
		    {				  
		    var res=xmlhttp.responseText;
		    //alert(res);	
		    //location.reload();
		    }
		}
		  xmlhttp.open("POST","TakeScreenshot?c="+c+"&c_name="+c_name,true);			
		  xmlhttp.send();	
    },1000*60);
	});*/
	</script>
	
	<script type="text/javascript"> 
		
		var video = document.getElementById('videoID'); 
		var canvas = document.getElementById('canvasID'); 
		var context = canvas.getContext('2d'); 
		
		window.URL = window.URL || window.webkitURL; 
		
		navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia;
		
		navigator.getUserMedia({ video : true 
			}, function(stream) { 
				video.src = window.URL.createObjectURL(stream); 
				}, function(e) { console.log('An error happened:', e); });

		function capture() { 
			context.drawImage(video, 0, 0, canvas.width, canvas.height); 
			};
			function send() { 
				var imageData = canvas.toDataURL(); 
				var xmlhttp = new XMLHttpRequest(); 
				xmlhttp.open("POST", "TakeScreenshot", true); 
				xmlhttp.send(imageData); 
				};

			 //http://mrbool.com/java-image-processing-capturing-images-with-java-and-html5/30659#ixzz42EnJUyZj
		
	</script>

Read more: http://mrbool.com/java-image-processing-capturing-images-with-java-and-html5/30659#ixzz42ElCCuUZ
</head>
<body>
<%= getServletContext().getRealPath("/")%>
<%
/*Rectangle screenRect = new Rectangle(Toolkit.getDefaultToolkit().getScreenSize());
BufferedImage capture = new Robot().createScreenCapture(screenRect);
ImageIO.write(capture, "bmp", new File(getServletContext().getRealPath("/")+"image.bmp"));
*/
%>
<div>
	<video id="videoID" autoplay style="border: 1px solid black;">
	</video>
</div> 

<div>
	<canvas id="canvasID" style="border: 1px solid black;"></canvas>
</div> 

<div> 
	<input type="button" value="Take photo" onclick="capture()" style="width: 200px; height: 30px;"/> 
	<input type="button" value="Send" onclick="send()" style="width: 200px; height: 30px;"/> 
</div>

Read more: http://mrbool.com/java-image-processing-capturing-images-with-java-and-html5/30659#ixzz42EkskldP
</body>
</html>