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
function joi+

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
function del()
{
	type=document.getElementById("mcq_title").value;
	if (window.XMLHttpRequest)
	  {
	  xmlhttp=new XMLHttpRequest();
	  }
	else
	  {
	  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");

	  }
	
	xmlhttp.onreadystatechange=function() {	
		//alert(xmlhttp.status);
	  if (xmlhttp.readyState==4 && xmlhttp.status==200)
	    {				  
	    var res=xmlhttp.responseText;
	    //alert(res);	
	    //location.reload();
	    //window.location="HostMCQDetail.jsp";
	    }
	}	
	  xmlhttp.open("POST","DeleteGDPIMcqQuestion?type="+type,true);			
	  xmlhttp.send();
	}

function addQues()
{
	
	mcqTitle=document.getElementById("mcq_title").value;
	q=document.getElementById("question").value;
	a=document.getElementById("a").value;
	b=document.getElementById("b").value;
	c=document.getElementById("c").value;
	d=document.getElementById("d").value;
	ac=document.getElementById("ac").value;
	hint=document.getElementById("hint").value;
	//alert(a);
	if (window.XMLHttpRequest)
	  {
	  xmlhttp=new XMLHttpRequest();
	  }
	else
	  {
	  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");

	  }
	
	xmlhttp.onreadystatechange=function() {	
		//alert(xmlhttp.status);
	  if (xmlhttp.readyState==4 && xmlhttp.status==200)
	    {				  
	    var res=xmlhttp.responseText;
	    alert(res);	
	    //location.reload();
	    }
	}
	var uri =q;
	var res = encodeURIComponent(uri);
	
	
	  xmlhttp.open("POST","MCQQuestionUploadGDPI?ques="+res+"&a="+a+"&b="+b+"&c="+c+"&d="+d+"&t="+mcqTitle+"&ac="+ac+"&hint="+hint,true);			
	  xmlhttp.send();
	}
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
				.link-left a{					
					color:rgba(0,0,0,0.8);
					
				}
				.body-back{
				background-color: #eee;
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
<div class="body-back">
<%
String name=(String)session.getAttribute("name");
String email=(String)session.getAttribute("email");
String uid=(String)session.getAttribute("uid");
String type=request.getParameter("type");
String rgb="",btn_submit_class="";
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://mysql16670-gdpindia.cloud.cms500.com/WATAForAll","root","PRKakz31968");	
PreparedStatement st=null;
ResultSet  rs=null;
%>
<input type="hidden" id="mcq_title" value="<%=type%>">
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
                	<li id="nav-username"><a>Welcome<b style="font-size: 14px;">   <%=name%></b></a></li>
                	<li><a href="Logout">Logout</a></li>
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
        <br><br><br><br><br><br>
	<div class="container">
		<div class="row  forum-row">
			<div class="col-md-2 col-lg-2 col-sm-2 col-xs-12 link-left">
				<h4><b>Test Your skills in </b>:</h4>				
				<a href="MCQ.jsp?type=c">C</a><br>
				<a href="MCQ.jsp?type=c__">C++</a><br>				
				<a href="MCQ.jsp?type=english">ENGLISH</a><br>	
				<a href="MCQ.jsp?type=gk">GENERAL KNOWLEDGE</a><br>
				<a href="MCQ.jsp?type=java">JAVA</a><br>								
				<a href="MCQ.jsp?type=reasoning">REASONING</a><br>
			<br><br><br><br>			
				</div>
			<div class="col-md-7 col-lg-7 col-sm-7 col-xs-12">
				<span style="color:rgba(<%=rgb %>,1);text-align: center;"><h2 style="font-family: cursive;">Upload Questions for <%=type %></h2></span>															
				<div class="row" style="background-color: rgba(<%=rgb %>,0.1);margin:15px;padding: 15px;color: rgba(<%=rgb %>,1);">																	
					<div class="row">
						<div class="col-md-9 col-lg-9 col-xs-12 col-sm-6">
							<label>Enter Your Question..</label>
							<textarea name="ques" class="form-control" rows="7" cols="60" placeholder="Enter Your question" id="question" style="border-radius:15px;">
							</textarea>
							<br>
						</div>
						
					<div class="row">
						<div class="col-md-6 col-lg-6 col-xs-12 col-sm-6">
							<span>  a)  <input type="text" class="form-control" name="a" id="a" style="border-radius:5px;width:80%">
							</span>
						</div>						
						<div class="col-md-6 col-lg-6 col-xs-12 col-sm-6">
							<span>  b)  <input type="text" class="form-control" name="b" id="b" style="border-radius:5px;width:80%">
							</span>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-md-6 col-lg-6 col-xs-12 col-sm-6">
							<span>  c)  <input type="text" class="form-control" name="c" id="c" style="border-radius:5px;width:80%">
							</span>
						</div>						
						<div class="col-md-6 col-lg-6 col-xs-12 col-sm-6">
							<span>  d)  <input type="text" class="form-control" name="d" id="d" style="border-radius:5px;width:80%">
							</span>
						</div>
					</div>
						<br>
					<div class="row">
						<div class="col-md-4 col-lg-4 col-xs-12 col-sm-4">
							<label>Correct Answer</label><br>
							<input type="text" name="ac" class="form-control" id="ac" placeholder="a/b/c/d" style="width:30%">							
						</div>
						<div class="col-md-4 col-lg-4 col-xs-12 col-sm-4">
							<label>Hint</label><br>
							<input type="text" name="marks" class="form-control" id="hint" placeholder="" value="3" style="width:80%">							
						</div>
						<div class="col-md-4 col-lg-4 col-xs-12 col-sm-4">
							<button class="btn btn-defult" style="margin:15px;" onclick="addQues()">Add Question</button>
						</div>
					</div>																										
				</div>					
					<br>					
					<button class="btn btn-primary" style="margin-left:30%" onclick="del()">Delete</button>				
			</div>		
			</div>
			<div class="col-md-3 col-lg-3 col-sm-3 col-xs-12">
				<div class="row">
					<div class="alert alert-info alert-dismissable">								           
			            <strong>Hey!</strong>Looking forward to <strong style="font-size: 22px;">host your contest</strong> for your college fest and other events.Well,this is the right place for you...</h1>			            
			      		<br><br>
			      		<p>This portal gives you the power to organize your own Gd.<Strong>Just one click away</Strong>			      		
			      		</p>
			      		<p>You can upload your questions one at a time or can directly give us your text file by clicking the button
			      		<span class="glyphicon glyphicon-arrow-down"></span> below.</p>
			      		<br>
			      		<p>Make sure you pass the right key to the contestants.</p>
			      		<p>Participants may enter your contest by entering the key in our respective link.</p>
			      	</div>
				</div>
				<br><br>
				<!--<a href=" #uploadmodal" class="btn btn-danger" data-toggle="modal" data-backdrop="static" data-keyboard="false">Upload A Text File Of Your Questions</a>-->
			</div>			
		</div>
	</div>
	</div>
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
							<li><a href="http://localhost:8080/gdpi/HostGD.jsp">Host your gd</a></li>
							<li><a href="HostMCQDetail.jsp">Host your mcq contest</a></li>
							
							<li><a href="#join-hosted-gd" data-toggle="modal" data-backdrop="static" data-keyboard="false">Participate in gd</a></li>
							<li><a href="#contest" data-toggle="modal" data-backdrop="static" data-keyboard="false">Participate in mcq contest</a></li>
						</ul>	
					</div>
					<div class="col-md-2 col-lg-2 col-sm-2 col-sm-12">
						<ul>
						<strong>Forum</strong><br>
						<li><a href="http://localhost:8080/gdpi/ForumDiscussion.jsp?gdid=gd_topic_3&gd_heading=Dowery&gd_topic=Dowery%20a%20Menace&posted_date=February%2005%20,%202016&posted_by_name=Shivank%20Agarwal">Join Forum</a></li>
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
						<li><a href="#">Back To Top</a></li>
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
	        	<span class="footer-copyright">� 2013-2016 <a href="Home.jsp" >gdpindia.com</a></span>
	        </div>
	        <div style="float:right;display:inline;"> 
	        <span class="footer-follow"><b>follow us on :</b></span>
		        <a href="https://www.facebook.com"><img id="fb" src="imagesForGDPI/fb-1.png" width=35 height=35></a>   
		        <a href="https://www.twitter.com"><img id="twitter" src="imagesForGDPI/twitter-1.png" width=45 height=35> </a> 
		        <a href="https://www.gmail.com"><img id="google" src="imagesForGDPI/google-1.png" width=35 height=35> </a>
		        <a href="https://www.youtube.com"><img id="youtube" src="imagesForGDPI/youtube-1.png" width=35 height=35></a>
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
	e.printStackTrace();
}
%>
<script src="Scripts/jquery-1.9.1.min.js"></script>
<script src="jquery.easing.min.js"></script>  
<script src="js/bootstrap.min.js"></script> 
</body>
</html>