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
<title>MCQ's</title>
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
	jQuery(document).ready(function(){
		jQuery(':radio').click(function()
		{
		if ((jQuery(this).attr('class') == 'checked'))
		{   
		    jQuery(this).attr('class','unchecked');
		    jQuery(this).removeAttr('checked');
		} else {
		jQuery(this).attr('class','checked');
		}//or any element you want

		});
		});
});
</script>
<link href="css/bootstrap.min.css" rel="stylesheet" />
<style>
       
        .nav-top-elements{
        	float:right;
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
		.scrollbar{					
			overflow-y:scroll;			
			}
		.content{
			height:280px;			
			} 
			#scrollbarid::-webkit-scrollbar{
				width:6px;
				background-color:rgba(179,179,179,0.3);
				}
			#scrollbarid::-webkit-scrollbar-thumb{
				background-color:rgba(0,0,0,1);
				border-radius:10px;
				}
			#scrollbarid::-webkit-scrollbar-thumb:hover{
				background-color:rgba(0,0,0,1);
				border:1px solid #333333;
				}
			#scrollbarid::-webkit-scrollbar-thumb:active{
				background-color:rgba(0,0,0,1);
				border:1px solid #333333;
				}  
			#scrollbarid::-webkit-scrollbar-track{
				border:1px gray solid;
				border-radius:10px;
				-webkit-box-shadow:0 0 6px gray inset;
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
<%
try{
String name=(String)session.getAttribute("name");
String email=(String)session.getAttribute("email");
String uid=(String)session.getAttribute("uid");
String type=request.getParameter("type");
String rgb="",btn_submit_class="",type_mcqpage=type;
if(type.equals("java") || type.equals("gk"))
{
	rgb="0,179,0";
	btn_submit_class="success";
}
if(type.equals("english") || type.equals("c__"))
{
	rgb="179,0,0";
	btn_submit_class="danger";
}
if(type.equals("c") || type.equals("reasoning"))
{
	rgb="0,0,179";
	btn_submit_class="primary";
}
if(type.equals("c__"))
{
	type_mcqpage="C++";
}
type_mcqpage=type_mcqpage.toUpperCase();
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://mysql16670-gdpindia.cloud.cms500.com/WATAForAll","root","PRKakz31968");	
PreparedStatement st=null;
ResultSet  rs=null;
st=con.prepareStatement("select * from "+type);
rs=st.executeQuery();
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
        
        
	<div class="container">
		<div class="row  forum-row">
			<div class="col-md-2 col-lg-2 col-sm-2 col-xs-12">
				<h4 style="font-family: cursive;">Test Other skills</h4>
				<!--<div class="scrollbar" id="scrollbarid">
					<div class="content">-->
						<a href="MCQ.jsp?type=c">C</a><br>
						<a href="MCQ.jsp?type=c__">C++</a><br>				
						<a href="MCQ.jsp?type=english">ENGLISH</a><br>	
						<a href="MCQ.jsp?type=gk">GENERAL KNOWLEDGE</a><br>
						<a href="MCQ.jsp?type=java">JAVA</a><br>								
						<a href="MCQ.jsp?type=reasoning">REASONING</a><br>
					<!--</div>
				</div>-->
			</div>
			<div class="col-md-7 col-lg-7 col-sm-7 col-xs-12">
				<span style="color:rgba(<%=rgb %>,1);text-align: center;"><h2 style="font-family: cursive;">Test Your <%=type_mcqpage %> skills</h2></span>
				<form action="MCQAnswer.jsp">
				<input type="text" name="type" value="<%=type%>" style="display:none">
				<%String modifiedquestion="";
				char array[]={'{','}',';',')'};	
					while(rs.next())
					{modifiedquestion="";
					String question=rs.getString("question");

					boolean bool=false;
					for(int i=0;i<question.length();i++){
						modifiedquestion+=question.charAt(i);
						if(question.charAt(i)=='(')
							bool=true;
						if(question.charAt(i)==')')
							bool=false;
						for(char ch : array ){
							if(ch==question.charAt(i) && bool==false){
								modifiedquestion+=" \n";
							}
						}
					}
						
				%>																
				<div class="row" style="background-color: rgba(<%=rgb %>,0.1);margin:15px;padding: 15px;color: rgba(<%=rgb %>,1);">
					<h4><%=rs.getInt("srno")%>)  <%=modifiedquestion %></h4>
					<br>
					<div class="row">
						<div class="col-md-6 col-lg-6 col-xs-12 col-sm-6">
							<span>  a)  <input type="radio" class="myradio"  name=<%=rs.getInt("srno") %> value="a"><%=  " "+ rs.getString("a")%> 
							</span>
						</div>
						<div class="col-md-6 col-lg-6 col-xs-12 col-sm-6">
							<span> b)  <input type="radio" class="myradio" name=<%=rs.getInt("srno") %> value="b"><%=  " "+ rs.getString("b")  %>
							</span>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 col-lg-6 col-xs-12 col-sm-6">
							<span> c)  <input type="radio" class="myradio" name=<%=rs.getInt("srno") %> value="c"><%=  " "+ rs.getString("c")  %>
							</span>
						</div>
						<div class="col-md-6 col-lg-6 col-xs-12 col-sm-6">
							<span>  d)  <input type="radio" class="myradio" name=<%=rs.getInt("srno") %> value="d"><%=  " "+ rs.getString("d")  %>
							</span>	
						</div>
					</div>																										
				</div>
				<%
					}
				%>
					<input type="submit" class="btn btn-<%=btn_submit_class %>" style="margin:15px;">
				</form>
			</div>
			<div class="col-md-3 col-lg-3 col-sm-3 col-xs-12">
				<div class="row">
					<div class="alert alert-info alert-dismissable">
					<h4>About</h4>
						<p>Well,its time to test the waters.Get ready for the evaluation.Wishing you very best of luck.We advise the contestants to remain fair while giving the test.</p>
						<br>
						<p>You can come here any time you feel free and test yourself.</p>
						<br>
						<p>Questions are genuine and hints will be displayed along with your answers and correct answer once you successfully submit the test.</p>	
					</div>
				</div>
								
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
        
        
        
      
      <div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="myModal-label" aria-hidden="true">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModal-label">LogIn</h4>
                    </div>
                    <div class="modal-body">      
                    <form action="Login">             
                        <label class="control-label" for="path" >Enter Your User Id</label>
                        <input type="email" required class="form-control" name="email" id="lname" placeholder="Enter Your Id"  value="">
                        <label class="control-label" for="key">Enter your password</label>
                        <input type="password" required class="form-control" name="password" id="lpass" placeholder="Enter Your Password" value="">
                        <br>
                  <!--        <button type="button" class="btn btn-success" onclick="LoginServlet()" style="margin-left:105px;">LogIn</button>                       
             -->
             <input type="submit" class="btn btn-success" value="LogIn" style="margin-left:105px;">
             </form>
             
                    </div>                    
                    <p>Not a registered user?<a href="#signindb" data-toggle="modal" data-dismiss="modal" data-backdrop="static" data-keyboard="false">Sign Up</a></p>
                    <hr>                    
                                    
                    <div class="container">
	       <p><a href="#forgottenmodal" data-toggle="modal" data-dismiss="modal" data-backdrop="static" data-keyboard="false">forgotten Your Password?</a></p>
                    </div>
                </div>
            </div>
        </div> 
        
        
        
     





 
      <div class="modal fade" id="forgottenmodal" tabindex="-1" role="dialog" aria-labelledby="myModal-label" aria-hidden="true">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModal-label">Forgot password</h4>
                    </div>
                    <div class="modal-body">      
                    <form action="forgotten">             
                        <label class="control-label" for="path" >Enter Your User Id</label>
                        <input type="email" required class="form-control" name="email" id="lname" placeholder="Enter Your Id"  value="">
                        <br>
                  <!--        <button type="button" class="btn btn-success" onclick="LoginServlet()" style="margin-left:105px;">LogIn</button>                       
             -->
             <input type="submit" class="btn btn-success" value="send mail" style="margin-left:105px;">
             </form>
             
                    </div>                    
                    <p>Not a registered user?<a href="#signindb" data-toggle="modal" data-dismiss="modal" data-backdrop="static" data-keyboard="false">Sign Up</a></p>
                    <hr>                    
                    
                    <p>you will get  password on  your email  </p>
                    
                    
                </div>
            </div>
        </div> 
        
        
        
        
        
        
        
    




        
        <div class="modal fade" id="signindb" tabindex="-1" role="dialog" aria-labelledby="myModal-label" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModal-label">Sign Up</h4>
                    </div>
                    <form method="post" action="SignUp">
                    <div class="modal-body">                    
                        <label class="control-label" for="path" >Enter Your Email Id</label><span id="email-already-exists" style="display:none;color:red">Email already in Use!!</span>
                        <input type="email" required class="form-control" name="email" id="emailid" placeholder="Enter Your EmailId" value="" onblur="checkemail(this)" onfocus="document.getElementById('email-already-exists').style.display='none';document.getElementById('signup-save-btn').disabled=false;">                        
                        <label class="control-label" for="key">Enter Your Name</label>
                        <input type="text" required class="form-control" name="name" id="uname" placeholder="Enter Your Name" value="">
                        <label class="control-label" for="path" >Enter Your Password</label>
                        <input type="password" required class="form-control" name="pass" id="upass" placeholder="Enter Your Password" value="">
                        <label class="control-label" for="key">ReEnter Your Password</label><span id='pass_diff' style="color:red;display:none;">Password didn't match</span>
                        <input type="password" required class="form-control" name="pass" id="urepass" placeholder="ReEnter Your Password" value="" onblur="comparepass()" onfocus="document.getElementById('pass_diff').style.display='none';document.getElementById('signup-save-btn').disabled=false;">
                        <label class="control-label" for="path" >Enter Your DOB</label>
                        <input type="date" required class="form-control" name="date" id="udob" placeholder="Enter Your date of birth" value="">
                        <label class="control-label" for="path" >Enter Your Phone no</label>
                        <input type="text" required class="form-control" name="pno" id="upno" placeholder="Enter Your Phone No" value="">                        
                        <label class="control-label" for="path" >Enter Your College Name</label>
                        <input type="text" required class="form-control" name="clg" id="uclg" placeholder="Enter Your College Name" value="">                        
                        <div class="checkbox">
                            <label>
                                <input required  type="checkbox" id="urobot">
                                I'm not robot.
                            </label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                     <!--     <button type="button" class="btn btn-primary" data-dismiss="modal" value="SignIn" onclick="SignInServlet(this)">Save</button>                        
                  -->
                  		<input type="submit" class="btn btn-primary" value="Save" id='signup-save-btn'>
                    </div>
                    </form>
                </div>
                
            </div>
        </div> 
                
<%	
}
catch(Exception e)
{
	e.printStackTrace();
}
}
catch(Exception e)
{
	
}
%>
<script src="Scripts/jquery-1.9.1.min.js"></script>
<script src="jquery.easing.min.js"></script>  
<script src="js/bootstrap.min.js"></script> 
</body>
</html>