<%@page import="io.tech.blog.entities.Post"%>
<%@page import="io.tech.blog.dao.PostDao"%>
<%@page import="io.tech.blog.entities.User"%>
<%@page import="io.tech.blog.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

<%
User user_index = (User) session.getAttribute("user");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
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

	<div class="container-fluid p-0 m-0 text-white">

		<div class="jumbotron primary-background banner-background">
			<div class="container">
				<h2>Welcome to my Tech Blogs</h2>
				<p>Computer programming is the process of performing a
					particular computation (or more generally, accomplishing a specific
					computing result), usually by designing and building an executable
					computer program.</p>

				<button class="btn btn-outline-dark">
					<span class="fa fa-user-plus"></span> Start, Its Free!
				</button>
				<a href="login_page.jsp" class="btn btn-outline-dark"> <span
					class="fa fa-user-circle fa-spin"> </span> Login
				</a>

			</div>


		</div>


	</div>

	<div class="container">

		<div class="row mb-3">


			<%
			PostDao postDao = new PostDao(ConnectionProvider.getConnection());
			int cnt = 0;
			for (Post post : postDao.getAllPosts()) {
				if (cnt <= 4) {
			%>
			<div class="col-md-4 my-2">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title text-truncate"><%=post.getpTitle()%></h5>
						<p class="card-text text-truncate"><%=post.getpContent()%></p>
						<%
						if (user_index != null) {
						%>
						<a href="#" class="btn primary-background text-white">Read
							More</a>

						<%
						}
						%>
					</div>
				</div>
			</div>
			<%
			cnt++;
			}
			}
			%>
			
			<div class="col-md-4 text-center">
				<a href="profile.jsp">More</a>
			</div>
			
			
			<!-- <div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							More</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							More</a>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							More</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							More</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							More</a>
					</div>
				</div>
			</div>
		</div> -->



	</div>


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
</body>
</html>