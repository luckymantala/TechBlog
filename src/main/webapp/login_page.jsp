<%@page import="io.tech.blog.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="io.tech.blog.entities.Message"%>

<%
	
	User user = (User)session.getAttribute("user");
	if(user != null) {
		response.sendRedirect("profile.jsp");
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
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


	<main class="banner-background primary-background"
		style="padding-bottom: 60px;">
		<div class="container p-5">

			<div class="row">
				<div class="col-md-6 offset-md-3 col-sm-8 offset-sm-2">
					<div class="card">
						<div class="card-header text-center primary-background text-white">
							<span class="fa fa-user-circle fa-2x"></span>
							<h3>Login</h3>
						</div>

						<%
						Message msg = (Message) session.getAttribute("msg");
						if (msg != null) {
						%>
						<div id="message" class="alert <%=msg.getCssClass()%>" role="alert">
							<%=msg.getContent()%>
						</div>
						<%
						session.removeAttribute("msg");
						}
						%>

						<div class="card-body">
							<form method="post" action="login">
								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input
										type="email" name="user_email" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										placeholder="Enter email"> <small id="emailHelp"
										class="form-text text-muted">We'll never share your
										email with anyone else.</small>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										name="user_password" type="password" class="form-control"
										id="exampleInputPassword1" placeholder="Password">
								</div>
								<div class="container text-center">
									<button type="submit" class="btn primary-background">Submit</button>
								</div>

							</form>
						</div>
					</div>
				</div>
			</div>

		</div>
	</main>

	<!-- javascript  -->
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
	<script src="js/app.js" type="text/javascript"></script>
	
	<script type="text/javascript">
		$('#message').delay(4000).fadeOut('slow');
	</script>
	
</body>
</html>