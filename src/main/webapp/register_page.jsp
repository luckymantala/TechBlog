<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registeration</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css/style.css" rel="stylesheet" type="text/css">

<style type="text/css">
.banner-background {
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 65% 86%, 27% 93%, 0 86%, 0 0);
}
</style>
</head>
<body>

	<!-- Adding navbar --|>> normal_navbar.jsp  -->
	<%@include file="normal_navbar.jsp"%>

	<main class="primary-background banner-background"
		style="padding-bottom: 80px;">

		<div class="container p-5">
			<div class="row">
				<div class="col-md-6 offset-md-3 col-sm-8 offset-sm-2">
					<div class="card">

						<div class="card-header text-center primary-background text-white">
							<span class="fa fa-user-plus fa-2x"></span>
							<h3>Registeration Form</h3>
						</div>
						<div class="card-body">

							<form id="register-form" method="post" action="register">
								<div class="form-group">
									<label for="InputUserName">User Name</label> <input
										name="user_name" type="text" class="form-control"
										id="InputUserName" aria-describedby="emailHelp"
										placeholder="Enter email">
								</div>
								<div class="form-group">
									<label for="InputEmail1">Email address</label> <input
										type="email" class="form-control" name="user_email"
										id="InputEmail1" aria-describedby="emailHelp"
										placeholder="Enter email"> <small id="emailHelp"
										class="form-text text-muted">We'll never share your
										email with anyone else.</small>
								</div>
								<div class="form-group">
									<label for="InputPassword1">Password</label> <input
										name="user_pass" type="password" class="form-control"
										id="InputPassword1" placeholder="Password">
								</div>


								<div class="form-group">
									<label>Gender</label> &nbsp;
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio"
											name="user_gender" id="inlineRadio1" value="Male"> <label
											class="form-check-label" for="inlineRadio1">Male</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio"
											name="user_gender" id="inlineRadio2" value="Female">
										<label class="form-check-label" for="inlineRadio2">Female</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio"
											name="user_gender" id="inlineRadio3" value="Other"> <label
											class="form-check-label" for="inlineRadio3">Other</label>
									</div>
								</div>

								<div class="form-group">
									<label for="exampleFormControlTextarea1">About</label>
									<textarea name="user_about" style="resize: none;"
										class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
								</div>

								<div class="form-check mb-2">
									<input name="terms" type="checkbox" class="form-check-input"
										id="exampleCheck1"> <label class="form-check-label"
										for="exampleCheck1"> <span class="text-danger">*</span>Terms
										and Conditions
									</label>
								</div>


								<div class="conatiner loader text-center" style="display: none;">
									<span class="fa fa-spinner fa-2x fa-spin"></span>
									<h4>Please Wait</h4>
								</div>

								<button type="submit" class="btn btn-primary submit">Submit</button>
							</form>

						</div>

					</div>


				</div>
			</div>
		</div>
	</main>



	<script src="https://code.jquery.com/jquery-3.6.4.min.js"
		integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="js/app.js" type="text/javascript"></script>
	
	<script>
		$(document).ready(function() {
			console.log("page is ready...")

			$("#register-form").on('submit', function(event) {
				event.preventDefault();
				
				// var f = $(this).serialize();
				let f = new FormData(this);
				console.log(f);
				$(".loader").show();
				$(".submit").hide();

				$.ajax({
					url : "register",
					data : f,
					type : "post",
					success : function(data, textStatus, jqXHR) {
						console.log(data)
						$(".loader").hide();
						$(".submit").show();

						if (data.trim() == "done") {
							Swal.fire(
									  'Registered Successfully!!',
									  'Welcome to Tech Blogs Family',
									  'success'
									).then((result) => {
										window.location="login_page.jsp"
									})
						} else {
							Swal.fire(
									  'Oops!',
									  data,
									  'error'
									)
						}

					},
					error : function(jqHXR, textStatus, errorThrown) {
						Swal.fire(
									  'Oops!',
									  'Something wend wrong',
									  'error'
									)
					},
					processData: false,
					contentType: false
				})
			})
		})
	</script>
	
</body>
</html>