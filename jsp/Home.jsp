<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="imagesForGDPI/logo.jpg" />
<title>GDPIndia</title>
<script src="Scripts/jquery-1.9.1.min.js"></script>  
<script>
$(function () {
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

function LoginServlet()
{
	var id=document.getElementById("lname").value;
	var pass=document.getElementById("lpass").value;
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
	    location.reload();
	    }
	}
	  xmlhttp.open("POST","Login?email="+id+"&password="+pass,true);			
	  xmlhttp.send();	
	}
	
function SignInServlet(y)
{
	var x=y.value;			
	var xmlhttp;
	var id=document.getElementById("emailid").value;
	var name=document.getElementById("uname").value;
	var pass=document.getElementById("upass").value;
	var dob=document.getElementById("udob").value;
	var pno=document.getElementById("upno").value;
	var clg=document.getElementById("uclg").value;
	var robot=document.getElementById("urobot").value;
	var repass=document.getElementById("urepass").value;
	if(pass==repass){
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
	    location.reload();
	    }
	}
	  xmlhttp.open("POST","SignUp?email="+id+"&name="+name+"&pass="+pass+"&pno="+pno+"&date="+dob+"&clg="+clg,true);			
	  xmlhttp.send();
	}
	else{
		
		alert("password didnot match");
	}
	}
	function checkemail(q){
		var email=q.value;	
		
		if (window.XMLHttpRequest)
		  {
		  xmlhttp=new XMLHttpRequest();
		  }
		else
		  {
		  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		  }
		try{
		xmlhttp.onreadystatechange=function() {				
		  if (xmlhttp.readyState==4 && xmlhttp.status==200)
		    {				  
		    var res=xmlhttp.responseText;
		    //alert(res);
		    if(res==0)
		    	{
		    	
		    	//q.value="Email Already in database";
		    	//q.style.color='red';
		    	//alert(res);
		    	document.getElementById('email-already-exists').style.display='block';
		    	document.getElementById('signup-save-btn').disabled=true;
		    	}
		    
		    }
		}
		  xmlhttp.open("POST","CheckEmailIdInDB?email="+email,true);			
		  xmlhttp.send();
		}
		catch(e)
		{
			alert(e);
		}
	}
	function comparepass(){
		var pass=document.getElementById("upass").value;
		var repass=document.getElementById("urepass").value;
		if(pass!=repass)
			{
				document.getElementById('pass_diff').style.display='block';	
				document.getElementById('signup-save-btn').disabled=true;
			}
	}
	function gotogdpage()
	{
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
		    alert(res);				    			    	    
		    }
		}
		  xmlhttp.open("POST","GD.jsp",true);			
		  xmlhttp.send();
	}
	function hostgd(){
		//alert("dzc");
		window.location="HostGD.jsp";
	}
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
<% 
String email="",name="";
if(session!=null)
{
email=(String)session.getAttribute("email");
name=(String)session.getAttribute("name");
}
String login=(String)session.getAttribute("login");
if(login!=null && login.equals("f"))
{
	session.setAttribute("login", "n");
%>
<script type="text/javascript">
$(window).load(function () {
$('#success-modal').modal('show');
});
</script>
		<div class="modal fade" id="success-modal" tabindex="-1" role="dialog" aria-labelledby="myModal-label" aria-hidden="true">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header"> 
                    	<button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="success_modal_hide()">&times;</button>                       
                        <h4 class="modal-title" id="myModal-label">You are not logged in!!!</h4>
                    </div> 
                    <div class="modal-body"></div>                   
                </div>
            </div>
        </div> 
<%
}
String v=(String)session.getAttribute("signupinfomodal");
if((v!=null && v!="") && !(v.equals("x")))
{
	%>
	<script type="text/javascript">
$(window).load(function () {
$('#success-modal').modal('show');
});
</script>
		<div class="modal fade" id="success-modal" tabindex="-1" role="dialog" aria-labelledby="myModal-label" aria-hidden="true">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header"> 
                    	<button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="success_modal_hide()">&times;</button>                       
                        <h4 class="modal-title" id="myModal-label"><%=v %></h4>
                    </div> 
                    <div class="modal-body"></div>                   
                </div>
            </div>
        </div> 
	<%
	session.setAttribute("signupinfomodal","x");
}
%>
	<div id="top">
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
                        <input maxlength="16" type="password" required class="form-control" name="previouspassword" id="lname" placeholder="Enter Your old password"  value="">
                        <br>
                       
                       <input maxlength="16" type="password" required class="form-control" name="newpassword" id="lname" placeholder="Enter Your new password"  value="">
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
        
        
        
        
        
        
        
        
     
		<!--<div class="container" id="gd-started-div">          
            <div class="carousel-caption" style="background-color: rgba(0,0,0,0.1);">                        
              <h1 class="carousel-caption-heading"><code>Join Our GD Panel</code></h1>              
              <h3 class="carousel-caption-body">This section <code>takes</code> you to our group discussion corner where you can enhance and improve your <code>GD</code>skills.</h3>              
              <p><a class="btn btn-lg btn-danger" href="UpcomingGD.jsp" role="button" id="gdpagebtn">Get Started</a></p>                         
            </div>
          </div>-->    
	<div id="myCarousel" class="carousel slide" data-ride="carousel" style="">
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <!--<li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>-->
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="item active">        
          <img style="height: 680px;" class="first-slide carousel_image carousel-image-first" id="image-xs" src="imagesForGDPI/gd.jpg">
          <div class="container">          
            <div class="carousel-caption" style="background-color: rgba(0,0,0,0.1);">                        
              <h1 class="carousel-caption-heading"><code>Join Our GD Panel</code></h1>              
              <h3 class="carousel-caption-body">This section <code>takes</code> you to our group discussion corner where you can enhance and improve your <code>GD</code>skills.</h3>              
              <p><a class="btn btn-lg btn-danger" href="UpcomingGD.jsp" role="button" id="gdpagebtn">Get Started</a></p>                         
            </div>
          </div>
          <!--<img src="imagesForGDPI/xs-image-1.jpg" style="position: fixed;top: 60px;left: 100px;cursor: pointer;" id="xs-image-gdhost" onclick="hostgd()">-->
        </div>
        <!--<div class="item">
          <img class="second-slide carousel_image" src="imagesForGDPI/pi-2.jpg" style="height: 680px">
          <div class="container">
            <div class="carousel-caption" style="background-color: rgba(0,0,0,0.1);">                        
              <h1 class="carousel-caption-heading"><code style="color:rgba(102,51,0,1)">Get Ready To Test The Water.</code></h1>              
              <h3 class="carousel-caption-body"><code style="color:rgba(102,51,0,1);background-color: rgba(252,252,252,0.7)">This section takes you to our experts who are eager to asses yourself and prepare you to tackle the real life challenges skills.</code></h3>              
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Get Started</a></p>              
            </div>
          </div>
        </div>
        <div class="item">
          <img class="third-slide carousel_image" src="imagesForGDPI/forum.jpg" style="height: 680px">
          <div class="container">
            <div class="carousel-caption" style="background-color: rgba(0,0,0,0);position:absolute;top:530px;left:-25px"> 
          		<a id="button_forum" class="btn btn-lg btn-warning" href="#" role="button">Go To Our</a>
          	</div>
          </div>
          
          </div>-->
        </div>
      </div>
      <div class="left carousel-control">
        <!-- <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>-->
      </div>
      <div class="right carousel-control">
        <!-- <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>-->
      </div>
    <br><br><br><br>
    <h1 style="text-align: center;"><code style="background-color: rgba(0,0,0,0.4);color:white;">Some Of Our Elite Interviewers</code></h1>
    <br><br><br><br>
    <div class="row">
        <div class="col-md-4 col-sm-4 col-xs-12 col-lg-4">        
          <img class="image-circular" src="imagesForGDPI/exp-1.jpg">                                                          
              <h3 style="text-align:center;"><span style="text-align: center;color:rgb(170,170,170);">My Experience</span></h3>   
              <p style="color:rgb(170,170,170);">What I usually tell students for Interviews is to focus on two words: <strong>leadership and vision </strong>. Then tell of how that leadership and vision translated into your personal delivered results.</p>
              <p style="color:rgb(170,170,170);">Here is a sample of how to respond: "The key quality in a successful manager should be leadership , the ability to be the visionary for the people who are working under them . The person who can set the course and direction for subordinates, keeping them focused on what is most important for delivering the highest priority results. The highest calling of a true leader is <strong>inspiring others</strong> to reach the highest of their abilities . I'd like to tell you about a person whom I consider to be a <strong>true leader</strong> . "</p>
			  <p style="color:rgb(170,170,170);">Then give an example of someone who has touched your life and how their impact has helped in your personal development.</p>	 
				 <p><a class="btn btn-lg btn-warning" href="#" role="button" style="margin-left:140px;">Learn More</a></p>                          
         
              </div>
         <div class="col-md-4 col-sm-4 col-xs-12 col-lg-4">        
          <img class="image-circular" src="imagesForGDPI/exp-2.jpg">                                                          
              <h3 style="text-align:center;"><span style="text-align: center;color:rgb(170,170,170);">My Experience</span></h3>   
              <p style="color:rgb(170,170,170);">Are you wondering what an <strong>interviewer</strong> looks for during an interview, or what you should do to get him to like you? Is there some secret to figuring out if the <strong>interview is going well</strong> or something else you can do to insure that it does?</p>            
              <p style="color:rgb(170,170,170);">While you are in the interview hot seat watching for <strong>clues from your interviewer<strong>, he or she is busy watching you . looking for their own clues. Interviewers look for things they want to hear in your answers, or ways you handle yourself during the interview, or simply some <strong>sign that shows them what you might be like if you worked for them</strong>.</p>
              <p style="color:rgb(170,170,170);">What I am here for is to make you more and more <strong>comfortable </strong>with such scenarios and counter attack the <strong>HR . </strong>This is really a nice effort to ignite the fire within you that has gone miles far aay from you</p>      
              <p><a class="btn btn-lg btn-danger" href="#" role="button" style="margin-left:140px;">Learn More</a></p>                                   </div>
         <div class="col-md-4 col-sm-4 col-xs-12 col-lg-4">        
          <img class="image-circular" src="imagesForGDPI/exp-3.jpg">                                                          
              <h3 style="text-align:center;"><span style="text-align: center;color:rgb(170,170,170);">My Experience</span></h3>   
              <p style="color:rgb(170,170,170);">Often, I focus on my own perspective: <strong>online  interviews, behavioral interviews </strong>, and what a candidate <strong>should or shouldn't wear to the interview </strong>. But what about our own role in the interviewing process?</p>
			  <p style="color:rgb(170,170,170);">Isn't it every employer's responsibility to treat interviewees with the highest degree of <strong>respect and consideration </strong>? A candidate - just like a client or a valued customer - needs to leave your company feeling like they've been treated kindly and professionally.</p>           
              <p><a class="btn btn-lg btn-primary" href="#" role="button" style="margin-left:140px;">Learn More</a></p>                          
         </div> 
     </div> 
     
     
     
     <br><br><br><br>
     <h1 style="text-align: center;"><code style="color:rgba(0,0,0,0.4);">A Few Of Our Satisfied And Successful Users.</code></h1>
     <br><br><br><br>
     
     
     	<div class="container">
         <div class="row">
		  <div class="col-md-3 col-lg-3 col-sm-3 col-xs-6">
		    <div class="thumbnail">
		      <img src="imagesForGDPI/c.jpg" style="height: 230px;width:100%;">		      
		    </div>
		  </div>
		  <div class="col-md-8 col-lg-8 col-sm-9 col-xs-6">
		  	<div class="caption">
		  		<h3>Sarthak Goyal</h3>		        
		        <p><h3 style="display:inline;">W</h3><span style="display:inline;color:rgb(130,130,130);">ell,It's important in current competitive world to remain <strong>focused</strong>.There's nothing wrong with having a 1000's OK skills but if the only place they live is in your memory for a temporary short period.Better still, you need a permanent skill.Be prepared with a story about an idea of yours that was taken from idea to implementation , and considered successful.Then <strong>this is a right place for you</strong>.I myself have improved my <strong>communications skills</strong> and have been benefitted a lot.I recommend all aspirants looking forward to enhance their communications and gd skills then you cannot find a better platform then this. </span></p>		        
		    	<hr style="border-top:1px solid;border-color: rgba(200,200,200,1);">		    	
		    </div>
		  </div>
		</div>
		<br><br><br><br>
		 <div class="row">		  
		  <div class="col-md-8 col-lg-8 col-sm-9 col-xs-6">
		  	<div class="caption">	
		  		<h3>Bhanu Pratap Gill</h3>	        
		        <p><h3 style="display:inline;">I</h3><span style="display:inline;color:rgb(130,130,130);"> used to remain perturb regarding mine weak communication skills as I have done mine schooling from a aregional board. Once while browsing ,I came to know about <b>GDPINDIA</b>.It is a very nice platform as it helps to improve the versatility in all walks of personality development like communication skills ,presenting yourself in a group as you can give numerous gd's and PI on this site.You can discuss your problems with experts and groom your personality.This platform is insdispensable for personality development. </span></p>		        
		    	<hr style="border-top:1px solid;border-color: rgba(200,200,200,1);">		    	
		    </div>
		  </div>
		  <div class="col-md-3 col-lg-3 col-sm-3 col-xs-6">
		    <div class="thumbnail">
		      <img src="imagesForGDPI/b.jpg" style="height: 230px;width:100%;">		      
		    </div>
		  </div>
		</div> 
		<br><br><br><br>
		<div class="row">
		  <div class="col-md-3 col-lg-3 col-sm-3 col-xs-6">
		    <div class="thumbnail">
		      <img src="imagesForGDPI/m.jpg" style="height: 230px;width:100%;">		      
		    </div>
		  </div>
		  <div class="col-md-8 col-lg-8 col-sm-9 col-xs-6">
		  	<div class="caption">
		  		<h3>Meetaansh Deol</h3>		        
		        <p><h3 style="display:inline;">G</h3><span style="display:inline;color:rgb(130,130,130);">
dpindia helps me  in <strong>getting a job</strong> . I  create my account and practice practice practice. I use <strong>self hosting facility</strong>   and later practiced the <strong>upcoming GD</strong> facility for prospective Supervisors. It was fantastic. I was very confident and prepared to answer all the questions during <strong>interview</strong>. It was amazing. It helps me in getting my best out of me. 
		        </span></p>		        
		    	<hr style="border-top:1px solid;border-color: rgba(200,200,200,1);">		    	
		    </div>
		  </div>
		</div>
		<br><br><br><br>
		 <div class="row">		  
		  <div class="col-md-8 col-lg-8 col-sm-9 col-xs-6">
		  	<div class="caption">
		  		<h3>Aditya Aggarwal</h3>		        
		        <p><h3 style="display:inline;">G</h3><span style="display:inline;color:rgb(130,130,130);">dpindia make me fell much more confident about  <strong>real GD</strong>. I fell real <strong>interview and Gd condition </strong>. I also really liked the  self hosting facility and forum facility to post my own topic and  let me show my view and let me know where i am wrong . It really helped me improve my <strong>interview skills</strong>, that's why I am recommending it to others.
		        </span></p>		        
		    	<hr style="border-top:1px solid;border-color: rgba(200,200,200,1);">		    	
		    </div>
		  </div>
		  <div class="col-md-3 col-lg-3 col-sm-3 col-xs-6">
		    <div class="thumbnail">
		      <img src="imagesForGDPI/n.jpg" style="height: 230px;width:100%;">		      
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
                        <input maxlength="50" type="email" required class="form-control" name="email" id="lname" placeholder="Enter Your Id"  value="">
                        <label class="control-label" for="key">Enter your password</label>
                        <input maxlength="50" type="password" required class="form-control" name="password" id="lpass" placeholder="Enter Your Password" value="">
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
                        <input maxlength="50" type="email" required class="form-control" name="email" id="lname" placeholder="Enter Your Id"  value="">
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
                        <input maxlength="50" type="email" required class="form-control" name="email" id="emailid" placeholder="Enter Your EmailId" value="" onblur="checkemail(this)" onfocus="document.getElementById('email-already-exists').style.display='none';document.getElementById('signup-save-btn').disabled=false;">                        
                        <label class="control-label" for="key">Enter Your Name</label>
                        <input maxlength="100" type="text" required class="form-control" name="name" id="uname" placeholder="Enter Your Name" value="">
                        <label class="control-label" for="path" >Enter Your Password</label>
                        <input maxlength="16" type="password" required class="form-control" name="pass" id="upass" placeholder="Enter Your Password" value="">
                        <label class="control-label" for="key">ReEnter Your Password</label><span id='pass_diff' style="color:red;display:none;">Password didn't match</span>
                        <input maxlength="16" type="password" required class="form-control" name="pass" id="urepass" placeholder="ReEnter Your Password" value="" onblur="comparepass()" onfocus="document.getElementById('pass_diff').style.display='none';document.getElementById('signup-save-btn').disabled=false;">
                        <label class="control-label" for="path" >Enter Your DOB</label>
                        <input type="date" required class="form-control" name="date" id="udob" placeholder="Enter Your date of birth" value="">
                        <label class="control-label" for="path" >Enter Your Phone no</label>
                        <input maxlength="10" type="number" required class="form-control" name="pno" id="upno" placeholder="Enter Your Phone No" value="">                        
                        <label class="control-label" for="path" >Enter Your College Name</label>
                        <input maxlength="100" type="text" required class="form-control" name="clg" id="uclg" placeholder="Enter Your College Name" value="">                        
                        <div class="checkbox">
                            <label>
                                <input required  type="checkbox" id="urobot">
                                I agree.
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
                    
<script src="Scripts/jquery-1.9.1.min.js"></script>  
<script src="js/bootstrap.min.js"></script>  
</body>
</html>