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
<link rel="shortcut icon" href="imagesForGDPI/logo.jpg" />
<title>PastGD</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script>
function join_hosted_gd(){
	var q=document.getElementById("codeid").value;
	window.location="Hosted_gd_Room.jsp?key="+q;
}
$(document).ready(function(){
	var y=0;

	
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
function join_hosted_gd(){
	var q=document.getElementById("codeid").value;
	window.location="Hosted_gd_Room.jsp?key="+q;
}
</script>
<link href="css/bootstrap.min.css" rel="stylesheet" />
<style>
        .carousel_image{
            width:100%;
            height: 100px;
        }
        .nav-top-elements{
        	float:right;
    }
		.carousel-caption-heading{
			color:rgb(0,0,0);
		}
		.carousel-caption-body{
			color:rgb(0,0,0);
		}
		.image-circular{
			background-repeat: no-repeat;
		    background-position: 50%;
		    border-radius: 50%;
		    width: 50%;
		    height: 200px;
		    display: block;
    		margin-left: auto;
    		margin-right: auto;
		}
		.align-center{
			display: block;
    		margin-left: auto;
    		margin-right: auto;
		}
		.nav-head:HOVER {
			color:rgba(0,0,0,1);
		}
		.body-style-gdroom{
			background-color: rgba(0,0,0,0.8);
		}
		.none_for_gdtable{
			background-color: white
		}	
		@media screen and (max-width:1024px){
			.add-div-left{
				display:none;
			}
			.add-div-right{
				
			}
			.add-div-bottom{
				
			}			
		}
		@media screen and (max-width:768px){
			.gd-links {
				margin-top:0px;				
			}
			.footer-copyright{
				margin-top:0px;
				margin-bottom:10px;
				display:block;
			}
		}
		@media screen and (max-width:480px){
			.gd-links {
				margin-top:-10px;
				font-size: 12px;
				margin-bottom:10px;					
			}
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
			.gd-links {
				margin-top:-10px;
				font-size: 10px;
				margin-bottom: 10px;						
			}
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
			.footer-a-links a{
			color:rgba(179,179,179,0.5);
		}
		.footer-a-links a:HOVER{
			color:white;				
		}	
    </style>
</head>
<body class="">
<% String name=(String)session.getAttribute("name");
String email=(String)session.getAttribute("email");
String uid=(String)session.getAttribute("uid");
if(name!=null)
{
	try{
		String date="",time="";
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		dateFormat.setTimeZone(TimeZone.getTimeZone("IST"));
		Date dat = new Date();
		String da=dateFormat.format(dat);
		Calendar cal = Calendar.getInstance(); 
		cal.setTime(dat); 
		cal.add(Calendar.DATE, 1);
		dat = cal.getTime();
		String nda=dateFormat.format(dat);
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
		//out.println(time);
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
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://mysql16670-gdpindia.cloud.cms500.com/WATAForAll","root","PRKakz31968");
		PreparedStatement st=null;
		ResultSet  rs=null;
		
%>
		<div>
	<nav class="navbar navbar-static-top navbar-inverse" style="position: fixed;width:100%;">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
          
              </button>
              <a class="navbar-brand" href="Home.jsp">gDPinDIa.com</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
              <ul class="nav navbar-nav nav-top-elements">
                <li class="active nav-top-elements"><a href="Home.jsp">Home</a></li>
                <li class="dropdown nav-top-elements">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">GD<span class="caret"></span></a>
                  <ul class="dropdown-menu">
                    <li><a href="UpcomingGD.jsp">gdpindia GD</a></li>
                    <li><a href="#join-hosted-gd" data-toggle="modal" data-backdrop="static" data-keyboard="false">Join Hosted GD</a></li>                                                     
                  </ul>
                </li>
                
                <li class="dropdown nav-top-elements">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Host<span class="caret"></span></a>
                  <ul class="dropdown-menu">
                    <li><a href="HostMCQDetail.jsp">Host Your MCQ</a></li>
                    <li><a href="HostGD.jsp">Host Your GD</a></li>                                                     
                  </ul>
                </li>
                
                
                
                <li class="nav-top-elements"><a href="MCQ.jsp?type=java" class="nav-head">MCQ,s</a></li>
                <li class="nav-top-elements"><a href="#contest" class="nav-head" data-toggle="modal" data-backdrop="static" data-keyboard="false">Contest</a></li>
             <!--     <li class="nav-top-elements"><a href="ContactUs.jsp">Contact Us</a></li>
               --> <li class="nav-top-elements"><a href="Forum.jsp">Forum</a></li>
               <li class="nav-top-elements"><a href="ProgSoln.jsp?c_month=january_16&c_name=long&c_ques=a.txt">Start Programming</a></li>
                <!--<li class="dropdown nav-top-elements">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Quick Access <span class="caret"></span></a>
                  <ul class="dropdown-menu">
                    <li><a href="#">PI</a></li>
                    <li><a href="#">GD</a></li>
                    <li><a href="#">Mock Papers</a></li>
                    <li role="separator" class="divider"></li>
                    <li class="dropdown-header">Additional Info</li>                    
                    <li><a href="#">Forum</a></li>
                  </ul>
                </li> -->  
                <%if(name!="" && name!=null)
                	{
                	%>
                	
                	
                	 <li class="dropdown nav-top-elements">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Welcome <%=name%><span class="caret"></span></a>
                  <ul class="dropdown-menu">
                    
                    <li><a href="#changepassword" data-toggle="modal" data-backdrop="static" data-keyboard="false">Change password</a></li>                                                     
                <li><a href="Logout">Logout</a></li>
                
                
                  </ul>
                </li>
                	
                	
                	
                	
                	
                <!--  	<li id="nav-username"><a>Welcome<b style="font-size: 14px;">   <%=name%></b></a></li>
                	<li><a href="Logout">Logout</a></li>-->
                	<%
                	}
                	else
                	{%>             
                <li class="nav-top-elements"><a href="#login" data-toggle="modal" data-backdrop="static" data-keyboard="false">Login</a></li>
              	<%} %>
              </ul>
            </div>
          </div>
        </nav>
       </div>
           
      <div class="modal fade" id="changepassword" tabindex="-1" role="dialog" aria-labelledby="myModal-label" aria-hidden="true">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModal-label">Change password</h4>
                    </div>
                    <div class="modal-body">      
                    <form action="changepassword">             
                        <label class="control-label" for="path" >Enter Your previous password</label>
                        <input type="password" required class="form-control" name="previouspassword" id="lname" placeholder="Enter Your old password"  value="">
                        <br>
                       
                       <input type="password" required class="form-control" name="newpassword" id="lname" placeholder="Enter Your new password"  value="">
                  <br>
                  <!--        <button type="button" class="btn btn-success" onclick="LoginServlet()" style="margin-left:105px;">LogIn</button>                       
             -->
             
             
             <input type="submit" class="btn btn-success" value="changepassword" style="margin-left:105px;">
             </form>
             
             
                    </div>                    
                   <hr>                  
                    
                 
                    
                    
                </div>
            </div>
        </div> 
        
        
        <br><br><br>
        <br><br><br>
        <div class="gd-links">
        <a href="UpcomingGD.jsp" style="text-decoration: none ;color:rgba(100,100,100,.7)">Upcoming</a>&nbsp;&nbsp;|
		<a href="RegisteredGD.jsp" style="text-decoration: none ;color:rgba(100,100,100,.7)">Registered</a>&nbsp;&nbsp;|
		<a href="#" style="text-decoration: none ;color:rgba(100,100,100,.7)">Past</a>&nbsp;&nbsp;|
		<a href="HostGD.jsp" style="text-decoration: none ;color:rgba(100,100,100,.7)" target="_blank">Host Your GD</a>&nbsp;&nbsp;|
		<a href="GDTips.jsp" style="text-decoration: none ;color:rgba(100,100,100,.7)">GD tips</a>
     	</div>
        <q style="float:right;margin-right: 10px;color:rgba(200,200,200,1)"><i>You don't always need a plan.<br>Sometimes you just need to breathe,trust,<br>let go and see what happens.</i></q>
        
<div class="container" style="min-height: 500px;">
	<div class="row">	
		<div class="col-md-2 col-lg-2 col-xs-12 col-sm-12">
			<div style="margin-right:10px;padding-rigth:10px;margin-top: 100px;" class="add-div-left">
		
			</div>		
		</div>	
		<div class="col-md-8 col-lg-8 col-sm-12 col-xs-12" style="min-height: 425px;">
			<h1 style="text-align: center"><kbd>Past GD's</kbd></h1>			
			<div>
			<table class="table">                       	                                
            	<tr class="active">
	            	<td class="col-md-3 col-xs-3 col-lg-3 col-sm-3">
	            	<strong><h4>Srno</h4></strong>
	            	</td>
	            	<td class="col-md-3 col-xs-3 col-lg-3 col-sm-3">
	            	<strong><h4>Gd Id</h4></strong>
	            	</td>	            	
	            	<td class="col-md-3 col-xs-3 col-lg-3 col-sm-3">
	            	<strong><h4>Date</h4></strong>
	            	</td>
	            	<td class="col-md-3 col-xs-3 col-lg-3 col-sm-3">
	            	<strong><h4>Time</h4></strong>
	            	</td>
					<td class="col-md-3 col-xs-3 col-lg-3 col-sm-3">
	            	<strong><h4>Result</h4></strong>
	            	</td>   
            	</tr>
            </table>
            <table class="table table-hover">	                            				
				<%try{
				//out.println(date+" "+uid+" "+nextdate);
				st=con.prepareStatement("select * from "+uid+"_future minus (select * from "+uid+"_future where gd_date=? or gd_date=?)");
				st.setString(1, date);
				st.setString(2, nextdate);
				rs=st.executeQuery();
				}catch(Exception e){e.printStackTrace();}				
				String context_array[]={"active","success","warning","info","danger","none_for_gdtable"};
				String table_rows_context="";
				int table_row_context_counter=0,table_row_context_even_odd=0;;
				int m=0;
				while(rs.next())
				{
						m++;
						if(table_row_context_even_odd%2==0)
						{						
						table_rows_context="warning";
						table_row_context_even_odd=1;
						}
						else
						{
							table_rows_context="none_for_gdtable";
							table_row_context_even_odd=0;
						}						
				%>
					<tr class="<%=table_rows_context%>">
					<td class="col-md-3 col-lg-3 col-xs-12 col-sm-12">
					<b><%=m%></b>
					</td>
					<td class="col-md-3 col-lg-3 col-xs-12 col-sm-12">
					<b><%=rs.getString(2)%></a>
					</b>					
					</td>	
					<td class="col-md-3 col-lg-3 col-xs-12 col-sm-12">
					<b><%=rs.getString(4)%></b>
					</td>	
					<td class="col-md-3 col-lg-3 col-xs-12 col-sm-12">
					<strong><%=rs.getString(3)%></strong>
					</td>
					<td class="col-md-3 col-lg-3 col-xs-12 col-sm-12">
					<strong><%=rs.getString(5)%></strong>
					</td>	
					</tr>												
				<%
				}
				%>				
        	</table>
        	</div>
			</div>
		<div class="col-md-2 col-lg-2 col-xs-12 col-sm-12" style="padding-top:10px;magin-top:10px;" class="add-div-right">
			
			</div>
		</div>
	</div>	
	
	
   <br><br><br><br>
           <br><br><br><br>
    <footer class="footer">
		<div>
			<div class="footer-top-span">
				<!-- <span><em>Quick Links</em></span>-->
			</div>
			<div class="container-fluid footer-a-links" style="background-color:rgba(0,0,0,0.8);color:rgba(179,179,179,1);">
				<div class="row">
					<div class="col-md-2 col-lg-2 col-sm-2 col-sm-12">
					<ul>
						<strong>MCQ</strong><br>
						<li><a href="MCQ.jsp?type=c">C</a></li>
						<li><a href="MCQ.jsp?type=c__">C++</a></li>
						<li><a href="MCQ.jsp?type=java">Java</a></li>
						<li><a href="MCQ.jsp?type=reasoning">Reasoning</a></li>
						<li><a href="MCQ.jsp?type=gk">GK</a></li>
						<li><a href="MCQ.jsp?type=english">English</a></li>	
					</ul>
					</div>
					<div class="col-md-2 col-lg-2 col-sm-2 col-sm-12">
					<ul>
						<strong>Group Discussion</strong><br>
						<li><a href="UpcomingGD.jsp">Register for GD</a></li>
						<li><a href="RegisteredGD.jsp">Enter in a GD</a></li>
						<li><a href="PastGD.jsp">Past GD</a></li>	
					</ul>	
					</div>
					<div class="col-md-2 col-lg-2 col-sm-2 col-sm-12">
						<ul>
						<strong>Hosting</strong><br>
							<li><a href="HostGD.jsp">Host your gd</a></li>
							<li><a href="HostMCQDetail.jsp">Host your mcq contest</a></li>
							
							<li><a href="#join-hosted-gd" data-toggle="modal" data-backdrop="static" data-keyboard="false">Participate in gd</a></li>
							<li><a href="#contest" data-toggle="modal" data-backdrop="static" data-keyboard="false">Participate in mcq contest</a></li>
						</ul>	
					</div>
					<div class="col-md-2 col-lg-2 col-sm-2 col-sm-12">
						<ul>
						<strong>Forum</strong><br>
						<li><a href="ForumDiscussion.jsp?gdid=gd_topic_3&gd_heading=Dowery&gd_topic=Dowery%20a%20Menace&posted_date=February%2005%20,%202016&posted_by_name=Shivank%20Agarwal">Join Forum</a></li>
						<li><a href="Forum.jsp">Post Topic in Forum</a></li>	
						</ul>					
					</div>
			<div class="col-md-2 col-lg-2 col-sm-2 col-sm-12">
					<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script src="http://www.google.com/uds/solutions/dynamicfeed/gfdynamicfeedcontrol.js"
type="text/javascript"></script>

<style type="text/css">


</style>
<script type="text/javascript">
function load() {
var feed ="http://feeds.bbci.co.uk/news/world/rss.xml";
new GFdynamicFeedControl(feed, "feedControl");

}
google.load("feeds", "1");
google.setOnLoadCallback(load);
</script>
						  <div id="body" class="panel panel-primary" style="width:100%;">
						  <div class="panel-heading">Latest New From Us</div>
							<div class="panel-body">
								<div class="scrollbar" id="scrollbarid">
							    <div id="content">
							    <div id="feedControl"></div>
							    </div>
							    </div>
							</div>
						</div>									
					</div>		
					<div class="col-md-2 col-lg-2 col-sm-2 col-sm-12">
						<ul>
						<strong>Others</strong><br>						
						<li><a href="ProgSoln.jsp?c_month=january_16&c_name=long&c_ques=a.txt">Start Programming</a><br></li>											
						<li><a href="GDTips.jsp">GD Tips</a></li>
						<li><a href="Host_Invite.jsp">Instructions To Invite Others to Hosted GD</a><br>
						<li><a href="AboutUs.jsp">About Us</a></li>
						<li><a href="ContactUs.jsp">Contact Us</a>					
						<li><a href="#top">Back To Top</a></li>
						</ul>			
					</div>
				</div>
			</div>
			
	      <div class="container" style="z-index: 100;">
	      	<hr>	      	
	        <div style="display:inline;">
	        	<span class="footer-policies"><b>Policies :</b></span>
	        	<span class="footer-links">
	        	<a href="TermsOfUse.jsp" style="text-decoration: none;color:rgba(0,0,0,0.7);">Terms of use</a>
	        	|
	        	<a href="Security.jsp" style="text-decoration: none;color:rgba(0,0,0,0.7);">Security</a>
	        	|
	        	<a href="Help.jsp" style="text-decoration: none;color:rgba(0,0,0,0.7);">Help</a>
	        	</span>
	        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        	<span class="footer-copyright">© 2013-2016 <a href="Home.jsp" >gdpindia.com</a></span>
	        </div>
	        <div style="float:right;display:inline;"> 
	        <span class="footer-follow"><b>follow us on :</b></span>
		        <a href="https://www.facebook.com/WATAForAll/?skip_nax_wizard=true"><img id="fb" src="imagesForGDPI/fb-1.png" width=35 height=35></a>   
		        <a href="https://twitter.com/WATAForAll"><img id="twitter" src="imagesForGDPI/twitter-1.png" width=45 height=35> </a> 
		        <a href="https://en.wikipedia.org/wiki/Gdpindia"><img id="google" src="imagesForGDPI/google-1.png" width=35 height=35> </a>
		        <a href="https://www.youtube.com/channel/UCHquW0FXVBNEpZ0pfWIcjLQ"><img id="youtube" src="imagesForGDPI/youtube-1.png" width=35 height=35></a>
	        </div>	        
	        <hr>
	      </div>
	      </div>
      </footer>
      
       
        <div class="modal fade" id="join-hosted-gd" tabindex="-1" role="dialog" aria-labelledby="myModal-label" aria-hidden="true">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModal-label">Enter Your code id</h4>
                    </div>
                    <div class="modal-body">                   
                        <input type="text" class="form-control" id="codeid" placeholder="Enter Your Id" value="">                        
                        <br>
                        <button type="button" class="btn btn-success" onclick="join_hosted_gd()" data-dismiss="modal" style="margin-left:105px;">Join</button>
                    </div>                                        
                </div>
            </div>
        </div>  
        
        
            
      <div class="modal fade" id="contest" tabindex="-1" role="dialog" aria-labelledby="myModal-label" aria-hidden="true">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModal-label">Join MCQ Contest</h4>
                    </div>
                    <div class="modal-body">      
                    <form action="ContestDirectingPage">             
                        <label class="control-label" for="path" >Enter Contest Name</label>
                        <input type="text" required class="form-control" name="contestname" id="contestname" placeholder="Enter Your Id"  value="">
                        <label class="control-label" for="key">Enter your Key</label>
                        <input type="text" required class="form-control" name="contestkey" id="contestkey" placeholder="Enter Your Password" value="">
                        <br>
                  <!--        <button type="button" class="btn btn-success" onclick="LoginServlet()" style="margin-left:105px;">LogIn</button>                       
             -->
             <input type="submit" class="btn btn-success" value="Enter" style="margin-left:105px;">
             </form>
             
                    </div>                    
                  
                </div>
            </div>
        </div> 
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
<%
}
%> 
<script src="Scripts/jquery-1.9.1.min.js"></script>  
<script src="js/bootstrap.min.js"></script> 
</body>
</html>