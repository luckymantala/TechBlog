<%@page import="io.tech.blog.entities.User"%>
<%@page import="io.tech.blog.dao.LikeDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="io.tech.blog.entities.Post"%>
<%@page import="io.tech.blog.helper.ConnectionProvider"%>
<%@page import="io.tech.blog.dao.PostDao"%>



<div class="row">

	<%
	User u = (User) session.getAttribute("user");
	
	PostDao postDao = new PostDao(ConnectionProvider.getConnection());

	int cid = Integer.valueOf(request.getParameter("cid"));

	List<Post> posts = new ArrayList<>();

	if (cid == 0) {
		posts = postDao.getAllPosts();
	} else {
		posts = postDao.getPostsByCatID(cid);
	}

	if (posts.size() == 0) {
	%>
	<div class="col text-center">
		<h4>No Posts available...</h4>
	</div>

	<%
	return;
	}
	for (Post post : posts) {
	%>

	<div class="col-md-6">
		<div class="card mb-4">
			<img class="card-img-top" alt="post image"
				src="img/thumbnails/<%=post.getpPic()%>">
			<div class="card-body">
				<h5 class="card-title text-truncate"><%=post.getpTitle()%></h5>
				<p class="card-text text-truncate"><%=post.getpContent()%></p>
			</div>
			<div class="card-footer text-center">
				<button class="btn btn-outline-primary" 
					onclick="addLike(<%= post.getpID()%>,<%=u.getId()%>)">
					<%
					LikeDao likeDao = new LikeDao(ConnectionProvider.getConnection());
					%>

					<span class="fa fa-thumbs-o-up "> <span class="likeCount">
							<%=likeDao.getLikeCountOnPost(post.getpID())%></span></span>
				</button>
				<a href="show_post_page.jsp?pid=<%=post.getpID()%>"
					class="btn btn-outline-primary">Read More...</a>
				<button class="btn btn-outline-primary">
					<i class="fa fa-comments-o"> 20</i>
				</button>

			</div>
		</div>
	</div>

	<%
	}
	%>
</div>
