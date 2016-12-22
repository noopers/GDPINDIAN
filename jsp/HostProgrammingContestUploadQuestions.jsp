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
<title>MCQ's</title>
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
function finish()
{
	/*if (window.XMLHttpRequest)
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
	    window.location="HostMCQDetail.jsp";
	    }
	}	
	  xmlhttp.open("POST","FinishAddingQuestion",true);			
	  xmlhttp.send();*/
	}

function addQues()
{
	
	ctitle=document.getElementById("ctitle").value;
	q=document.getElementById("question").value;
	t=document.getElementById("testcases").value;
	s=document.getElementById("solution").value;
	marks=document.getElementById("marks").value;
	quesid=document.getElementById("quesid").value;
	tl=document.getElementById("tl").value;
	//alert(ctitle);
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
	var ques = encodeURIComponent(uri);
	testcases = encodeURIComponent(t);
	solution = encodeURIComponent(s);
	
	  xmlhttp.open("POST","HostProgrammingQuestion?ques="+ques+"&test="+testcases+"&soln="+solution+"&t="+ctitle+"&marks="+marks+"&quesid="+quesid+"&tl="+tl,true);			
	  xmlhttp.send();
	}
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
out.println(session.getAttribute("tablename"));
String name=(String)session.getAttribute("name");
String email=(String)session.getAttribute("email");
String uid=(String)session.getAttribute("uid");
String rgb="",btn_submit_class="";
String ctitle=request.getParameter("c_title");
try{
Class.forName("oracle.jdbc.driver.OracleDriver");		
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","SYSTEM","123");	
PreparedStatement st=null;
ResultSet  rs=null;
%>
<input type="hidden" id="ctitle" value="<%=ctitle%>">
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
                <li class="nav-top-elements"><a href="AboutUs.jsp" class="nav-head">About Us</a></li>
                <li class="nav-top-elements"><a href="ContactUs.jsp">Contact Us</a></li>
                <li class="nav-top-elements"><a href="Forum.jsp">Forum</a></li>
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
                	<li><a href="User.jsp">
        	               	<b>Welcome   <%=name%></b></a></li>
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
	<div class="container">
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
				<span style="color:rgba(<%=rgb %>,1);text-align: center;"><h1>Upload Questions for your contest <%=request.getParameter("c_title") %>!!!</h1></span>															
				<div class="row" style="background-color: rgba(<%=rgb %>,0.1);margin:15px;padding: 15px;color: rgba(<%=rgb %>,1);">
					<%String key=request.getParameter("key");
					if(key!=null)
					{
					%>
					<div>
					This is Your contest key!!!Send it to your participants to make them participate in the contest...
					<label style="font-size: 48px"><code><%=key %></code></label>
					</div>
					<%
					}%>									
					
					<div class="row">
						<div class="col-md-9 col-lg-9 col-xs-12 col-sm-6">
							<label>Enter Your QuestionID..</label>
							<input type="text" id="quesid" class="form-control">
							<br>
						</div>
						<div class="col-md-9 col-lg-9 col-xs-12 col-sm-6">
							<label>Enter Your Question..</label>
							<textarea name="ques" class="form-control" rows="7" cols="60" placeholder="Enter Your question" id="question" style="border-radius:15px;">
							</textarea>
							<br>
						</div>
						<div class="col-md-9 col-lg-9 col-xs-12 col-sm-6">
							<label>Enter Your test cases..</label>
							<textarea name="testcases" class="form-control" rows="7" cols="60" placeholder="Enter Your question" id="testcases" style="border-radius:15px;">
							</textarea>
							<br>
						</div>
						<div class="col-md-9 col-lg-9 col-xs-12 col-sm-6">
							<label>Enter Your Solution..</label>
							<textarea name="soln" class="form-control" rows="7" cols="60" placeholder="Enter Your question" id="solution" style="border-radius:15px;">
							</textarea>
							<br>
						</div>
					
					<div class="row">
						<div class="col-md-4 col-lg-4 col-xs-12 col-sm-4">
							<input type="text" class="form-control" style="margin:15px;" id="marks" placeholder="Enter marks">
						</div>	
						<div class="col-md-4 col-lg-4 col-xs-12 col-sm-4">
							<input type="text" class="form-control" style="margin:15px;" id="tl" placeholder="Enter timelimit in sec">
						</div>					
						<div class="col-md-4 col-lg-4 col-xs-12 col-sm-4">
							<button class="btn btn-defult" style="margin:15px;" onclick="addQues()">Add Question</button>
						</div>
					</div>																										
				</div>					
					<br>
					<button class="btn btn-primary" style="margin-left:30%" onclick="finish()">Finish</button>				
			</div>			
			</div>
			<div class="col-md-3 col-lg-3 col-sm-3 col-xs-12">
				<div class="row">
					<div class="alert alert-info alert-dismissable">
						<h1>About</h1>			            
			            <strong>Gdpindia Forum!</strong> let you ask your queries and doubts regarding your gd <a href="#" class="alert-link">skills</a> ,effective <a href="#" class="alert-link">communication</a>.
			        </div>
				</div>
				<br><br>
				<a href=" #uploadmodal" class="btn btn-danger" data-toggle="modal" data-backdrop="static" data-keyboard="false">Upload A Text File Of Your Questions</a>
			</div>			
		</div>
	</div>
	<footer class="footer">
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
		        <a href="https://www.facebook.com"><img id="fb" src="imagesForGDPI/fb-1.png" width=35 height=35></a>   
		        <a href="https://www.twitter.com"><img id="twitter" src="imagesForGDPI/twitter-1.png" width=45 height=35> </a> 
		        <a href="https://www.gmail.com"><img id="google" src="imagesForGDPI/google-1.png" width=35 height=35> </a>
		        <a href="https://www.youtube.com"><img id="youtube" src="imagesForGDPI/youtube-1.png" width=35 height=35></a>
	        </div>	        
	        <hr>
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
        <form action="Upload"  method="post">	
    	<div class="modal fade" id="uploadmodal" tabindex="-1" role="dialog" aria-labelledby="myModal-label" aria-hidden="true">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModal-label">SendFile</h4>
                    </div>
                    <div class="modal-body">
                        <p>Enter filename</p>
                        <input type="text" class="form-control" size="50" id="sendfilename" name="sendfilename"/>
                        <br>                                       							
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <input type="submit" class="btn btn-primary" value="Upload File">                    
                    </div>                    
                </div>
            </div>
        </div>
        </form>
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