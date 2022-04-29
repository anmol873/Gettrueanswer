<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="com.blogs.helper.ConnectionProvider"%>
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
<title>Get Your True Answer master</title>
<style>
.banner-background {
	clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 100%, 90% 93%, 66% 94%, 4% 94%, 0
		100%, 0 0, 30% 0);
}
</style>
</head>
<body>

	<!-- navbar -->
	<%@include file="navbar.jsp"%>

	<!-- Banner -->

	<div class="container-fluid p-0 m-0">
		<div class="jumbotron sec-background banner-background text-center">
			<div class="container">
				<h3 class="Display-3">Welcome</h3>
				<p>We definitely feel like our blogs are going edgy to broad and
					boring.</p>
				<a href="signup.jsp" class="btn btn-outline-dark"> <span
					class="fa fa-user-plus"></span>Start Now
				</a> <a href="login-page.jsp" class="btn btn-outline-dark"> <span
					class="fa fa-user-circle fa-spin"></span>Login!
				</a>
			</div>
		</div>
	</div>

		<!-- cards -->
		<br>
		<div class="container">


			<!-- first cards row starts from here -->


			<div class="row mb-2">

				<%
				PostDao p = new PostDao(ConnectionProvider.getConnection());
				ArrayList<Categories> list = p.getCategory();
				for (Categories cc : list) {
				%>
				<div class="col-md-4">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title"><%=cc.getCTitle()%></h5>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
							<a href="show_post_CatId.jsp?c_id=<%=cc.getCID()%>" class="btn primary-background text-white">Read
								More</a>
						</div>
					</div>
					</div>
				<%
				}
				%>
			</div>

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
				integrity="sha384-JZR6Spejh4U02d8jO6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
				crossorigin="anonymous"></script>
</body>
</html>