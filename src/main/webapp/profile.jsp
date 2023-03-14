
<%@ page import="io.tech.blog.entities.User"%>
<%@ page errorPage="error_page.jsp"%>
<%@ page import="io.tech.blog.entities.Message"%>
<%
User user = (User) session.getAttribute("user");
if (user == null) {
	response.sendRedirect("login_page.jsp");
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile Page</title>
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
</head>
<body>

	<!-- navbar starts  -->

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
				<li class="nav-item active"><a class="nav-link" href="#"> <span
						class="fa fa-cubes"></span> Learn with Jacky<span class="sr-only">(current)</span></a>
				</li>

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

				<li class="nav-item"><a class="nav-link" data-target="#post-form-modal" data-toggle="modal"
					href="#<!-- constact_page.jsp -->"> <span
						class="	fa fa-address-book"></span> Do Post
				</a></li>

			</ul>

			<ul class="navbar-nav mr-right">

				<!-- Button trigger modal -->
				<li data-toggle="modal" data-target="#exampleModal" class="nav-item"><a
					class="nav-link" href="#"> <span class="	fa fa-user-circle"></span>
						<%=user.getName()%>
				</a></li>

				<li class="nav-item"><a class="nav-link" href="logout"> <span
						class="fa fa-user-plus"></span> Logout
				</a></li>

			</ul>

		</div>
	</nav>

	<!-- navbar ends  -->

	<!-- Modal - Posts -->
	<div class="modal fade" id="post-form-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Post</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				
					<form action="PostServlet" method="post">
						
						<div class="form-group">
						<select class="form-control"> 
							<option selected disabled>---Select Categoty---</option>
							<option>Java</option>
						</select>
						</div>
						
						
						<div class="form-group">
							<input type="text" placeholder="Enter post title" class="form-control">
						</div>
						
						<div class="form-group">
							<textarea placeholder="Start writing post..." rows="10" class="form-control" style="resize: none;"></textarea>
						</div>
						
						<div class="form-group">
							<textarea placeholder="Enter your code here..." rows="6" class="form-control" style="resize: none;"></textarea>
						</div>
						
						<div class="form-group">
							<label for="img-select">Choose an image for the post</label>
							<input id="img-select" type="file" class="form-control-file">
						</div>
						
						<div class="form-group">
							<input type="text" placeholder="Add tags(comma seperated)" class="form-control">
						</div>
						
						<div class="text-center">
							<button type="submit" class="btn btn-primary">Submit</button>
						</div>
						
					</form>
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal - User Details -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Tech Blog</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img alt="" class="img-fluid rounded-circle"
							src="img/profile/<%=user.getProfile()%>"
							style="max-width: 150px;">
						<h4 class="mt-2">
							<%=user.getName()%>
						</h4>

						<!-- details table -->
						<table id="details-table" class="table text-left">
							<thead>
								<tr>
									<th scope="col">ID :</th>
									<th scope="col"><%=user.getId()%></th>

								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row">Name :</th>
									<td><%=user.getName()%></td>

								</tr>
								<tr>
									<th scope="row">Email :</th>
									<td><%=user.getEmail()%></td>

								</tr>
								<tr>
									<th scope="row">Gender :</th>
									<td><%=user.getGender()%></td>
								</tr>

								<tr>
									<th scope="row">About :</th>
									<td><%=user.getAbout()%></td>
								</tr>

								<tr>
									<th scope="row">Regitered Date :</th>
									<td><%=user.getDateTime()%></td>
								</tr>

							</tbody>
						</table>

						<!-- edit table -->
						<form id="edit-table" action="updateDetails" method="post"
							enctype="multipart/form-data" style="display: none;">


							<table class="table text-left">
								<thead>
									<tr>
										<th scope="col">ID :</th>
										<th scope="col"><%=user.getId()%></th>

									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">Name :</th>
										<td><input name="update-name" type="text"
											class="form-control" value="<%=user.getName()%>"></td>

									</tr>
									<tr>
										<th scope="row">Email :</th>
										<td><input name="update-email" class="form-control"
											type="email" value="<%=user.getEmail()%>"></td>

									</tr>
									<tr>
										<th scope="row">Gender :</th>
										<td><%=user.getGender()%></td>
									</tr>

									<tr>
										<th scope="row">About :</th>
										<td><textarea name="update-about" class="form-control"
												rows="3" style="resize: none;"><%=user.getAbout()%></textarea></td>
									</tr>

									<tr>
										<th scope="row">Profile :</th>
										<td><input type="file" name="update-profile"
											class="form-control"></td>
									</tr>



								</tbody>
							</table>
							<button type="submit" class="btn btn-primary">Submit</button>

						</form>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button id="editBtn" type="button" class="btn btn-primary">Edit</button>
				</div>
			</div>
		</div>
	</div>



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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript" src="js/app.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			var flag = false;
			$('#editBtn').on('click', function() {
				if(flag==false) {
					$("#details-table").hide();
					$('#edit-table').show();
					$(this).html('Back')
					flag=true;
				} else {
					$("#details-table").show();
					$('#edit-table').hide();
					$(this).html('Edit')
					flag=false;
				}
				
			})
			
		})
	</script>

	<%
	Message msg = (Message) session.getAttribute("msg");
	if (msg != null) {
	%>
	<script type="text/javascript">
					swal("<%=msg.getType().toUpperCase()%>","<%=msg.getContent()%>", "<%=msg.getType()%>
		");
	</script>

	<%
	session.removeAttribute("msg");
	}
	%>


</body>
</html>