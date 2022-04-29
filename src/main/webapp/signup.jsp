<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign up page</title>
<!-- css -->

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="Css/style.css">

<style>
.banner-background {
	clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 100%, 90% 93%, 66% 94%, 4% 94%, 0
		100%, 0 0, 30% 0);
}
</style>

</head>
<body>

<%
	session.removeAttribute("currentUser");
%>
	<%@include file="navbar.jsp"%>
	<!-- login inputs -->
	<main
		class="d-flex align-items-center sec-background banner-background"
		style="height: 100vh; padding-bottom: 20px">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-header primary-background text-center">
							<span class="	fa fa-user-plus fa-3x"></span>
							<h5>Sign Up!</h5>
						</div>
						<div class="card-body">

							<!-- form -->

							<form id="registration_form" action="RegisterServlet" method="post">

								<div class="form-group">
									<label for="exampleInputPassword1">User Name</label> <input
										type="text" class="form-control" id="userName" name="userName"
										placeholder="User Name">
								</div>
								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input
										type="email" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" name="email"
										placeholder="Enter email"> <small id="emailHelp"
										class="form-text text-muted">We'll never share your
										email with anyone else.</small>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										type="password" class="form-control"
										id="exampleInputPassword1" name="password"
										placeholder="Password">
								</div>

								<div class="form-group">
									<label for="exampleInputPassword1">Gender</label> <br>
									<input type="radio" id="male" name="gender" value="male">
									Male <input type="radio" id="female" name="gender"
										value="female"> Female <input type="radio" id="other"
										name="gender" value="other"> Other
								</div>
								<div class="form-check">
									<input type="checkbox" name="check" class="form-check-input"
										id="exampleCheck1"> <label class="form-check-label"
										for="exampleCheck1">Terms and Condition</label>
								</div>
								<br>
								<div class = "container" id  = "laoder" style ="display:none">
									<span class ="fa fa-refresh fa-spin fa-2x"></span>
									<h4>Please wait</h4>
								</div>
								<button id ="submit-btn" type="submit" class="btn btn-primary">Sign up</button>
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
	<script src ="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js">
	</script>
	<script>
		$(document).ready(function() {
			console.log("loaded")
			$('#registration_form').on('submit', function(event) {
				event.preventDefault();
				
				let form = new FormData(this);

				//send the data to the servlet

				$.ajax({
					url : "RegisterServlet",
					type : 'POST',
					data : form,
					success : function(data, textStatus, jqXHR) {
							console.log(data);
							$("#submit-btn").show();
							$("#loader").hide();
							if(data.trim() === 'done')
							{
								$("#success").show();
								swal("Success!! we are redirecting to Login page")
								.then((value) => {
							  	window.location = "login-page.jsp";
							});
							}
							else
							{
								swal(data);	
							}
					},
							error : function(jqXHR, textStatus, errorThrown) {
							console.log(jqXHR);
							$("#submit-btn").show();
							$("#loader").hide();
							swal("Error Occured");
					},
					processData: false,
					contentType: false
				});
			});
		});
	</script>
</body>
</html>