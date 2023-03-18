<%@page import="io.tech.blog.entities.User"%>
<%
	User user_normal_navBar = (User) session.getAttribute("user");
%>

<nav class="navbar navbar-expand-lg navbar-light bg-light primary-background">
  <a class="navbar-brand" href="index.jsp"> <span class="fa fa-github-alt"></span> Tech Blog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#"> <span class="fa fa-cubes"></span> Learn with Jacky<span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <span class="fa fa-reorder"></span> Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Learn Programming</a>
          <a class="dropdown-item" href="#">UI / UX Designing</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Project implementation</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#<!-- constact_page.jsp -->"> <span class="fa fa-address-book"></span> Contact</a>
      </li>
      <%
      if(user_normal_navBar == null) {

      %>
      <li class="nav-item">
        <a class="nav-link" href="login_page.jsp"> <span class="fa fa-user-circle"></span> Login</a>
      </li>
      
       <li class="nav-item">
        <a class="nav-link" href="register_page.jsp"> <span class="fa fa-user-plus"></span> Register</a>
      </li>
      
      <%
      }
      %>
     <!--  <li class="nav-item">
        <a class="nav-link disabled" href="#">Disabled</a>
      </li> -->
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-dark my-2 my-sm-0" type="submit">Search</button>
    </form>
    
    <%
    	if(user_normal_navBar != null) {
    		%>
    		<ul class="navbar-nav mr-right">

				<!-- Button trigger modal -->
				<li data-toggle="modal" data-target="#exampleModal" class="nav-item"><a
					class="nav-link" href="profile.jsp"> <span class="fa fa-user-circle"></span>
						<%=user_normal_navBar.getName()%>
				</a></li>

				<li class="nav-item"><a class="nav-link" href="logout"> <span
						class="fa fa-user-plus"></span> Logout
				</a></li>

			</ul>
    		<%
    	}
    %>
    
  </div>
</nav>