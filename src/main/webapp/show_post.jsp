<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.blogs.dao.*"%>
<%@page import="com.blogs.helper.*"%>
<%@page import="com.blogs.entities.*"%>
<%@page import="java.util.ArrayList"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="Css/style.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
.card-body {
	font-size: 25px;
}
</style>
</head>
<body>
	<%
	User user = (User) session.getAttribute("currentUser");
		if(user == null)
		{
			
			response.sendRedirect("login-page.jsp");
		}
		else
		{
	%>
	<%
	int post_id = Integer.parseInt(request.getParameter("post_id"));
	System.out.println(post_id);
	PostDao pDao = new PostDao(ConnectionProvider.getConnection());
	Post post = pDao.getPost(post_id);
	System.out.println(post);
	%>
	<!-- End of nav bar -->
	<nav class="navbar navbar-expand-lg navbar-light primary-background">
		<a class="navbar-brand" href="index.jsp"><span class="fa fa-edit"></span>Bloging
			Site</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="index.jsp"><span class="fa fa-home"></span>Home <span
						class="sr-only">(current)</span> </a></li>

				<!-- 
			<li class="nav-item"><a class="nav-link disabled" href="#">Disabled</a>
			</li>-->
			</ul>
			<ul class="navbar-nav mr-right">
				<li class="nav-item active"><a class="nav-link "
					href = "profile.jsp"><span
						class="fa fa-user-circle"></span><%=user.getName() %></a></li>

				<li class="nav-item active"><a class="nav-link"
					href="logout.jsp"><span class="	fa fa-user-times"></span>Log
						out<span class="sr-only">(current)</span> </a></li>
			</ul>
		</div>
	</nav>


	<!-- main content of the post -->

	<div class="container">
		<div class="col-md-8 mt-4 offset-md-2 mb-3">
			<div class="card h-600" style="height: 40rem">
				<div class="card-header text-center primary-background">
					<img src="images/<%=post.getpPic()%>"
						style="width: 300px; height: 200px">
				</div>
				<div class="card-body">
					<h3><%=post.getTitle()%></h3>
					<p><%=post.getContent()%></p>
				</div>
				<div class="card-footer text-right primary-background">

					<a href="#" class="btn btn-outline-light btn-sm"><i
						class="fa fa-thumbs-o-up"></i><span>10</span></a> <a href="#"
						class="btn btn-outline-light btn-sm"><i
						class="fa fa-commenting-o"></i><span>10</span></a>
				</div>
			</div>
		</div>
	</div>
	<%
	} 
	%>
	<!--  end of main content -->
</body>
</html>