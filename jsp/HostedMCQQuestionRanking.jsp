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
<title>MySubmission</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
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
		
		@media screen and (max-width:1366px){
					/*#gd-started-div
					{
						display:none;
					}*/
					#image-xs{
				//display:none;	
				content:url('imagesForGDPI/gd.jpg');			
			}
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
			.footer-a-links a{
			color:rgba(179,179,179,0.5);
		}
		.footer-a-links a:HOVER{
			color:white;				
		}	
			
</style>
</head>
<body>
<%String email="",name="";
if(session!=null)
{
email=(String)session.getAttribute("email");
name=(String)session.getAttribute("name");
} %>
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
        
        
	        <br>
	        <br>
<%
String message =request.getParameter("message");
String type=request.getParameter("type");%>

     	
				<% if(message==null||message.equals("")){
}
else{
	%>
<script type="text/javascript">
$(window).load(function () {
$('#success-modal').modal('show');
});
</script>	
	<%
	//out.print("fghghdgh");
}
 %>
 
 <div class="modal fade" id="success-modal" tabindex="-1" role="dialog" aria-labelledby="myModal-label" aria-hidden="true">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header"> 
                    	<button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="success_modal_hide()">&times;</button>                       
                        <h4 class="modal-title" id="myModal-label"><%
                        if(message.equals("first")){
                        	
                        	out.print("Congrats Your response has been saved");
                        }
                        
                        else if(message.equals("notfirst")){
                        	
                        	out.print("sorry could not update response ");
                        }
                        
                        else if(message.equals("timeexpired")){
	 
	 
	 out.print("sorry you are late ");
 }  
                        else
                        {
                        	out.println(message);
                        }
                        
                        %></h4>
                    </div> 
                    <div class="modal-body"></div>                   
                </div>
            </div>
        </div>   
        
<%
try{
DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
dateFormat.setTimeZone(TimeZone.getTimeZone("IST"));
Date dat = new Date();
String cdate=dateFormat.format(dat);
long cms=dat.getTime();	
String ddate="";long dms=0,dur=0,ddur=0;


Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://mysql16670-gdpindia.cloud.cms500.com/WATAForAll","root","PRKakz31968");;	
PreparedStatement st=con.prepareStatement("select * from  host_mcq_table where contest_no=?");
st.setString(1,type );
//st.setString(2, contestkey);
boolean b=false;
ResultSet rs=st.executeQuery();
if(rs.next()){	
	b=true;
	ddate=rs.getString(4)+" "+rs.getString(5)+":00";
	dat=dateFormat.parse(ddate);
	dms=dat.getTime();			
	dur=cms-dms;	
	String durrrr=rs.getString(8);
	if(durrrr.equals("0:30"))
	{
		ddur=30*60*1000;
	}
	if(durrrr.equals("1:00"))
	{
		ddur=60*60*1000;
	}
	if(durrrr.equals("1:30"))
	{
		ddur=90*60*1000;
	}
	if(durrrr.equals("2:00"))
	{
		ddur=120*60*1000;
	}
	if(durrrr.equals("2:30"))
	{
		ddur=150*60*1000;
	}
	if(durrrr.equals("3:00"))
	{
		ddur=180*60*1000;
	}						
}
if(dur<0)
{
	//before
}
else if(dur>=0 && (dur-ddur)<=0){
	//response.sendRedirect("HostedMCQQuestion.jsp?type//="+);
}
	else
	{
//response.sendRedirect("HostedMCQQuestionRanking.jsp?type="+);
st=con.prepareStatement("select * from "+type+"_ranklist order by score desc,name asc,college asc ");
rs=st.executeQuery();
String s=(String)session.getAttribute("uid");
String score="na",record="na";
%>		        
		<div class="container">
			<div class="row  forum-row">
				<div class="col-md-4 col-lg-4 col-sm-4 col-xs-12">
					<!--<h4>Test Other skills</h4>
					<a href="MCQ.jsp?type=c">C</a><br>
					<a href="MCQ.jsp?type=c__">C++</a><br>				
					<a href="MCQ.jsp?type=english">ENGLISH</a><br>	
					<a href="MCQ.jsp?type=gk">GENERAL KNOWLEDGE</a><br>
					<a href="MCQ.jsp?type=java">JAVA</a><br>								
					<a href="MCQ.jsp?type=reasoning">REASONING</a><br>
					-->
					<div class="row" style="margin-top:50px;">					
					<table class="table">
					<tr>
					<td  class="col-md-3 col-xs-3 col-lg-3 col-sm-3"><strong>Rank</strong></td>
					<td  class="col-md-3 col-xs-3 col-lg-3 col-sm-3"><strong>Id</strong></td>
					<td  class="col-md-3 col-xs-3 col-lg-3 col-sm-3"><strong>Name</strong></td>
					<td  class="col-md-3 col-xs-3 col-lg-3 col-sm-3"><strong>College</strong></td>
					<td  class="col-md-3 col-xs-3 col-lg-3 col-sm-3"><strong>Score</strong></td>
					</tr>
					</table>
					<table class="table table-hover">
					<% 
					int rankcount=1;
					while(rs.next()){
						%>
						<tr>
						<td><%=rankcount++ %></td>
						<td><%=rs.getString(2) %></td>
						<td style="font-family: cursive;"><%=rs.getString(3) %></td>
						<td><%=rs.getString(6) %></td>
						<td><%=rs.getString(4) %></td>
						</tr>	
						<% 
						if(rs.getString(2).equals(s)){	
							score=rs.getString(4);
							record=rs.getString(5);
						}
					}
					%>
					</table>
					</div>
				</div>
				<div class="col-md-7 col-lg-7 col-sm-7 col-xs-12">
					<span style="color:rgba(0,179,0,1);text-align: center;"><h3 style="font-family:cursive">Test Your <u><%=type%></u> skills!!!</h3></span>								
					<%
					if(!score.equals("na")){
					st=con.prepareStatement("select * from "+type);
					rs=st.executeQuery();
					int count=0;
					int sr=1;
						while(rs.next())
						{
							//System.out.println("zf");
							String ans=record.charAt(sr)+"";	
							String question=rs.getString("ques");
							String modifiedquestion=""
									;
							for(int i=0;i<question.length();i++){
								modifiedquestion+=question.charAt(i);
								char array[]={'{','}',';',')'};
								for(char ch : array ){
									if(ch==question.charAt(i)){
										modifiedquestion+=" \n";
									}
								}
							}
					%>																
					<div class="row" style="background-color: rgba(0,179,0,0.1);margin:15px;padding: 15px;color: rgba(0,179,0,1),1);">
						<h3><%=sr++%>)  <%=modifiedquestion %></h3>
						<br>
						<div class="row">
							<div class="col-md-6 col-lg-6 col-xs-12 col-sm-6">
							<%
							if(ans!="U"&&ans!=null&&ans.equals("a")){
							%>
								<span>  a)  <input type="radio" class="myradio"  name=<%=rs.getInt("srno") %> checked value="a"><%=  " "+ rs.getString("a")%> 
								</span>					
							<%
							if((rs.getString("ac").equals("a")))
							{
							%>
							<span class="glyphicon glyphicon-ok"></span>
							<% 
							}
							else
							{
							%>
							<span class="glyphicon glyphicon-remove"></span>
							<%
							}											
							}
							else
							{
							%>
								<span>  a)  <input type="radio" class="myradio"  name=<%=rs.getInt("srno") %> value="a"><%=  " "+ rs.getString("a")%> 
								</span>
							<%
							if(rs.getString("ac").equals("a"))
							{
							%>
							<span class="glyphicon glyphicon-ok"></span>
							<%
							}
							}
							%>
							</div>					
							<div class="col-md-6 col-lg-6 col-xs-12 col-sm-6">
							<%
							if(ans!="U"&&ans!=null&&ans.equals("b")){
							%>
								<span>  b)  <input type="radio" class="myradio"  name=<%=rs.getInt("srno") %> checked value="b"><%=  " "+ rs.getString("b")%> 
								</span>					
							<%
							if(rs.getString("ac").equals("b"))
							{
							%>
							<span class="glyphicon glyphicon-ok"></span>
							<% 
							}
							else
							{
							%>
							<span class="glyphicon glyphicon-remove"></span>
							<%						
							}						
							}
							else
							{
							%>
								<span>  b)  <input type="radio" class="myradio"  name=<%=rs.getInt("srno") %> value="b"><%=  " "+ rs.getString("b")%> 
								</span>
							<%
							if(rs.getString("ac").equals("b"))
							{
							%>
							<span class="glyphicon glyphicon-ok"></span>
							<%
							}
							}
							%>
							</div>	
						</div>
						<div class="row">
							<div class="col-md-6 col-lg-6 col-xs-12 col-sm-6">
							<%
							if(ans!="U"&&ans!=null&&ans.equals("c")){
							%>
								<span>  c)  <input type="radio" class="myradio"  name=<%=rs.getInt("srno") %> checked value="c"><%=  " "+ rs.getString("c")%> 
								</span>					
							<%
							if(rs.getString("ac").equals("c"))
							{
							%>
							<span class="glyphicon glyphicon-ok"></span>
							<% 
							}
							else
							{
							%>
							<span class="glyphicon glyphicon-remove"></span>
							<%
							}						
							}
							else
							{
							%>
								<span>  c)  <input type="radio" class="myradio"  name=<%=rs.getInt("srno") %> value="c"><%=  " "+ rs.getString("c")%> 
								</span>
							<%
							if(rs.getString("ac").equals("c"))
							{
							%>
							<span class="glyphicon glyphicon-ok"></span>
							<%
							}
							}
							%>
							</div>	
							<div class="col-md-6 col-lg-6 col-xs-12 col-sm-6">
							<%
							if(ans!="U"&&ans!=null&&ans.equals("d")){
							%>
								<span>  d)  <input type="radio" class="myradio"  name=<%=rs.getInt("srno") %> checked value="d"><%=  " "+ rs.getString("d")%> 
								</span>					
							<%
							if(rs.getString("ac").equals("d"))
							{
							%>
							<span class="glyphicon glyphicon-ok"></span>
							<% 
							}
							else
							{
							%>
							<span class="glyphicon glyphicon-remove"></span>
							<%
							}						
							}
							else
							{
							%>
								<span>  d)  <input type="radio" class="myradio"  name=<%=rs.getInt("srno") %> value="d"><%=  " "+ rs.getString("d")%> 
								</span>
							<%
							if(rs.getString("ac").equals("d"))
							{
							%>
							<span class="glyphicon glyphicon-ok"></span>
							<%
							}
							}
							%>
							</div>	
						</div>
						<% if(ans!="U" && ans !=null&& ans.equals(rs.getString("ac"))){
							count++;
						}
						%>																																														
																													
					</div>
				
				
				
			
				 
					<%
						}
					}
				}
%>

<%
			}

catch(Exception e){
	e.printStackTrace();
}

%>
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
<script src="Scripts/jquery-1.9.1.min.js"></script>  
<script src="js/bootstrap.min.js"></script>  
</body>
</html>