<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.util.*" %>
    <%@ page import="java.util.Date" %>
    <%@ page import="java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HostGD</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script>

$(function () {
	  $('[data-toggle="tooltip"]').tooltip()
	})
$(document).ready(function(){
	var y=0;
	var x=	setInterval(function () {
        $("#button_forum").css('opacity',y/10);
        if(y!=10){
        	y=y+1;
        }
        else{
        	y=1;
        }
    },300);
    	    
	$("#button_forum").hover(function(){		
		clearInterval(x);		
	});
	
	$("#fb").mouseenter(function() {
		$(this).attr('src','imagesForGDPI/fb-2.png');
	});
	$("#fb").mouseleave(function() {
		$(this).attr('src','imagesForGDPI/fb-1.png');
	});
	$("#twitter").mouseenter(function() {
		$(this).attr('src','imagesForGDPI/twitter-2.png');
	});
	$("#twitter").mouseleave(function() {
		$(this).attr('src','imagesForGDPI/twitter-1.png');
	});
	$("#google").mouseenter(function() {
		$(this).attr('src','imagesForGDPI/google-2.png');
	});
	$("#google").mouseleave(function() {
		$(this).attr('src','imagesForGDPI/google-1.png');
	});
	$("#youtube").mouseenter(function() {
		$(this).attr('src','imagesForGDPI/youtube-2.png');
	});
	$("#youtube").mouseleave(function() {
		$(this).attr('src','imagesForGDPI/youtube-1.png');
	});	
});
</script>
<link href="css/bootstrap.min.css" rel="stylesheet" />
<style>
       
        .nav-top-elements{
        	float:right;
        }
        li:HOVER {
			background-color:rgb(230,230,230); 
		}
		.align-center{
			display: block;
    		margin-left: auto;
    		margin-right: auto;
		}
		.nav-head:HOVER {
			color:rgba(0,0,0,1);
		}
		@media screen and (max-width:1024px){
					
		}
		@media screen and (max-width:768px){
			
			.footer-copyright{
				margin-top:0px;
				margin-bottom:10px;
				display:block;
			}
		}
		@media screen and (max-width:480px){
			
			.footer-copyright{
				margin-top:0px;
				margin-bottom:10px;
				display:block;
			}
			.footer-follow{
				font-size: 15px;				
			}
		}
		@media screen and (max-width:360px){
			
			.footer-links{
				font-size: 13px;
				display:block;
			}
			.footer-copyright{
				margin-top:0px;
				margin-bottom:10px;
				display:block;
			}
			.footer-follow{
				font-size: 15px;
				display: block;
				margin-left: -75px;
			}
		}
		.forum-row{
			margin-top:100px;
		}
    </style>
</head>
<body>
<%
String name=(String)session.getAttribute("name");
String email=(String)session.getAttribute("email");
String uid=(String)session.getAttribute("uid");
if(name!=null)
{
try{
Class.forName("oracle.jdbc.driver.OracleDriver");		
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","SYSTEM","123");	
PreparedStatement st=null;
ResultSet  rs=null;
DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
Date dat = new Date();
String d=dateFormat.format(dat);
int m=Integer.parseInt(d.substring(5,7));
String month="";
switch(m)
{
case 1:month="January";
break;
case 2:month="February";
break;
case 3:month="March";
break;
case 4:month="April";
break;
case 5:month="May";
break;
case 6:month="June";
break;
case 7:month="July";
break;
case 8:month="August";
break;
case 9:month="September";
break;
case 10:month="October";
break;
case 11:month="November";
break;
case 12:month="December";
break;
}
String date=month +" "+d.substring(8)+" , "+d.substring(0,4);
%>
	<div class="container" style="margin-top:-80px;">
		<div class="row  forum-row">
			<div class="col-md-2 col-lg-2 col-sm-2 col-xs-12">				
								
			
			<div class="row">
					<label>My Hosted Contests...</label>
					<p>You can go here to edit your contest and view ranks</p>
					<%	
					try{
						st=con.prepareStatement("select * from host_programming_table where user_email=?",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
						st.setString(1, uid);
						rs=st.executeQuery();
						String c_name="",c_title="";
						if(rs.last())
						{
							System.out.print("wow");
						c_name=rs.getString(1);
						c_title=rs.getString(2);
					%>
						<a href="DisplayHostedProgrammingQuestion.jsp?c_name=<%=c_name%>&by=<%=email%>"><%=c_title %></a>
					<%	
						}
						while(rs.previous())
						{
							c_name=rs.getString(1);
							c_title=rs.getString(2);
					%><br>
						<a href="DisplayHostedProgrammingQuestion.jsp?c_name=<%=c_name%>&by=<%=email%>"><%=c_title %></a>
					<%
						}
					}
					catch(Exception e){e.printStackTrace();}
					%>
				</div>
				<div class="row">					
					<strong><h4>Others hosted contests</h4></strong>
					<%	
					try{
						st=con.prepareStatement("select * from host_programming_table minus select * from host_programming_table where user_email=?");
						st.setString(1, uid);
						rs=st.executeQuery();
						String c_name="",c_title="",by="";
						
						while(rs.next())
						{
							c_name=rs.getString(1);
							c_title=rs.getString(2);
							by=rs.getString(10);
					%><br>
						<a href="DisplayHostedProgrammingQuestion.jsp?c_name=<%=c_name%>&by=<%=by%>"><%=c_title %></a>
					<%
						}
					}
					catch(Exception e){e.printStackTrace();}
					%>			
				</div>
			</div>
			<div class="col-md-7 col-lg-7 col-sm-7 col-xs-12">
				<div class="row">
					<span style="text-align: center;"><b style="font-size:52px;text-align: center;"><p style="text-align: center;">GDPINDIA</p></b></span>
					<p style="color:rgba(100,100,100,1);font-size: 32px;">Host Your Own Contest</p>
					<p style="color:rgba(200,200,200,1);font-size: 20px;">The official site to host contest for your college fests and other events....Just One click away!!:)</p>
				</div>				
				
				<!-- <p style="color:rgba(200,200,200,1);font-size: 20px;font-family:serif;"><%=date%></p> -->
				<div class="row">					
					<form class="form" action="HostProgrammingDB">
  						<div class="form-group">					    	
					    	<input type="text" class="form-control" name="contest_title" placeholder="Enter contest title" style="width:50%;">
					  	</div>
					  <div class="form-group">    
					    	<textarea rows="5" cols="100" class="form-control" name="contest_desc" placeholder="Give Your Test description" style="width:90%;"></textarea>
					  </div>
					  <div class="form-group"> 
					  		<label>Start Date</label>    
					    	<input required type="date" class="form-control" name="contest_date" style="width:25%;">
					  </div>						  				 
					  <div class="form-group">
					  		<label>Start Time</label>    
					    	<input type="time" class="form-control" name="contest_time" style="width: 30%;">					    	
					   </div>	
					   <div class="form-group">
					  		<label>Duration</label>    
					    	<select name="contest_duration"><option value="0:30">00:30 hr</option><option value="1:00">1:00 hr</option><option value="1:30">1:30 hr</option><option value="2:00">2:00 hr</option><option value="2:30">2:30 hr</option><option value="3">3:00 hr</option></select>					    	
					   </div>						   
					   <div class="form-group">
					  		<label>Contested By</label>    
					    	<input type="text" class="form-control" name="contest_by" style="width: 40%;" placeholder="Your organisation /college name">					    	
					   </div>			  
					  <button type="submit" class="btn btn-success">Host</button>
					</form>
				</div>
				<div class="row">
					<!-- <a href="" class="btn btn-primary btn-lg">Participate in Discussion</a>-->
				</div>
			</div>
			<div class="col-md-3 col-lg-3 col-sm-3 col-xs-12">
				<div class="row">
					<div class="alert alert-info alert-dismissable">
						<h1>About</h1>			            
			            <strong>Gdpindia Forum!</strong> let you ask your queries and doubts regarding your gd <a href="#" class="alert-link">skills</a> ,effective <a href="#" class="alert-link">communication</a>.
			        </div>
				</div>
				<div class="row">
					<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>			
						<ins class="adsbygoogle"
			     		style="display:block"
			     		data-ad-client="ca-pub-6590006325388707"
			    		 data-ad-slot="9929133187"
			     		data-ad-format="auto"></ins>
					<script>
						(adsbygoogle = window.adsbygoogle || []).push({});
					</script>
				</div>
								
			</div>			
		</div>
	</div>
	<footer class="footer">
	      <div class="container" style="z-index: 100;">
	      	<hr>	      	
	        <div style="display:inline;">
	        	<span class="footer-policies"><b>Policies :</b></span>
	        	<span class="footer-links">
	        	<a href="#" style="text-decoration: none;color:rgba(0,0,0,0.7);">Terms of use</a>
	        	|
	        	<a href="#" style="text-decoration: none;color:rgba(0,0,0,0.7);">Security</a>
	        	|
	        	<a href="#" style="text-decoration: none;color:rgba(0,0,0,0.7);">Privacy</a>
	        	|
	        	<a href="#" style="text-decoration: none;color:rgba(0,0,0,0.7);">Help</a>
	        	</span>
	        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        	<span class="footer-copyright">© 2013-2016 <a href="#" >gdpindia.com</a></span>
	        </div>
	        <div style="float:right;display:inline;"> 
	        <span class="footer-follow"><b>follow us on :</b></span>
		        <img id="fb" src="imagesForGDPI/fb-1.png" width=35 height=35>   
		        <img id="twitter" src="imagesForGDPI/twitter-1.png" width=45 height=35>  
		        <img id="google" src="imagesForGDPI/google-1.png" width=35 height=35> 
		        <img id="youtube" src="imagesForGDPI/youtube-1.png" width=35 height=35>
	        </div>	        
	        <hr>
	      </div>
      </footer>
<%	
}
catch(Exception e)
{
}
}
else
{
	session.setAttribute("login", "f");
	response.sendRedirect("Home.jsp?");
%>
You are not logged in!!!
<%
}
%> 
<script src="Scripts/jquery-1.9.1.min.js"></script>
<script src="jquery.easing.min.js"></script>  
<script src="js/bootstrap.min.js"></script> 
</body>
</html>