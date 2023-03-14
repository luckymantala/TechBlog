package io.tech.blog.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import io.tech.blog.entities.Message;


public class LogoutServlet extends HttpServlet{

	private static final long serialVersionUID = -4676801196140215831L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		session.removeAttribute("user");
		
		Message msg = new Message("Logged out successfully", "success", "alert-success");
		
		session.setAttribute("msg", msg);
		
		resp.sendRedirect("login_page.jsp");
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
}
