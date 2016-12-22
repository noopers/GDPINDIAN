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
	});
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
	/*$("#edit_btn").click(function(){
		$('#editquestion').modal({
	        show: 'true'
	    });
	});*/
	
	$('.modal').on('hidden.bs.modal', function(){
	    $(this).find('form')[0].reset();
	});
	
	
	           
	           

});
function edit_btn_fn(q)
{
	s=q.value;
	t=document.getElementById("tn").value;
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
	    var content=xmlhttp.responseText;
	    //location.reload();
	    //alert(res);
	    if (typeof content == 'string') {
    		content = ( new window.DOMParser() ).parseFromString(content, "text/xml");
    		}		    	    
	    /*document.getElementById("sno").value=content.getElementsByTagName('srno')[0].childNodes[0].nodeValue;
		document.getElementById("q1").value=content.getElementsByTagName('ques')[0].childNodes[0].nodeValue;
		document.getElementById("a1").value=content.getElementsByTagName('a')[0].childNodes[0].nodeValue;
		document.getElementById("b1").value=content.getElementsByTagName('b')[0].childNodes[0].nodeValue;
		document.getElementById("c1").value=content.getElementsByTagName('c')[0].childNodes[0].nodeValue;
		document.getElementById("d1").value=content.getElementsByTagName('d')[0].childNodes[0].nodeValue;
		document.getElementById("ac1").value=content.getElementsByTagName('ac')[0].childNodes[0].nodeValue;
		document.getElementById("m1").value=content.getElementsByTagName('m')[0].childNodes[0].nodeValue;
	    */
	    //alert(res);
	    
		/*s=document.getElementById("sno").value;
		q=document.getElementById("q1").value;
		a=document.getElementById("a1").value;
		b=document.getElementById("b1").value;
		c=document.getElementById("c1").value;
		d=document.getElementById("d1").value;
		ac=document.getElementById("ac1").value;
		marks=document.getElementById("m1").value;
		alert(s+q+a+b+c+d+ac+m);*/
		
		$("#sn").html(content.getElementsByTagName('srno')[0].childNodes[0].nodeValue);
		$("#ques").val(content.getElementsByTagName('ques')[0].childNodes[0].nodeValue);
		$('input[id="a1"]').val(content.getElementsByTagName('a')[0].childNodes[0].nodeValue);
		$('input[id="b1"]').val(content.getElementsByTagName('b')[0].childNodes[0].nodeValue);
		$('input[id="c1"]').val(content.getElementsByTagName('c')[0].childNodes[0].nodeValue);
		$('input[id="d1"]').val(content.getElementsByTagName('d')[0].childNodes[0].nodeValue);
		$('input[id="ac1"]').val(content.getElementsByTagName('ac')[0].childNodes[0].nodeValue);
		$('input[id="m1"]').val(content.getElementsByTagName('m')[0].childNodes[0].nodeValue);
		$("#editQuestion").modal();		
	    }
	}
	  xmlhttp.open("POST","SetSrno?sr="+s+"&t="+t,true);
	  //alert();
	  xmlhttp.send();
	}
	function update()
	{
		t=document.getElementById("t1").value;
		s=document.getElementById("sn").innerHTML;
		q=document.getElementById("ques").value;
		a=document.getElementById("a1").value;
		b=document.getElementById("b1").value;
		c=document.getElementById("c1").value;
		d=document.getElementById("d1").value;
		ac=document.getElementById("ac1").value;
		marks=document.getElementById("m1").value;
		//alert(t+s+q+a+b+c+d+ac+marks);
		
		
		
		if(t!=""&&q!=""&&a!=""&&b!=""&&c!=""&&d!=""&&ac!=""&&marks!=""&&s!=""){
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
		    location.reload();
		    }
		}
		var uri =q;
		var res = encodeURIComponent(uri);
		
		xmlhttp.open("POST","UpdateQuesByHoster?sno="+s+"&ques="+res+"&a="+a+"&b="+b+"&c="+c+"&d="+d+"&ac="+ac+"&marks="+marks+"&t="+t,true);			
		  xmlhttp.send();}
		else{
			
			
			alert("please fill the fields");
		}
	}
	
	
	function edit_btn_fn1(q)
	{
		s=q.value;
		t=document.getElementById("tn").value;
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
		    var content=xmlhttp.responseText;
		    
		    //alert(res);
		    if (typeof content == 'string') {
	    		content = ( new window.DOMParser() ).parseFromString(content, "text/xml");
	    		}		    	    
		    /*document.getElementById("sno").value=content.getElementsByTagName('srno')[0].childNodes[0].nodeValue;
			document.getElementById("q1").value=content.getElementsByTagName('ques')[0].childNodes[0].nodeValue;
			document.getElementById("a1").value=content.getElementsByTagName('a')[0].childNodes[0].nodeValue;
			document.getElementById("b1").value=content.getElementsByTagName('b')[0].childNodes[0].nodeValue;
			document.getElementById("c1").value=content.getElementsByTagName('c')[0].childNodes[0].nodeValue;
			document.getElementById("d1").value=content.getElementsByTagName('d')[0].childNodes[0].nodeValue;
			document.getElementById("ac1").value=content.getElementsByTagName('ac')[0].childNodes[0].nodeValue;
			document.getElementById("m1").value=content.getElementsByTagName('m')[0].childNodes[0].nodeValue;
		    */
		    //alert(res);
		    
			/*s=document.getElementById("sno").value;
			q=document.getElementById("q1").value;
			a=document.getElementById("a1").value;
			b=document.getElementById("b1").value;
			c=document.getElementById("c1").value;
			d=document.getElementById("d1").value;
			ac=document.getElementById("ac1").value;
			marks=document.getElementById("m1").value;
			alert(s+q+a+b+c+d+ac+m);*/
			alert("Question Deleted from your contest successfully.");
			location.reload();
		    }
		}
		  xmlhttp.open("POST","Delete?sr="+s+"&t="+t,true);
		  //alert();
		  xmlhttp.send();
		}
	
	
	
	
	function addques(){
		
		t=document.getElementById("t1").value;
		alert(t);
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
			  alert("j");
		    var res=xmlhttp.responseText;
		    window.location="http://www.gdpindian.com/HostMCQ.jsp?c_title=<%=request.getParameter("c_title")%>&key=<%=request.getParameter("key")%>";
		    }
		}		
		xmlhttp.open("POST","SetSessionForHostedContest?c="+t,true);			
		  xmlhttp.send();
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
		.side-links a{
			color:rgba(100,100,100,1);
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
				.body-back{					
				}
    </style>
</head>
<body>
<div class="body-back">
<%
String name=(String)session.getAttribute("name");
String email=(String)session.getAttribute("email");
String uid=(String)session.getAttribute("uid");
String tablename=request.getParameter("c_name");
if(name!=null)
{
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://mysql16670-gdpindia.cloud.cms500.com/WATAForAll","root","PRKakz31968");	
PreparedStatement st=null;
ResultSet  rs=null;
st=con.prepareStatement("select * from "+uid+"_hosted_mcq where mcqid=?");
st.setString(1, tablename);
rs=st.executeQuery(); 

if(rs.next())
{

DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
dateFormat.setTimeZone(TimeZone.getTimeZone("IST"));

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
        
        
	<div class="container" style="margin-top:-80px;">
		<div class="row  forum-row">
			<div class="col-md-2 col-lg-2 col-sm-2 col-xs-12">				
				<div class="row side-links" style="color:rgba(0,0,0,0.8);">										
					<strong><h4>Test Other skills</h4></strong>
					<div class="">
					<a href="MCQ.jsp?type=c">C</a><br>
					<a href="MCQ.jsp?type=c__">C++</a><br>				
					<a href="MCQ.jsp?type=english">ENGLISH</a><br>	
					<a href="MCQ.jsp?type=gk">GENERAL KNOWLEDGE</a><br>
					<a href="MCQ.jsp?type=java">JAVA</a><br>								
					<a href="MCQ.jsp?type=reasoning">REASONING</a><br>	
					</div>				
				</div>				
			<br><br><br><br><br><br><br><br>
			<div class="row" style="color:rgba(0,0,0,0.6);">
					<label style="font-size: 18px;">My Hosted Contests...</label>	
					<div class="side-links scrollbar" id="scrollbarid">
					<div class="content">				
					<%	
					try{
						st=con.prepareStatement("select * from "+uid+"_hosted_mcq",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
						rs=st.executeQuery();
						String c_name="",c_title="",k="";
						if(rs.last())
						{
						c_name=rs.getString(1);
						c_title=rs.getString(2);
						k=rs.getString(3);
					%>
						<a href="DisplayQuestionHosted.jsp?c_name=<%=c_name%>&key=<%=k%>&c_title=<%=c_title%>"><%=c_title %></a>
					<%	
						}
						while(rs.previous())
						{
							c_name=rs.getString(1);
							c_title=rs.getString(2);
					%><br>
						<a href="DisplayQuestionHosted.jsp?c_name=<%=c_name%>&key=<%=k%>&c_title=<%=c_title%>"><%=c_title %></a>
					<%
						}
					}
					catch(Exception e){e.printStackTrace();}
					%>
					</div>
					</div>
				</div>
				</div>
				<div class="col-md-7 col-lg-7 col-sm-7 col-xs-12">
				<label><strong>Key : </strong><%=request.getParameter("key")%></label>
				<label><strong>Id : </strong><%=request.getParameter("key")%></label>
				<%		
				char array[]={'{','}',';',')'};	
				
				st=con.prepareStatement("select * from "+tablename);
				rs=st.executeQuery();
				String sr="",question="",a="",b="",c="",d1="",ac="",marks="";
				String modifiedquestion="";
				int count=0;
				while(rs.next())
				{
					modifiedquestion="";
					sr=rs.getString(1);
					question=rs.getString(2);
					a=rs.getString(3);
					b=rs.getString(4);
					c=rs.getString(5);
					d1=rs.getString(6);
					ac=rs.getString(7);
					marks=rs.getString(8);
							count++;		
					
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
			<div class="row" style="background-color: rgba(0,179,0,0.1);margin:15px;padding: 15px;color: rgba(0,179,0,1);">
				<pre>				
				<h4><%=count%>) </h4> <%=modifiedquestion %>				
				</pre>
				
					<br>
					<div class="row">
						<div class="col-md-6 col-lg-6 col-xs-12 col-sm-6">
							<span>  a)  <label><%=a %></label>
							</span>
						</div>
						<div class="col-md-6 col-lg-6 col-xs-12 col-sm-6">
							<span> b)  <label><%=b %></label>
							</span>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 col-lg-6 col-xs-12 col-sm-6">
							<span> c)  <label><%=c %></label>
							</span>
						</div>
						<div class="col-md-6 col-lg-6 col-xs-12 col-sm-6">
							<span>  d)  <label><%=d1 %></label>
							</span>	
						</div>
					</div>	
					<div class="row">
						<div class="col-md-4 col-lg-4 col-xs-12 col-sm-4">
							<span> Correct answer : <label><%=ac %></label>
							</span>
						</div>
						<div class="col-md-4 col-lg-4 col-xs-12 col-sm-4">
							<span>  marks : <label><%=marks %></label>
							</span>	
						</div>
						<div class="col-md-4 col-lg-4 col-xs-12 col-sm-4">						
							<button class="glyphicon glyphicon-pencil" value="<%=sr%>" onclick="edit_btn_fn(this)" style="background-color: rgba(0,179,0,0.1);"></button>
							<button class="glyphicon glyphicon-remove" value="<%=sr%>" onclick="edit_btn_fn1(this)" style="background-color: rgba(0,179,0,0.1);"></button>
						</div>
					</div>																									
				</div>
																																		
			
			<%
				}
			%>
			</div>
			<input type="hidden" value="<%=tablename%>" id="tn">
			<div class="col-md-3 col-lg-3 col-sm-3 col-xs-12">
				<div class="row">
					<div class="alert alert-info alert-dismissable">
						<h1>About</h1>			            
			            <strong>Gdpindia MCQ!</strong> You can enhance your <a href="#" class="alert-link">technical</a> and <a href="#" class="alert-link">reasoning</a> skills with so much ease under one site only .
			        </div>
			        <button class="btn btn-primary" onclick="addques()">Add Questions</button>
				</div>
				<!--<div class="row">
					<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>			
						<ins class="adsbygoogle"
			     		style="display:block"
			     		data-ad-client="ca-pub-6590006325388707"
			    		 data-ad-slot="9929133187"
			     		data-ad-format="auto"></ins>
					<script>
						(adsbygoogle = window.adsbygoogle || []).push({});
					</script>
				</div>-->
								
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
      
      
      <div class="modal fade" id="editQuestion" tabindex="-1" role="dialog" aria-labelledby="myModal-label" aria-hidden="true">
            <div class="modal-dialog modal-medium">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModal-label">Edit your question</h4>
                    </div>
                    <div class="modal-body"> 
                    <form>

                    <% String sno=(String)session.getAttribute("sr");                    	
                    	st=con.prepareStatement("select * from "+tablename+" where srno=?");
                    	st.setString(1, sno);
                    	rs=st.executeQuery();
                    	String q1="",a1="",b1="",c1="",d2="",ac1="",m1="";
                    	if(rs.next())
                    	{
                    		q1=rs.getString(2);
                    		a1=rs.getString(3);
                    		b1=rs.getString(4);
                    		c1=rs.getString(5);
                    		d2=rs.getString(6);
                    		ac1=rs.getString(7);
                    		m1=rs.getString(8);
                    	}
                    	modifiedquestion="";
                    	boolean bool=false;
                    	for(int i=0;i<q1.length();i++){
    						modifiedquestion+=q1.charAt(i);
    						if(q1.charAt(i)=='(')
    							bool=true;
    						if(q1.charAt(i)==')')
    							bool=false;
    						for(char ch : array ){
    							if(ch==q1.charAt(i) && bool==false){
    								modifiedquestion+=" \n";
    							}
    						}
    					}
                    %>          <input type="hidden" value="<%=sno %>" id="sno">        
                       <label id='sn'><%= sno%></label> 
                       <textarea  maxlength="3800" required class="form-control" id="ques" rows="10" column="100"><%=modifiedquestion %>
                        </textarea>
                        a)<input maxlength="100" required type="text" class="form-control" id="a1" value="<%=a1 %>">                 
                        <br>
                        b)<input maxlength="100" required type="text" class="form-control" id="b1" value="<%=b1 %>">                 
                        <br>
                        c)<input maxlength="100" required type="text" class="form-control" id="c1" value="<%=c1 %>">                 
                        <br>
                        d)<input maxlength="100" required type="text" class="form-control" id="d1" value="<%=d2 %>">                 
                        <br>
                        <div class="col-md-3 col-lg-3 col-sm-3 col-xs-12">
                        <b>Correct answer</b><input maxlength="1" required type="text" class="form-control" id="ac1" value="<%=ac1 %>" style="width:100%;">                                         
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-3 col-xs-12">
                        <b>Marks</b><input required maxlength="5" type="number" class="form-control" id="m1" value="<%=m1 %>" style="width:100%;">                 
                        </div>
                        <br>
                        <input type="hidden" id="t1" value="<%=tablename %>">
                        <button type="button" class="btn btn-success" data-dismiss="modal" style="margin-left:105px;" onclick="update()">
                        Update</button>
                        
                    </form>
                    </div>                                        
                </div>
            </div>
        </div>      
<%
}
else
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
                        <h4 class="modal-title" id="myModal-label">You are not the Host</h4>
                    </div> 
                    <div class="modal-body"></div>                   
                </div>
            </div>
        </div> 
	<%
}
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
                    <p>Not a registered user?<a href="#signindb" data-toggle="modal" data-dismiss="modal" data-backdrop="static" data-keyboard="false">Sign Up</a></p>
                    <hr>                    
                    
                 
                    
                    
                </div>
            </div>
        </div> 
        
<script src="Scripts/jquery-1.9.1.min.js"></script>
<script src="jquery.easing.min.js"></script>  
<script src="js/bootstrap.min.js"></script> 
</body>
</html>