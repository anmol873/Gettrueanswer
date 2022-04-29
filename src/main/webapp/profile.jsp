<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.blogs.helper.ConnectionProvider"%>
<%@page import="com.blogs.dao.PostDao"%>
<%@page import="com.blogs.entities.User"%>
<%@page import="com.blogs.dao.UserDao"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="com.blogs.servlets.EditServlet"%>
<%@page import="com.blogs.entities.Message"%>
<%@page import="com.blogs.entities.Categories"%>
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
<title>Profile</title>
</head>
<body>

	<%
	User user = (User) session.getAttribute("currentUser");
	%>
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
				<li class="nav-item active"><a class="nav-link"
					href="index.jsp"><span class="fa fa-phone-square"></span>Contact<span
						class="sr-only">(current)</span> </a></li>
				<li class="nav-item active"><a class="nav-link"
					data-toggle="modal" data-target="#do-post-modal"><span
						class="fa fa-address-card-o"></span>New Post<span class="sr-only">(current)</span>
				</a></li>


				<div class="form-gorup sec-background"
					style="background: #8f9bff !important;">
					<select class="form-control " name="select-cat" >
						<option selected disabled class="primary-background">--Select
							Categories--</option>
						<option value = "0">Show All</option>
						<%
						PostDao pDao = new PostDao(ConnectionProvider.getConnection());
						ArrayList<Categories> list = pDao.getCategory();
						for (Categories cc : list) {
						%>
						<option value="<%=cc.getCID()%>"><%=cc.getCTitle()%></option>
						<%
						}
						%>
					</select>
				</div>
				<!-- 
			<li class="nav-item"><a class="nav-link disabled" href="#">Disabled</a>
			</li>-->
			</ul>
			<ul class="navbar-nav mr-right">
				<li class="nav-item active"><a class="nav-link "
						data-toggle="modal" data-target="#profileModal"><span
						class="fa fa-user-circle"></span> <%=user.getName()%></a></li>

				<li class="nav-item active"><a class="nav-link"
					href="logout.jsp"><span class="	fa fa-user-times"></span>Log
						out<span class="sr-only">(current)</span> </a></li>
			</ul>
		</div>
	</nav>
	<%
	Message msg = (Message) session.getAttribute("message");
	if (msg != null) {
	%>
	<div class="alert <%=msg.getCssClass()%>" id="alert-message"
		role="alert">
		<%=msg.getContent()%>
	</div>
	<%
	}
	session.removeAttribute("message");
	%>


	<main>
		<div class="container">
			<div class="col-md-16">

				<div class="container text-center" id="loader">
					<i class="fa fa-refresh fa-3x fa-spin"></i>
					<h3>Loading.........</h3>
				</div>
				<div id="post-container"></div>
			</div>
			
		</div>
	</main>
	<!-- profile modal-->

	<!-- Button trigger modal -->

	<!-- Modal -->
	<div class="modal fade" id="profileModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background">
					<h5 class="modal-title container text-center"
						id="exampleModalLabel">
						<span class="fa fa-edit""></span>Bloging Site
					</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img src="images/<%=user.getProfile()%>" style="max-width: 150px;">
					</div>
					<div class="container text-center ">
						<h3>
							<%=user.getName()%></h3>
					</div>
					<div class="container m-3" id="profile-details">
						<table class="container text-center">
							<tbody>
								<tr>
									<hr>
								<tr>
								<tr>

									<td>Email_Id :</td>
									<td><%=user.getEmail()%></td>

								</tr>
								<tr>
									<td><hr></td>
									<td><hr></td>
								</tr>
								<tr>
									<td>User_Id :</td>
									<td><%=user.getId()%></td>
								</tr>
								<tr>
									<td><hr></td>
									<td><hr></td>
								</tr>
								<tr>
									<td>Gender :</td>
									<td><%=user.getGender()%></td>
								</tr>
							</tbody>
						</table>
					</div>

					<!-- Profile edits -->
					<div id="profile-edit" style="display: none;">
						<div class="heading text-center">
							<h5>Edit Your Profile</h5>
						</div>
						<form class="container text-center" action="EditServlet"
							enctype="multipart/form-data" method="post">
							<table class="container text-center">
								<tbody>
									<tr>
										<hr>
									<tr>
									<tr>

										<td>Email_Id :</td>
										<td><input type="text" class="form-control"
											name="email_id" placeholder="<%=user.getEmail()%>"></td>

									</tr>
									<tr>
										<td><hr></td>
										<td><hr></td>
									</tr>
									<tr>

										<td>Name :</td>
										<td><input type="text" class="form-control"
											placeholder="<%=user.getName()%>" name="name"></td>

									</tr>
									<tr>
										<td><hr></td>
										<td><hr></td>
									</tr>
									<tr>

										<td>New Profile :</td>
										<td><input type="file" name="profile-pic"
											class="form-control"></td>

									</tr>
									<tr>
										<td><hr></td>
										<td><hr></td>
									</tr>
								</tbody>
							</table>

							<div class="container text-center">
								<button type="submit" class="btn btn-outline-primary m-4">Save
									Changes</button>
						</form>
					</div>
				</div>
				<div></div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary" id="edit-profile-btn">Edit
					Profile</button>
			</div>
		</div>
	</div>
	</div>



	<!-- Add blogs modal -->
	<div class="modal fade" id="do-post-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLongTitle" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header container text-center">
					<h5 class="modal-title" id="exampleModalLongTitle">Post New
						Blogs</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<form id="do-post-form" class="container" action="AddPostServlet"
						method="post" enctype="multipart/form-data">
						<div class="form-gorup">
							<select class="form-control" required = "true" name="category">
								<option selected disabled value = "">--Select Categories--</option>

								<%
								PostDao pDao1 = new PostDao(ConnectionProvider.getConnection());
								ArrayList<Categories> list1 = pDao1.getCategory();
								for (Categories cc1 : list1) {
								%>
								<option value="<%=cc1.getCID()%>"><%=cc1.getCTitle()%></option>
								<%
								}
								%>
							</select>
						</div>
						<hr>
						<div class="form-group">
							<input type="text" class="form-control" name="post-title"
								placeholder="Enter the title of the post" required>
						</div>
						<hr>
						<div class="form-group">
							<textarea class="form-control" name="post-content"
								placeholder="Enter the content of the post"
								style="height: 100px" required></textarea>
						</div>
						<hr>
						<div class="form-group">
							<textarea class="form-control" name="post-description"
								placeholder="Enter the Discription of the post"
								style="height: 200px"></textarea>
						</div>
						<hr>
						<div class="form-group text-center">
							<b>Upload The Picture</b>
							<br>
							<input type="file" name="blog-picture" class="form-control" placeholder = "choose the photo" required>
						</div>
						<hr>
						<div class="container text-center">
							<button type="submit" class="btn btn-primary" id="post-btn">Post</button>
						</div>
					</form>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
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
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>

	<script>
		let status = false;
		$(document).ready(function() {
			$('#edit-profile-btn').click(function() {
				if (status == false) {
					$('#profile-details').hide();
					$('#profile-edit').show();
					status = true;
					$(this).text("Back");
				} else {
					$('#profile-details').show();
					$('#profile-edit').hide();
					status = false;
					$(this).text("Edit Profile");
				}
			})

		})
		$(document).ready(function() {
			$('#alert-message').click(function() {
				$('#alert-message').hide();
			})
		})
	</script>
	<script>
	<!-- loading posts-->
		
		$(document).ready(function(e) {
			$.ajax({
				url : "loadpost.jsp",
				success : function(data, textStatus, jqXHR) {
					console.log(data);
					$('#loader').hide();
					$('#post-container').html(data);
				}

			})
		})
	</script>
	<!-- add post java script -->
</body>
</html>