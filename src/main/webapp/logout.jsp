<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="com.blogs.helper.ConnectionProvider"%>
<%@page import="com.blogs.entities.User"%>
<%@page import="com.blogs.dao.UserDao"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="com.blogs.entities.Message"%>
<%@page import="com.blogs.servlets.LoginServlet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		session.removeAttribute("currentUser");
		Message message = new Message("Logout Sucessfull","success","alert-primary");
		session.setAttribute("message", message);
		response.sendRedirect("login-page.jsp");
	%>
</body>
</html>