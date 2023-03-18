<%@page import="io.tech.blog.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="io.tech.blog.entities.User"%>
<%@page import="io.tech.blog.entities.Post"%>
<%@page import="io.tech.blog.helper.ConnectionProvider"%>
<%@page import="io.tech.blog.dao.PostDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
User user = (User) session.getAttribute("user");
int pid = Integer.parseInt(request.getParameter("pid"));

PostDao postDao = new PostDao(ConnectionProvider.getConnection());
Post post = postDao.getPostByPostID(pid);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%=post.getpTitle()%></title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css/style.css" rel="stylesheet" type="text/css">

</head>
<body>
	<div id="fb-root"></div>
	<script async defer crossorigin="anonymous"
		src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v16.0"
		nonce="OcWLc9Gj"></script>

	<!-- Navbar starts  -->

	<nav
		class="navbar navbar-expand-lg navbar-light bg-light primary-background">
		<a class="navbar-brand" href="index.jsp"> <span
			class="fa fa-github-alt"></span> Tech Blog
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="profile.jsp"> <span class="fa fa-cubes"></span> Learn
						with Jacky<span class="sr-only">(current)</span></a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <span class="fa fa-reorder"></span>
						Categories
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Learn Programming</a> <a
							class="dropdown-item" href="#">UI / UX Designing</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Project implementation</a>
					</div></li>
				<li class="nav-item"><a class="nav-link"
					href="#<!-- constact_page.jsp -->"> <span
						class="	fa fa-address-book"></span> Contact
				</a></li>

				<li class="nav-item"><a class="nav-link"
					data-target="#post-form-modal" data-toggle="modal"
					href="#<!-- constact_page.jsp -->"> <span
						class="	fa fa-address-book"></span> Do Post
				</a></li>

			</ul>

			<ul class="navbar-nav mr-right">

				<!-- Button trigger modal -->
				<li data-toggle="modal" data-target="#exampleModal" class="nav-item"><a
					class="nav-link" href="#"> <span class="fa fa-user-circle"></span>
						<%=user.getName()%>
				</a></li>

				<li class="nav-item"><a class="nav-link" href="logout"> <span
						class="fa fa-user-plus"></span> Logout
				</a></li>

			</ul>

		</div>
	</nav>


	<!-- Navbar ends  -->


	<!-- main body  -->

	<div class="container">
		<div class="row my-4">
			<div class="col-md-8 offset-md-2">

				<div class="card">

					<div class="card-header primary-background">
						<h3><%=post.getpTitle()%></h3>
					</div>
					<div class="card-body">
						<img class="card-img-top" alt="post image"
							src="img/thumbnails/<%=post.getpPic()%>">

						<div class="row mb-3">
							<div class="col-md-6">
								<span>Posted By: <a href="#">Lucky Mantala</a></span>
							</div>
							<div
								class="col-md-6 d-flex justify-content-end align-items-center">
								<span><b><i><%=DateFormat.getDateTimeInstance().format(post.getpDate())%></i></b></span>
							</div>
						</div>

						<p>
							<%=post.getpContent()%>
						</p>

						<p class="bg-light">
							<%=post.getpCode()%>
						</p>

					</div>

					<div class="card-footer primary-background">
						<button onclick="addLike(<%=post.getpID()%>, <%=user.getId()%>)"
							class="btn btn-outline-dark">
							<%
							LikeDao likeDao = new LikeDao(ConnectionProvider.getConnection());
							%>

							<span class="fa fa-thumbs-o-up "> <span class="likeCount">
									<%=likeDao.getLikeCountOnPost(post.getpID())%></span></span>
						</button>
						<button class="btn btn-outline-dark">
							<i class="fa fa-comments-o"> 20</i>
						</button>

					</div>

					<div class="card-footer">
						<div class="fb-comments"
							data-href="http://localhost:9494/TechBlog/show_post_page.jsp?pid=<%=post.getpID()%>"
							data-width="100" data-numposts="5"></div>
					</div>

				</div>

			</div>
		</div>
	</div>


	<!-- main body ends  -->


	<!-- Javascript -->
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
	<script src="js/actions.js"></script>

</body>
</html>