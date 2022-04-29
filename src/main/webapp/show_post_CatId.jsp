<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="Css/style.css">
<%@page import="com.blogs.dao.*"%>
<%@page import="com.blogs.helper.*"%>
<%@page import="com.blogs.entities.*"%>
<%@page import="java.util.ArrayList"%>
</head>
<body>

<%@include file="navbar.jsp"%>
	<main>
		<div class = "container">
		<div class="row">
			<%
			int c_id = Integer.parseInt(request.getParameter("c_id"));
			System.out.println(c_id);
			PostDao pDao2 = new PostDao(ConnectionProvider.getConnection());
			int cid = 0;
			cid = 0;
			ArrayList<Post> list2 = null;
			if (cid == 0) {
				list2 = pDao2.getPostByCid(c_id);
			} else {

			}
			if (list2.isEmpty()) {
			%>
			<div class="container text-center" style="margin: 2vh">
				<h1>No Post Sorry</h1>
			</div>
			<%
			}
			for (Post cc : list2) {
			System.out.println(cc.getpPic());
			%>
			<div class="col-md-4 mt-4 mb-3">
				<div class="card h-600" style="height:35rem">
					<div class="card-header text-center primary-background">
						<img src="images/<%=cc.getpPic()%>"
							style="width: 300px; height: 200px">
					</div>
					<div class="card-body">
						<h3><%=cc.getTitle()%></h3>
						<p><%=cc.getContent()%></p>
					</div>
					<div class="card-footer text-right primary-background">

						<a href="show_post.jsp?post_id=<%=cc.getPId()%>"
							class="btn btn-outline-light btn-sm">Read more</a><a href="#"
							class="btn btn-outline-light btn-sm"><i
							class="fa fa-thumbs-o-up"></i><span>10</span></a> <a href="#"
							class="btn btn-outline-light btn-sm"><i
							class="fa fa-commenting-o"></i><span>10</span></a>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		</div>
	</main>
</body>
</html>