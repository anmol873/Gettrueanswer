<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.blogs.helper.ConnectionProvider"%>
<%@page import="com.blogs.entities.User"%>
<%@page import="com.blogs.dao.UserDao"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="com.blogs.entities.Message"%>
<%@page import="com.blogs.servlets.LoginServlet"%>


<!-- css -->

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
<title>Login page</title>
</head>
<style>
.banner-background {
	clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 100%, 90% 93%, 66% 94%, 4% 94%, 0
		100%, 0 0, 30% 0);
}
</style>
<body>


	<!-- nav bar -->

	<%@include file="navbar.jsp"%>
	<!-- login inputs -->
	<main
		class="d-flex align-items-center sec-background banner-background"
		style="height: 70vh">
		<div class="container">
			 <div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-header primary-background text-center">
							<span class="	fa fa-user-circle-o fa-3x"></span>
							<h5>Login Here!</h5>
						</div>
						<%
						Message msg = (Message) session.getAttribute("message");
						if (msg != null) {
						%>
						<div class="alert <%=msg.getCssClass()%>" role="alert">
							<%=msg.getContent() %>
						</div>
						<%
						}
						session.removeAttribute("message");
						%>
						<div class="card-body">

							<!-- form -->

							<form action="LoginServlet" method="post">
								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input
										type="email" required class="form-control"
										id="exampleInputEmail1" name="email"
										aria-describedby="emailHelp" placeholder="Enter email">
									<small id="emailHelp" class="form-text text-muted">We'll
										never share your email with anyone else.</small>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										type="password" required class="form-control" name="password"
										id="exampleInputPassword1" placeholder="Password">
								</div>
								<div class="container text-center">
									<button type="submit" class="btn btn-primary">Submit</button>
								</div>
							</form>
						</div>

					</div>
				</div>
			</div>
		</div>
	</main>

	<!-- Java Script -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>
</html>