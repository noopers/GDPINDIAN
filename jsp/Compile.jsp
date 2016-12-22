<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String path=request.getParameter("path");
String lang=request.getParameter("lang");
if(lang.equals("java"))
{
	response.sendRedirect("CompileJava?path="+path);
}
else if(lang.equals("cplus"))
{
	response.sendRedirect("CompileCPlus?path="+path);
}
else
{
	response.sendRedirect("CompileC?path="+path);
}
%>
</body>
</html>