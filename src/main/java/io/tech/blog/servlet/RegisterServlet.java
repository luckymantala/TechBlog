package io.tech.blog.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import io.tech.blog.dao.UserDao;
import io.tech.blog.entities.User;
import io.tech.blog.helper.ConnectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@MultipartConfig
public class RegisterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();

		String name = req.getParameter("user_name");
		String email = req.getParameter("user_email");
		String password = req.getParameter("user_pass");
		String gender = req.getParameter("user_gender");
		String about = req.getParameter("user_about");

		String check = req.getParameter("terms");
		
		if (check == null) {
			out.println("Please Accept terms and conditions to continue");
		} else {
			User user = new User(name, email, password, gender, about);
			UserDao userDao = new UserDao(ConnectionProvider.getConnection());

			if (userDao.saveUser(user)) {
				out.println("done");
			} else {
				out.println("error");
			}
		}
	}

}
