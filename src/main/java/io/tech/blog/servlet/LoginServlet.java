package io.tech.blog.servlet;

import java.io.IOException;

import io.tech.blog.dao.UserDao;
import io.tech.blog.entities.Message;
import io.tech.blog.entities.User;
import io.tech.blog.helper.ConnectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 4525656280286065727L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		resp.setContentType("text/html");
		
		UserDao userDao = new UserDao(ConnectionProvider.getConnection());
		
		String email = req.getParameter("user_email");
		String password = req.getParameter("user_password");
		
		User user = userDao.getUserByEmailAndPassword(email, password);
		
		if (user == null) {
			Message nullUser = new Message("User not found. Please register first!", "error", "alert-danger");
			session.setAttribute("msg", nullUser);
			resp.sendRedirect("login_page.jsp");

		} else {
			
			session.setAttribute("user", user);
			resp.sendRedirect("profile.jsp");
			
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
